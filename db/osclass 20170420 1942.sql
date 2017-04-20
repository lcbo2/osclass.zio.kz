--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.2.58.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 20.04.2017 19:43:01
-- Версия сервера: 5.7.14
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE osclass;

--
-- Описание для таблицы oc_t_admin
--
DROP TABLE IF EXISTS oc_t_admin;
CREATE TABLE oc_t_admin (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_name VARCHAR(100) NOT NULL,
  s_username VARCHAR(40) NOT NULL,
  s_password CHAR(60) NOT NULL,
  s_email VARCHAR(100) DEFAULT NULL,
  s_secret VARCHAR(40) DEFAULT NULL,
  b_moderator TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (pk_i_id),
  UNIQUE INDEX s_email (s_email),
  UNIQUE INDEX s_username (s_username)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_alerts
--
DROP TABLE IF EXISTS oc_t_alerts;
CREATE TABLE oc_t_alerts (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_email VARCHAR(100) DEFAULT NULL,
  fk_i_user_id INT(10) UNSIGNED DEFAULT NULL,
  s_search LONGTEXT DEFAULT NULL,
  s_secret VARCHAR(40) DEFAULT NULL,
  b_active TINYINT(1) NOT NULL DEFAULT 0,
  e_type ENUM('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  dt_date DATETIME DEFAULT NULL,
  dt_unsub_date DATETIME DEFAULT NULL,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_alerts_sent
--
DROP TABLE IF EXISTS oc_t_alerts_sent;
CREATE TABLE oc_t_alerts_sent (
  d_date DATE NOT NULL,
  i_num_alerts_sent INT(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (d_date)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_ban_rule
--
DROP TABLE IF EXISTS oc_t_ban_rule;
CREATE TABLE oc_t_ban_rule (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_name VARCHAR(250) NOT NULL DEFAULT '',
  s_ip VARCHAR(50) NOT NULL DEFAULT '',
  s_email VARCHAR(250) NOT NULL DEFAULT '',
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_category
--
DROP TABLE IF EXISTS oc_t_category;
CREATE TABLE oc_t_category (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_parent_id INT(10) UNSIGNED DEFAULT NULL,
  i_expiration_days INT(3) UNSIGNED NOT NULL DEFAULT 0,
  i_position INT(2) UNSIGNED NOT NULL DEFAULT 0,
  b_enabled TINYINT(1) NOT NULL DEFAULT 1,
  b_price_enabled TINYINT(1) NOT NULL DEFAULT 1,
  s_icon VARCHAR(250) DEFAULT NULL,
  PRIMARY KEY (pk_i_id),
  INDEX fk_i_parent_id (fk_i_parent_id),
  INDEX i_position (i_position),
  CONSTRAINT oc_t_category_ibfk_1 FOREIGN KEY (fk_i_parent_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 96
AVG_ROW_LENGTH = 172
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_country
--
DROP TABLE IF EXISTS oc_t_country;
CREATE TABLE oc_t_country (
  pk_c_code CHAR(2) NOT NULL,
  s_name VARCHAR(80) NOT NULL,
  s_slug VARCHAR(80) NOT NULL DEFAULT '',
  PRIMARY KEY (pk_c_code),
  INDEX idx_s_name (s_name),
  INDEX idx_s_slug (s_slug)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_cron
--
DROP TABLE IF EXISTS oc_t_cron;
CREATE TABLE oc_t_cron (
  e_type ENUM('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  d_last_exec DATETIME NOT NULL,
  d_next_exec DATETIME NOT NULL
)
ENGINE = INNODB
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_currency
--
DROP TABLE IF EXISTS oc_t_currency;
CREATE TABLE oc_t_currency (
  pk_c_code CHAR(3) NOT NULL,
  s_name VARCHAR(40) NOT NULL,
  s_description VARCHAR(80) DEFAULT NULL,
  b_enabled TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (pk_c_code),
  UNIQUE INDEX s_name (s_name)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_car_make_attr
--
DROP TABLE IF EXISTS oc_t_item_car_make_attr;
CREATE TABLE oc_t_item_car_make_attr (
  pk_i_id INT(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_name VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 54
AVG_ROW_LENGTH = 315
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_custom_attr_fields
--
DROP TABLE IF EXISTS oc_t_item_custom_attr_fields;
CREATE TABLE oc_t_item_custom_attr_fields (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_type VARCHAR(10) DEFAULT NULL,
  s_label VARCHAR(255) DEFAULT NULL,
  s_options MEDIUMTEXT DEFAULT NULL,
  b_range TINYINT(1) DEFAULT NULL,
  s_steps INT(10) UNSIGNED DEFAULT NULL,
  b_required TINYINT(1) DEFAULT NULL,
  b_search TINYINT(1) DEFAULT NULL,
  b_search_limits TINYINT(1) DEFAULT NULL,
  i_order INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_custom_attr_groups
--
DROP TABLE IF EXISTS oc_t_item_custom_attr_groups;
CREATE TABLE oc_t_item_custom_attr_groups (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_name VARCHAR(255) DEFAULT NULL,
  s_heading VARCHAR(255) DEFAULT NULL,
  s_order_type VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_description
--
DROP TABLE IF EXISTS oc_t_item_description;
CREATE TABLE oc_t_item_description (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_title VARCHAR(100) NOT NULL,
  s_description MEDIUMTEXT NOT NULL,
  PRIMARY KEY (fk_i_item_id, fk_c_locale_code),
  FULLTEXT INDEX s_description (s_description, s_title)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 612
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы oc_t_latest_searches
--
DROP TABLE IF EXISTS oc_t_latest_searches;
CREATE TABLE oc_t_latest_searches (
  d_date DATETIME NOT NULL,
  s_search VARCHAR(255) NOT NULL
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_locale
--
DROP TABLE IF EXISTS oc_t_locale;
CREATE TABLE oc_t_locale (
  pk_c_code CHAR(5) NOT NULL,
  s_name VARCHAR(100) NOT NULL,
  s_short_name VARCHAR(40) NOT NULL,
  s_description VARCHAR(100) NOT NULL,
  s_version VARCHAR(20) NOT NULL,
  s_author_name VARCHAR(100) NOT NULL,
  s_author_url VARCHAR(100) NOT NULL,
  s_currency_format VARCHAR(50) NOT NULL,
  s_dec_point VARCHAR(2) DEFAULT '.',
  s_thousands_sep VARCHAR(2) DEFAULT '',
  i_num_dec TINYINT(4) DEFAULT 2,
  s_date_format VARCHAR(20) NOT NULL,
  s_stop_words TEXT DEFAULT NULL,
  b_enabled TINYINT(1) NOT NULL DEFAULT 1,
  b_enabled_bo TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (pk_c_code),
  UNIQUE INDEX s_short_name (s_short_name)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_locations_tmp
--
DROP TABLE IF EXISTS oc_t_locations_tmp;
CREATE TABLE oc_t_locations_tmp (
  id_location VARCHAR(10) NOT NULL,
  e_type ENUM('COUNTRY','REGION','CITY') NOT NULL,
  PRIMARY KEY (id_location, e_type)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_log
--
DROP TABLE IF EXISTS oc_t_log;
CREATE TABLE oc_t_log (
  dt_date DATETIME NOT NULL,
  s_section VARCHAR(50) NOT NULL,
  s_action VARCHAR(50) NOT NULL,
  fk_i_id INT(10) UNSIGNED NOT NULL,
  s_data VARCHAR(250) NOT NULL,
  s_ip VARCHAR(50) NOT NULL,
  s_who VARCHAR(50) NOT NULL,
  fk_i_who_id INT(10) UNSIGNED NOT NULL
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_meta_fields
--
DROP TABLE IF EXISTS oc_t_meta_fields;
CREATE TABLE oc_t_meta_fields (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_name VARCHAR(255) NOT NULL,
  s_slug VARCHAR(255) NOT NULL,
  e_type ENUM('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  s_options VARCHAR(2048) DEFAULT NULL,
  b_required TINYINT(1) NOT NULL DEFAULT 0,
  b_searchable TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_pages
--
DROP TABLE IF EXISTS oc_t_pages;
CREATE TABLE oc_t_pages (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_internal_name VARCHAR(50) DEFAULT NULL,
  b_indelible TINYINT(1) NOT NULL DEFAULT 0,
  b_link TINYINT(1) NOT NULL DEFAULT 1,
  dt_pub_date DATETIME NOT NULL,
  dt_mod_date DATETIME DEFAULT NULL,
  i_order INT(3) NOT NULL DEFAULT 0,
  s_meta TEXT DEFAULT NULL,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 24
AVG_ROW_LENGTH = 744
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_preference
--
DROP TABLE IF EXISTS oc_t_preference;
CREATE TABLE oc_t_preference (
  s_section VARCHAR(128) NOT NULL,
  s_name VARCHAR(128) NOT NULL,
  s_value LONGTEXT NOT NULL,
  e_type ENUM('STRING','INTEGER','BOOLEAN') NOT NULL,
  UNIQUE INDEX s_section (s_section, s_name)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 81
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_profile_picture
--
DROP TABLE IF EXISTS oc_t_profile_picture;
CREATE TABLE oc_t_profile_picture (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(10) DEFAULT NULL,
  pic_ext VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_widget
--
DROP TABLE IF EXISTS oc_t_widget;
CREATE TABLE oc_t_widget (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  s_description VARCHAR(40) NOT NULL,
  s_location VARCHAR(40) NOT NULL,
  e_kind ENUM('TEXT','HTML') NOT NULL,
  s_content MEDIUMTEXT NOT NULL,
  PRIMARY KEY (pk_i_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы table1
--
DROP TABLE IF EXISTS table1;
CREATE TABLE table1 (
  id INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы oc_t_category_description
--
DROP TABLE IF EXISTS oc_t_category_description;
CREATE TABLE oc_t_category_description (
  fk_i_category_id INT(10) UNSIGNED NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_name VARCHAR(100) DEFAULT NULL,
  s_description TEXT DEFAULT NULL,
  s_slug VARCHAR(255) NOT NULL,
  PRIMARY KEY (fk_i_category_id, fk_c_locale_code),
  INDEX fk_c_locale_code (fk_c_locale_code),
  INDEX idx_s_slug (s_slug),
  CONSTRAINT oc_t_category_description_ibfk_1 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_category_description_ibfk_2 FOREIGN KEY (fk_c_locale_code)
    REFERENCES oc_t_locale(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 172
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_category_stats
--
DROP TABLE IF EXISTS oc_t_category_stats;
CREATE TABLE oc_t_category_stats (
  fk_i_category_id INT(10) UNSIGNED NOT NULL,
  i_num_items INT(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (fk_i_category_id),
  CONSTRAINT oc_t_category_stats_ibfk_1 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 172
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_country_stats
--
DROP TABLE IF EXISTS oc_t_country_stats;
CREATE TABLE oc_t_country_stats (
  fk_c_country_code CHAR(2) NOT NULL,
  i_num_items INT(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (fk_c_country_code),
  INDEX idx_num_items (i_num_items),
  CONSTRAINT oc_t_country_stats_ibfk_1 FOREIGN KEY (fk_c_country_code)
    REFERENCES oc_t_country(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_car_model_attr
--
DROP TABLE IF EXISTS oc_t_item_car_model_attr;
CREATE TABLE oc_t_item_car_model_attr (
  pk_i_id INT(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_make_id INT(2) UNSIGNED NOT NULL,
  s_name VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (pk_i_id),
  INDEX fk_i_make_id (fk_i_make_id),
  CONSTRAINT oc_t_item_car_model_attr_ibfk_1 FOREIGN KEY (fk_i_make_id)
    REFERENCES oc_t_item_car_make_attr(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 550
AVG_ROW_LENGTH = 89
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_car_vehicle_type_attr
--
DROP TABLE IF EXISTS oc_t_item_car_vehicle_type_attr;
CREATE TABLE oc_t_item_car_vehicle_type_attr (
  pk_i_id INT(2) UNSIGNED NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_name VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (pk_i_id, fk_c_locale_code),
  INDEX fk_c_locale_code (fk_c_locale_code),
  CONSTRAINT oc_t_item_car_vehicle_type_attr_ibfk_1 FOREIGN KEY (fk_c_locale_code)
    REFERENCES oc_t_locale(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_custom_attr_categories
--
DROP TABLE IF EXISTS oc_t_item_custom_attr_categories;
CREATE TABLE oc_t_item_custom_attr_categories (
  fk_i_group_id INT(10) UNSIGNED NOT NULL,
  fk_i_category_id INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (fk_i_group_id, fk_i_category_id),
  INDEX fk_i_category_id (fk_i_category_id),
  CONSTRAINT oc_t_item_custom_attr_categories_ibfk_1 FOREIGN KEY (fk_i_group_id)
    REFERENCES oc_t_item_custom_attr_groups(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_custom_attr_categories_ibfk_2 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_custom_attr_meta
--
DROP TABLE IF EXISTS oc_t_item_custom_attr_meta;
CREATE TABLE oc_t_item_custom_attr_meta (
  fk_i_group_id INT(10) UNSIGNED NOT NULL,
  fk_i_field_id INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (fk_i_group_id, fk_i_field_id),
  INDEX fk_i_field_id (fk_i_field_id),
  CONSTRAINT oc_t_item_custom_attr_meta_ibfk_1 FOREIGN KEY (fk_i_group_id)
    REFERENCES oc_t_item_custom_attr_groups(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_custom_attr_meta_ibfk_2 FOREIGN KEY (fk_i_field_id)
    REFERENCES oc_t_item_custom_attr_fields(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_meta_categories
--
DROP TABLE IF EXISTS oc_t_meta_categories;
CREATE TABLE oc_t_meta_categories (
  fk_i_category_id INT(10) UNSIGNED NOT NULL,
  fk_i_field_id INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (fk_i_category_id, fk_i_field_id),
  INDEX fk_i_field_id (fk_i_field_id),
  CONSTRAINT oc_t_meta_categories_ibfk_1 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_meta_categories_ibfk_2 FOREIGN KEY (fk_i_field_id)
    REFERENCES oc_t_meta_fields(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_pages_description
--
DROP TABLE IF EXISTS oc_t_pages_description;
CREATE TABLE oc_t_pages_description (
  fk_i_pages_id INT(10) UNSIGNED NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_title VARCHAR(255) NOT NULL,
  s_text TEXT DEFAULT NULL,
  PRIMARY KEY (fk_i_pages_id, fk_c_locale_code),
  INDEX fk_c_locale_code (fk_c_locale_code),
  CONSTRAINT oc_t_pages_description_ibfk_1 FOREIGN KEY (fk_i_pages_id)
    REFERENCES oc_t_pages(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_pages_description_ibfk_2 FOREIGN KEY (fk_c_locale_code)
    REFERENCES oc_t_locale(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 744
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_plugin_category
--
DROP TABLE IF EXISTS oc_t_plugin_category;
CREATE TABLE oc_t_plugin_category (
  s_plugin_name VARCHAR(40) NOT NULL,
  fk_i_category_id INT(10) UNSIGNED NOT NULL,
  INDEX fk_i_category_id (fk_i_category_id),
  CONSTRAINT oc_t_plugin_category_ibfk_1 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_region
--
DROP TABLE IF EXISTS oc_t_region;
CREATE TABLE oc_t_region (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_c_country_code CHAR(2) NOT NULL,
  s_name VARCHAR(60) NOT NULL,
  s_slug VARCHAR(60) NOT NULL DEFAULT '',
  b_active TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (pk_i_id),
  INDEX fk_c_country_code (fk_c_country_code),
  INDEX idx_s_name (s_name),
  INDEX idx_s_slug (s_slug),
  CONSTRAINT oc_t_region_ibfk_1 FOREIGN KEY (fk_c_country_code)
    REFERENCES oc_t_country(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_city
--
DROP TABLE IF EXISTS oc_t_city;
CREATE TABLE oc_t_city (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_region_id INT(10) UNSIGNED NOT NULL,
  s_name VARCHAR(60) NOT NULL,
  s_slug VARCHAR(60) NOT NULL DEFAULT '',
  fk_c_country_code CHAR(2) DEFAULT NULL,
  b_active TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (pk_i_id),
  INDEX fk_c_country_code (fk_c_country_code),
  INDEX fk_i_region_id (fk_i_region_id),
  INDEX idx_s_name (s_name),
  INDEX idx_s_slug (s_slug),
  CONSTRAINT oc_t_city_ibfk_1 FOREIGN KEY (fk_i_region_id)
    REFERENCES oc_t_region(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_city_ibfk_2 FOREIGN KEY (fk_c_country_code)
    REFERENCES oc_t_country(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_region_stats
--
DROP TABLE IF EXISTS oc_t_region_stats;
CREATE TABLE oc_t_region_stats (
  fk_i_region_id INT(10) UNSIGNED NOT NULL,
  i_num_items INT(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (fk_i_region_id),
  INDEX idx_num_items (i_num_items),
  CONSTRAINT oc_t_region_stats_ibfk_1 FOREIGN KEY (fk_i_region_id)
    REFERENCES oc_t_region(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_city_area
--
DROP TABLE IF EXISTS oc_t_city_area;
CREATE TABLE oc_t_city_area (
  pk_i_id INT(10) UNSIGNED NOT NULL,
  fk_i_city_id INT(10) UNSIGNED NOT NULL,
  s_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (pk_i_id),
  INDEX fk_i_city_id (fk_i_city_id),
  INDEX idx_s_name (s_name),
  CONSTRAINT oc_t_city_area_ibfk_1 FOREIGN KEY (fk_i_city_id)
    REFERENCES oc_t_city(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_city_stats
--
DROP TABLE IF EXISTS oc_t_city_stats;
CREATE TABLE oc_t_city_stats (
  fk_i_city_id INT(10) UNSIGNED NOT NULL,
  i_num_items INT(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (fk_i_city_id),
  INDEX idx_num_items (i_num_items),
  CONSTRAINT oc_t_city_stats_ibfk_1 FOREIGN KEY (fk_i_city_id)
    REFERENCES oc_t_city(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_keywords
--
DROP TABLE IF EXISTS oc_t_keywords;
CREATE TABLE oc_t_keywords (
  s_md5 VARCHAR(32) NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_original_text VARCHAR(255) NOT NULL,
  s_anchor_text VARCHAR(255) NOT NULL,
  s_normalized_text VARCHAR(255) NOT NULL,
  fk_i_category_id INT(10) UNSIGNED DEFAULT NULL,
  fk_i_city_id INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (s_md5, fk_c_locale_code),
  INDEX fk_c_locale_code (fk_c_locale_code),
  INDEX fk_i_category_id (fk_i_category_id),
  INDEX fk_i_city_id (fk_i_city_id),
  CONSTRAINT oc_t_keywords_ibfk_1 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_keywords_ibfk_2 FOREIGN KEY (fk_i_city_id)
    REFERENCES oc_t_city(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_keywords_ibfk_3 FOREIGN KEY (fk_c_locale_code)
    REFERENCES oc_t_locale(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_user
--
DROP TABLE IF EXISTS oc_t_user;
CREATE TABLE oc_t_user (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  dt_reg_date DATETIME NOT NULL,
  dt_mod_date DATETIME DEFAULT NULL,
  s_name VARCHAR(100) NOT NULL,
  s_username VARCHAR(100) NOT NULL,
  s_password CHAR(60) NOT NULL,
  s_secret VARCHAR(40) DEFAULT NULL,
  s_email VARCHAR(100) NOT NULL,
  s_website VARCHAR(100) DEFAULT NULL,
  s_phone_land VARCHAR(45) DEFAULT NULL,
  s_phone_mobile VARCHAR(45) DEFAULT NULL,
  b_enabled TINYINT(1) NOT NULL DEFAULT 1,
  b_active TINYINT(1) NOT NULL DEFAULT 0,
  s_pass_code VARCHAR(100) DEFAULT NULL,
  s_pass_date DATETIME DEFAULT NULL,
  s_pass_ip VARCHAR(15) DEFAULT NULL,
  fk_c_country_code CHAR(2) DEFAULT NULL,
  s_country VARCHAR(40) DEFAULT NULL,
  s_address VARCHAR(100) DEFAULT NULL,
  s_zip VARCHAR(15) DEFAULT NULL,
  fk_i_region_id INT(10) UNSIGNED DEFAULT NULL,
  s_region VARCHAR(100) DEFAULT NULL,
  fk_i_city_id INT(10) UNSIGNED DEFAULT NULL,
  s_city VARCHAR(100) DEFAULT NULL,
  fk_i_city_area_id INT(10) UNSIGNED DEFAULT NULL,
  s_city_area VARCHAR(200) DEFAULT NULL,
  d_coord_lat DECIMAL(10, 6) DEFAULT NULL,
  d_coord_long DECIMAL(10, 6) DEFAULT NULL,
  b_company TINYINT(1) NOT NULL DEFAULT 0,
  i_items INT(10) UNSIGNED DEFAULT 0,
  i_comments INT(10) UNSIGNED DEFAULT 0,
  dt_access_date DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  s_access_ip VARCHAR(15) NOT NULL DEFAULT '',
  PRIMARY KEY (pk_i_id),
  INDEX fk_c_country_code (fk_c_country_code),
  INDEX fk_i_city_area_id (fk_i_city_area_id),
  INDEX fk_i_city_id (fk_i_city_id),
  INDEX fk_i_region_id (fk_i_region_id),
  INDEX idx_s_name (s_name(6)),
  INDEX idx_s_username (s_username),
  UNIQUE INDEX s_email (s_email),
  CONSTRAINT oc_t_user_ibfk_1 FOREIGN KEY (fk_c_country_code)
    REFERENCES oc_t_country(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_user_ibfk_2 FOREIGN KEY (fk_i_region_id)
    REFERENCES oc_t_region(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_user_ibfk_3 FOREIGN KEY (fk_i_city_id)
    REFERENCES oc_t_city(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_user_ibfk_4 FOREIGN KEY (fk_i_city_area_id)
    REFERENCES oc_t_city_area(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item
--
DROP TABLE IF EXISTS oc_t_item;
CREATE TABLE oc_t_item (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_user_id INT(10) UNSIGNED DEFAULT NULL,
  fk_i_category_id INT(10) UNSIGNED NOT NULL,
  dt_pub_date DATETIME NOT NULL,
  dt_mod_date DATETIME DEFAULT NULL,
  f_price FLOAT DEFAULT NULL,
  i_price BIGINT(20) DEFAULT NULL,
  fk_c_currency_code CHAR(3) DEFAULT NULL,
  s_contact_name VARCHAR(100) DEFAULT NULL,
  s_contact_email VARCHAR(140) NOT NULL,
  s_ip VARCHAR(64) NOT NULL DEFAULT '',
  b_premium TINYINT(1) NOT NULL DEFAULT 0,
  b_enabled TINYINT(1) NOT NULL DEFAULT 1,
  b_active TINYINT(1) NOT NULL DEFAULT 0,
  b_spam TINYINT(1) NOT NULL DEFAULT 0,
  s_secret VARCHAR(40) DEFAULT NULL,
  b_show_email TINYINT(1) DEFAULT NULL,
  dt_expiration DATETIME NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (pk_i_id),
  INDEX fk_c_currency_code (fk_c_currency_code),
  INDEX fk_i_category_id (fk_i_category_id),
  INDEX fk_i_user_id (fk_i_user_id),
  INDEX idx_b_premium (b_premium),
  INDEX idx_price (i_price),
  INDEX idx_pub_date (dt_pub_date),
  INDEX idx_s_contact_email (s_contact_email(10)),
  CONSTRAINT oc_t_item_ibfk_1 FOREIGN KEY (fk_i_user_id)
    REFERENCES oc_t_user(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_ibfk_2 FOREIGN KEY (fk_i_category_id)
    REFERENCES oc_t_category(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_ibfk_3 FOREIGN KEY (fk_c_currency_code)
    REFERENCES oc_t_currency(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_user_description
--
DROP TABLE IF EXISTS oc_t_user_description;
CREATE TABLE oc_t_user_description (
  fk_i_user_id INT(10) UNSIGNED NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_info TEXT DEFAULT NULL,
  PRIMARY KEY (fk_i_user_id, fk_c_locale_code),
  INDEX fk_c_locale_code (fk_c_locale_code),
  CONSTRAINT oc_t_user_description_ibfk_1 FOREIGN KEY (fk_i_user_id)
    REFERENCES oc_t_user(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_user_description_ibfk_2 FOREIGN KEY (fk_c_locale_code)
    REFERENCES oc_t_locale(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_user_email_tmp
--
DROP TABLE IF EXISTS oc_t_user_email_tmp;
CREATE TABLE oc_t_user_email_tmp (
  fk_i_user_id INT(10) UNSIGNED NOT NULL,
  s_new_email VARCHAR(100) NOT NULL,
  dt_date DATETIME NOT NULL,
  PRIMARY KEY (fk_i_user_id),
  CONSTRAINT oc_t_user_email_tmp_ibfk_1 FOREIGN KEY (fk_i_user_id)
    REFERENCES oc_t_user(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_car_attr
--
DROP TABLE IF EXISTS oc_t_item_car_attr;
CREATE TABLE oc_t_item_car_attr (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  i_year INT(4) UNSIGNED DEFAULT NULL,
  i_doors INT(1) UNSIGNED DEFAULT NULL,
  i_seats INT(4) UNSIGNED DEFAULT NULL,
  i_mileage INT(10) UNSIGNED DEFAULT NULL,
  i_engine_size INT(10) UNSIGNED DEFAULT NULL,
  fk_i_make_id INT(2) UNSIGNED DEFAULT NULL,
  fk_i_model_id INT(2) UNSIGNED DEFAULT NULL,
  i_num_airbags INT(2) UNSIGNED DEFAULT NULL,
  e_transmission ENUM('MANUAL','AUTO') DEFAULT NULL,
  e_fuel ENUM('DIESEL','GASOLINE','ELECTRIC-HIBRID','OTHER') DEFAULT NULL,
  e_seller ENUM('DEALER','OWNER') DEFAULT NULL,
  b_warranty TINYINT(1) DEFAULT NULL,
  b_new TINYINT(1) DEFAULT NULL,
  i_power INT(10) UNSIGNED DEFAULT NULL,
  e_power_unit ENUM('KW','CV','CH','KM','HP','PS','PK','CP') DEFAULT NULL,
  i_gears INT(1) UNSIGNED DEFAULT NULL,
  fk_vehicle_type_id INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (fk_i_item_id),
  INDEX fk_i_item_id (fk_i_item_id),
  INDEX fk_i_make_id (fk_i_make_id),
  INDEX fk_i_model_id (fk_i_model_id),
  CONSTRAINT oc_t_item_car_attr_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_car_attr_ibfk_2 FOREIGN KEY (fk_i_make_id)
    REFERENCES oc_t_item_car_make_attr(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_car_attr_ibfk_3 FOREIGN KEY (fk_i_model_id)
    REFERENCES oc_t_item_car_model_attr(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_comment
--
DROP TABLE IF EXISTS oc_t_item_comment;
CREATE TABLE oc_t_item_comment (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  dt_pub_date DATETIME NOT NULL,
  s_title VARCHAR(200) NOT NULL,
  s_author_name VARCHAR(100) NOT NULL,
  s_author_email VARCHAR(100) NOT NULL,
  s_body TEXT NOT NULL,
  b_enabled TINYINT(1) NOT NULL DEFAULT 1,
  b_active TINYINT(1) NOT NULL DEFAULT 0,
  b_spam TINYINT(1) NOT NULL DEFAULT 0,
  fk_i_user_id INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (pk_i_id),
  INDEX fk_i_item_id (fk_i_item_id),
  INDEX fk_i_user_id (fk_i_user_id),
  CONSTRAINT oc_t_item_comment_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_comment_ibfk_2 FOREIGN KEY (fk_i_user_id)
    REFERENCES oc_t_user(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_custom_attr_values
--
DROP TABLE IF EXISTS oc_t_item_custom_attr_values;
CREATE TABLE oc_t_item_custom_attr_values (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_item_id INT(10) UNSIGNED DEFAULT NULL,
  fk_i_field_id INT(10) UNSIGNED DEFAULT NULL,
  s_value VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (pk_i_id),
  INDEX fk_i_field_id (fk_i_field_id),
  INDEX fk_i_item_id (fk_i_item_id),
  CONSTRAINT oc_t_item_custom_attr_values_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_custom_attr_values_ibfk_2 FOREIGN KEY (fk_i_field_id)
    REFERENCES oc_t_item_custom_attr_fields(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_job_attr
--
DROP TABLE IF EXISTS oc_t_item_job_attr;
CREATE TABLE oc_t_item_job_attr (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  e_relation ENUM('HIRE','LOOKING') DEFAULT NULL,
  s_company_name VARCHAR(100) NOT NULL,
  e_position_type ENUM('UNDEF','PART','FULL') DEFAULT NULL,
  s_salary_text TEXT NOT NULL,
  PRIMARY KEY (fk_i_item_id),
  CONSTRAINT oc_t_item_job_attr_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_job_description_attr
--
DROP TABLE IF EXISTS oc_t_item_job_description_attr;
CREATE TABLE oc_t_item_job_description_attr (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  fk_c_locale_code CHAR(5) NOT NULL,
  s_desired_exp VARCHAR(255) DEFAULT NULL,
  s_studies VARCHAR(255) DEFAULT NULL,
  s_minimum_requirements TEXT DEFAULT NULL,
  s_desired_requirements TEXT DEFAULT NULL,
  s_contract VARCHAR(255) DEFAULT NULL,
  s_company_description TEXT DEFAULT NULL,
  PRIMARY KEY (fk_i_item_id, fk_c_locale_code),
  INDEX fk_c_locale_code (fk_c_locale_code),
  CONSTRAINT oc_t_item_job_description_attr_ibfk_1 FOREIGN KEY (fk_c_locale_code)
    REFERENCES oc_t_locale(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_job_description_attr_ibfk_2 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_location
--
DROP TABLE IF EXISTS oc_t_item_location;
CREATE TABLE oc_t_item_location (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  fk_c_country_code CHAR(2) DEFAULT NULL,
  s_country VARCHAR(40) DEFAULT NULL,
  s_address VARCHAR(100) DEFAULT NULL,
  s_zip VARCHAR(15) DEFAULT NULL,
  fk_i_region_id INT(10) UNSIGNED DEFAULT NULL,
  s_region VARCHAR(100) DEFAULT NULL,
  fk_i_city_id INT(10) UNSIGNED DEFAULT NULL,
  s_city VARCHAR(100) DEFAULT NULL,
  fk_i_city_area_id INT(10) UNSIGNED DEFAULT NULL,
  s_city_area VARCHAR(200) DEFAULT NULL,
  d_coord_lat DECIMAL(10, 6) DEFAULT NULL,
  d_coord_long DECIMAL(10, 6) DEFAULT NULL,
  PRIMARY KEY (fk_i_item_id),
  INDEX fk_c_country_code (fk_c_country_code),
  INDEX fk_i_city_area_id (fk_i_city_area_id),
  INDEX fk_i_city_id (fk_i_city_id),
  INDEX fk_i_region_id (fk_i_region_id),
  CONSTRAINT oc_t_item_location_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_location_ibfk_2 FOREIGN KEY (fk_c_country_code)
    REFERENCES oc_t_country(pk_c_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_location_ibfk_3 FOREIGN KEY (fk_i_region_id)
    REFERENCES oc_t_region(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_location_ibfk_4 FOREIGN KEY (fk_i_city_id)
    REFERENCES oc_t_city(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_location_ibfk_5 FOREIGN KEY (fk_i_city_area_id)
    REFERENCES oc_t_city_area(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_meta
--
DROP TABLE IF EXISTS oc_t_item_meta;
CREATE TABLE oc_t_item_meta (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  fk_i_field_id INT(10) UNSIGNED NOT NULL,
  s_value TEXT DEFAULT NULL,
  s_multi VARCHAR(20) NOT NULL DEFAULT '',
  PRIMARY KEY (fk_i_item_id, fk_i_field_id, s_multi),
  INDEX fk_i_field_id (fk_i_field_id),
  INDEX s_value (s_value(255)),
  CONSTRAINT oc_t_item_meta_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT oc_t_item_meta_ibfk_2 FOREIGN KEY (fk_i_field_id)
    REFERENCES oc_t_meta_fields(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_resource
--
DROP TABLE IF EXISTS oc_t_item_resource;
CREATE TABLE oc_t_item_resource (
  pk_i_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  s_name VARCHAR(60) DEFAULT NULL,
  s_extension VARCHAR(10) DEFAULT NULL,
  s_content_type VARCHAR(40) DEFAULT NULL,
  s_path VARCHAR(250) DEFAULT NULL,
  PRIMARY KEY (pk_i_id),
  INDEX fk_i_item_id (fk_i_item_id),
  INDEX idx_s_content_type (pk_i_id, s_content_type(10)),
  CONSTRAINT oc_t_item_resource_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_stats
--
DROP TABLE IF EXISTS oc_t_item_stats;
CREATE TABLE oc_t_item_stats (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  i_num_views INT(10) UNSIGNED NOT NULL DEFAULT 0,
  i_num_spam INT(10) UNSIGNED NOT NULL DEFAULT 0,
  i_num_repeated INT(10) UNSIGNED NOT NULL DEFAULT 0,
  i_num_bad_classified INT(10) UNSIGNED NOT NULL DEFAULT 0,
  i_num_offensive INT(10) UNSIGNED NOT NULL DEFAULT 0,
  i_num_expired INT(10) UNSIGNED NOT NULL DEFAULT 0,
  i_num_premium_views INT(10) UNSIGNED NOT NULL DEFAULT 0,
  dt_date DATE NOT NULL,
  PRIMARY KEY (fk_i_item_id, dt_date),
  INDEX dt_date (dt_date, fk_i_item_id),
  CONSTRAINT oc_t_item_stats_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_telephone
--
DROP TABLE IF EXISTS oc_t_item_telephone;
CREATE TABLE oc_t_item_telephone (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  s_telephone VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (fk_i_item_id),
  CONSTRAINT oc_t_item_telephone_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы oc_t_item_youtube
--
DROP TABLE IF EXISTS oc_t_item_youtube;
CREATE TABLE oc_t_item_youtube (
  fk_i_item_id INT(10) UNSIGNED NOT NULL,
  s_youtube VARCHAR(100) DEFAULT NULL,
  s_id VARCHAR(15) NOT NULL DEFAULT '-no-id-',
  PRIMARY KEY (fk_i_item_id),
  CONSTRAINT oc_t_item_youtube_ibfk_1 FOREIGN KEY (fk_i_item_id)
    REFERENCES oc_t_item(pk_i_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

-- 
-- Вывод данных для таблицы oc_t_admin
--
INSERT INTO oc_t_admin VALUES
(1, 'Administrator', 'admin', '$2y$15$wJUyzZ.Y.ocAHsxFxTI00uscueGvSH/LkLkFpkxKiapPAG.kMoGZK', 'xzyinmail@gmail.com', NULL, 0);

-- 
-- Вывод данных для таблицы oc_t_alerts
--

-- Таблица osclass.oc_t_alerts не содержит данных

-- 
-- Вывод данных для таблицы oc_t_alerts_sent
--

-- Таблица osclass.oc_t_alerts_sent не содержит данных

-- 
-- Вывод данных для таблицы oc_t_ban_rule
--

-- Таблица osclass.oc_t_ban_rule не содержит данных

-- 
-- Вывод данных для таблицы oc_t_category
--
INSERT INTO oc_t_category VALUES
(1, NULL, 0, 1, 1, 1, NULL),
(2, NULL, 0, 2, 1, 1, NULL),
(3, NULL, 0, 3, 1, 1, NULL),
(4, NULL, 0, 4, 1, 1, NULL),
(5, NULL, 0, 5, 1, 1, NULL),
(6, NULL, 0, 6, 1, 1, NULL),
(7, NULL, 0, 7, 1, 1, NULL),
(8, NULL, 0, 8, 1, 1, NULL),
(9, 1, 0, 1, 1, 1, NULL),
(10, 1, 0, 2, 1, 1, NULL),
(11, 1, 0, 3, 1, 1, NULL),
(12, 1, 0, 4, 1, 1, NULL),
(13, 1, 0, 5, 1, 1, NULL),
(14, 1, 0, 6, 1, 1, NULL),
(15, 1, 0, 7, 1, 1, NULL),
(16, 1, 0, 8, 1, 1, NULL),
(17, 1, 0, 9, 1, 1, NULL),
(18, 1, 0, 10, 1, 1, NULL),
(19, 1, 0, 11, 1, 1, NULL),
(20, 1, 0, 12, 1, 1, NULL),
(21, 1, 0, 13, 1, 1, NULL),
(22, 1, 0, 14, 1, 1, NULL),
(23, 1, 0, 15, 1, 1, NULL),
(24, 1, 0, 16, 1, 1, NULL),
(25, 1, 0, 17, 1, 1, NULL),
(26, 1, 0, 18, 1, 1, NULL),
(27, 1, 0, 19, 1, 1, NULL),
(28, 1, 0, 20, 1, 1, NULL),
(29, 1, 0, 21, 1, 1, NULL),
(30, 1, 0, 22, 1, 1, NULL),
(31, 2, 0, 1, 1, 1, NULL),
(32, 2, 0, 2, 1, 1, NULL),
(33, 2, 0, 3, 1, 1, NULL),
(34, 2, 0, 4, 1, 1, NULL),
(35, 2, 0, 5, 1, 1, NULL),
(36, 2, 0, 6, 1, 1, NULL),
(37, 2, 0, 7, 1, 1, NULL),
(38, 3, 0, 1, 1, 1, NULL),
(39, 3, 0, 2, 1, 1, NULL),
(40, 3, 0, 3, 1, 1, NULL),
(41, 3, 0, 4, 1, 1, NULL),
(42, 3, 0, 5, 1, 1, NULL),
(43, 4, 0, 1, 1, 1, NULL),
(44, 4, 0, 2, 1, 1, NULL),
(45, 4, 0, 3, 1, 1, NULL),
(46, 4, 0, 4, 1, 1, NULL),
(47, 4, 0, 5, 1, 1, NULL),
(48, 4, 0, 6, 1, 1, NULL),
(49, 4, 0, 7, 1, 1, NULL),
(50, 4, 0, 8, 1, 1, NULL),
(51, 4, 0, 9, 1, 1, NULL),
(52, 5, 0, 1, 1, 1, NULL),
(53, 5, 0, 2, 1, 1, NULL),
(54, 5, 0, 3, 1, 1, NULL),
(55, 5, 0, 4, 1, 1, NULL),
(56, 5, 0, 5, 1, 1, NULL),
(57, 5, 0, 6, 1, 1, NULL),
(58, 5, 0, 7, 1, 1, NULL),
(59, 5, 0, 8, 1, 1, NULL),
(60, 5, 0, 9, 1, 1, NULL),
(61, 5, 0, 10, 1, 1, NULL),
(62, 5, 0, 11, 1, 1, NULL),
(63, 6, 0, 1, 1, 1, NULL),
(64, 6, 0, 2, 1, 1, NULL),
(65, 6, 0, 3, 1, 1, NULL),
(66, 6, 0, 4, 1, 1, NULL),
(67, 6, 0, 5, 1, 1, NULL),
(68, 6, 0, 6, 1, 1, NULL),
(69, 7, 0, 1, 1, 1, NULL),
(70, 7, 0, 2, 1, 1, NULL),
(71, 7, 0, 3, 1, 1, NULL),
(72, 7, 0, 4, 1, 1, NULL),
(73, 7, 0, 5, 1, 1, NULL),
(74, 7, 0, 6, 1, 1, NULL),
(75, 8, 0, 1, 1, 1, NULL),
(76, 8, 0, 2, 1, 1, NULL),
(77, 8, 0, 3, 1, 1, NULL),
(78, 8, 0, 4, 1, 1, NULL),
(79, 8, 0, 5, 1, 1, NULL),
(80, 8, 0, 6, 1, 1, NULL),
(81, 8, 0, 7, 1, 1, NULL),
(82, 8, 0, 8, 1, 1, NULL),
(83, 8, 0, 9, 1, 1, NULL),
(84, 8, 0, 10, 1, 1, NULL),
(85, 8, 0, 11, 1, 1, NULL),
(86, 8, 0, 12, 1, 1, NULL),
(87, 8, 0, 13, 1, 1, NULL),
(88, 8, 0, 14, 1, 1, NULL),
(89, 8, 0, 15, 1, 1, NULL),
(90, 8, 0, 16, 1, 1, NULL),
(91, 8, 0, 17, 1, 1, NULL),
(92, 8, 0, 18, 1, 1, NULL),
(93, 8, 0, 19, 1, 1, NULL),
(94, 8, 0, 20, 1, 1, NULL),
(95, 8, 0, 21, 1, 1, NULL);

-- 
-- Вывод данных для таблицы oc_t_country
--
INSERT INTO oc_t_country VALUES
('KZ', 'Kazakhstan', '');

-- 
-- Вывод данных для таблицы oc_t_cron
--
INSERT INTO oc_t_cron VALUES
('HOURLY', '2017-04-20 19:40:14', '2017-04-20 20:40:00'),
('DAILY', '2017-04-20 19:40:14', '2017-04-21 19:40:00'),
('WEEKLY', '2017-04-20 19:40:14', '2017-04-27 19:40:00');

-- 
-- Вывод данных для таблицы oc_t_currency
--
INSERT INTO oc_t_currency VALUES
('EUR', 'European Union euro', 'Euro €', 1),
('GBP', 'United Kingdom pound', 'Pound £', 1),
('USD', 'United States dollar', 'Dollar US$', 1);

-- 
-- Вывод данных для таблицы oc_t_item_car_make_attr
--
INSERT INTO oc_t_item_car_make_attr VALUES
(1, 'Acura'),
(2, 'Audi'),
(3, 'Alfa Romeo'),
(4, 'Aston Martin'),
(5, 'BMW'),
(6, 'Buick'),
(7, 'Cadillac'),
(8, 'Chevrolet'),
(9, 'Chrysler'),
(10, 'Datsun'),
(11, 'Dodge'),
(12, 'FAW'),
(14, 'Ferrari'),
(15, 'Fiat'),
(16, 'Ford'),
(17, 'GEO'),
(18, 'GMC'),
(19, 'Honda'),
(20, 'Hummer'),
(21, 'Hyundai'),
(22, 'Infiniti'),
(23, 'Izusu'),
(24, 'Jaguar'),
(25, 'Jeep'),
(26, 'Lamborghini'),
(27, 'Land Rover'),
(28, 'Lincoln'),
(29, 'Maserati'),
(30, 'Mazda'),
(31, 'Mercedes Benz'),
(32, 'Mercury'),
(33, 'Villager'),
(34, 'MG'),
(35, 'Mini'),
(36, 'Mitsubishi'),
(37, 'Nissan'),
(38, 'Oldsmobile'),
(39, 'Peugeot'),
(40, 'Plymouth'),
(41, 'Pontiac'),
(42, 'Porsche'),
(43, 'Rambler'),
(44, 'Renault'),
(45, 'RollsRoyce'),
(46, 'Rove'),
(47, 'Saab'),
(48, 'Seat'),
(49, 'Smart'),
(50, 'Suzuki'),
(51, 'Toyota'),
(52, 'Volkswagen'),
(53, 'Volvo');

-- 
-- Вывод данных для таблицы oc_t_item_custom_attr_fields
--

-- Таблица osclass.oc_t_item_custom_attr_fields не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_custom_attr_groups
--

-- Таблица osclass.oc_t_item_custom_attr_groups не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_description
--
INSERT INTO oc_t_item_description VALUES
(1, 'ru_RU', 'Пример объявления', 'Описание примера объявления. Вставьте здесь некоторые полезные описания вашего объявления.'),
(2, 'ru_RU', 'Mauris blandit aliquet elit', 'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.'),
(3, 'ru_RU', 'Nulla porttitor accumsan tincidunt.', '<p>Nulla porttitor accumsan tincidunt. Cras ultricies ligula sed magna dictum porta. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.</p>'),
(4, 'ru_RU', 'Proin eget tortor risus', '<p>Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Proin eget tortor risus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Donec sollicitudin molestie malesuada.</p>');

-- 
-- Вывод данных для таблицы oc_t_latest_searches
--

-- Таблица osclass.oc_t_latest_searches не содержит данных

-- 
-- Вывод данных для таблицы oc_t_locale
--
INSERT INTO oc_t_locale VALUES
('ru_RU', 'Russian', 'Russian', 'Russian translation', 'Osclass 3.5.0', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', '', 1, 1);

-- 
-- Вывод данных для таблицы oc_t_locations_tmp
--
INSERT INTO oc_t_locations_tmp VALUES
('KZ', 'COUNTRY');

-- 
-- Вывод данных для таблицы oc_t_log
--
INSERT INTO oc_t_log VALUES
('2017-02-06 14:25:50', 'item', 'add', 1, 'Пример объявления', '127.0.0.1', 'admin', 0),
('2017-02-07 16:30:37', 'user', 'register', 1, 'lolo@mail.ru', '127.0.0.1', 'user', 1),
('2017-02-07 16:32:50', 'user', 'activate', 1, 'lolo@mail.ru', '127.0.0.1', 'admin', 1),
('2017-02-07 16:40:50', 'user', 'edit', 1, 'lolo@mail.ru', '127.0.0.1', 'user', 1),
('2017-02-07 16:41:56', 'item', 'add', 2, 'Mauris blandit aliquet elit', '127.0.0.1', 'user', 1),
('2017-02-07 21:48:31', 'user', 'add', 2, 'dodo@mail.ru', '127.0.0.1', 'admin', 1),
('2017-02-12 18:40:56', 'item', 'add', 3, 'Nulla porttitor accumsan tincidunt.', '127.0.0.1', 'user', 1),
('2017-02-12 19:10:11', 'item', 'add', 4, 'Proin eget tortor risus', '127.0.0.1', 'user', 2);

-- 
-- Вывод данных для таблицы oc_t_meta_fields
--
INSERT INTO oc_t_meta_fields VALUES
(1, 'НОВОЕ пользовательское поле', '-', 'TEXT', '', 0, 0);

-- 
-- Вывод данных для таблицы oc_t_pages
--
INSERT INTO oc_t_pages VALUES
(1, 'email_item_inquiry', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, '2017-02-06 20:25:45', NULL, 0, NULL),
(23, 'example_page', 0, 0, '2017-02-06 14:25:51', '2017-02-06 14:25:51', 1, '""');

-- 
-- Вывод данных для таблицы oc_t_preference
--
INSERT INTO oc_t_preference VALUES
('bender', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('bender', 'defaultShowAs@all', 'list', 'STRING'),
('bender', 'donation', '0', 'STRING'),
('bender', 'footer_link', '1', 'STRING'),
('bender', 'keyword_placeholder', 'например, программист PHP', 'STRING'),
('bender', 'version', '314', 'STRING'),
('bender_theme', 'defaultShowAs@all', 'list', 'STRING'),
('bender_theme', 'donation', '0', 'STRING'),
('bender_theme', 'footer_link', '1', 'STRING'),
('bender_theme', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('bender_theme', 'version', '1.0.1', 'STRING'),
('custom_attributes', 'database_version', '3', 'INTEGER'),
('jobs_plugin', 'allow_cv_unreg', '1', 'BOOLEAN'),
('jobs_plugin', 'allow_cv_upload', '0', 'BOOLEAN'),
('jobs_plugin', 'cv_email', '', 'STRING'),
('jobs_plugin', 'send_me_cv', '0', 'BOOLEAN'),
('jobs_plugin', 'version', '320', 'STRING'),
('modern_admin_theme', 'compact_mode', '0', 'STRING'),
('osclass', 'active_plugins', 'a:11:{i:0;s:21:"google_maps/index.php";i:1;s:26:"google_analytics/index.php";i:2;s:17:"youtube/index.php";i:3;s:29:"simple_social_share/index.php";i:4;s:20:"spamkiller/index.php";i:5;s:19:"telephone/index.php";i:6;s:21:"user_sidbar/index.php";i:7;s:27:"custom_attributes/index.php";i:8;s:25:"profile_picture/index.php";i:9;s:25:"jobs_attributes/index.php";i:10;s:18:"richedit/index.php";}', 'STRING'),
('osclass', 'admin_language', 'ru_RU', 'STRING'),
('osclass', 'admin_theme', 'modern', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'allow_report_osclass', '1', 'BOOLEAN'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'disabled', 'STRING'),
('osclass', 'comments_per_page', '10', 'INTEGER'),
('osclass', 'contactEmail', 'xzyinmail@gmail.com', 'STRING'),
('osclass', 'contact_attachment', '0', 'STRING'),
('osclass', 'csrf_name', 'CSRF2109665948', 'STRING'),
('osclass', 'currency', 'USD', 'STRING'),
('osclass', 'dateFormat', 'F j, Y', 'STRING'),
('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
('osclass', 'defaultResultsPerPage@search', '12', 'STRING'),
('osclass', 'defaultShowAs@search', 'list', 'STRING'),
('osclass', 'description_character_length', '5000', 'INTEGER'),
('osclass', 'dimNormal', '640x480', 'STRING'),
('osclass', 'dimPreview', '480x340', 'STRING'),
('osclass', 'dimThumbnail', '240x200', 'STRING'),
('osclass', 'enabled_comments', '1', 'BOOLEAN'),
('osclass', 'enabled_recaptcha_items', '0', 'BOOLEAN'),
('osclass', 'enabled_users', '1', 'BOOLEAN'),
('osclass', 'enabled_user_registration', '1', 'BOOLEAN'),
('osclass', 'enabled_user_validation', '1', 'BOOLEAN'),
('osclass', 'enableField#f_price@items', '1', 'BOOLEAN'),
('osclass', 'enableField#images@items', '1', 'BOOLEAN'),
('osclass', 'force_aspect_image', '0', 'BOOLEAN'),
('osclass', 'installed_plugins', 'a:11:{i:0;s:26:"google_analytics/index.php";i:1;s:21:"google_maps/index.php";i:2;s:17:"youtube/index.php";i:3;s:29:"simple_social_share/index.php";i:4;s:20:"spamkiller/index.php";i:5;s:19:"telephone/index.php";i:6;s:21:"user_sidbar/index.php";i:7;s:27:"custom_attributes/index.php";i:8;s:25:"profile_picture/index.php";i:9;s:25:"jobs_attributes/index.php";i:10;s:18:"richedit/index.php";}', 'STRING'),
('osclass', 'items_wait_time', '0', 'INTEGER'),
('osclass', 'item_attachment', '0', 'BOOLEAN'),
('osclass', 'keep_original_image', '1', 'BOOLEAN'),
('osclass', 'language', 'ru_RU', 'STRING'),
('osclass', 'languages_downloaded', '["ru_RU"]', 'STRING'),
('osclass', 'languages_last_version_check', '1486830255', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1492695618', 'STRING'),
('osclass', 'location_todo', '1', 'STRING'),
('osclass', 'logged_user_item_validation', '1', 'BOOLEAN'),
('osclass', 'mailserver_auth', '', 'BOOLEAN'),
('osclass', 'mailserver_host', 'localhost', 'STRING'),
('osclass', 'mailserver_mail_from', '', 'STRING'),
('osclass', 'mailserver_name_from', '', 'STRING'),
('osclass', 'mailserver_password', '', 'STRING'),
('osclass', 'mailserver_pop', '', 'BOOLEAN'),
('osclass', 'mailserver_port', '', 'INTEGER'),
('osclass', 'mailserver_ssl', '', 'STRING'),
('osclass', 'mailserver_type', 'custom', 'STRING'),
('osclass', 'mailserver_username', '', 'STRING'),
('osclass', 'marketAllowExternalSources', '0', 'STRING'),
('osclass', 'marketAPIConnect', '', 'STRING'),
('osclass', 'marketCategories', '{"0":{"value":"135","label":"Apps","categories":[]},"languages":{"value":"98","label":"Languages","categories":[]},"themes":{"value":"96","label":"Themes","categories":[{"value":"102","label":"General","categories":[]},{"value":"100","label":"Jobs","categories":[]},{"value":"101","label":"Real estate","categories":[]},{"value":"99","label":"Automotive","categories":[]}]},"plugins":{"value":"97","label":"Plugins","categories":[{"value":"103","label":"Ad management","categories":[]},{"value":"132","label":"Appearance","categories":[]},{"value":"105","label":"Analytics","categories":[]},{"value":"130","label":"Attributes","categories":[]},{"value":"106","label":"Counters","categories":[]},{"value":"107","label":"Cloud tools","categories":[]},{"value":"109","label":"Customer support","categories":[]},{"value":"110","label":"DB tools","categories":[]},{"value":"111","label":"Date \\/ Time","categories":[]},{"value":"112","label":"E-mail","categories":[]},{"value":"114","label":"Image galleries \\/ sliders","categories":[]},{"value":"115","label":"Maps","categories":[]},{"value":"116","label":"Mobile","categories":[]},{"value":"117","label":"Messaging","categories":[]},{"value":"131","label":"Monetize","categories":[]},{"value":"119","label":"Reviews &amp; Ratings","categories":[]},{"value":"134","label":"Search tools","categories":[]},{"value":"120","label":"Site recommendation","categories":[]},{"value":"121","label":"User Management","categories":[]},{"value":"122","label":"Payments","categories":[]},{"value":"124","label":"Text processing \\/ WYSIWYG Editors","categories":[]},{"value":"125","label":"Video \\/ Audio","categories":[]},{"value":"126","label":"Social Networks","categories":[]},{"value":"127","label":"SEO","categories":[]},{"value":"133","label":"Security","categories":[]},{"value":"128","label":"Miscellaneous","categories":[]}]}}', 'STRING'),
('osclass', 'marketDataUpdate', '1486830307', 'STRING'),
('osclass', 'marketURL', 'https://market.osclass.org/api/v2/', 'STRING'),
('osclass', 'maxLatestItems@home', '12', 'STRING'),
('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
('osclass', 'maxSizeKb', '2048', 'INTEGER'),
('osclass', 'moderate_comments', '0', 'INTEGER'),
('osclass', 'moderate_items', '-1', 'INTEGER'),
('osclass', 'mod_rewrite_loaded', '0', 'BOOLEAN'),
('osclass', 'notify_contact_friends', '1', 'BOOLEAN'),
('osclass', 'notify_contact_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment_user', '0', 'BOOLEAN'),
('osclass', 'notify_new_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_user', '1', 'BOOLEAN'),
('osclass', 'numImages@items', '4', 'INTEGER'),
('osclass', 'num_rss_items', '50', 'STRING'),
('osclass', 'osclass_installed', '1', 'BOOLEAN'),
('osclass', 'pageDesc', '', 'STRING'),
('osclass', 'pageTitle', 'zio', 'STRING'),
('osclass', 'ping_search_engines', '1', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '["custom_attributes","youtube","http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php","http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php","jobs-attributes","","rich-edit","simple-social-share","","telephone-plugin","user-sidbar","cars-attributes"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1486830254', 'STRING'),
('osclass', 'plugins_to_update', '[]', 'STRING'),
('osclass', 'plugins_update_count', '0', 'STRING'),
('osclass', 'purge_latest_searches', '1000', 'STRING'),
('osclass', 'recaptchaPrivKey', '', 'STRING'),
('osclass', 'recaptchaPubKey', '', 'STRING'),
('osclass', 'recaptcha_version', '2', 'STRING'),
('osclass', 'reg_user_can_contact', '0', 'BOOLEAN'),
('osclass', 'reg_user_post', '0', 'BOOLEAN'),
('osclass', 'reg_user_post_comments', '0', 'BOOLEAN'),
('osclass', 'rewriteEnabled', '0', 'BOOLEAN'),
('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
('osclass', 'rewrite_contact', 'contact', 'STRING'),
('osclass', 'rewrite_feed', 'feed', 'STRING'),
('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}', 'STRING'),
('osclass', 'rewrite_language', 'language', 'STRING'),
('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
('osclass', 'rewrite_rules', '', 'STRING'),
('osclass', 'rewrite_search_category', 'category', 'STRING'),
('osclass', 'rewrite_search_city', 'city', 'STRING'),
('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
('osclass', 'rewrite_search_country', 'country', 'STRING'),
('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
('osclass', 'rewrite_search_region', 'region', 'STRING'),
('osclass', 'rewrite_search_url', 'search', 'STRING'),
('osclass', 'rewrite_search_user', 'user', 'STRING'),
('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
('osclass', 'save_latest_searches', '0', 'BOOLEAN'),
('osclass', 'selectable_parent_categories', '', 'STRING'),
('osclass', 'seo_url_search_prefix', '', 'STRING'),
('osclass', 'subdomain_host', '', 'STRING'),
('osclass', 'subdomain_type', '', 'STRING'),
('osclass', 'theme', 'osclasswizards', 'STRING'),
('osclass', 'themes_downloaded', '["bender","osclasswizards-free-responsive-theme","readable",null]', 'STRING'),
('osclass', 'themes_last_version_check', '1486830242', 'STRING'),
('osclass', 'themes_to_update', '[]', 'STRING'),
('osclass', 'themes_update_count', '0', 'STRING'),
('osclass', 'timeFormat', 'g:i a', 'STRING'),
('osclass', 'timezone', 'Asia/Almaty', 'STRING'),
('osclass', 'title_character_length', '100', 'INTEGER'),
('osclass', 'update_core_json', '', 'STRING'),
('osclass', 'username_blacklist', 'admin,user', 'STRING'),
('osclass', 'use_imagick', '0', 'BOOLEAN'),
('osclass', 'version', '371', 'INTEGER'),
('osclass', 'warn_expiration', '0', 'INTEGER'),
('osclass', 'watermark_image', '', 'STRING'),
('osclass', 'watermark_place', 'centre', 'STRING'),
('osclass', 'watermark_text', '', 'STRING'),
('osclass', 'watermark_text_color', '', 'STRING'),
('osclass', 'weekStart', '0', 'STRING'),
('osclasswizards_theme', 'defaultShowAs@all', 'list', 'STRING'),
('osclasswizards_theme', 'description_minimum_length', '3', 'STRING'),
('osclasswizards_theme', 'facebook-height', '400', 'STRING'),
('osclasswizards_theme', 'facebook-url', 'https://www.facebook.com/osclasswizards', 'STRING'),
('osclasswizards_theme', 'facebook-width', '340', 'STRING'),
('osclasswizards_theme', 'google_fonts', 'Open Sans', 'STRING'),
('osclasswizards_theme', 'keyword_placeholder', 'например, программист PHP', 'STRING'),
('osclasswizards_theme', 'locations_input_as', 'text', 'STRING'),
('osclasswizards_theme', 'popular_cities_limit', '10', 'STRING'),
('osclasswizards_theme', 'popular_regions_limit', '10', 'STRING'),
('osclasswizards_theme', 'popular_searches_limit', '10', 'STRING'),
('osclasswizards_theme', 'premium_listings_shown', '6', 'STRING'),
('osclasswizards_theme', 'premium_listings_shown_home', '6', 'STRING'),
('osclasswizards_theme', 'show_banner', '1', 'STRING'),
('osclasswizards_theme', 'show_popular', '1', 'STRING'),
('osclasswizards_theme', 'show_popular_cities', '1', 'STRING'),
('osclasswizards_theme', 'show_popular_regions', '1', 'STRING'),
('osclasswizards_theme', 'show_popular_searches', '1', 'STRING'),
('osclasswizards_theme', 'show_search_country', '1', 'STRING'),
('osclasswizards_theme', 'sub_cat_limit', '5', 'STRING'),
('osclasswizards_theme', 'theme_color', '#77c04b', 'STRING'),
('osclasswizards_theme', 'theme_color_mode', 'green', 'STRING'),
('osclasswizards_theme', 'title_minimum_length', '1', 'STRING'),
('osclasswizards_theme', 'version', '2.0.4', 'STRING'),
('osclasswizards_theme', 'welcome_message', 'Hello Guest, Welcome to OsclassWizards', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-1', 'SHOPPING-CART', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-2', 'CAR', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-3', 'BULLHORN', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-4', 'HOME', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-5', 'WRENCH', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-6', 'USERS', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-7', 'HEART', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-8', 'SUITCASE', 'STRING'),
('osclasswizards_theme_cat_icons', 'first_load_cat_icons', 'loaded', 'STRING'),
('plugin-google_analytics', 'google_analytics_id', '', 'STRING'),
('richedit', 'buttons1', 'bold,italic,underline,forecolor,separator,undo,redo,separator,justifycenter,justifyright,justifyfull,separator,bullist,numlist,separator,link,unlink,separator,code', 'STRING'),
('richedit', 'buttons2', '', 'STRING'),
('richedit', 'buttons3', '', 'STRING'),
('richedit', 'height', '240px', 'STRING'),
('richedit', 'plugins', '', 'STRING'),
('richedit', 'skin', 'o2k7', 'STRING'),
('richedit', 'skin_variant', 'silver', 'STRING'),
('richedit', 'theme', 'advanced', 'STRING'),
('richedit', 'width', '600px', 'STRING'),
('SpamKiller', 'enableon', '1', 'STRING'),
('SpamKiller', 'stopwords', 'alcohol,drug', 'STRING'),
('telephone', 'hide_digits', '0', 'STRING'),
('youtube', 'youtube_version', '200', 'STRING');

-- 
-- Вывод данных для таблицы oc_t_profile_picture
--
INSERT INTO oc_t_profile_picture VALUES
(1, 1, '.jpg');

-- 
-- Вывод данных для таблицы oc_t_widget
--

-- Таблица osclass.oc_t_widget не содержит данных

-- 
-- Вывод данных для таблицы table1
--

-- Таблица osclass.table1 не содержит данных

-- 
-- Вывод данных для таблицы oc_t_category_description
--
INSERT INTO oc_t_category_description VALUES
(1, 'ru_RU', 'Продажа', NULL, 'prodaja'),
(2, 'ru_RU', 'Авто-мото', NULL, 'avto-moto'),
(3, 'ru_RU', 'Обучение', NULL, 'obuchenie'),
(4, 'ru_RU', 'Недвижимость', NULL, 'nedvijimost'),
(5, 'ru_RU', 'Услуги', NULL, 'uslugi'),
(6, 'ru_RU', 'Сообщество', NULL, 'soobschestvo'),
(7, 'ru_RU', 'Знакомства', NULL, 'znakomstva'),
(8, 'ru_RU', 'Работа', NULL, 'rabota'),
(9, 'ru_RU', 'Животные', NULL, 'jivotnie'),
(10, 'ru_RU', 'Искусство - Коллекционирование', NULL, 'iskusstvo-kollektsionirovanie'),
(11, 'ru_RU', 'Обмен', NULL, 'obmen'),
(12, 'ru_RU', 'Книги - Журналы', NULL, 'knigi-jurnali'),
(13, 'ru_RU', 'Камеры - Аксессуары', NULL, 'kameri-aksessuari'),
(14, 'ru_RU', 'CDs - Рекордеры', NULL, 'cds-rekorderi'),
(15, 'ru_RU', 'Мобильные телефоны - Аксессуары', NULL, 'mobilnie-telefoni-aksessuari'),
(16, 'ru_RU', 'Одежда', NULL, 'odejda'),
(17, 'ru_RU', 'Компьютеры - Комплектующие', NULL, 'kompyuteri-komplektuyuschie'),
(18, 'ru_RU', 'DVD', NULL, 'dvd'),
(19, 'ru_RU', 'Электроника', NULL, 'elektronika'),
(20, 'ru_RU', 'Детские товары', NULL, 'detskie-tovari'),
(21, 'ru_RU', 'Гаражная распродажа', NULL, 'garajnaya-rasprodaja'),
(22, 'ru_RU', 'Красота и здоровье', NULL, 'krasota-i-zdorove'),
(23, 'ru_RU', 'Дом - Мебель - Для дома и сада', NULL, 'dom-mebel-dlya-doma-i-sada'),
(24, 'ru_RU', 'Ювелирные изделия - Часы', NULL, 'yuvelirnie-izdeliya-chasi'),
(25, 'ru_RU', 'Музыкальные инструменты', NULL, 'muzikalnie-instrumenti'),
(26, 'ru_RU', 'Товары для спорта - велосипеды', NULL, 'tovari-dlya-sporta-velosipedi'),
(27, 'ru_RU', 'Билеты', NULL, 'bileti'),
(28, 'ru_RU', 'Игрушки - Игры - Хобби', NULL, 'igrushki-igri-hobbi'),
(29, 'ru_RU', 'Видеоигры', NULL, 'videoigri'),
(30, 'ru_RU', 'Что-то еще', NULL, 'chto-to-esche'),
(31, 'ru_RU', 'Автомобили', NULL, 'avtomobili'),
(32, 'ru_RU', 'Автозапчасти', NULL, 'avtozapchasti'),
(33, 'ru_RU', 'Мотоциклы', NULL, 'mototsikli'),
(34, 'ru_RU', 'Лодки - Яхты', NULL, 'lodki-yahti'),
(35, 'ru_RU', 'Прицепы - Дома на колесах', NULL, 'pritsepi-doma-na-kolesah'),
(36, 'ru_RU', 'Грузовики - Коммерческая техника', NULL, 'gruzoviki-kommercheskaya-tehnika'),
(37, 'ru_RU', 'Другая техника', NULL, 'drugaya-tehnika'),
(38, 'ru_RU', 'Обучения компьютерам', NULL, 'obucheniya-kompyuteram'),
(39, 'ru_RU', 'Обучение языкам', NULL, 'obuchenie-yazikam'),
(40, 'ru_RU', 'Обучение Музыка - Театр - Тацны', NULL, 'obuchenie-muzika-teatr-tatsni'),
(41, 'ru_RU', 'Репетиторы - Частные уроки', NULL, 'repetitori-chastnie-uroki'),
(42, 'ru_RU', 'Другие тренинги', NULL, 'drugie-treningi'),
(43, 'ru_RU', 'Дома или квартиры на продажу', NULL, 'doma-ili-kvartiri-na-prodaju'),
(44, 'ru_RU', 'Дома или квартиры в аренду', NULL, 'doma-ili-kvartiri-v-arendu'),
(45, 'ru_RU', 'Аренда комнат', NULL, 'arenda-komnat'),
(46, 'ru_RU', 'Обмен недвижимости', NULL, 'obmen-nedvijimosti'),
(47, 'ru_RU', 'Аренда недвижимости на курортах', NULL, 'arenda-nedvijimosti-na-kurortah'),
(48, 'ru_RU', 'Стоянки', NULL, 'stoyanki'),
(49, 'ru_RU', 'Земля', NULL, 'zemlya'),
(50, 'ru_RU', 'Офисы - Коммерческая недвижимость', NULL, 'ofisi-kommercheskaya-nedvijimost'),
(51, 'ru_RU', 'Магазины в аренду или на продажу', NULL, 'magazini-v-arendu-ili-na-prodaju'),
(52, 'ru_RU', 'Сиделки - Няньки', NULL, 'sidelki-nyanki'),
(53, 'ru_RU', 'Кастинги - Прослушивания', NULL, 'kastingi-proslushivaniya'),
(54, 'ru_RU', 'Компьютеры', NULL, 'kompyuteri'),
(55, 'ru_RU', 'Запчасти', NULL, 'zapchasti'),
(56, 'ru_RU', 'Здоровье - Фитнес', NULL, 'zdorove-fitnes'),
(57, 'ru_RU', 'Гадания - Гороскопы', NULL, 'gadaniya-goroskopi'),
(58, 'ru_RU', 'Помощь по дому', NULL, 'pomosch-po-domu'),
(59, 'ru_RU', 'Хранение - Перевозка', NULL, 'hranenie-perevozka'),
(60, 'ru_RU', 'Ремонт', NULL, 'remont'),
(61, 'ru_RU', 'Писать - Редактировать - Переводить', NULL, 'pisat-redaktirovat-perevodit'),
(62, 'ru_RU', 'Другие услуги', NULL, 'drugie-uslugi'),
(63, 'ru_RU', 'Карпул', NULL, 'karpul'),
(64, 'ru_RU', 'Общественная деятельность', NULL, 'obschestvennaya-deyatelnost'),
(65, 'ru_RU', 'События', NULL, 'sobitiya'),
(66, 'ru_RU', 'Музыканты - Артисты - Группы', NULL, 'muzikanti-artisti-gruppi'),
(67, 'ru_RU', 'Волонтеры', NULL, 'volonteri'),
(68, 'ru_RU', 'Потери и Находки', NULL, 'poteri-i-nahodki'),
(69, 'ru_RU', 'Женщина ищет Мужчину', NULL, 'jenschina-ischet-mujchinu'),
(70, 'ru_RU', 'Мужчина ищет Женщину', NULL, 'mujchina-ischet-jenschinu'),
(71, 'ru_RU', 'Мужчина ищет Мужчину', NULL, 'mujchina-ischet-mujchinu'),
(72, 'ru_RU', 'Женщина ищет Женщину', NULL, 'jenschina-ischet-jenschinu'),
(73, 'ru_RU', 'Дружба', NULL, 'drujba'),
(74, 'ru_RU', 'Поиск людей', NULL, 'poisk-lyudey'),
(75, 'ru_RU', 'Бухгалтерский учет - Финансы', NULL, 'buhgalterskiy-uchet-finansi'),
(76, 'ru_RU', 'Реклама - PR', NULL, 'reklama-pr'),
(77, 'ru_RU', 'Развлечения', NULL, 'razvlecheniya'),
(78, 'ru_RU', 'Администрация', NULL, 'administratsiya'),
(79, 'ru_RU', 'Обслуживание клиентов', NULL, 'obslujivanie-klientov'),
(80, 'ru_RU', 'Образование - Тренинги', NULL, 'obrazovanie-treningi'),
(81, 'ru_RU', 'Архитектура - Проектирование', NULL, 'arhitektura-proektirovanie'),
(82, 'ru_RU', 'Здоровье', NULL, 'zdorove'),
(83, 'ru_RU', 'Найм', NULL, 'naym'),
(84, 'ru_RU', 'Интернет', NULL, 'internet'),
(85, 'ru_RU', 'Право', NULL, 'pravo'),
(86, 'ru_RU', 'Ручная работа', NULL, 'ruchnaya-rabota'),
(87, 'ru_RU', 'Производство', NULL, 'proizvodstvo'),
(88, 'ru_RU', 'Маркетинг', NULL, 'marketing'),
(89, 'ru_RU', 'Бесплатно - Волонетеры', NULL, 'besplatno-voloneteri'),
(90, 'ru_RU', 'Недвижимость', NULL, 'nedvijimost_1'),
(91, 'ru_RU', 'Рестораны - Фудсервис', NULL, 'restorani-fudservis'),
(92, 'ru_RU', 'Розница', NULL, 'roznitsa'),
(93, 'ru_RU', 'Продажи', NULL, 'prodaji'),
(94, 'ru_RU', 'Технология', NULL, 'tehnologiya'),
(95, 'ru_RU', 'Другая Работа', NULL, 'drugaya-rabota');

-- 
-- Вывод данных для таблицы oc_t_category_stats
--
INSERT INTO oc_t_category_stats VALUES
(1, 4),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 2),
(10, 0),
(11, 0),
(12, 0),
(13, 1),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 1),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0);

-- 
-- Вывод данных для таблицы oc_t_country_stats
--
INSERT INTO oc_t_country_stats VALUES
('KZ', 3);

-- 
-- Вывод данных для таблицы oc_t_item_car_model_attr
--
INSERT INTO oc_t_item_car_model_attr VALUES
(1, 1, 'TL'),
(2, 1, 'MDX'),
(3, 1, 'RDX'),
(4, 1, 'RL'),
(5, 1, 'Integra'),
(6, 1, 'TSX'),
(7, 2, 'A1'),
(8, 2, 'A3'),
(9, 2, 'A4'),
(10, 2, 'A5'),
(11, 2, 'A6'),
(12, 2, 'A8'),
(13, 2, 'S3'),
(14, 2, 'S4'),
(15, 2, 'S5'),
(16, 2, 'S6'),
(17, 2, 'S8'),
(18, 2, 'RS4'),
(19, 2, 'RS6'),
(20, 2, 'R8'),
(21, 2, 'Allroad'),
(22, 2, 'Q5'),
(23, 2, 'Q7'),
(24, 3, '156'),
(25, 3, '147'),
(26, 4, 'DB9'),
(27, 4, 'DBS'),
(28, 4, 'Vantage'),
(29, 5, '1600'),
(30, 5, 'M Z4'),
(31, 5, 'M1'),
(32, 5, 'M3'),
(33, 5, 'M5'),
(34, 5, 'M6'),
(35, 5, 'Serie 1'),
(36, 5, 'Serie 3'),
(37, 5, 'Serie 5'),
(38, 5, 'Serie 6'),
(39, 5, 'Serie 7'),
(40, 5, 'Serie 8'),
(41, 5, 'X1'),
(42, 5, 'X3'),
(43, 5, 'X5'),
(44, 5, 'X6'),
(45, 5, 'X6 M'),
(46, 5, 'Z3'),
(47, 5, 'Z4'),
(48, 6, 'Enclave'),
(49, 6, 'LaCrosse'),
(50, 6, 'LeSabre'),
(51, 6, 'Otro'),
(52, 6, 'Regal'),
(53, 6, 'Riviera'),
(54, 7, 'BLS'),
(55, 7, 'Catera'),
(56, 7, 'Concours'),
(57, 7, 'CTS'),
(58, 7, 'Deville'),
(59, 7, 'DHS'),
(60, 7, 'Escalade'),
(61, 7, 'Seville'),
(62, 7, 'SRX'),
(63, 7, 'STS'),
(64, 8, '1500'),
(65, 8, '210'),
(66, 8, '400'),
(67, 8, '454'),
(68, 8, 'Apache'),
(69, 8, 'Astra'),
(70, 8, 'Astro'),
(71, 8, 'Avalanche'),
(72, 8, 'Aveo'),
(73, 8, 'Bell Air'),
(74, 8, 'Blazer'),
(75, 8, 'Bravada'),
(76, 8, 'C 350'),
(77, 8, 'C 3500'),
(78, 8, 'C-15'),
(79, 8, 'C-20'),
(80, 8, 'C36'),
(81, 8, 'Camaro'),
(82, 8, 'Captiva'),
(83, 8, 'Cavalier'),
(84, 8, 'Chevy'),
(85, 8, 'Chevy Monza'),
(86, 8, 'Cheyenne'),
(87, 8, 'Citation-x11'),
(88, 8, 'Colorado'),
(89, 8, 'Corsa'),
(90, 8, 'Corsica'),
(91, 8, 'Corvette'),
(92, 8, 'Cruze'),
(93, 8, 'Custom'),
(94, 8, 'Cutlass'),
(95, 8, 'Deluxe'),
(96, 8, 'El Camino'),
(97, 8, 'Epica'),
(98, 8, 'Equinox'),
(99, 8, 'Eurocar'),
(100, 8, 'G-30'),
(101, 8, 'HHR'),
(102, 8, 'Impala'),
(103, 8, 'Kodiac'),
(104, 8, 'LUV'),
(105, 8, 'Malibu'),
(106, 8, 'Matiz'),
(107, 8, 'Meriva'),
(108, 8, 'Montecarlo'),
(109, 8, 'Monza'),
(110, 8, 'Monza C2'),
(111, 8, 'OldsMobile'),
(112, 8, 'Optra'),
(113, 8, 'Pop'),
(114, 8, 'S 10'),
(115, 8, 'Safari'),
(116, 8, 'Sierra'),
(117, 8, 'Silhouete'),
(118, 8, 'Silverado'),
(119, 8, 'Sonora'),
(120, 8, 'Spark'),
(121, 8, 'Suburban'),
(122, 8, 'Tahoe'),
(123, 8, 'Tornado'),
(124, 8, 'Tracker'),
(125, 8, 'Trailbalzer'),
(126, 8, 'Transport'),
(127, 8, 'Uplander'),
(128, 8, 'Vanette'),
(129, 8, 'Vectra'),
(130, 8, 'Venture'),
(131, 8, 'Yukon'),
(132, 8, 'Zafira'),
(133, 9, '300 C'),
(134, 9, '300 M'),
(135, 9, 'Aspen'),
(136, 9, 'Atos'),
(137, 9, 'Caravan'),
(138, 9, 'Cirrus'),
(139, 9, 'Concorde'),
(140, 9, 'Crossfire'),
(141, 9, 'D-350'),
(142, 9, 'Grand Caravan'),
(143, 9, 'Grand Voyager'),
(144, 9, 'Intrepid'),
(145, 9, 'Le Baron'),
(146, 9, 'LHS'),
(147, 9, 'Neon'),
(148, 9, 'New Yorker'),
(149, 9, 'Pacifica'),
(150, 9, 'PT Cruiser'),
(151, 9, 'RAM'),
(152, 9, 'Sebring'),
(153, 9, 'Shadow'),
(154, 9, 'Stratus'),
(155, 9, 'Town Country'),
(156, 9, 'Valiant'),
(157, 9, 'Voyager'),
(158, 10, 'Sedan'),
(159, 11, '1000'),
(160, 11, 'Atos'),
(161, 11, 'Attitude'),
(162, 11, 'Avenger'),
(163, 11, 'Caravan'),
(164, 11, 'Challenger'),
(165, 11, 'Charger'),
(166, 11, 'Coronet'),
(167, 11, 'D 600'),
(168, 11, 'D-150'),
(169, 11, 'D-250'),
(170, 11, 'D-350'),
(171, 11, 'Dakota'),
(172, 11, 'Dart'),
(173, 11, 'Durango'),
(174, 11, 'Grand Caravan'),
(175, 11, 'H-100'),
(176, 11, 'Intrepid'),
(177, 11, 'Journey'),
(178, 11, 'Neon'),
(179, 11, 'Nitro'),
(180, 11, 'RAM'),
(181, 11, 'Royal Mónaco'),
(182, 11, 'Stealth'),
(183, 11, 'Stratus'),
(184, 11, 'Valiant'),
(185, 11, 'Vanette'),
(186, 11, 'Verna'),
(187, 11, 'Viper'),
(188, 12, 'F1'),
(189, 12, 'F4'),
(190, 12, 'F5'),
(191, 14, '360'),
(192, 14, '430'),
(193, 14, '550'),
(194, 14, '575'),
(195, 14, '599'),
(196, 14, '612'),
(197, 15, '500'),
(198, 15, 'Abarth'),
(199, 15, 'Albea'),
(200, 15, 'Bravo'),
(201, 15, 'Ducato Cargo Van'),
(202, 15, 'Grande Punto'),
(203, 15, 'Idea Adventure'),
(204, 15, 'Palio'),
(205, 15, 'Panda'),
(206, 15, 'Stilo'),
(207, 15, 'Strada Pick-Up'),
(208, 16, 'Aerostar'),
(209, 16, 'Bronco'),
(210, 16, 'Contour'),
(211, 16, 'Cougar'),
(212, 16, 'Courier'),
(213, 16, 'Crown'),
(214, 16, 'E-150'),
(215, 16, 'Ecoline'),
(216, 16, 'EcoSport'),
(217, 16, 'Edge'),
(218, 16, 'Escape'),
(219, 16, 'Escort'),
(220, 16, 'Excurcion'),
(221, 16, 'Expedition'),
(222, 16, 'Explorer'),
(223, 16, 'F-100'),
(224, 16, 'F-150'),
(225, 16, 'F-200'),
(226, 16, 'F-250'),
(227, 16, 'F-350'),
(228, 16, 'F-450'),
(229, 16, 'F-550'),
(230, 16, 'Fairlane'),
(231, 16, 'Fairmont'),
(232, 16, 'Falcon'),
(233, 16, 'Fiesta'),
(234, 16, 'FiveHundred'),
(235, 16, 'Focus'),
(236, 16, 'Freestar'),
(237, 16, 'Fusion'),
(238, 16, 'Galaxie'),
(239, 16, 'Ghia'),
(240, 16, 'Grand Marquis'),
(241, 16, 'Ikon'),
(242, 16, 'Ka'),
(243, 16, 'Lobo'),
(244, 16, 'LTD'),
(245, 16, 'Maverick'),
(246, 16, 'Mercury'),
(247, 16, 'Mondeo'),
(248, 16, 'Mustang'),
(249, 16, 'Mystique'),
(250, 16, 'Ranger'),
(251, 16, 'Sable'),
(252, 16, 'Taurus'),
(253, 16, 'ThunderBird'),
(254, 16, 'Topaz'),
(255, 16, 'Transit'),
(256, 16, 'Vanette'),
(257, 16, 'Windstar'),
(258, 17, 'Metro'),
(259, 18, 'Acadia'),
(260, 18, 'Canyon'),
(261, 18, 'Jimmy'),
(262, 18, 'Safari'),
(263, 18, 'Savana Van'),
(264, 18, 'Sierra'),
(265, 18, 'Sonoma'),
(266, 18, 'Yukon'),
(267, 19, 'Accord'),
(268, 19, 'City'),
(269, 19, 'Civic'),
(270, 19, 'Crosstour'),
(271, 19, 'CR-V'),
(272, 19, 'Fit'),
(273, 19, 'Odissey'),
(274, 19, 'Passaport'),
(275, 19, 'Pilot'),
(276, 19, 'Ridgeline'),
(277, 20, 'H1'),
(278, 20, 'H2'),
(279, 20, 'H2 Alpha'),
(280, 20, 'H3'),
(281, 20, 'H3 Alpha'),
(282, 22, 'Q-45'),
(283, 22, 'I-35'),
(284, 22, 'Q-30'),
(285, 22, 'I-30'),
(286, 23, 'Rodeo'),
(287, 23, 'Amigo'),
(288, 23, 'ELF'),
(289, 24, 'S-Type'),
(290, 24, 'Vanden Plas'),
(291, 24, 'XK8'),
(292, 24, 'XKR'),
(293, 24, 'X-Type'),
(294, 25, 'Cherokee'),
(295, 25, 'CJ7'),
(296, 25, 'Commander'),
(297, 25, 'Compass'),
(298, 25, 'Grand Cherokee'),
(299, 25, 'Grand Wagon'),
(300, 25, 'Laredo'),
(301, 25, 'Liberty'),
(302, 25, 'Patriot'),
(303, 25, 'Rubicon'),
(304, 25, 'Sahara'),
(305, 25, 'Wagoneer'),
(306, 25, 'Wrangler'),
(307, 26, 'Gallardo'),
(308, 26, 'Murcielago'),
(309, 27, 'Defender'),
(310, 27, 'Discovery'),
(311, 27, 'FreeLander'),
(312, 27, 'LR2'),
(313, 27, 'LR3'),
(314, 27, 'RangeRover'),
(315, 28, 'Aviator'),
(316, 28, 'Continental'),
(317, 28, 'LS'),
(318, 28, 'Mark'),
(319, 28, 'MKX'),
(320, 28, 'Navigator'),
(321, 28, 'Town Car'),
(322, 28, 'Zephyr'),
(323, 29, 'Quattroporte'),
(324, 29, '3200 GT'),
(325, 29, 'Gran Turismo'),
(326, 30, '3'),
(327, 30, '5'),
(328, 30, '6'),
(329, 30, 'CX7'),
(330, 30, 'CX9'),
(331, 30, 'LX'),
(332, 30, 'MPV'),
(333, 30, 'MX-5'),
(334, 30, 'Pick Up'),
(335, 31, '220'),
(336, 31, '230'),
(337, 31, '280 SE'),
(338, 31, '450'),
(339, 31, '450 SLC'),
(340, 31, '500SEL'),
(341, 31, 'B-Class'),
(342, 31, 'C-Class'),
(343, 31, 'CL-Class'),
(344, 31, 'CLK-Class'),
(345, 31, 'CLS-Class'),
(346, 31, 'A-Class'),
(347, 31, 'E-Class'),
(348, 31, 'G-Class'),
(349, 31, 'GL-Class'),
(350, 31, 'GLK-Class'),
(351, 31, 'ML-Class'),
(352, 31, 'R-Class'),
(353, 31, 'S-Class'),
(354, 31, 'SL-Class'),
(355, 31, 'SLK-Class'),
(356, 31, 'Sprinter'),
(357, 31, 'Unimog'),
(358, 31, 'Vito'),
(359, 32, 'Cougar'),
(360, 32, 'Grand Marquis'),
(361, 32, 'Mariner'),
(362, 32, 'Milan'),
(363, 32, 'Montego'),
(364, 32, 'Mountaineer'),
(365, 32, 'Sable'),
(366, 34, 'Magnett'),
(367, 34, 'MG'),
(368, 34, 'MGA'),
(369, 34, 'MGB'),
(370, 34, 'TF'),
(371, 34, 'ZR'),
(372, 34, 'ZT'),
(373, 35, 'Cooper'),
(374, 35, 'Morris'),
(375, 36, '3000 GT'),
(376, 36, 'Eclipse'),
(377, 36, 'Endeavor'),
(378, 36, 'Galant'),
(379, 36, 'L-200'),
(380, 36, 'Lancer'),
(381, 36, 'Montero'),
(382, 36, 'Montero Sport'),
(383, 36, 'Outlander'),
(384, 37, '350Z'),
(385, 37, 'Almera'),
(386, 37, 'Altima'),
(387, 37, 'Aprio'),
(388, 37, 'Armada'),
(389, 37, 'Cabstar'),
(390, 37, 'Datsun'),
(391, 37, 'Estacas'),
(392, 37, 'Frontier'),
(393, 37, 'Lucino'),
(394, 37, 'Maxima'),
(395, 37, 'Micra'),
(396, 37, 'Murano'),
(397, 37, 'Nx 2000'),
(398, 37, 'Pathfinder'),
(399, 37, 'Pick Up'),
(400, 37, 'Platina'),
(401, 37, 'Quest'),
(402, 37, 'Rogue'),
(403, 37, 'Sakura'),
(404, 37, 'Samurai'),
(405, 37, 'Sentra'),
(406, 37, 'Serie 200'),
(407, 37, 'Serie 240'),
(408, 37, 'Serie 300'),
(409, 37, 'TIIDA'),
(410, 37, 'Titan'),
(411, 37, 'Tsuru'),
(412, 37, 'Urban'),
(413, 37, 'X-Terra'),
(414, 37, 'X-Trail'),
(415, 38, 'Bravada'),
(416, 38, 'Delta 88'),
(417, 38, 'Eigthy'),
(418, 39, '206'),
(419, 39, '207'),
(420, 39, '306'),
(421, 39, '307'),
(422, 39, '405'),
(423, 39, '405'),
(424, 39, '407'),
(425, 39, '607'),
(426, 39, 'Grand Raid'),
(427, 39, 'Partner'),
(428, 40, 'Grand Voyager'),
(429, 41, 'Aztek'),
(430, 41, 'Boneville'),
(431, 41, 'Fiero'),
(432, 41, 'Firebird'),
(433, 41, 'G3'),
(434, 41, 'G4'),
(435, 41, 'G5'),
(436, 41, 'G6'),
(437, 41, 'Grand Am'),
(438, 41, 'Grand Prix'),
(439, 41, 'GTO'),
(440, 41, 'Matiz'),
(441, 41, 'Montana'),
(442, 41, 'Solstice'),
(443, 41, 'Sunfire'),
(444, 41, 'Torrent'),
(445, 41, 'Trans Am'),
(446, 41, 'Transport'),
(447, 42, '550'),
(448, 42, '911'),
(449, 42, '914'),
(450, 42, '924'),
(451, 42, 'Boxter'),
(452, 42, 'Carrera GT'),
(453, 42, 'Cayenne'),
(454, 42, 'Cayman'),
(455, 42, 'GT3 Cup'),
(456, 42, 'Panamera'),
(457, 44, '10'),
(458, 44, '12'),
(459, 44, 'Clio'),
(460, 44, 'Kangoo'),
(461, 44, 'Laguna'),
(462, 44, 'Megane'),
(463, 44, 'Scenic'),
(464, 44, 'Scenic ll'),
(465, 44, 'Trafic'),
(466, 45, 'Silver Shadow'),
(467, 46, '75'),
(468, 47, '9-3'),
(469, 47, '9-5'),
(470, 48, 'Alhambra'),
(471, 48, 'Altea'),
(472, 48, 'Cordoba'),
(473, 48, 'Ibiza'),
(474, 48, 'Leon'),
(475, 48, 'Toledo'),
(476, 49, 'Impreza'),
(477, 49, 'Tribeca'),
(478, 49, 'Legacy'),
(479, 49, 'Outback'),
(480, 49, 'Forester'),
(481, 50, 'Aerio'),
(482, 50, 'Grand Vitara'),
(483, 50, 'Swift'),
(484, 50, 'SX4'),
(485, 50, 'Samurai'),
(486, 50, 'Kazashi'),
(487, 50, 'Xl7'),
(488, 51, '4 Runner'),
(489, 51, 'Avalon'),
(490, 51, 'Avanza'),
(491, 51, 'Camry'),
(492, 51, 'Corolla'),
(493, 51, 'Echo'),
(494, 51, 'FJ Cruiser'),
(495, 51, 'Hiace'),
(496, 51, 'Highlander'),
(497, 51, 'Hilux'),
(498, 51, 'Matrix'),
(499, 51, 'MR2'),
(500, 51, 'Pick Up'),
(501, 51, 'Previa'),
(502, 51, 'RAV-4'),
(503, 51, 'Sequoia'),
(504, 51, 'Sienna'),
(505, 51, 'Solara'),
(506, 51, 'SR5'),
(507, 51, 'Supra'),
(508, 51, 'Tacoma'),
(509, 51, 'Tercel'),
(510, 51, 'Tundra'),
(511, 51, 'Yaris'),
(512, 52, 'Atlantic'),
(513, 52, 'Beetle'),
(514, 52, 'Bora'),
(515, 52, 'Brasilia'),
(516, 52, 'Buggy'),
(517, 52, 'Cabrio'),
(518, 52, 'Caribe'),
(519, 52, 'Combi'),
(520, 52, 'Crafter'),
(521, 52, 'CrossFox'),
(522, 52, 'Derby'),
(523, 52, 'Eos'),
(524, 52, 'Eurovan'),
(525, 52, 'Golf'),
(526, 52, 'GTI'),
(527, 52, 'Jetta'),
(528, 52, 'Lupo'),
(529, 52, 'New Beetle'),
(530, 52, 'Passat'),
(531, 52, 'Pointer'),
(532, 52, 'Polo'),
(533, 52, 'Polo Classic'),
(534, 52, 'Routan'),
(535, 52, 'Safari'),
(536, 52, 'Sedan'),
(537, 52, 'Sharan'),
(538, 52, 'SportVan'),
(539, 52, 'Touareg'),
(540, 52, 'Van'),
(541, 53, 'C70'),
(542, 53, 'S40'),
(543, 53, 'S60'),
(544, 53, 'S80'),
(545, 53, 'V50'),
(546, 53, 'V70'),
(547, 53, 'XC'),
(548, 53, 'XC 60'),
(549, 53, 'XC 90');

-- 
-- Вывод данных для таблицы oc_t_item_car_vehicle_type_attr
--

-- Таблица osclass.oc_t_item_car_vehicle_type_attr не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_custom_attr_categories
--

-- Таблица osclass.oc_t_item_custom_attr_categories не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_custom_attr_meta
--

-- Таблица osclass.oc_t_item_custom_attr_meta не содержит данных

-- 
-- Вывод данных для таблицы oc_t_meta_categories
--

-- Таблица osclass.oc_t_meta_categories не содержит данных

-- 
-- Вывод данных для таблицы oc_t_pages_description
--
INSERT INTO oc_t_pages_description VALUES
(1, 'ru_RU', '{WEB_TITLE} - У кого-то есть вопрос о вашем объявлении', '<p>Привет {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) написал сообщение по поводу Вашего объявления <a href="{ITEM_URL}">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>С уважением,</p><p>{WEB_LINK}</p>'),
(2, 'ru_RU', 'Подтверждение регистрации на сайте {WEB_TITLE}', '<p>Привет {USER_NAME},</p><p>Просьба подтвердить Вашу регистрацию, нажав на следующую ссылку: {VALIDATION_LINK}</p><p>Спасибо!</p><p>С уважением,</p><p>{WEB_LINK}</p>'),
(3, 'ru_RU', '{WEB_TITLE} - Успешная регистрация!', '<p>Hi {USER_NAME},</p><p>You''ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(4, 'ru_RU', 'Посмотри, что я обнаружил на {WEB_TITLE}', '<p>Привет {FRIEND_NAME},</p><p>Ваш друг {USER_NAME} хочет поделиться с Вами информацией <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Сообщение:</p><p>{COMMENT}</p><p>С уважением,</p><p>{WEB_TITLE}</p>'),
(5, 'ru_RU', '{WEB_TITLE} - Новое объявление in the last hour', '<p>Привет {USER_NAME},</p><p>Новые объявления опубликованные за последний час. Взгляните на них:</p><p>{ADS}</p><p>-------------</p><p>Чтобы отписаться от этой рассылки , перейдите по ссылке: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'ru_RU', '{WEB_TITLE} - Новое объявление in the last day', '<p>Привет {USER_NAME},</p><p>Новые объявления за прошедший день. Взгляните на них:</p><p>{ADS}</p><p>-------------</p><p>Чтобы отписаться от этой рассылки, перейдите по ссылке: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'ru_RU', '{WEB_TITLE} - Новое объявление in the last week', '<p>Привет {USER_NAME},</p><p>Новые объявления опубликованные на прошлой неделе. Взгляните на них:</p><p>{ADS}</p><p>-------------</p><p>Чтобы отписаться от этой рассылки, перейдите по ссылке: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'ru_RU', '{WEB_TITLE} - Новое объявление', '<p>Привет {USER_NAME},</p><p>Опубликовано новое объявление!</p><p>{ADS}</p><p>-------------</p><p>Для того чтобы отписаться от этой рассылки, перейдите по ссылке: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(9, 'ru_RU', '{WEB_TITLE} - Новый комментарий', '<p>Someone commented on the listing <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter''s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(10, 'ru_RU', '{WEB_TITLE} - Возможности редактирования для объявления {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You''re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href="{ITEM_URL}">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'ru_RU', '{WEB_TITLE} - Подтверждение объявления', '<p>Hi {USER_NAME},</p><p>You''re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn''t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'ru_RU', '{WEB_TITLE} - Опубликовано новое объявление', '<p>Dear {WEB_TITLE} admin,</p><p>You''re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'ru_RU', '{WEB_TITLE} - Восстановления пароля', '<p>Hi {USER_NAME},</p><p>We''ve sent you this e-mail because you''ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn''t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'ru_RU', '{WEB_TITLE} - Запрос на смену адреса почты', '<p>Hi {USER_NAME}</p><p>You''re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'ru_RU', '{WEB_TITLE} - Пожалуйста, подтвердите подписку', '<p>Привет {USER_NAME},</p><p> подтвердите регистрацию, нажав на следующую ссылку: {VALIDATION_LINK}</p><p>Спасибо!</p><p>С уважением,</p><p>{WEB_LINK}</p>'),
(16, 'ru_RU', '{WEB_TITLE} - Ваш комментарий одобрен', '<p>Привет {COMMENT_AUTHOR},</p><p>Ваш комментарий на <a href="{ITEM_URL}">{ITEM_TITLE}</a> успешно утвержден.</p><p>С уважением,</p><p>{WEB_LINK}</p>'),
(17, 'ru_RU', '{WEB_TITLE} - Подтверждение объявления', '<p>Hi {USER_NAME},</p><p>You''re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn''t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you''re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'ru_RU', '{WEB_TITLE} - Регистрация нового пользователя', '<p>Dear {WEB_TITLE} admin,</p><p>You''re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'ru_RU', '{WEB_TITLE} - У кого то есть вопрос к Вам', '<p>Привет {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) оставил Вам сообщение:</p><p>{COMMENT}</p><p>С уважением,</p><p>{WEB_LINK}</p>'),
(20, 'ru_RU', '{WEB_TITLE} - Кто то оставил комментарий на Ваше объявление', '<p>There''s a new comment on the listing: <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author''s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(21, 'ru_RU', '{WEB_TITLE} - Успешное создание учетной записи администратора!', '<p>Здравствуйте {ADMIN_NAME},</p><p>Администратор {WEB_LINK} создал для Вас личный кабинет,</p><ul><li>Имя пользователя: {USERNAME}</li><li>Пароль: {PASSWORD}</li></ul><p>Для управления вашим личным кабинетом перейдите по ссылке {WEB_ADMIN_LINK}.</p><p>Благодарим Вас!</p><p>С уважением,</p>'),
(22, 'ru_RU', '{WEB_TITLE} - Ваше объявление скоро станет не актуальным', '<p>Привет {USER_NAME},</p><p> Ваше объявление <a href="{ITEM_URL}">{ITEM_TITLE}</a> - уже не актуально {WEB_LINK}.'),
(23, 'ru_RU', 'Пример названия страницы', 'Это описание примера страницы.');

-- 
-- Вывод данных для таблицы oc_t_plugin_category
--

-- Таблица osclass.oc_t_plugin_category не содержит данных

-- 
-- Вывод данных для таблицы oc_t_region
--

-- Таблица osclass.oc_t_region не содержит данных

-- 
-- Вывод данных для таблицы oc_t_city
--

-- Таблица osclass.oc_t_city не содержит данных

-- 
-- Вывод данных для таблицы oc_t_region_stats
--

-- Таблица osclass.oc_t_region_stats не содержит данных

-- 
-- Вывод данных для таблицы oc_t_city_area
--

-- Таблица osclass.oc_t_city_area не содержит данных

-- 
-- Вывод данных для таблицы oc_t_city_stats
--

-- Таблица osclass.oc_t_city_stats не содержит данных

-- 
-- Вывод данных для таблицы oc_t_keywords
--

-- Таблица osclass.oc_t_keywords не содержит данных

-- 
-- Вывод данных для таблицы oc_t_user
--
INSERT INTO oc_t_user VALUES
(1, '2017-02-07 16:30:34', '2017-02-07 16:40:50', 'Максат Оралбаев', '1', '$2y$15$oGf/7QdOU8utZ2UgjuaxuOB/9DjXi/kK1im.GTfhUkRY7vFj555Sq', 'tV3pYzUj', 'lolo@mail.ru', '', '87754041635', '87754041635', 1, 1, NULL, NULL, NULL, NULL, 'Казахстан', 'Турдалиев 23', '', NULL, 'Astana City', NULL, 'Астана', NULL, 'Астана', NULL, NULL, 0, 2, 0, '2017-02-12 18:39:53', '127.0.0.1'),
(2, '2017-02-07 21:48:28', '2017-02-07 21:48:28', 'Додо додович', 'dodo', '$2y$15$oOsxyDH4pJGT4MKH3WGuLud0a4vBOf9gclnrAgPFMq2Go8vK8TxQy', 'hreVQFi5', 'dodo@mail.ru', '', '', '87754041635', 1, 1, NULL, NULL, NULL, NULL, 'Kazakhstan', 'Турдалы', '66666666', NULL, 'Шымкент', NULL, 'Шымкент', NULL, 'Турдалы', NULL, NULL, 0, 1, 0, '2017-04-20 19:40:26', '127.0.0.1');

-- 
-- Вывод данных для таблицы oc_t_item
--
INSERT INTO oc_t_item VALUES
(1, NULL, 9, '2017-02-06 14:25:50', NULL, NULL, NULL, NULL, 'Пример автора', 'osclass@example.com', '127.0.0.1', 0, 1, 1, 0, 'PVOmgOPP', 0, '9999-12-31 23:59:59'),
(2, 1, 9, '2017-02-07 16:41:56', NULL, NULL, 1000000, 'USD', 'Максат Оралбаев', 'lolo@mail.ru', '127.0.0.1', 0, 1, 1, 0, 'uztKI9ZW', 0, '9999-12-31 23:59:59'),
(3, 1, 13, '2017-02-12 18:40:56', NULL, NULL, 1000000000, 'USD', 'Максат Оралбаев', 'lolo@mail.ru', '127.0.0.1', 0, 1, 1, 0, 'U1LQjBUC', 0, '9999-12-31 23:59:59'),
(4, 2, 18, '2017-02-12 19:10:11', NULL, NULL, 12000000, 'USD', 'Додо додович', 'dodo@mail.ru', '127.0.0.1', 0, 1, 1, 0, 'byhCQ1ii', 0, '9999-12-31 23:59:59');

-- 
-- Вывод данных для таблицы oc_t_user_description
--
INSERT INTO oc_t_user_description VALUES
(1, 'ru_RU', ''),
(2, 'ru_RU', '');

-- 
-- Вывод данных для таблицы oc_t_user_email_tmp
--

-- Таблица osclass.oc_t_user_email_tmp не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_car_attr
--

-- Таблица osclass.oc_t_item_car_attr не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_comment
--
INSERT INTO oc_t_item_comment VALUES
(1, 2, '2017-02-07 21:49:59', 'iy s dodo', 'Додо додович', 'dodo@mail.ru', 'hi lolo', 1, 0, 0, 2);

-- 
-- Вывод данных для таблицы oc_t_item_custom_attr_values
--

-- Таблица osclass.oc_t_item_custom_attr_values не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_job_attr
--

-- Таблица osclass.oc_t_item_job_attr не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_job_description_attr
--

-- Таблица osclass.oc_t_item_job_description_attr не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_location
--
INSERT INTO oc_t_item_location VALUES
(1, NULL, 'Пример страны', '', NULL, NULL, 'Пример региона', NULL, 'Пример города', NULL, '', NULL, NULL),
(2, 'KZ', 'Kazakhstan', 'Турдалиев 23', NULL, NULL, 'Astana City', NULL, 'Астана', NULL, 'Астана', NULL, NULL),
(3, 'KZ', 'Kazakhstan', 'Турдалиев 23', NULL, NULL, 'ЮКО', NULL, 'Шымкент', NULL, 'Астана', NULL, NULL),
(4, 'KZ', 'Kazakhstan', 'Турдалы', NULL, NULL, 'ЮКО', NULL, 'Шымкент', NULL, 'Турдалы', NULL, NULL);

-- 
-- Вывод данных для таблицы oc_t_item_meta
--

-- Таблица osclass.oc_t_item_meta не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_resource
--
INSERT INTO oc_t_item_resource VALUES
(1, 2, 'EeAiILIT', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(2, 2, 'vakVq0Va', 'jpg', 'image/jpeg', 'oc-content/uploads/0/');

-- 
-- Вывод данных для таблицы oc_t_item_stats
--
INSERT INTO oc_t_item_stats VALUES
(1, 1, 0, 0, 0, 0, 0, 0, '2017-02-06'),
(2, 0, 0, 0, 0, 0, 0, 0, '2017-02-07'),
(2, 1, 0, 0, 0, 0, 0, 0, '2017-04-20'),
(3, 0, 0, 0, 0, 0, 0, 0, '2017-02-12'),
(4, 0, 0, 0, 0, 0, 0, 0, '2017-02-12');

-- 
-- Вывод данных для таблицы oc_t_item_telephone
--

-- Таблица osclass.oc_t_item_telephone не содержит данных

-- 
-- Вывод данных для таблицы oc_t_item_youtube
--

-- Таблица osclass.oc_t_item_youtube не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;