import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";

let model = initModels(sequelize);

// thông tin hình ảnh và người tạo ảnh
export const imgDetail = async (req, res) => {
  try {
    let { hinh_id } = req.params;
    let data = await model.hinh_anh.findOne({
      where: {
        hinh_id,
      },
    });
    responseData(res, "lấy chi tiết ảnh thành công", data, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// thông tin bình luận
export const commentDetai = async (req, res) => {
  try {
    let { hinh_id } = req.params;

    let data = await model.binh_luan.findAll({
      where: {
        hinh_id,
      },
    });
    responseData(res, "lấy bình luận thành công", data, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// check hình
export const checkImg = async (req, res) => {
  try {
    let { hinh_id } = req.params;

    let check = await model.hinh_anh.findOne({
      where: {
        hinh_id,
      },
    });

    if (!check) {
      responseData(res, "hình ảnh không tồn tại", "", 404);
      return;
    }
    // kiểm tra ảnh được lưu hay chưa
    let checkImg = await model.luu_anh.findOne({
      where: {
        hinh_id,
      },
    });

    if (checkImg) {
      responseData(res, "ảnh đã được lưu !!!", checkImg, 200);
    } else {
      responseData(res, "ảnh chưa được lưu !!!", "", 200);
    }
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
      responseData(res, "ảnh đã được lưu !!!", check, 200);
      return;
    }
    // nếu ảnh chưa được lưu thì lưu vào
    let saveImgData = {
      hinh_id,
      nguoi_dung_id,
      ngay_luu: Date.now(),
    };

    let data = await model.luu_anh.create(saveImgData);
    responseData(res, "Lưu ảnh thành công", data, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// bình luận
export const postComment = async (req, res) => {
  try {
    let { token } = req.headers;
    let { hinh_id } = req.params;
    let { noi_dung } = req.body;

    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;
    
    let newData = {
      nguoi_dung_id,
      hinh_id,
      ngay_binh_luan: Date.now(),
      noi_dung,
    };

    await model.binh_luan.create(newData);
    responseData(res, "Bình luận thành công", newData, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};
