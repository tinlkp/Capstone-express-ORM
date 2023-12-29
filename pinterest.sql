/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `binh_luan` (
  `binh_luan_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_binh_luan` datetime DEFAULT NULL,
  `noi_dung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`binh_luan_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh_anh` (
  `hinh_id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh` varchar(255) DEFAULT NULL,
  `duong_dan` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  `hien_thi` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `luu_anh` (
  `nguoi_dung_id` int NOT NULL,
  `hinh_id` int NOT NULL,
  `ngay_luu` datetime DEFAULT NULL,
  `hien_thi` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`,`hinh_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoi_dung` (
  `nguoi_dung_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `tuoi` int DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `refresh_token` text,
  PRIMARY KEY (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(30, 17, 16, '2023-12-29 23:08:58', 'zxczxcxzc');


INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(16, 'medusa', '1702348701453_409912890_888544499470152_8835147124699694194_n.jpg', 'hình mỹ đỗ toa', 5, 1);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(17, 'medusa 2', '1702862542368_410585864_219562951186422_1646345773803745163_n.jpg', 'hình mỹ đỗ toa', 5, 0);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(18, 'medusa 3', '1702862565268_maxresdefault.jpg', 'hình mỹ đỗ toa', 5, 0);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(19, 'medusa 3', '1703298568624_maxresdefault.jpg', 'hình mỹ đỗ toa', 5, 0),
(20, 'medusa 3', '1703298574592_maxresdefault.jpg', 'hình mỹ đỗ toa', 5, 1),
(24, 'ad', '1703554192653_1876_hinh_nen_doraemon_4k__50_.jpg', 'dđ', 8, 1),
(25, 'test', '1703554204677_banner.jpg', 'áđâsdsad', 8, 1),
(26, 'zxczxc', '1703813453518_anh-nen-hoat-hinh-kungfu-panda 1.jpeg', 'zxcxzc', 8, 1),
(27, 'ảnh medusa 2', '1703836184622_414924880_228976883578362_7224514318279625990_n.jpg', 'áđasá', 8, 1),
(28, 'me du sa', '1703889215978_d187b90c02b4a778b47a2f4ef0e1ca14.jpg', 'avatar', 8, 1),
(30, 'avatar', '1703891308858_5d2d9184f73ff069b5795e25e78442a8.jpg', 'xzcxc', 17, 1);

INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`, `hien_thi`) VALUES
(17, 16, '2023-12-29 22:59:36', 0);
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`, `hien_thi`) VALUES
(17, 24, '2023-12-29 22:59:37', 0);
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`, `hien_thi`) VALUES
(17, 26, '2023-12-29 23:08:12', 0);
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`, `hien_thi`) VALUES
(17, 27, '2023-12-29 22:59:39', 1),
(17, 28, '2023-12-29 23:06:32', 1);

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(1, 'johndoe@example.com', 'password123', 'John Doe', 30, '1703319193445_411728864_876963391104281_6978640317389673952_n.jpg', NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(2, 'johndoe1@example.com', 'password456', 'Doe John', 20, '1703319193445_411728864_876963391104281_6978640317389673952_n.jpg', NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(3, 'alexsmith@example.com', 'password789', 'Alex Smith', 22, '1703319193445_411728864_876963391104281_6978640317389673952_n.jpg', NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(4, 'alexsmith1@example.com', 'password012', 'Smith Alex', 32, '1703319193445_411728864_876963391104281_6978640317389673952_n.jpg', NULL),
(5, 'abc@gmail.com', 'abc', 'le kim phuoc tin', 27, '1703319193445_411728864_876963391104281_6978640317389673952_n.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjUsImtleSI6MTcwMzMxOTEzNDQwMH0sImlhdCI6MTcwMzMxOTEzNCwiZXhwIjoxNzAzNDA1NTM0fQ.JdhJOj-wCsE4GsZcLpJpBzxrRle6yfx4-vB662WJVqA'),
(8, 'abc1@gmail.com', '$2b$05$h8oqQLupte5g2XkHgLQTJeGZ5HBBav5ArWrjaO1uq.8cVFtiTJ5Ua', 'tinnn', 200, '1703889247657_d187b90c02b4a778b47a2f4ef0e1ca14.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjgsImtleSI6MTcwMzg5MTM2MzM4MX0sImlhdCI6MTcwMzg5MTM2MywiZXhwIjoxNzAzOTc3NzYzfQ.iuNS401O4eNm77DsMqqoKT4CDljOOodKBVc6sbm2APE'),
(9, 'abc2@gmail.com', '$2b$05$GHlmnYFXLjIlpL4aIDLB0eeUF0JTEM2KgE7VrXvmjRUSacGy1Hu4S', 'tin', 20, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjksImtleSI6MTcwMzg4OTU4MTY3MH0sImlhdCI6MTcwMzg4OTU4MSwiZXhwIjoxNzAzOTc1OTgxfQ.96PJxe7lKXj06nvLfG5PlVXnbR_Ssh0m2Pdy1dWr37w'),
(10, 'z@gmail.com', '$2b$05$1wxs7uaKlZ6MZZVsRoacde0os80SPe11skzMUwLWl/6rs1rd/WZLm', 'abc', 222, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjEwLCJrZXkiOjE3MDM0NzA2NTE4ODl9LCJpYXQiOjE3MDM0NzA2NTEsImV4cCI6MTcwMzU1NzA1MX0.VRQgqHC763PpkG2luhgw5RTwqUCVELhxP1f0bKxA5S0'),
(11, 'zx@gmail.com', '$2b$05$ptP..zrtL3VpJOrW5Q0q0uEha5vPTPOIyHSepWLBGlxPWv0TJZsza', 'abc', 222, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjExLCJrZXkiOjE3MDM0Njk4NzE5MzN9LCJpYXQiOjE3MDM0Njk4NzEsImV4cCI6MTcwMzU1NjI3MX0.wawD_zzk4EXP66efVbLblL_MCE1-xfYP9QOD7Ot2uLs'),
(12, 'zxc@gmail.com', '$2b$05$dc5X7noV7s3iGPKKrEDQ6edxusTpbpUuH68I4sldZ33ik/V.NW3sS', 'abc', 123, '', NULL),
(13, 'abc3@gmail.com', '$2b$05$giuC4p.FxZofprs6b4dpbOokpyMsx4sThN9dmbbPobQYuWeIHdT1m', 'abbb', 12, '', NULL),
(14, 'tin@gmail.com', '$2b$05$X6W292oJGC9kWTeoNplAauaiVppXCLpBmBq5SAmkKRMR6Py1JohSC', 'tin', 20, '', NULL),
(15, 'tin1@gmail.com', '$2b$05$2ZKxA18Sx3oPHbwyJMSfy.3jviHTjxgckp1jj1MjQvc9QCmvMt/ve', 'tin', 20, '1703889272216_maxresdefault.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjE1LCJrZXkiOjE3MDM4OTEwNDY1MzZ9LCJpYXQiOjE3MDM4OTEwNDYsImV4cCI6MTcwMzk3NzQ0Nn0.rWZJX7B3nFmpRF2TV5i8inT_a21lmJeOa6Z0PUmn1Ao'),
(16, 'tin2@gmail.com', '$2b$05$ifpG5zK8evdOKpOof3gXqObO2yoKmTYTxw3Pl2GPHBYp6aLRNd4HK', 'tin', 27, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjE2LCJrZXkiOjE3MDM4ODk4MDY0MzF9LCJpYXQiOjE3MDM4ODk4MDYsImV4cCI6MTcwMzk3NjIwNn0.CjaAmAze-Y65fONf9src86FNE5pzk2lZD-yVIAaExmM'),
(17, 'tin3@gmail.com', '$2b$05$4liB32sHjsNT2AhLK4Dubuva1fVkDHuezbYg2PDdjK8vD5AT5gf6e', 'tin le', 270, '1703891322658_5d2d9184f73ff069b5795e25e78442a8.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjE3LCJrZXkiOjE3MDM4OTEyODgxMTh9LCJpYXQiOjE3MDM4OTEyODgsImV4cCI6MTcwMzk3NzY4OH0.t14gJRle86wXMaKxSEiR1-qg_mL5dIQ0QPG5ds8EZ9g'),
(18, 'tin4@gmail.com', '$2b$05$/ZT9xrRkAiW6SPe4gfv/oejrCBDKskEXlxi9QZynwFkXne7utEqTW', 'tin le', 27, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjE4LCJrZXkiOjE3MDM4OTA3NzMzMTJ9LCJpYXQiOjE3MDM4OTA3NzMsImV4cCI6MTcwMzk3NzE3M30.9BqQqq2n9cAHdpjELs4q0aVuJFihuHcgfAkx_Qw-S1s'),
(19, 'tin5@gmail.com', '$2b$05$THC/CfzVRyw7P5iJeuZMb.HIZCFSPbsq4/uJDjfMZwWZFFJxfeRoG', 'le tin', 27, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjE5LCJrZXkiOjE3MDM4OTA5ODMyMTN9LCJpYXQiOjE3MDM4OTA5ODMsImV4cCI6MTcwMzk3NzM4M30.huxwE9VkSTdJ48g72F74rhebMXU0e-eTMYYXMUD-ymo');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;