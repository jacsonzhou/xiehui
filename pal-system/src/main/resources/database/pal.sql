/*
Navicat MySQL Data Transfer

Source Server         : efeiyi
Source Server Version : 50625
Source Host           : 192.168.1.57:3306
Source Database       : pal

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-11-26 17:03:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_auto_serial
-- ----------------------------
DROP TABLE IF EXISTS `base_auto_serial`;
CREATE TABLE `base_auto_serial` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `serial` bigint(10) DEFAULT NULL,
  `groupName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for base_document
-- ----------------------------
DROP TABLE IF EXISTS `base_document`;
CREATE TABLE `base_document` (
  `document_content_id` char(16) DEFAULT NULL,
  `document_order` int(11) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `sample_content` varchar(300) DEFAULT NULL,
  `the_date_time` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `group_name` varchar(15) DEFAULT NULL,
  `id` char(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` char(32) NOT NULL,
  `serial` bigint(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `label_batch_id` char(18) DEFAULT NULL,
  `purchase_order_label_id` char(18) DEFAULT NULL,
  `tenant_id` char(18) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `first_check_datetime` datetime DEFAULT NULL,
  `last_check_datetime` datetime DEFAULT NULL,
  `checked_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_label_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label_batch
-- ----------------------------
DROP TABLE IF EXISTS `label_batch`;
CREATE TABLE `label_batch` (
  `id` char(18) NOT NULL,
  `setting` varchar(64) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `serial` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label_check_record
-- ----------------------------
DROP TABLE IF EXISTS `label_check_record`;
CREATE TABLE `label_check_record` (
  `id` char(18) NOT NULL,
  `label_id` char(18) DEFAULT NULL,
  `product_id` char(18) DEFAULT NULL,
  `IP` varchar(16) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label_copy
-- ----------------------------
DROP TABLE IF EXISTS `label_copy`;
CREATE TABLE `label_copy` (
  `id` char(32) NOT NULL,
  `serial` bigint(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `label_batch_id` char(18) DEFAULT NULL,
  `purchase_order_label_id` char(18) DEFAULT NULL,
  `tenant_id` char(18) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `first_check_datetime` datetime DEFAULT NULL,
  `last_check_datetime` datetime DEFAULT NULL,
  `checked_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_label_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization_address_city
-- ----------------------------
DROP TABLE IF EXISTS `organization_address_city`;
CREATE TABLE `organization_address_city` (
  `id` char(18) NOT NULL,
  `city_name` varchar(16) DEFAULT NULL,
  `province_id` char(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization_address_district
-- ----------------------------
DROP TABLE IF EXISTS `organization_address_district`;
CREATE TABLE `organization_address_district` (
  `id` char(18) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `city_id` char(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization_address_province
-- ----------------------------
DROP TABLE IF EXISTS `organization_address_province`;
CREATE TABLE `organization_address_province` (
  `id` char(18) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization_intangible_cultural
-- ----------------------------
DROP TABLE IF EXISTS `organization_intangible_cultural`;
CREATE TABLE `organization_intangible_cultural` (
  `id` char(16) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `district_id` char(16) DEFAULT NULL,
  `the_datetime` datetime DEFAULT NULL,
  `in_charge_person` varchar(16) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization_tenant
-- ----------------------------
DROP TABLE IF EXISTS `organization_tenant`;
CREATE TABLE `organization_tenant` (
  `id` char(18) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `province_id` char(18) DEFAULT NULL,
  `city_id` char(18) DEFAULT NULL,
  `district_id` char(18) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization_user
-- ----------------------------
DROP TABLE IF EXISTS `organization_user`;
CREATE TABLE `organization_user` (
  `id` char(18) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `tenant_id` char(18) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `account_enabled` varchar(1) DEFAULT NULL,
  `account_expired` varchar(1) DEFAULT NULL,
  `account_locked` varchar(1) DEFAULT NULL,
  `credentials_expired` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` char(18) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `serial` varchar(32) DEFAULT NULL,
  `product_series_id` char(18) DEFAULT NULL,
  `tenant_id` char(18) DEFAULT NULL,
  `master_name` varchar(64) DEFAULT NULL,
  `made_year` datetime DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `shopping_url` varchar(128) DEFAULT NULL,
  `tenant_product_series_id` char(18) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
  `id` char(18) NOT NULL,
  `product_id` char(18) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_property_value
-- ----------------------------
DROP TABLE IF EXISTS `product_property_value`;
CREATE TABLE `product_property_value` (
  `id` char(18) NOT NULL,
  `product_series_property_name_id` char(18) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `product_id` char(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_series
-- ----------------------------
DROP TABLE IF EXISTS `product_series`;
CREATE TABLE `product_series` (
  `id` char(18) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `serial` varchar(32) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_series_property_name
-- ----------------------------
DROP TABLE IF EXISTS `product_series_property_name`;
CREATE TABLE `product_series_property_name` (
  `id` char(18) NOT NULL,
  `product_series_id` char(18) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
  `id` char(18) NOT NULL,
  `serial` varchar(32) DEFAULT NULL,
  `tenant_id` char(18) DEFAULT NULL,
  `user_id` char(18) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_order_label
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_label`;
CREATE TABLE `purchase_order_label` (
  `id` char(18) NOT NULL,
  `purchase_order_id` char(18) DEFAULT NULL,
  `product_id` char(18) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for purchase_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_payment`;
CREATE TABLE `purchase_order_payment` (
  `id` char(18) NOT NULL,
  `purchase_order_id` char(18) DEFAULT NULL,
  `payway` varchar(16) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tenant_certification
-- ----------------------------
DROP TABLE IF EXISTS `tenant_certification`;
CREATE TABLE `tenant_certification` (
  `id` char(18) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `tenant_id` char(18) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `org` varchar(128) DEFAULT NULL,
  `theDate` datetime DEFAULT NULL,
  `level` varchar(64) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL,
  `status` varchar(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tenant_certification_img
-- ----------------------------
DROP TABLE IF EXISTS `tenant_certification_img`;
CREATE TABLE `tenant_certification_img` (
  `id` char(18) NOT NULL,
  `tenant_certification_id` char(18) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tenant_product_series
-- ----------------------------
DROP TABLE IF EXISTS `tenant_product_series`;
CREATE TABLE `tenant_product_series` (
  `id` char(18) NOT NULL,
  `tenant_id` char(18) NOT NULL,
  `product_series_id` char(18) NOT NULL,
  `tenant_certification_id` char(18) DEFAULT NULL,
  `craft` varchar(64) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tenant_product_series_img
-- ----------------------------
DROP TABLE IF EXISTS `tenant_product_series_img`;
CREATE TABLE `tenant_product_series_img` (
  `id` char(18) NOT NULL,
  `tenant_product_series_id` char(18) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
