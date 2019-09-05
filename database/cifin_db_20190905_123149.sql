-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- DROP TABLE "ci_sessions" ------------------------------------
DROP TABLE IF EXISTS `ci_sessions` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "ci_sessions" ----------------------------------
CREATE TABLE `ci_sessions` ( 
	`session_id` VarChar( 40 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
	`ip_address` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
	`user_agent` VarChar( 120 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`last_activity` Int( 10 ) UNSIGNED NOT NULL DEFAULT 0,
	`user_data` Text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `session_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- DROP TABLE "tbl_last_login" ---------------------------------
DROP TABLE IF EXISTS `tbl_last_login` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "tbl_last_login" -------------------------------
CREATE TABLE `tbl_last_login` ( 
	`id` BigInt( 20 ) AUTO_INCREMENT NOT NULL,
	`userId` BigInt( 20 ) NOT NULL,
	`sessionData` VarChar( 2048 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`machineIp` VarChar( 1024 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`userAgent` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`agentString` VarChar( 1024 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`platform` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`createdDtm` DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 11;
-- -------------------------------------------------------------


-- DROP TABLE "tbl_reset_password" -----------------------------
DROP TABLE IF EXISTS `tbl_reset_password` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "tbl_reset_password" ---------------------------
CREATE TABLE `tbl_reset_password` ( 
	`id` BigInt( 20 ) AUTO_INCREMENT NOT NULL,
	`email` VarChar( 128 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`activation_id` VarChar( 32 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`agent` VarChar( 512 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`client_ip` VarChar( 32 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`isDeleted` TinyInt( 4 ) NOT NULL DEFAULT 0,
	`createdBy` BigInt( 20 ) NOT NULL DEFAULT 1,
	`createdDtm` DateTime NOT NULL,
	`updatedBy` BigInt( 20 ) NULL,
	`updatedDtm` DateTime NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- DROP TABLE "tbl_roles" --------------------------------------
DROP TABLE IF EXISTS `tbl_roles` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "tbl_roles" ------------------------------------
CREATE TABLE `tbl_roles` ( 
	`roleId` TinyInt( 4 ) AUTO_INCREMENT NOT NULL COMMENT 'role id',
	`role` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'role text',
	PRIMARY KEY ( `roleId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = MyISAM
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- DROP TABLE "tbl_transactions" -------------------------------
DROP TABLE IF EXISTS `tbl_transactions` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "tbl_transactions" -----------------------------
CREATE TABLE `tbl_transactions` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`description` Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`amount` Int( 255 ) NOT NULL,
	`type` Smallint( 255 ) NOT NULL,
	`transDate` Date NULL,
	`files` Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`createdBy` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- -------------------------------------------------------------


-- DROP TABLE "tbl_users" --------------------------------------
DROP TABLE IF EXISTS `tbl_users` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "tbl_users" ------------------------------------
CREATE TABLE `tbl_users` ( 
	`userId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`email` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'login email',
	`password` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'hashed login password',
	`name` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'full name of user',
	`mobile` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`roleId` TinyInt( 4 ) NOT NULL,
	`isDeleted` TinyInt( 4 ) NOT NULL DEFAULT 0,
	`createdBy` Int( 11 ) NOT NULL,
	`createdDtm` DateTime NOT NULL,
	`updatedBy` Int( 11 ) NULL,
	`updatedDtm` DateTime NULL,
	PRIMARY KEY ( `userId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = MyISAM
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------


-- Dump data of "ci_sessions" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "tbl_last_login" ---------------------------
INSERT INTO `tbl_last_login`(`id`,`userId`,`sessionData`,`machineIp`,`userAgent`,`agentString`,`platform`,`createdDtm`) VALUES 
( '1', '1', '{"role":"1","roleText":"System Administrator","name":"System Administrator"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-02 13:33:56' ),
( '2', '1', '{"role":"1","roleText":"System Administrator","name":"System Administrator"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-02 14:15:03' ),
( '3', '2', '{"role":"1","roleText":"System Administrator","name":"Manager"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-04 15:54:03' ),
( '4', '9', '{"role":"2","roleText":"Manager","name":"Sarah Kusuma Dewi"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-04 15:59:35' ),
( '5', '2', '{"role":"1","roleText":"System Administrator","name":"Manager"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-04 16:04:18' ),
( '6', '1', '{"role":"1","roleText":"System Administrator","name":"Harry Agustiana"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-04 16:05:26' ),
( '7', '1', '{"role":"1","roleText":"System Administrator","name":"Harry Agustiana"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-04 16:06:18' ),
( '8', '1', '{"role":"1","roleText":"System Administrator","name":"Harry Agustiana"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-04 16:07:36' ),
( '9', '1', '{"role":"1","roleText":"System Administrator","name":"Harry Agustiana"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-05 11:09:10' ),
( '10', '1', '{"role":"1","roleText":"System Administrator","name":"Administrator"}', '127.0.0.1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Linux', '2019-09-05 11:13:48' );
-- ---------------------------------------------------------


-- Dump data of "tbl_reset_password" -----------------------
INSERT INTO `tbl_reset_password`(`id`,`email`,`activation_id`,`agent`,`client_ip`,`isDeleted`,`createdBy`,`createdDtm`,`updatedBy`,`updatedDtm`) VALUES 
( '1', 'harry.agustiana@gmail.com', 'Nfdr9ehLYbX2F0K', 'Chrome 76.0.3809.132', '127.0.0.1', '0', '1', '2019-09-04 15:52:32', NULL, NULL ),
( '2', 'harry.agustiana@gmail.com', 'fEsNdrUcSz38O06', 'Chrome 76.0.3809.132', '127.0.0.1', '0', '1', '2019-09-04 15:52:41', NULL, NULL );
-- ---------------------------------------------------------


-- Dump data of "tbl_roles" --------------------------------
INSERT INTO `tbl_roles`(`roleId`,`role`) VALUES 
( '1', 'System Administrator' ),
( '2', 'Manager' ),
( '3', 'Employee' );
-- ---------------------------------------------------------


-- Dump data of "tbl_transactions" -------------------------
INSERT INTO `tbl_transactions`(`id`,`name`,`description`,`amount`,`type`,`transDate`,`files`,`createdBy`) VALUES 
( '5', 'Test', 'Test', '10000', '1', '2019-09-03', '5.jpg', '1' ),
( '6', 'Test 2', 'Test', '50000', '2', '2019-09-06', NULL, '1' );
-- ---------------------------------------------------------


-- Dump data of "tbl_users" --------------------------------
INSERT INTO `tbl_users`(`userId`,`email`,`password`,`name`,`mobile`,`roleId`,`isDeleted`,`createdBy`,`createdDtm`,`updatedBy`,`updatedDtm`) VALUES 
( '1', 'admin@cifin.com', '$2y$10$GsxRPPMPGGiLsSILl4Z1beRBIpk/sMUkrKnE6BU8dssppPd7AcG7C', 'Administrator', '081234567890', '1', '0', '1', '2016-12-09 17:49:56', '1', '2019-09-05 11:13:36' ),
( '3', 'employee@cifin.com', '$2y$10$UYsH1G7MkDg1cutOdgl2Q.ZbXjyX.CSjsdgQKvGzAgl60RXZxpB5u', 'Employee', '081234567890', '3', '0', '1', '2016-12-09 17:50:22', '1', '2019-09-02 16:18:06' ),
( '9', 'manager@cifin.com', '$2y$10$cpq04peTl7SeN0A2H2dniOhB3PguAfRd/ZYfg361u0SuAs1jcxMUu', 'Manager', '081234567890', '2', '0', '1', '2019-09-02 16:21:49', '1', '2019-09-05 11:14:24' );
-- ---------------------------------------------------------


-- CREATE INDEX "last_activity_idx" ----------------------------
CREATE INDEX `last_activity_idx` USING BTREE ON `ci_sessions`( `last_activity` );
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


