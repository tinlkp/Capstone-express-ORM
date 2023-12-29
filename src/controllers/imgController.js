import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";
import compress_images from "compress-images";
import fs from "fs";

let model = initModels(sequelize);

// post ảnh từ user

export const postImg = async (req, res) => {
  try {
    let { file } = req;
    // tối ưu hình ảnh
    compress_images(
      process.cwd() + "/public/imgs/" + file.filename,
      process.cwd() + "/public/imgs/image/",
      { compress_force: false, statistic: true, autoupdate: true },
      false,
      { jpg: { engine: "mozjpeg", command: ["-quality", "10"] } },
      { png: { engine: "pngquant", command: ["--quality=20-50", "-o"] } },
      { svg: { engine: "svgo", command: "--multipass" } },
      {
        gif: {
          engine: "gifsicle",
          command: ["--colors", "64", "--use-col=web"],
        },
      },
      function (error, completed, statistic) {
        // nếu thành công thì xóa ảnh chưa được tối ưu đi
        console.log(error);
        if (completed) {
          const imgUnOptimized =
            process.cwd() + "/public/imgs/" + file.filename;
          fs.unlink(imgUnOptimized, (err) => {
            console.log(err);
          });
        }
      }
    );
    let { token } = req.headers;
    let accessToken = decodeToken(token);
    let { nguoi_dung_id } = accessToken.data;
    let { mota, ten_hinh } = req.body;

    let imgData = {
      ten_hinh,
      duong_dan: file.filename,
      mo_ta: mota,
      nguoi_dung_id,
      hien_thi: true,
    };
    await model.hinh_anh.create(imgData);

    responseData(res, "Tải ảnh thành công", imgData, 200);
  } catch (exception) {
    responseData(res, "Lỗi ...", exception.message, 500);
  }
};

// lấy danh sách hình theo tên
export const imgList = async (req, res) => {
  let { ten_hinh } = req.body;
  try {
    let data = await model.hinh_anh.findAll({
      where: {
        ten_hinh,
        hien_thi: true,
      },
    });

    responseData(res, "danh sách hình ảnh theo tên", data, 200);
  } catch (exception) {
    responseData(res, "Lỗi ...", exception.message, 500);
  }
};

// thông tin hình ảnh và người tạo ảnh
export const imgDetail = async (req, res) => {
  try {
    let { hinh_id } = req.params;
    let data = await model.hinh_anh.findOne({
      where: {
        hinh_id,
      },
      include: ["nguoi_dung"],
    });
    responseData(res, "lấy chi tiết ảnh thành công", data, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// lưu ảnh
export const saveImg = async (req, res) => {
  try {
    let { hinh_id } = req.params;
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    // kiểm tra ảnh được lưu hay chưa
    let check = await model.luu_anh.findOne({
      where: {
        hinh_id,
      },
    });
    if (check) {
      await model.luu_anh.update(
        { hien_thi: true },
        {
          where: {
            hinh_id,
          },
        }
      );
      responseData(res, "ảnh đã được lưu !!!", check, 200);
      return;
    } else {
      // nếu ảnh chưa được lưu thì lưu vào
      let saveImgData = {
        hinh_id,
        nguoi_dung_id,
        ngay_luu: Date.now(),
        hien_thi: true,
      };

      let data = await model.luu_anh.create(saveImgData);
      responseData(res, "Lưu ảnh thành công", data, 200);
    }
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// delete ảnh lưu
export const deletelistSave = async (req, res) => {
  try {
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { hinh_id } = req.params;
    let { nguoi_dung_id } = dToken.data;

    // kiểm tra ảnh
    let check = await model.luu_anh.findOne({
      where: {
        hinh_id,
        nguoi_dung_id,
      },
    });
    // nếu tồn tại thì set lại hien_thi
    if (check) {
      await model.luu_anh.update(
        { hien_thi: false },
        {
          where: {
            hinh_id,
            nguoi_dung_id,
          },
        }
      );
      responseData(res, "Bỏ lưu ảnh thành công", check, 200);
    }
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// xóa hình
export const deleteImg = async (req, res) => {
  try {
    let { hinh_id } = req.params;
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    // kiểm tra ảnh có tồn tại không
    const ImgDetail = await model.hinh_anh.findOne({
      where: {
        hinh_id,
        nguoi_dung_id,
      },
    });

    // nếu ảnh tồn tại thì set lại hien_thi
    if (ImgDetail) {
      await model.hinh_anh.update(
        { hien_thi: false },
        {
          where: {
            hinh_id,
            nguoi_dung_id,
          },
        }
      );
      responseData(res, "xóa thành công", ImgDetail, 200);
    } else {
      responseData(res, "ảnh không tồn tại", nguoi_dung_id, 404);
    }
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};
export const repostImgDelete = async (req, res) => {
  try {
    let { hinh_id } = req.params;
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    // kiểm tra ảnh có tồn tại không
    const ImgDetail = await model.hinh_anh.findOne({
      where: {
        hinh_id,
        nguoi_dung_id,
      },
    });

    // nếu ảnh tồn tại thì set lại hien_thi
    if (ImgDetail) {
      await model.hinh_anh.update(
        { hien_thi: true },
        {
          where: {
            hinh_id,
            nguoi_dung_id,
          },
        }
      );
      responseData(res, "khôi phục ảnh thành công", ImgDetail, 200);
    } else {
      responseData(res, "ảnh không tồn tại", ImgDetail, 404);
    }
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};
