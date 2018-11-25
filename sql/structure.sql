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