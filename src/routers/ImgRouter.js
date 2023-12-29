import express from "express";
import {
  imgList,
  postImg,
  deletelistSave,
  imgDetail,
  saveImg,
  deleteImg,
  repostImgDelete,
} from "../controllers/imgController.js";
import upload from "../config/uploadImg.js";

const imgRouter = express.Router();

// post thêm 1 ảnh của user
imgRouter.post("/upload", upload.single("duong_dan"), postImg);

// danh sách hình theo tên
imgRouter.get("/img-list", imgList);

// thông tin chi tiết ảnh và người dùng
imgRouter.get("/img-detail/:hinh_id", imgDetail);

// lưu ảnh
imgRouter.post("/save-img/:hinh_id", saveImg);

// bỏ lưu ảnh
imgRouter.delete("/delete-save-img/:hinh_id", deletelistSave);

// xóa hình
imgRouter.delete("/delete-img/:hinh_id", deleteImg);

// đăng lại hình
imgRouter.post("/repost-img/:hinh_id", repostImgDelete);

export default imgRouter;
