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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `luu_anh` (
  `nguoi_dung_id` int NOT NULL,
  `hinh_id` int NOT NULL,
  `ngay_luu` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(2, 2, 1, '2023-10-22 08:00:00', 'ảnh đẹp');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(4, 4, 3, '2023-12-25 10:00:00', 'ảnh xáu');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(5, 1, 1, '2023-11-05 10:00:00', 'zxcxz');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(7, 3, 3, '2023-11-05 10:00:00', 'zxcxz'),
(9, 5, 1, '2023-12-06 01:09:55', NULL),
(10, 5, 1, '2023-12-06 01:10:13', NULL),
(11, 5, 1, '2023-12-06 01:10:45', 'zxczxcxz'),
(12, 5, 2, '2023-12-12 00:56:20', 'zxczxcxz'),
(13, 5, 2, '2023-12-12 00:56:30', 'anh binh thuong');

INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(1, 'Hình ảnh của John Doe', '1702348701453_409912890_888544499470152_8835147124699694194_n.jpg', 'Hình ảnh của John Doe', 2, 0);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(2, 'Hình ảnh của Doe John', '1702348701453_409912890_888544499470152_8835147124699694194_n.jpg', 'Hình ảnh của Doe John', 1, 0);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(3, 'Hình ảnh của Alex Smith', '1702348701453_409912890_888544499470152_8835147124699694194_n.jpg', 'Hình ảnh của Alex Smith', 3, 1);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`, `hien_thi`) VALUES
(16, 'medusa', '1702348701453_409912890_888544499470152_8835147124699694194_n.jpg', 'hình mỹ đỗ toa', 5, 1),
(17, 'medusa 2', '1702862542368_410585864_219562951186422_1646345773803745163_n.jpg', 'hình mỹ đỗ toa', 5, 0),
(18, 'medusa 3', '1702862565268_maxresdefault.jpg', 'hình mỹ đỗ toa', 5, 0),
(19, 'medusa 3', '1703298568624_maxresdefault.jpg', 'hình mỹ đỗ toa', 5, 1),
(20, 'medusa 3', '1703298574592_maxresdefault.jpg', 'hình mỹ đỗ toa', 5, 1);

INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 3, '2023-01-03 10:00:00');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(2, 2, '2023-01-20 10:00:00');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(3, 2, '2023-06-08 10:00:00');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(4, 1, '2023-10-15 10:00:00'),
(8, 16, '2023-12-18 23:33:47');

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(1, 'johndoe@example.com', 'password123', 'John Doe', 30, 'https://example.com/images/johndoe.jpg', NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(2, 'johndoe1@example.com', 'password456', 'Doe John', 20, 'https://example.com/images/johndoe.jpg', NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(3, 'alexsmith@example.com', 'password789', 'Alex Smith', 22, 'https://example.com/images/alexsmith.jpg', NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`, `refresh_token`) VALUES
(4, 'alexsmith1@example.com', 'password012', 'Smith Alex', 32, 'https://example.com/images/alexsmith.jpg', NULL),
(5, 'abc@gmail.com', '$2b$05$h8oqQLupte5g2XkHgLQTJeGZ5HBBav5ArWrjaO1uq.8cVFtiTJ5Ua', 'tin le', 27, '1703298705437_410585864_219562951186422_1646345773803745163_n.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjUsImtleSI6MTcwMzI5OTIxOTY4NH0sImlhdCI6MTcwMzI5OTIxOSwiZXhwIjoxNzAzMzg1NjE5fQ.VdXwTRXKZwGpjHVRIztJX6S5zTLH1hC79whd-udPqW4'),
(8, 'abc1@gmail.com', '$2b$05$h8oqQLupte5g2XkHgLQTJeGZ5HBBav5ArWrjaO1uq.8cVFtiTJ5Ua', 'tin', 20, '1702695305358_410585864_219562951186422_1646345773803745163_n.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Im5ndW9pX2R1bmdfaWQiOjgsImtleSI6MTcwMzI5OTAzNDkzMn0sImlhdCI6MTcwMzI5OTAzNCwiZXhwIjoxNzAzMzg1NDM0fQ.yRYB-g57L5kKYzgjn3IlFn2LnoqvjbOsEnMVEivUTBo');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;