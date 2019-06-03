CREATE DATABASE IF NOT EXISTS questionnaire CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE questionnaire;
CREATE TABLE `tb_quest` (
  `id` BIGINT(20) UNSIGNED not null AUTO_INCREMENT COMMENT '自增Id',
  `desc` varchar(128) not null DEFAULT '' COMMENT '描述',
  `a0` varchar(18) DEFAULT null COMMENT '答案1',
  `m0` float not null default 0.0 COMMENT '答案1修正度',
  `a1` varchar(18) DEFAULT null COMMENT '答案2',
  `m1` float not null default 0.0 COMMENT '答案2修正度',
  `a2` varchar(18) DEFAULT null COMMENT '答案3',
  `m2` float not null default 0.0 COMMENT '答案3修正度',
  `a3` varchar(18) DEFAULT null COMMENT '答案4',
  `m3` float not null default 0.0 COMMENT '答案4修正度',
  `a4` varchar(18) DEFAULT null COMMENT '答案5',
  `m4` float not null default 0.0 COMMENT '答案5修正度',
  `a5` varchar(18) DEFAULT null COMMENT '答案6',
  `m5` float not null default 0.0 COMMENT '答案6修正度',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_answer` (
  `id` varchar(18) not null COMMENT '唯一Id',
  `desc` varchar(128) not null DEFAULT '' COMMENT '描述',

  `c0` varchar(32) DEFAULT null COMMENT '相关分类0',
  `rc0` float not null default 1.0 COMMENT '关系0',
  `c1` varchar(32) DEFAULT null COMMENT '相关分类1',
  `rc1` float not null default 1.0 COMMENT '关系1',
  `c2` varchar(32) DEFAULT null COMMENT '相关分类2',
  `rc2` float not null default 1.0 COMMENT '关系2',

  `a0` varchar(32) DEFAULT null COMMENT '相关能力0',
  `ea0` float not null default 1.0 COMMENT '影响0',
  `a1` varchar(32) DEFAULT null COMMENT '相关能力1',
  `ea1` float not null default 1.0 COMMENT '影响1',
  `a2` varchar(32) DEFAULT null COMMENT '相关能力2',
  `ea2` float not null default 1.0 COMMENT '影响2',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;