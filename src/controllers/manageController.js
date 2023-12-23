import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";

let model = initModels(sequelize);

// thông tin người dùng
export const getUserDetail = async (req, res) => {
  try {
    // lấy nguoi_dung_id dựa trên token đã đăng nhập
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    // lấy thông tin user
    let userDetail = await model.nguoi_dung.findOne({
      where: {
        nguoi_dung_id,
      },
    });

    responseData(res, "lấy thông tin thành công", userDetail, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};

// lấy danh sách ảnh đã tạo
export const listImg = async (req, res) => {
  try {
    // lấy nguoi_dung_id dựa trên token đã đăng nhập
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    // lấy danh sách ảnh của user đó
    const imgList = await model.hinh_anh.findAll({
      where: {
        nguoi_dung_id,
      },
    });

    responseData(res, "lấy danh sách ảnh thành công", imgList, 200);
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};
// lấy danh sách ảnh đã lưu
export const listImgSave = async (req, res) => {
  try {
    // lấy nguoi_dung_id dựa trên token đã đăng nhập
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    // lấy danh sách ảnh của user đó
    const imgList = await model.luu_anh.findAll({
      where: {
        nguoi_dung_id,
      },
    });

    responseData(res, "lấy danh sách ảnh thành công", imgList, 200);
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

// xóa ảnh đã tạo dành cho Admin
export const deleteImgAdmin = async (req, res) => {
  try {
    let { hinh_id } = req.params;

    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { nguoi_dung_id } = dToken.data;

    const checkImg = await model.hinh_anh.findOne({
      where: {
        hinh_id,
        nguoi_dung_id,
      },
    });
    if (checkImg) {
      // kiểm tra bình luận của ảnh
      const commentHinh = await model.binh_luan.findAll({
        where: {
          hinh_id,
          nguoi_dung_id,
        },
      });
      // nếu bình luận có thì xóa bình luận của hình ảnh
      if (commentHinh) {
        await model.binh_luan.destroy({
          where: {
            hinh_id,
            nguoi_dung_id,
          },
        });
      }
      // nếu bình luận rỗng thì xóa hình ảnh
      const deleteImg = await model.hinh_anh.destroy({
        where: {
          hinh_id,
          nguoi_dung_id,
        },
      });
      responseData(res, "xóa thành công", deleteImg, 200);
    } else {
      responseData(res, "ảnh không tồn tại", "", 404);
    }
  } catch (exception) {
    responseData(res, "lỗi ...", exception.message, 500);
  }
};
