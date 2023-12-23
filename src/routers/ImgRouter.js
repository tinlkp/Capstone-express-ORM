import express from "express";
import { imgList, postImg } from "../controllers/imgController.js";
import upload from "../config/uploadImg.js";

const imgRouter = express.Router();

// post thêm 1 ảnh của user
imgRouter.post("/upload", upload.single("duong_dan"), postImg);

// danh sách hình
imgRouter.get("/img-list", imgList);

export default imgRouter;
