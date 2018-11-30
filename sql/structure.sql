SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema matdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `matdb` ;

-- -----------------------------------------------------
-- Schema matdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `matdb` DEFAULT CHARACTER SET utf8mb4 ;
USE `matdb` ;

-- -----------------------------------------------------
-- Table `matdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `matdb`.`user` ;

CREATE TABLE IF NOT EXISTS `matdb`.`user` (
	`user_id` VARCHAR(32) NOT NULL COMMENT '用户id(微信id)',
	`reserve_id` VARCHAR(32) NOT NULL COMMENT '用户id(备用)',
    `superior_id` VARCHAR(32) NULL COMMENT '上级id',
    `mobile` VARCHAR(32) NULL COMMENT '手机号码',
	`nickname` VARCHAR(32) NULL DEFAULT '' COMMENT '微信昵称',
	`headimgurl` VARCHAR(256) NULL DEFAULT '' COMMENT '微信头像',
	`weixin` VARCHAR(32) NULL COMMENT '微信号',
	`class` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '级别',
	`extra` JSON NULL COMMENT '附加信息',
	`balance` DOUBLE NOT NULL DEFAULT 0 COMMENT '余额',
	`lock` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '乐观锁',
	`sex` TINYINT UNSIGNED NOT NULL DEFAULT 2 COMMENT '性别，1-男，2-女',
    `push_id` VARCHAR(32) NULL COMMENT '推送id',
    `member_deadline` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员截止时间',
    `login_state` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录状态，1-未登录，2-已登录',
	`active_time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '活跃时间',
	`create_time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
	`update_time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
	INDEX `IDXs` (`superior_id`),
	INDEX `IDXr` (`reserve_id`),
	INDEX `IDXm` (`mobile`),
	UNIQUE INDEX `user_id_IDX` (`user_id`),
	PRIMARY KEY (`user_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `matdb`.`material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `matdb`.`material` ;
CREATE TABLE `material` (
  `material_id` VARCHAR(32) NOT NULL COMMENT '素材id',
  `user_id` VARCHAR(32) NOT NULL COMMENT '用户id',
  `text` VARCHAR(512) DEFAULT NULL,
  `cate` VARCHAR(32) DEFAULT NULL,
  `media_type` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '包含的媒体类型，0-无，1-图片，2-视频',
  `see_type` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '可见类型，1-all，2-tags，3-self',
  `green_state` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '文本反垃圾状态，0-待检测，1-检测通过，2-检测不通过, 3-待确认',
  `green_label` VARCHAR(16) NULL COMMENT '文本反垃圾类型，spam：含垃圾信息,ad：广告,politics：涉政,terrorism：暴恐,abuse：辱骂,porn：色情,flood：灌水,contraband：违禁,meaningless：无意义',
  `sequence` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '序号',
  `create_time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`material_id`),
  INDEX `rt` (`user_id`, `media_type`, `see_type`, `green_state`, `sequence`, `create_time`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;