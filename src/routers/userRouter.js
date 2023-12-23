import express from "express";
import {
  UpdateInfoUser,
  getUserDetail,
  upAvatar,
  userList,
} from "../controllers/userController.js";
import upload from "../config/uploadImg.js";

const userRouter = express.Router();

// lấy thông tin chi tiết người dùng
userRouter.get("/get-user-detail", getUserDetail);

// thay đổi thông tin người dùng
userRouter.put("/change-info", UpdateInfoUser);

// up hình đại diện
userRouter.post("/upload-avatar", upload.single("anh_dai_dien"), upAvatar);

// lấy danh sách người dùng
userRouter.get("/get-user-list", userList);

export default userRouter;
