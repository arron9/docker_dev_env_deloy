CREATE DATABASE IF NOT EXISTS account CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE account;

CREATE TABLE `account` (
  `id` BIGINT(20) UNSIGNED not null AUTO_INCREMENT COMMENT '自增Id',
  `account` varchar(18) not null comment '唯一账号',
  `password` varchar(128) not null default '' comment '密文密码',
  `salt` varchar(48) not NULL DEFAULT '' COMMENT '密码盐值',
  `nick` varchar(18) not null comment '昵称',
  `identity` TINYINT(1) not null DEFAULT '0' comment '账号身份0普通账号1实名认证2大V认证',
  `identification` varchar(36) not null DEFAULT '' comment '认证信息',
  `gender` TINYINT(1) UNSIGNED not null DEFAULT '0' COMMENT '性别0女1男',
  `avatar` varchar(128) not null DEFAULT '' comment '头像url',
  `bio` varchar(128) not null DEFAULT '' comment '个人简介',
  `tag` varchar(128) not null DEFAULT '' comment '个人标签',
  `status` TINYINT(1) not null default '0' comment '账号状态0正常',
  `regTime` BIGINT(20) UNSIGNED not null comment '注册时间',
  `lastLoginTime` BIGINT(20) UNSIGNED not null comment '上次登录时间',
  `lastLoginIp` varchar(32) not null comment '上次登录ip',
  `lastUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `quizClear` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '答题测试0未通过1通过',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

