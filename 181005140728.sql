/*
MySQL Backup
Source Server Version: 5.5.5
Source Database: ciputraqs
Date: 5/10/2018 14:07:29
*/


-- ----------------------------
--  Table structure for `approval_actions`
-- ----------------------------
DROP TABLE IF EXISTS `approval_actions`;
CREATE TABLE `approval_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `approval_histories`
-- ----------------------------
DROP TABLE IF EXISTS `approval_histories`;
CREATE TABLE `approval_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `approval_action_id` int(11) NOT NULL DEFAULT '0',
  `no_urut` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approval_histories_document_id_user_id_index` (`document_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `approval_references`
-- ----------------------------
DROP TABLE IF EXISTS `approval_references`;
CREATE TABLE `approval_references` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `min_value` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_action` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approval_references_user_id_project_id_pt_id_index` (`user_id`,`project_id`,`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `approvals`
-- ----------------------------
DROP TABLE IF EXISTS `approvals`;
CREATE TABLE `approvals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `approval_action_id` int(11) NOT NULL DEFAULT '1',
  `document_id` int(11) DEFAULT NULL,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_nilai` double(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approvals_document_id_index` (`document_id`),
  KEY `approvals_approval_action_id_index` (`approval_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_detail_items`
-- ----------------------------
DROP TABLE IF EXISTS `asset_detail_items`;
CREATE TABLE `asset_detail_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_detail_id` int(11) DEFAULT NULL,
  `barangkeluar_detail_price_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_details`
-- ----------------------------
DROP TABLE IF EXISTS `asset_details`;
CREATE TABLE `asset_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventarisir_detail_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reuse` smallint(6) DEFAULT NULL,
  `reuse_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_progresses`
-- ----------------------------
DROP TABLE IF EXISTS `asset_progresses`;
CREATE TABLE `asset_progresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `asset_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templatepekerjaan_detail_id` int(11) DEFAULT NULL,
  `progresslapangan_percent` decimal(5,2) DEFAULT NULL,
  `progressbap_percent` decimal(5,2) DEFAULT NULL,
  `mulai_jadwal_date` date DEFAULT NULL,
  `selesai_jadwal_date` date DEFAULT NULL,
  `selesai_actual_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_progresses_asset_id_index` (`asset_id`),
  KEY `asset_progresses_templatepekerjaan_detail_id_index` (`templatepekerjaan_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_transaction_detail_images`
-- ----------------------------
DROP TABLE IF EXISTS `asset_transaction_detail_images`;
CREATE TABLE `asset_transaction_detail_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_transaction_detail_id` int(11) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_transaction_details`
-- ----------------------------
DROP TABLE IF EXISTS `asset_transaction_details`;
CREATE TABLE `asset_transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_transaction_id` int(11) DEFAULT NULL,
  `asset_detail_item_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `from_department_id` int(11) DEFAULT NULL,
  `from_unit_sub_id` int(11) DEFAULT NULL,
  `from_location_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `to_department_id` int(11) DEFAULT NULL,
  `to_unit_sub_id` int(11) DEFAULT NULL,
  `to_location_id` int(11) DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_transaction_images`
-- ----------------------------
DROP TABLE IF EXISTS `asset_transaction_images`;
CREATE TABLE `asset_transaction_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_transaction_id` int(11) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_data` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_transaction_images_asset_transaction_id_index` (`asset_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `asset_transactions`
-- ----------------------------
DROP TABLE IF EXISTS `asset_transactions`;
CREATE TABLE `asset_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `from_department_id` int(11) DEFAULT NULL,
  `from_unit_sub_id` int(11) DEFAULT NULL,
  `from_location_id` int(11) DEFAULT NULL,
  `from_room_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `to_department_id` int(11) DEFAULT NULL,
  `to_unit_sub_id` int(11) DEFAULT NULL,
  `to_location_id` int(11) DEFAULT NULL,
  `to_room_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_transactions_asset_id_index` (`asset_id`),
  KEY `asset_transactions_from_user_id_index` (`from_user_id`),
  KEY `asset_transactions_from_department_id_index` (`from_department_id`),
  KEY `asset_transactions_from_unit_sub_id_index` (`from_unit_sub_id`),
  KEY `asset_transactions_from_location_id_index` (`from_location_id`),
  KEY `asset_transactions_to_user_id_index` (`to_user_id`),
  KEY `asset_transactions_to_department_id_index` (`to_department_id`),
  KEY `asset_transactions_to_unit_sub_id_index` (`to_unit_sub_id`),
  KEY `asset_transactions_to_location_id_index` (`to_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `assets`
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventarisir_detail_id` int(11) DEFAULT NULL,
  `sumber_id` int(11) DEFAULT NULL,
  `sumber_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `nilai_ekonomis` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `asset_age` date DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` float(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_labeled` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_item_id_index` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `banks`
-- ----------------------------
DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `bap_detail_itempekerjaans`
-- ----------------------------
DROP TABLE IF EXISTS `bap_detail_itempekerjaans`;
CREATE TABLE `bap_detail_itempekerjaans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bap_detail_id` int(11) DEFAULT NULL,
  `spkvo_unit_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `terbayar_percent` decimal(5,2) DEFAULT NULL,
  `lapangan_percent` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bap_detail_itempekerjaans_bap_detail_id_itempekerjaan_id_index` (`bap_detail_id`,`itempekerjaan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `bap_details`
-- ----------------------------
DROP TABLE IF EXISTS `bap_details`;
CREATE TABLE `bap_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bap_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `asset_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bap_details_bap_id_asset_id_index` (`bap_id`,`asset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `bap_goodreceive_potongans`
-- ----------------------------
DROP TABLE IF EXISTS `bap_goodreceive_potongans`;
CREATE TABLE `bap_goodreceive_potongans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `coa_id` int(11) DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bap_goodreceive_potongans_head_id_index` (`head_id`),
  KEY `bap_goodreceive_potongans_head_type_index` (`head_type`),
  KEY `bap_goodreceive_potongans_voucher_id_index` (`voucher_id`),
  KEY `bap_goodreceive_potongans_coa_id_index` (`coa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `bap_pphs`
-- ----------------------------
DROP TABLE IF EXISTS `bap_pphs`;
CREATE TABLE `bap_pphs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bap_id` int(11) DEFAULT NULL,
  `coa_id` int(11) DEFAULT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bap_pphs_bap_id_coa_id_index` (`bap_id`,`coa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `baps`
-- ----------------------------
DROP TABLE IF EXISTS `baps`;
CREATE TABLE `baps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spk_id` int(11) DEFAULT NULL,
  `spk_retensi_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `termin` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai_administrasi` double(15,2) DEFAULT NULL,
  `nilai_denda` double(15,2) DEFAULT NULL,
  `nilai_selisih` double(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `baps_spk_id_index` (`spk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barang_masuk_hibah_details`
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk_hibah_details`;
CREATE TABLE `barang_masuk_hibah_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang_masuk_hibah_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_acuan` int(11) DEFAULT NULL,
  `quantity_reject` int(11) DEFAULT NULL,
  `quantity_sisa` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barang_masuk_hibah_details_barang_masuk_hibah_id_index` (`barang_masuk_hibah_id`),
  KEY `barang_masuk_hibah_details_warehouse_id_index` (`warehouse_id`),
  KEY `barang_masuk_hibah_details_item_id_index` (`item_id`),
  KEY `barang_masuk_hibah_details_item_satuan_id_index` (`item_satuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barang_masuk_hibahs`
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk_hibahs`;
CREATE TABLE `barang_masuk_hibahs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_project_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_pt_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_project_id` int(11) DEFAULT NULL,
  `to_pt_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_recipient_id` int(11) DEFAULT NULL,
  `no_refrensi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_hibah` date DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangkeluar_detail_prices`
-- ----------------------------
DROP TABLE IF EXISTS `barangkeluar_detail_prices`;
CREATE TABLE `barangkeluar_detail_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barangkeluar_detail_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangkeluar_details`
-- ----------------------------
DROP TABLE IF EXISTS `barangkeluar_details`;
CREATE TABLE `barangkeluar_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barangkeluar_id` int(11) DEFAULT NULL,
  `permintaanbarang_detail_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `is_sent` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangkeluars`
-- ----------------------------
DROP TABLE IF EXISTS `barangkeluars`;
CREATE TABLE `barangkeluars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permintaanbarang_id` int(11) DEFAULT NULL,
  `confirmed_by_warehouseman` int(11) DEFAULT NULL,
  `confirmed_by_requester` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangmasuk_details`
-- ----------------------------
DROP TABLE IF EXISTS `barangmasuk_details`;
CREATE TABLE `barangmasuk_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barangmasuk_id` int(11) DEFAULT NULL,
  `purchaseorder_detail_id` int(11) DEFAULT NULL,
  `goodreceive_detail_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangmasuk_hibah_detail_pengisians`
-- ----------------------------
DROP TABLE IF EXISTS `barangmasuk_hibah_detail_pengisians`;
CREATE TABLE `barangmasuk_hibah_detail_pengisians` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang_masuk_hibah_id` int(11) DEFAULT NULL,
  `barang_masuk_hibah_detail_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_reject` int(11) DEFAULT NULL,
  `quantity_sisa` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barangmasuk_hibah_detail_pengisians_barang_masuk_hibah_id_index` (`barang_masuk_hibah_id`),
  KEY `barangmasuk_hibah_detail_pengisians_warehouse_id_index` (`warehouse_id`),
  KEY `barangmasuk_hibah_detail_pengisians_item_id_index` (`item_id`),
  KEY `barangmasuk_hibah_detail_pengisians_item_satuan_id_index` (`item_satuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangmasuks`
-- ----------------------------
DROP TABLE IF EXISTS `barangmasuks`;
CREATE TABLE `barangmasuks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) DEFAULT NULL,
  `sumber_id` int(11) DEFAULT NULL,
  `sumber_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_by_warehouseman` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_by_requester` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_by_warehouseman_at` timestamp NULL DEFAULT NULL,
  `confirmed_by_requester_at` timestamp NULL DEFAULT NULL,
  `approval_status_id` int(11) NOT NULL DEFAULT '0',
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangretur_details`
-- ----------------------------
DROP TABLE IF EXISTS `barangretur_details`;
CREATE TABLE `barangretur_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barangretur_id` int(11) NOT NULL,
  `goodreceive_detail_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `pph` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barangretur_details_barangretur_id_index` (`barangretur_id`),
  KEY `barangretur_details_goodreceive_detail_id_index` (`goodreceive_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `barangreturs`
-- ----------------------------
DROP TABLE IF EXISTS `barangreturs`;
CREATE TABLE `barangreturs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodreceive_id` int(11) NOT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ditahan` double(15,2) NOT NULL DEFAULT '0.00',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barangreturs_goodreceive_id_index` (`goodreceive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `bloks`
-- ----------------------------
DROP TABLE IF EXISTS `bloks`;
CREATE TABLE `bloks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `project_kawasan_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luas` double(10,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bloks_project_id_project_kawasan_id_index` (`project_id`,`project_kawasan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `brands`
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `budget_details`
-- ----------------------------
DROP TABLE IF EXISTS `budget_details`;
CREATE TABLE `budget_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `volume` double(15,2) DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `budget_details_budget_id_itempekerjaan_id_index` (`budget_id`,`itempekerjaan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `budget_tahunan_details`
-- ----------------------------
DROP TABLE IF EXISTS `budget_tahunan_details`;
CREATE TABLE `budget_tahunan_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_tahunan_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `volume` double(15,2) DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `max_overbudget` decimal(5,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `budget_tahunan_details_budget_tahunan_id_itempekerjaan_id_index` (`budget_tahunan_id`,`itempekerjaan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `budget_tahunans`
-- ----------------------------
DROP TABLE IF EXISTS `budget_tahunans`;
CREATE TABLE `budget_tahunans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun_anggaran` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `budget_tahunans_budget_id_parent_id_index` (`budget_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `budgets`
-- ----------------------------
DROP TABLE IF EXISTS `budgets`;
CREATE TABLE `budgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pt_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `project_kawasan_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `budgets_pt_id_index` (`pt_id`),
  KEY `budgets_department_id_index` (`department_id`),
  KEY `budgets_project_id_index` (`project_id`),
  KEY `budgets_parent_id_index` (`parent_id`),
  KEY `budgets_project_kawasan_id_index` (`project_kawasan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `chats`
-- ----------------------------
DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user_id_user_to_index` (`user_id`,`user_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `cities`
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_province_id_index` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `coas`
-- ----------------------------
DROP TABLE IF EXISTS `coas`;
CREATE TABLE `coas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subholding` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coas_subholding_index` (`subholding`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `department_support_details`
-- ----------------------------
DROP TABLE IF EXISTS `department_support_details`;
CREATE TABLE `department_support_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_support_id` int(11) DEFAULT NULL,
  `pic_support` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_support_details_department_support_id_index` (`department_support_id`),
  KEY `department_support_details_pic_support_index` (`pic_support`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `department_supports`
-- ----------------------------
DROP TABLE IF EXISTS `department_supports`;
CREATE TABLE `department_supports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_supports_workorder_id_department_id_index` (`workorder_id`,`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `divisions`
-- ----------------------------
DROP TABLE IF EXISTS `divisions`;
CREATE TABLE `divisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `document_types`
-- ----------------------------
DROP TABLE IF EXISTS `document_types`;
CREATE TABLE `document_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `forum_comments`
-- ----------------------------
DROP TABLE IF EXISTS `forum_comments`;
CREATE TABLE `forum_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_comments_forum_id_index` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `forum_images`
-- ----------------------------
DROP TABLE IF EXISTS `forum_images`;
CREATE TABLE `forum_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_images_forum_id_index` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `forums`
-- ----------------------------
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forums_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `globalsettings`
-- ----------------------------
DROP TABLE IF EXISTS `globalsettings`;
CREATE TABLE `globalsettings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parameter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `goodreceive_details`
-- ----------------------------
DROP TABLE IF EXISTS `goodreceive_details`;
CREATE TABLE `goodreceive_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodreceive_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `satuan_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `pph` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `goodreceives`
-- ----------------------------
DROP TABLE IF EXISTS `goodreceives`;
CREATE TABLE `goodreceives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) DEFAULT NULL,
  `approval_status_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_downpayment` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `group_items`
-- ----------------------------
DROP TABLE IF EXISTS `group_items`;
CREATE TABLE `group_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `group_privileges`
-- ----------------------------
DROP TABLE IF EXISTS `group_privileges`;
CREATE TABLE `group_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `view` tinyint(1) NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_privileges_user_group_id_menu_id_index` (`user_group_id`,`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `group_tahapans`
-- ----------------------------
DROP TABLE IF EXISTS `group_tahapans`;
CREATE TABLE `group_tahapans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `history_approval_permintaanbarangs`
-- ----------------------------
DROP TABLE IF EXISTS `history_approval_permintaanbarangs`;
CREATE TABLE `history_approval_permintaanbarangs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permintaanbarang_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_satuan_id` int(11) NOT NULL,
  `stock_on_hand` int(11) DEFAULT NULL,
  `quantity_butuh` int(11) DEFAULT NULL,
  `stock_avaible` int(11) DEFAULT NULL,
  `tanggal_butuh` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventarisir_details`
-- ----------------------------
DROP TABLE IF EXISTS `inventarisir_details`;
CREATE TABLE `inventarisir_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventarisir_id` int(11) DEFAULT NULL,
  `barangkeluar_detail_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventarisir_details_inventarisir_id_index` (`inventarisir_id`),
  KEY `inventarisir_details_barangkeluar_detail_id_index` (`barangkeluar_detail_id`),
  KEY `inventarisir_details_item_id_index` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventarisirs`
-- ----------------------------
DROP TABLE IF EXISTS `inventarisirs`;
CREATE TABLE `inventarisirs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barangkeluar_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pic_giver` int(11) DEFAULT NULL,
  `id_pic_recipient` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventarisirs_barangkeluar_id_index` (`barangkeluar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventories`
-- ----------------------------
DROP TABLE IF EXISTS `inventories`;
CREATE TABLE `inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `rekanan_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `sumber_id` int(11) DEFAULT NULL,
  `sumber_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `quantity_terpakai` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventory_correction_details`
-- ----------------------------
DROP TABLE IF EXISTS `inventory_correction_details`;
CREATE TABLE `inventory_correction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventory_correction_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `satuan_id` int(11) NOT NULL,
  `quantity_app` int(11) DEFAULT NULL,
  `quantity_fisik` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_correction_details_inventory_correction_id_index` (`inventory_correction_id`),
  KEY `inventory_correction_details_item_id_index` (`item_id`),
  KEY `inventory_correction_details_warehouse_id_index` (`warehouse_id`),
  KEY `inventory_correction_details_satuan_id_index` (`satuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventory_corrections`
-- ----------------------------
DROP TABLE IF EXISTS `inventory_corrections`;
CREATE TABLE `inventory_corrections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventory_transfer_details`
-- ----------------------------
DROP TABLE IF EXISTS `inventory_transfer_details`;
CREATE TABLE `inventory_transfer_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventory_transfer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `inventory_transfers`
-- ----------------------------
DROP TABLE IF EXISTS `inventory_transfers`;
CREATE TABLE `inventory_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id_from` int(11) DEFAULT NULL,
  `warehouse_id_to` int(11) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `approval_status_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_at` timestamp NULL DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `item_categories`
-- ----------------------------
DROP TABLE IF EXISTS `item_categories`;
CREATE TABLE `item_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `item_category_user`
-- ----------------------------
DROP TABLE IF EXISTS `item_category_user`;
CREATE TABLE `item_category_user` (
  `item_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `item_prices`
-- ----------------------------
DROP TABLE IF EXISTS `item_prices`;
CREATE TABLE `item_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `price_kecil` double(15,2) DEFAULT NULL,
  `price_besar` double(15,2) DEFAULT NULL,
  `date_price` datetime DEFAULT NULL,
  `matauang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kurs` double(15,2) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `item_satuans`
-- ----------------------------
DROP TABLE IF EXISTS `item_satuans`;
CREATE TABLE `item_satuans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konversi` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `itempekerjaan_coas`
-- ----------------------------
DROP TABLE IF EXISTS `itempekerjaan_coas`;
CREATE TABLE `itempekerjaan_coas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `coa_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itempekerjaan_coas_itempekerjaan_id_department_id_coa_id_index` (`itempekerjaan_id`,`department_id`,`coa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `itempekerjaan_details`
-- ----------------------------
DROP TABLE IF EXISTS `itempekerjaan_details`;
CREATE TABLE `itempekerjaan_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `nilai` double(15,2) NOT NULL DEFAULT '0.00',
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` double(10,2) NOT NULL DEFAULT '0.00',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itempekerjaan_details_itempekerjaan_id_index` (`itempekerjaan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `itempekerjaans`
-- ----------------------------
DROP TABLE IF EXISTS `itempekerjaans`;
CREATE TABLE `itempekerjaans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `group_cost` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itempekerjaans_parent_id_index` (`parent_id`),
  KEY `itempekerjaans_department_id_index` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `sub_item_category_id` int(11) DEFAULT NULL,
  `default_warehouse_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan_warning` tinyint(1) DEFAULT '0',
  `stock_min` int(11) DEFAULT NULL,
  `is_inventory` tinyint(1) DEFAULT '0',
  `is_consumable` tinyint(1) DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `keterangans`
-- ----------------------------
DROP TABLE IF EXISTS `keterangans`;
CREATE TABLE `keterangans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `locations`
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `mappingperusahaans`
-- ----------------------------
DROP TABLE IF EXISTS `mappingperusahaans`;
CREATE TABLE `mappingperusahaans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pt_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mappingperusahaans_pt_id_department_id_index` (`pt_id`,`department_id`),
  KEY `mappingperusahaans_division_id_index` (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `mou_items`
-- ----------------------------
DROP TABLE IF EXISTS `mou_items`;
CREATE TABLE `mou_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_supp_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_satuan_id` int(11) NOT NULL,
  `price_kecil` double(15,2) NOT NULL,
  `price_besar` double(15,2) NOT NULL,
  `matauang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kurs` double(15,2) NOT NULL,
  `volume` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `mutasi_in_details`
-- ----------------------------
DROP TABLE IF EXISTS `mutasi_in_details`;
CREATE TABLE `mutasi_in_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mutasi_in_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `image1` blob,
  `image2` blob,
  `image3` blob,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `mutasi_ins`
-- ----------------------------
DROP TABLE IF EXISTS `mutasi_ins`;
CREATE TABLE `mutasi_ins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `item_tidak_terdefinisi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_item_tidak_terdefinisi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pic_giver` int(11) DEFAULT NULL,
  `name_pic_giver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pic_recipient` int(11) DEFAULT NULL,
  `pic_recipient` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_source` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_from_employee` smallint(6) DEFAULT NULL,
  `is_from_project` smallint(6) DEFAULT NULL,
  `is_from_rekanan` smallint(6) DEFAULT NULL,
  `is_from_other` smallint(6) DEFAULT NULL,
  `id_destination` int(11) DEFAULT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm_by_warehouseman` int(11) DEFAULT NULL,
  `confirm_by_hod` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `image1` blob,
  `image2` blob,
  `image3` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `mutasi_outs`
-- ----------------------------
DROP TABLE IF EXISTS `mutasi_outs`;
CREATE TABLE `mutasi_outs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pic_recipient` int(11) DEFAULT NULL,
  `pic_recipient` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pic_giver` int(11) DEFAULT NULL,
  `name_pic_giver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_destination` int(11) DEFAULT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` blob,
  `image2` blob,
  `image3` blob,
  `confirm_by_warehouseman` int(11) DEFAULT NULL,
  `is_inventory` smallint(6) DEFAULT NULL,
  `confirm_by_hod` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `op_name_assets`
-- ----------------------------
DROP TABLE IF EXISTS `op_name_assets`;
CREATE TABLE `op_name_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `period_op_name_id` int(11) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `pengajuanbiaya_details`
-- ----------------------------
DROP TABLE IF EXISTS `pengajuanbiaya_details`;
CREATE TABLE `pengajuanbiaya_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `pengajuanbiayas`
-- ----------------------------
DROP TABLE IF EXISTS `pengajuanbiayas`;
CREATE TABLE `pengajuanbiayas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `butuh_date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `pengembalianbarang_details`
-- ----------------------------
DROP TABLE IF EXISTS `pengembalianbarang_details`;
CREATE TABLE `pengembalianbarang_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pengembalianbarang_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `quantity_kembali` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `approval_status` int(11) DEFAULT NULL,
  `images` blob,
  `remarks` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `pengembalianbarangs`
-- ----------------------------
DROP TABLE IF EXISTS `pengembalianbarangs`;
CREATE TABLE `pengembalianbarangs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barangkeluar_id` int(11) DEFAULT NULL,
  `quantity_pinjam` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `period_op_names`
-- ----------------------------
DROP TABLE IF EXISTS `period_op_names`;
CREATE TABLE `period_op_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_opname` date DEFAULT NULL,
  `end_opname` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `permintaanbarang_details`
-- ----------------------------
DROP TABLE IF EXISTS `permintaanbarang_details`;
CREATE TABLE `permintaanbarang_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permintaanbarang_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_satuan_id` int(11) DEFAULT NULL,
  `is_inventarisasi` int(1) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `butuh_date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `permintaanbarangs`
-- ----------------------------
DROP TABLE IF EXISTS `permintaanbarangs`;
CREATE TABLE `permintaanbarangs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `spk_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_permintaan_id` int(6) DEFAULT NULL,
  `status_persetujuan` smallint(6) DEFAULT NULL,
  `confirm_by_requester` smallint(6) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `peruntukans`
-- ----------------------------
DROP TABLE IF EXISTS `peruntukans`;
CREATE TABLE `peruntukans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `piutang_pembayarans`
-- ----------------------------
DROP TABLE IF EXISTS `piutang_pembayarans`;
CREATE TABLE `piutang_pembayarans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `piutang_id` int(11) DEFAULT NULL,
  `sumber_id` int(11) DEFAULT NULL,
  `sumber_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `cara_pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `piutang_pembayarans_piutang_id_index` (`piutang_id`),
  KEY `piutang_pembayarans_sumber_id_index` (`sumber_id`),
  KEY `piutang_pembayarans_sumber_type_index` (`sumber_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `piutang_project_rekanans`
-- ----------------------------
DROP TABLE IF EXISTS `piutang_project_rekanans`;
CREATE TABLE `piutang_project_rekanans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `max_percent` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `piutang_project_rekanans_rekanan_id_project_id_index` (`rekanan_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `piutangs`
-- ----------------------------
DROP TABLE IF EXISTS `piutangs`;
CREATE TABLE `piutangs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_id` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `piutangs_rekanan_id_index` (`rekanan_id`),
  KEY `piutangs_approved_by_index` (`approved_by`),
  KEY `piutangs_project_id_index` (`project_id`),
  KEY `piutangs_pt_id_index` (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `project_contactpeople`
-- ----------------------------
DROP TABLE IF EXISTS `project_contactpeople`;
CREATE TABLE `project_contactpeople` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contactpeople_project_id_user_id_index` (`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `project_kawasans`
-- ----------------------------
DROP TABLE IF EXISTS `project_kawasans`;
CREATE TABLE `project_kawasans` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_type_id` int(11) DEFAULT NULL,
  `id_kawasan_erems` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lahan_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lahan_luas` double(10,2) DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_kawasan` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  KEY `project_kawasans_project_id_project_type_id_index` (`project_id`,`project_type_id`),
  KEY `project_kawasans_id_kawasan_erems_index` (`id_kawasan_erems`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `project_pt_users`
-- ----------------------------
DROP TABLE IF EXISTS `project_pt_users`;
CREATE TABLE `project_pt_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_pt_users_user_id_pt_id_project_id_index` (`user_id`,`pt_id`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `project_type_groups`
-- ----------------------------
DROP TABLE IF EXISTS `project_type_groups`;
CREATE TABLE `project_type_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `project_types`
-- ----------------------------
DROP TABLE IF EXISTS `project_types`;
CREATE TABLE `project_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_type_group_id` int(11) DEFAULT NULL,
  `is_unit` tinyint(1) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_types_project_type_group_id_index` (`project_type_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `projects`
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `subholding` int(11) DEFAULT NULL,
  `contactperson` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luas` double(10,2) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  KEY `projects_contactperson_subholding_index` (`contactperson`,`subholding`),
  KEY `projects_city_id_index` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `provinces`
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinces_country_id_index` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `pt_rekenings`
-- ----------------------------
DROP TABLE IF EXISTS `pt_rekenings`;
CREATE TABLE `pt_rekenings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `nama_rekening` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pt_rekenings_rekanan_id_bank_id_index` (`rekanan_id`,`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `pts`
-- ----------------------------
DROP TABLE IF EXISTS `pts`;
CREATE TABLE `pts` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  KEY `pts_city_id_index` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaseorder_cancellation_details`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseorder_cancellation_details`;
CREATE TABLE `purchaseorder_cancellation_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseorder_cancellation_id` int(11) DEFAULT NULL,
  `purchaseorder_detail_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaseorder_cancellations`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseorder_cancellations`;
CREATE TABLE `purchaseorder_cancellations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaseorder_details`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseorder_details`;
CREATE TABLE `purchaseorder_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `purchaserequest_detail_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `item_satuan_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `quantity_kecil` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `price_kecil` double(15,2) NOT NULL,
  `ppn` double(15,2) NOT NULL,
  `pph` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaseorder_dps`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseorder_dps`;
CREATE TABLE `purchaseorder_dps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `goodreceive_detail_id` int(11) NOT NULL,
  `goodreceive_detail_id_applied` int(11) NOT NULL,
  `date` date NOT NULL,
  `percentage` decimal(8,2) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaseorders`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseorders`;
CREATE TABLE `purchaseorders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaserequest_id` int(11) NOT NULL,
  `rekanan_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `matauang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kurs` double(15,3) NOT NULL,
  `term_pengiriman` int(11) NOT NULL,
  `cara_pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaserequest_cancellation_details`
-- ----------------------------
DROP TABLE IF EXISTS `purchaserequest_cancellation_details`;
CREATE TABLE `purchaserequest_cancellation_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaserequest_cancellation_id` int(11) NOT NULL,
  `purchaserequest_detail_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaserequest_cancellations`
-- ----------------------------
DROP TABLE IF EXISTS `purchaserequest_cancellations`;
CREATE TABLE `purchaserequest_cancellations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaserequest_id` int(11) NOT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaserequest_detail_penawarans`
-- ----------------------------
DROP TABLE IF EXISTS `purchaserequest_detail_penawarans`;
CREATE TABLE `purchaserequest_detail_penawarans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaserequest_detail_id` int(11) NOT NULL,
  `rekanan_id` int(11) NOT NULL,
  `price` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaserequest_details`
-- ----------------------------
DROP TABLE IF EXISTS `purchaserequest_details`;
CREATE TABLE `purchaserequest_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaserequest_id` int(11) NOT NULL,
  `itempekerjaan_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_satuan_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `recomended_supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `purchaserequests`
-- ----------------------------
DROP TABLE IF EXISTS `purchaserequests`;
CREATE TABLE `purchaserequests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_tahunan_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `butuh_date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchaserequests_budget_tahunan_id_index` (`budget_tahunan_id`),
  KEY `purchaserequests_pt_id_index` (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rab_pekerjaans`
-- ----------------------------
DROP TABLE IF EXISTS `rab_pekerjaans`;
CREATE TABLE `rab_pekerjaans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rab_unit_id` int(11) DEFAULT NULL,
  `templatepekerjaan_detail_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `urutitem` int(11) DEFAULT NULL,
  `termin` int(11) DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `volume` double(10,2) DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `is_pembangunan` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rab_pekerjaans_rab_unit_id_index` (`rab_unit_id`),
  KEY `rab_pekerjaans_templatepekerjaan_detail_id_index` (`templatepekerjaan_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rab_units`
-- ----------------------------
DROP TABLE IF EXISTS `rab_units`;
CREATE TABLE `rab_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rab_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `asset_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rab_units_rab_id_asset_id_index` (`rab_id`,`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rabs`
-- ----------------------------
DROP TABLE IF EXISTS `rabs`;
CREATE TABLE `rabs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flow` int(11) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rabs_workorder_id_index` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_groups`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_groups`;
CREATE TABLE `rekanan_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `npwp_kota` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pph_percent` int(11) DEFAULT NULL,
  `npwp_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp_alamat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_kelas`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_kelas`;
CREATE TABLE `rekanan_kelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_penilaian_details`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_penilaian_details`;
CREATE TABLE `rekanan_penilaian_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_penilaian_id` int(11) DEFAULT NULL,
  `spk_id` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanan_penilaian_details_rekanan_penilaian_id_index` (`rekanan_penilaian_id`),
  KEY `rekanan_penilaian_details_spk_id_index` (`spk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_penilaians`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_penilaians`;
CREATE TABLE `rekanan_penilaians` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `rekanan_id` int(11) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanan_penilaians_project_id_rekanan_id_index` (`project_id`,`rekanan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_rekenings`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_rekenings`;
CREATE TABLE `rekanan_rekenings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `nama_rekening` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanan_rekenings_rekanan_id_bank_id_index` (`rekanan_id`,`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_supp_vos`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_supp_vos`;
CREATE TABLE `rekanan_supp_vos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_supp_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `printed_at` timestamp NULL DEFAULT NULL,
  `setuju_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanan_supp_vos_rekanan_supp_id_index` (`rekanan_supp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_supps`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_supps`;
CREATE TABLE `rekanan_supps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `penandatangan` int(11) DEFAULT NULL,
  `saksi` int(11) DEFAULT NULL,
  `supp_template_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  `printed_at` timestamp NULL DEFAULT NULL,
  `setuju_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanan_supps_rekanan_id_index` (`rekanan_id`),
  KEY `rekanan_supps_pt_id_index` (`pt_id`),
  KEY `rekanan_supps_penandatangan_index` (`penandatangan`),
  KEY `rekanan_supps_saksi_index` (`saksi`),
  KEY `rekanan_supps_supp_template_id_index` (`supp_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_type_details`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_type_details`;
CREATE TABLE `rekanan_type_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_id` int(11) DEFAULT NULL,
  `rekanan_type_id` int(11) DEFAULT NULL,
  `kelas_spesialis` int(11) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanan_type_details_rekanan_id_rekanan_type_id_index` (`rekanan_id`,`rekanan_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanan_types`
-- ----------------------------
DROP TABLE IF EXISTS `rekanan_types`;
CREATE TABLE `rekanan_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_survey` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rekanans`
-- ----------------------------
DROP TABLE IF EXISTS `rekanans`;
CREATE TABLE `rekanans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_group_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `surat_kota` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surat_alamat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surat_kodepos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_ktp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_ktp_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_jabatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_whatsap` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `survey_status` int(11) NOT NULL DEFAULT '1',
  `survey_date` date DEFAULT NULL,
  `pkp_date` date DEFAULT NULL,
  `pkp_status` int(11) NOT NULL DEFAULT '1',
  `aktif_status` int(11) NOT NULL DEFAULT '2',
  `stujk` int(11) NOT NULL DEFAULT '1',
  `siup_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siup_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tdp_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tdp_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gabung_date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekanans_kelas_id_surat_kota_rekanan_group_id_index` (`kelas_id`,`surat_kota`,`rekanan_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rooms`
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `rotasis`
-- ----------------------------
DROP TABLE IF EXISTS `rotasis`;
CREATE TABLE `rotasis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `id_pic_giver` int(11) DEFAULT NULL,
  `pic_recipient` int(11) DEFAULT NULL,
  `from_department_id` int(11) DEFAULT NULL,
  `from_location_id` int(11) DEFAULT NULL,
  `to_department_id` int(11) DEFAULT NULL,
  `to_location_id` int(11) DEFAULT NULL,
  `from_room_id` int(11) DEFAULT NULL,
  `to_room_id` int(11) DEFAULT NULL,
  `confirm_by_warehouseman` tinyint(4) DEFAULT NULL,
  `confirm_by_hod` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` blob,
  `image2` blob,
  `image3` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spk_details`
-- ----------------------------
DROP TABLE IF EXISTS `spk_details`;
CREATE TABLE `spk_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spk_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `asset_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spk_details_spk_id_asset_id_index` (`spk_id`,`asset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spk_pengembalians`
-- ----------------------------
DROP TABLE IF EXISTS `spk_pengembalians`;
CREATE TABLE `spk_pengembalians` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spk_id` int(11) DEFAULT NULL,
  `termin` int(11) DEFAULT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spk_pengembalians_spk_id_index` (`spk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spk_po_pics`
-- ----------------------------
DROP TABLE IF EXISTS `spk_po_pics`;
CREATE TABLE `spk_po_pics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spk_po_pics_head_id_index` (`head_id`),
  KEY `spk_po_pics_head_type_index` (`head_type`),
  KEY `spk_po_pics_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spk_retensis`
-- ----------------------------
DROP TABLE IF EXISTS `spk_retensis`;
CREATE TABLE `spk_retensis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spk_id` int(11) DEFAULT NULL,
  `bap_id` int(11) DEFAULT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `hari` int(11) DEFAULT NULL,
  `is_progress` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spk_retensis_spk_id_index` (`spk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spk_types`
-- ----------------------------
DROP TABLE IF EXISTS `spk_types`;
CREATE TABLE `spk_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spks`
-- ----------------------------
DROP TABLE IF EXISTS `spks`;
CREATE TABLE `spks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `rekanan_id` int(11) DEFAULT NULL,
  `tender_rekanan_id` int(11) DEFAULT NULL,
  `spk_type_id` int(11) DEFAULT NULL,
  `spk_parent_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `fa_date` date DEFAULT NULL,
  `dp_percent` decimal(5,2) DEFAULT NULL,
  `garansi_nilai` double(10,2) DEFAULT NULL,
  `denda_a` int(11) DEFAULT NULL,
  `denda_b` int(11) DEFAULT NULL,
  `matauang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai_tukar` double(10,2) DEFAULT NULL,
  `jenis_kontrak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo_cara_bayar` text COLLATE utf8mb4_unicode_ci,
  `memo_lingkup_kerja` text COLLATE utf8mb4_unicode_ci,
  `is_instruksilangsung` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carapembayaran` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coa_pph_default_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spks_project_id_index` (`project_id`),
  KEY `spks_rekanan_id_index` (`rekanan_id`),
  KEY `spks_tender_rekanan_id_index` (`tender_rekanan_id`),
  KEY `spks_spk_type_id_index` (`spk_type_id`),
  KEY `spks_spk_parent_id_index` (`spk_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `spkvo_units`
-- ----------------------------
DROP TABLE IF EXISTS `spkvo_units`;
CREATE TABLE `spkvo_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spk_detail_id` int(11) DEFAULT NULL,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templatepekerjaan_id` int(11) DEFAULT NULL,
  `unit_progress_id` int(11) DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` double(10,2) DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppn` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spkvo_units_spk_detail_id_index` (`spk_detail_id`),
  KEY `spkvo_units_head_id_index` (`head_id`),
  KEY `spkvo_units_head_type_index` (`head_type`),
  KEY `spkvo_units_templatepekerjaan_id_index` (`templatepekerjaan_id`),
  KEY `spkvo_units_unit_progress_id_index` (`unit_progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `status_permintaans`
-- ----------------------------
DROP TABLE IF EXISTS `status_permintaans`;
CREATE TABLE `status_permintaans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `supp_revisions`
-- ----------------------------
DROP TABLE IF EXISTS `supp_revisions`;
CREATE TABLE `supp_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rekanan_supp_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supp_revisions_rekanan_supp_id_index` (`rekanan_supp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `supp_templates`
-- ----------------------------
DROP TABLE IF EXISTS `supp_templates`;
CREATE TABLE `supp_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `suratinstruksis`
-- ----------------------------
DROP TABLE IF EXISTS `suratinstruksis`;
CREATE TABLE `suratinstruksis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spk_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `perihal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biaya` tinyint(1) NOT NULL DEFAULT '0',
  `is_tambahbiaya` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suratinstruksis_spk_id_index` (`spk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `sys_logs`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_fix_tag_id` int(11) NOT NULL DEFAULT '0',
  `action_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_logs_head_id_index` (`head_id`),
  KEY `sys_logs_head_type_index` (`head_type`),
  KEY `sys_logs_log_fix_tag_id_index` (`log_fix_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `templatepekerjaan_detail_subs`
-- ----------------------------
DROP TABLE IF EXISTS `templatepekerjaan_detail_subs`;
CREATE TABLE `templatepekerjaan_detail_subs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `templatepekerjaan_details`
-- ----------------------------
DROP TABLE IF EXISTS `templatepekerjaan_details`;
CREATE TABLE `templatepekerjaan_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `templatepekerjaan_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `group_tahapan_id` int(11) DEFAULT NULL,
  `group_item_id` int(11) DEFAULT NULL,
  `urutitem` int(11) DEFAULT NULL,
  `termin` int(11) DEFAULT NULL,
  `nilai` double(15,2) NOT NULL DEFAULT '0.00',
  `volume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bobot` decimal(5,2) DEFAULT NULL,
  `durasi` int(11) NOT NULL DEFAULT '0',
  `is_pembangunan` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `templatepekerjaan_details_templatepekerjaan_id_index` (`templatepekerjaan_id`),
  KEY `templatepekerjaan_details_itempekerjaan_id_index` (`itempekerjaan_id`),
  KEY `templatepekerjaan_details_group_tahapan_id_index` (`group_tahapan_id`),
  KEY `templatepekerjaan_details_group_item_id_index` (`group_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `templatepekerjaan_lapangans`
-- ----------------------------
DROP TABLE IF EXISTS `templatepekerjaan_lapangans`;
CREATE TABLE `templatepekerjaan_lapangans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_item_id` int(11) DEFAULT NULL,
  `urutitem` int(11) DEFAULT NULL,
  `termin` int(11) DEFAULT NULL,
  `bobot` decimal(5,2) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `templatepekerjaan_lapangans_group_item_id_index` (`group_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `templatepekerjaans`
-- ----------------------------
DROP TABLE IF EXISTS `templatepekerjaans`;
CREATE TABLE `templatepekerjaans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luasbangunan` double(10,2) NOT NULL DEFAULT '0.00',
  `hppbangunanpermeter` double(15,2) DEFAULT NULL,
  `is_sellable` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_korespondensis`
-- ----------------------------
DROP TABLE IF EXISTS `tender_korespondensis`;
CREATE TABLE `tender_korespondensis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_rekanan_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `diundang_at` timestamp NULL DEFAULT NULL,
  `tempat_undangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_korespondensis_tender_rekanan_id_index` (`tender_rekanan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_menang_details`
-- ----------------------------
DROP TABLE IF EXISTS `tender_menang_details`;
CREATE TABLE `tender_menang_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_menang_id` int(11) DEFAULT NULL,
  `templatepekerjaan_detail_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `is_pembangunan` tinyint(1) NOT NULL DEFAULT '1',
  `nilai` double(15,2) DEFAULT NULL,
  `volume` double(10,2) DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_menang_details_tender_menang_id_index` (`tender_menang_id`),
  KEY `tender_menang_details_templatepekerjaan_detail_id_index` (`templatepekerjaan_detail_id`),
  KEY `tender_menang_details_itempekerjaan_id_index` (`itempekerjaan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_menangs`
-- ----------------------------
DROP TABLE IF EXISTS `tender_menangs`;
CREATE TABLE `tender_menangs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_rekanan_id` int(11) DEFAULT NULL,
  `tender_unit_id` int(11) DEFAULT NULL,
  `asset_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_menangs_tender_rekanan_id_index` (`tender_rekanan_id`),
  KEY `tender_menangs_tender_unit_id_index` (`tender_unit_id`),
  KEY `tender_menangs_asset_id_index` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_penawaran_details`
-- ----------------------------
DROP TABLE IF EXISTS `tender_penawaran_details`;
CREATE TABLE `tender_penawaran_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_penawaran_id` int(11) DEFAULT NULL,
  `rab_pekerjaan_id` int(11) DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `volume` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_penawaran_details_tender_penawaran_id_index` (`tender_penawaran_id`),
  KEY `tender_penawaran_details_rab_pekerjaan_id_index` (`rab_pekerjaan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_penawarans`
-- ----------------------------
DROP TABLE IF EXISTS `tender_penawarans`;
CREATE TABLE `tender_penawarans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_rekanan_id` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_penawarans_tender_rekanan_id_index` (`tender_rekanan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_rekanans`
-- ----------------------------
DROP TABLE IF EXISTS `tender_rekanans`;
CREATE TABLE `tender_rekanans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_id` int(11) DEFAULT NULL,
  `rekanan_id` int(11) DEFAULT NULL,
  `sipp_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sipp_date` date DEFAULT NULL,
  `doc_ambil_date` date DEFAULT NULL,
  `doc_ambil_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pemenang` tinyint(1) NOT NULL DEFAULT '0',
  `doc_bayar_status` tinyint(1) NOT NULL DEFAULT '0',
  `doc_bayar_date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_rekanans_tender_id_rekanan_id_index` (`tender_id`,`rekanan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tender_units`
-- ----------------------------
DROP TABLE IF EXISTS `tender_units`;
CREATE TABLE `tender_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tender_id` int(11) DEFAULT NULL,
  `rab_unit_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tender_units_tender_id_rab_unit_id_index` (`tender_id`,`rab_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tenders`
-- ----------------------------
DROP TABLE IF EXISTS `tenders`;
CREATE TABLE `tenders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rab_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ambil_doc_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aanwijzing_date` date DEFAULT NULL,
  `penawaran1_date` date DEFAULT NULL,
  `klarifikasi1_date` date DEFAULT NULL,
  `penawaran2_date` date DEFAULT NULL,
  `klarifikasi2_date` date DEFAULT NULL,
  `penawaran3_date` date DEFAULT NULL,
  `final_date` date DEFAULT NULL,
  `recommendation_date` date DEFAULT NULL,
  `pengumuman_date` date DEFAULT NULL,
  `harga_dokumen` double(8,2) DEFAULT NULL,
  `sumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenders_rab_id_kelas_id_index` (`rab_id`,`kelas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `unit_arahs`
-- ----------------------------
DROP TABLE IF EXISTS `unit_arahs`;
CREATE TABLE `unit_arahs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `unit_progress_detail_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `unit_progress_detail_pictures`;
CREATE TABLE `unit_progress_detail_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_progress_detail_id` int(11) DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_progress_detail_pictures_unit_progress_detail_id_index` (`unit_progress_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `unit_progress_details`
-- ----------------------------
DROP TABLE IF EXISTS `unit_progress_details`;
CREATE TABLE `unit_progress_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_progress_id` int(11) DEFAULT NULL,
  `pic_rekanan` int(11) DEFAULT NULL,
  `pic_internal` int(11) DEFAULT NULL,
  `progress_date` date DEFAULT NULL,
  `progress_percent` decimal(5,2) DEFAULT NULL,
  `setuju_rekanan_at` timestamp NULL DEFAULT NULL,
  `setuju_internal_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_progress_details_unit_progress_id_index` (`unit_progress_id`),
  KEY `unit_progress_details_pic_rekanan_index` (`pic_rekanan`),
  KEY `unit_progress_details_pic_internal_index` (`pic_internal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `unit_progresses`
-- ----------------------------
DROP TABLE IF EXISTS `unit_progresses`;
CREATE TABLE `unit_progresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `group_tahapan_id` int(11) DEFAULT NULL,
  `group_item_id` int(11) DEFAULT NULL,
  `urutitem` int(11) DEFAULT NULL,
  `termin` int(11) DEFAULT NULL,
  `nilai` double(15,2) NOT NULL DEFAULT '0.00',
  `volume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bobot` decimal(7,4) DEFAULT NULL,
  `durasi` int(11) NOT NULL DEFAULT '0',
  `is_pembangunan` tinyint(1) NOT NULL DEFAULT '1',
  `progresslapangan_percent` decimal(5,2) DEFAULT NULL,
  `progressbap_percent` decimal(5,2) DEFAULT NULL,
  `mulai_jadwal_date` date DEFAULT NULL,
  `selesai_jadwal_date` date DEFAULT NULL,
  `selesai_actual_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_progresses_project_id_index` (`project_id`),
  KEY `unit_progresses_unit_id_index` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `unit_subs`
-- ----------------------------
DROP TABLE IF EXISTS `unit_subs`;
CREATE TABLE `unit_subs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_subs_unit_id_index` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `unit_types`
-- ----------------------------
DROP TABLE IF EXISTS `unit_types`;
CREATE TABLE `unit_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `units`
-- ----------------------------
DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blok_id` int(11) DEFAULT NULL,
  `templatepekerjaan_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `peruntukan_id` int(11) DEFAULT NULL,
  `unit_arah_id` int(11) DEFAULT NULL,
  `unit_type_id` int(11) DEFAULT NULL,
  `id_erems` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanah_luas` double(10,2) DEFAULT NULL,
  `bangunan_luas` double(10,2) DEFAULT NULL,
  `is_sellable` tinyint(1) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `tag_kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'b',
  `st1_date` date DEFAULT NULL,
  `st2_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_blok_id_index` (`blok_id`),
  KEY `units_templatepekerjaan_id_index` (`templatepekerjaan_id`),
  KEY `units_pt_id_index` (`pt_id`),
  KEY `units_peruntukan_id_index` (`peruntukan_id`),
  KEY `units_unit_arah_id_index` (`unit_arah_id`),
  KEY `units_unit_type_id_index` (`unit_type_id`),
  KEY `units_id_erems_index` (`id_erems`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `user_details`
-- ----------------------------
DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `mappingperusahaan_id` int(11) DEFAULT NULL,
  `user_jabatan_id` int(11) DEFAULT NULL,
  `user_level` int(11) DEFAULT NULL,
  `can_approve` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_user_id_mappingperusahaan_id_user_jabatan_id_index` (`user_id`,`mappingperusahaan_id`,`user_jabatan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `user_group_details`
-- ----------------------------
DROP TABLE IF EXISTS `user_group_details`;
CREATE TABLE `user_group_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_details_user_id_user_group_id_index` (`user_id`,`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rekanan` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `user_jabatans`
-- ----------------------------
DROP TABLE IF EXISTS `user_jabatans`;
CREATE TABLE `user_jabatans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `user_warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `user_warehouse`;
CREATE TABLE `user_warehouse` (
  `user_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_rekanan` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digitalsignature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_login_unique` (`user_login`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `vos`
-- ----------------------------
DROP TABLE IF EXISTS `vos`;
CREATE TABLE `vos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suratinstruksi_id` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vos_suratinstruksi_id_index` (`suratinstruksi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `voucher_details`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_details`;
CREATE TABLE `voucher_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) DEFAULT NULL,
  `coa_id` int(11) DEFAULT NULL,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` double(15,2) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mata_uang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kurs` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_details_voucher_id_index` (`voucher_id`),
  KEY `voucher_details_coa_id_index` (`coa_id`),
  KEY `voucher_details_head_id_index` (`head_id`),
  KEY `voucher_details_head_type_index` (`head_type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `vouchers`
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekanan_id` int(11) DEFAULT NULL,
  `rekanan_rekening_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_faktur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempo_date` date DEFAULT NULL,
  `penyerahan_date` date DEFAULT NULL,
  `pencairan_date` date DEFAULT NULL,
  `is_out` tinyint(1) NOT NULL DEFAULT '1',
  `export_count` int(11) DEFAULT NULL,
  `posting` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vouchers_head_id_index` (`head_id`),
  KEY `vouchers_head_type_index` (`head_type`),
  KEY `vouchers_rekanan_id_index` (`rekanan_id`),
  KEY `vouchers_department_id_index` (`department_id`),
  KEY `vouchers_pt_id_index` (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `warehouses`
-- ----------------------------
DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `head_id` int(11) DEFAULT NULL,
  `head_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity_volume` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouses_head_id_city_id_index` (`head_id`,`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `workorder_budget_details`
-- ----------------------------
DROP TABLE IF EXISTS `workorder_budget_details`;
CREATE TABLE `workorder_budget_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) DEFAULT NULL,
  `itempekerjaan_id` int(11) DEFAULT NULL,
  `budget_tahunan_id` int(11) DEFAULT NULL,
  `tahun_anggaran` int(11) DEFAULT NULL,
  `volume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workorder_budget_details_workorder_id_index` (`workorder_id`),
  KEY `workorder_budget_details_itempekerjaan_id_index` (`itempekerjaan_id`),
  KEY `workorder_budget_details_budget_tahunan_id_index` (`budget_tahunan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `workorder_details`
-- ----------------------------
DROP TABLE IF EXISTS `workorder_details`;
CREATE TABLE `workorder_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `asset_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workorder_details_workorder_id_asset_id_index` (`workorder_id`,`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `workorders`
-- ----------------------------
DROP TABLE IF EXISTS `workorders`;
CREATE TABLE `workorders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_tahunan_id` int(11) DEFAULT NULL,
  `department_from` int(11) DEFAULT NULL,
  `department_to` int(11) DEFAULT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durasi` int(11) NOT NULL DEFAULT '0',
  `satuan_waktu` int(11) NOT NULL DEFAULT '0',
  `estimasi_nilaiwo` double(15,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `posisi_dokumen` int(11) NOT NULL DEFAULT '1',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `inactive_at` timestamp NULL DEFAULT NULL,
  `inactive_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workorders_budget_tahunan_id_index` (`budget_tahunan_id`),
  KEY `workorders_department_to_index` (`department_to`),
  KEY `workorders_department_from_index` (`department_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `approval_actions` VALUES ('1','open','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','delivered','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('3','in progress','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('4','on hold','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('5','released','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('6','approved','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('7','rejected','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('8','closed','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('9','canceled','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('10','active','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('11','inactive','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `approval_histories` VALUES ('1','1','2',NULL,'6','1','1','App\\Permintaanbarang','Permintaanbarang','2018-08-20 07:44:21','2018-08-20 07:44:21',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','4',NULL,'6','1','3','App\\Permintaanbarang','Permintaanbarang','2018-08-20 10:23:15','2018-08-20 10:23:15',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','6',NULL,'6','1','4','App\\Permintaanbarang','Permintaanbarang','2018-08-23 03:48:25','2018-08-23 03:48:25',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','8',NULL,'6','1','5','App\\Permintaanbarang','Permintaanbarang','2018-08-27 06:20:05','2018-08-27 06:20:05',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','10',NULL,'6','1','6','App\\Permintaanbarang','Permintaanbarang','2018-08-27 10:53:10','2018-08-27 10:53:10',NULL,'1',NULL,NULL,NULL,NULL),  ('6','1','12',NULL,'6','1','7','App\\Permintaanbarang','Permintaanbarang','2018-08-27 11:39:39','2018-08-27 11:39:39',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','14',NULL,'6','1','8','App\\Permintaanbarang','Permintaanbarang','2018-08-30 03:44:51','2018-08-30 03:44:51',NULL,'1',NULL,NULL,NULL,NULL),  ('8','1','16',NULL,'6','1','9','App\\Permintaanbarang','Permintaanbarang','2018-08-30 06:28:19','2018-08-30 06:28:19',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','18',NULL,'6','1','10','App\\Permintaanbarang','Permintaanbarang','2018-08-30 06:43:33','2018-08-30 06:43:33',NULL,'1',NULL,NULL,NULL,NULL),  ('10','1','20',NULL,'6','1','11','App\\Permintaanbarang','Permintaanbarang','2018-08-30 07:44:44','2018-08-30 07:44:44',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','22',NULL,'6','1','12','App\\Permintaanbarang','Permintaanbarang','2018-08-31 06:47:14','2018-08-31 06:47:14',NULL,'1',NULL,NULL,NULL,NULL),  ('12','1','24',NULL,'6','1','13','App\\Permintaanbarang','Permintaanbarang','2018-09-04 07:20:55','2018-09-04 07:20:55',NULL,'1',NULL,NULL,NULL,NULL),  ('13','1','26',NULL,'6','1','14','App\\Permintaanbarang','Permintaanbarang','2018-09-04 08:12:47','2018-09-04 08:12:47',NULL,'1',NULL,NULL,NULL,NULL),  ('14','1','28',NULL,'6','1','15','App\\Permintaanbarang','Permintaanbarang','2018-09-05 07:34:08','2018-09-05 07:34:08',NULL,'1',NULL,NULL,NULL,NULL),  ('15','1','30',NULL,'6','1','16','App\\Permintaanbarang','Permintaanbarang','2018-09-06 06:12:18','2018-09-06 06:12:18',NULL,'1',NULL,NULL,NULL,NULL),  ('16','1','38',NULL,'6','1','17','App\\Permintaanbarang','Permintaanbarang','2018-09-06 08:00:52','2018-09-06 08:00:52',NULL,'1',NULL,NULL,NULL,NULL),  ('17','1','43',NULL,'6','1','19','App\\Permintaanbarang','Permintaanbarang','2018-09-19 02:23:39','2018-09-19 02:23:39',NULL,'1',NULL,NULL,NULL,NULL),  ('18','1','46',NULL,'6','1','20','App\\Permintaanbarang','Permintaanbarang','2018-09-24 23:57:23','2018-09-24 23:57:23',NULL,'1',NULL,NULL,NULL,NULL),  ('19','1','47',NULL,'6','1','23','App\\Permintaanbarang','Permintaanbarang','2018-10-01 10:32:31','2018-10-01 10:32:31',NULL,'1',NULL,NULL,NULL,NULL),  ('20','1','48',NULL,'6','1','24','App\\Permintaanbarang','Permintaanbarang','2018-10-04 04:57:19','2018-10-04 04:57:19',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `approval_references` VALUES ('1','1','1','1','App\\Budget','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','1','1','App\\BudgetTahunan','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','1','1','App\\Workorder','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','1','1','App\\Rab','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','1','1','App\\Tender','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('6','1','1','1','App\\TenderKorespondensi','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','1','1','App\\Spk','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('8','1','1','1','App\\Purchaserequest','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','1','1','App\\Purchaseorder','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('10','1','1','1','App\\Goodreceive','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','1','1','App\\Permintaanbarang','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('12','1','1','1','App\\Barangretur','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('13','1','1','1','App\\Bap','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('14','1','1','1','App\\Voucher','1','1.00',NULL,'1','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `approvals` VALUES ('1','1','1','App\\Permintaanbarang','0.00','2018-08-20 07:33:02','2018-08-20 07:33:02',NULL,'1',NULL,NULL,NULL,NULL),  ('2','6','1','App\\Permintaanbarang',NULL,'2018-08-20 07:44:21','2018-08-20 07:44:21',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','1','App\\Barangkeluar','0.00','2018-08-20 08:21:27','2018-08-20 08:21:27',NULL,'1',NULL,NULL,NULL,NULL),  ('4','6','3','App\\Permintaanbarang',NULL,'2018-08-20 10:23:15','2018-08-20 10:23:15',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','2','App\\Barangkeluar','0.00','2018-08-20 10:24:33','2018-08-20 10:24:33',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6','4','App\\Permintaanbarang',NULL,'2018-08-23 03:48:25','2018-08-23 03:48:25',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','3','App\\Barangkeluar','0.00','2018-08-23 03:49:10','2018-08-23 03:49:10',NULL,'1',NULL,NULL,NULL,NULL),  ('8','6','5','App\\Permintaanbarang',NULL,'2018-08-27 06:20:05','2018-08-27 06:20:05',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','4','App\\Barangkeluar','0.00','2018-08-27 06:21:00','2018-08-27 06:21:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','6','6','App\\Permintaanbarang',NULL,'2018-08-27 10:53:10','2018-08-27 10:53:10',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','5','App\\Barangkeluar','0.00','2018-08-27 10:53:48','2018-08-27 10:53:48',NULL,'1',NULL,NULL,NULL,NULL),  ('12','6','7','App\\Permintaanbarang',NULL,'2018-08-27 11:39:39','2018-08-27 11:39:39',NULL,'1',NULL,NULL,NULL,NULL),  ('13','1','6','App\\Barangkeluar','0.00','2018-08-27 11:41:05','2018-08-27 11:41:05',NULL,'1',NULL,NULL,NULL,NULL),  ('14','6','8','App\\Permintaanbarang',NULL,'2018-08-30 03:44:51','2018-08-30 03:44:51',NULL,'1',NULL,NULL,NULL,NULL),  ('15','1','7','App\\Barangkeluar','0.00','2018-08-30 03:51:26','2018-08-30 03:51:26',NULL,'1',NULL,NULL,NULL,NULL),  ('16','6','9','App\\Permintaanbarang',NULL,'2018-08-30 06:28:19','2018-08-30 06:28:19',NULL,'1',NULL,NULL,NULL,NULL),  ('17','1','8','App\\Barangkeluar','0.00','2018-08-30 06:28:46','2018-08-30 06:28:46',NULL,'1',NULL,NULL,NULL,NULL),  ('18','6','10','App\\Permintaanbarang',NULL,'2018-08-30 06:43:33','2018-08-30 06:43:33',NULL,'1',NULL,NULL,NULL,NULL),  ('19','1','9','App\\Barangkeluar','0.00','2018-08-30 06:44:25','2018-08-30 06:44:25',NULL,'1',NULL,NULL,NULL,NULL),  ('20','6','11','App\\Permintaanbarang',NULL,'2018-08-30 07:44:44','2018-08-30 07:44:44',NULL,'1',NULL,NULL,NULL,NULL),  ('21','1','10','App\\Barangkeluar','0.00','2018-08-30 07:49:15','2018-08-30 07:49:15',NULL,'1',NULL,NULL,NULL,NULL),  ('22','6','12','App\\Permintaanbarang',NULL,'2018-08-31 06:47:14','2018-08-31 06:47:14',NULL,'1',NULL,NULL,NULL,NULL),  ('23','1','11','App\\Barangkeluar','0.00','2018-08-31 06:48:14','2018-08-31 06:48:14',NULL,'1',NULL,NULL,NULL,NULL),  ('24','6','13','App\\Permintaanbarang',NULL,'2018-09-04 07:20:55','2018-09-04 07:20:55',NULL,'1',NULL,NULL,NULL,NULL),  ('25','1','12','App\\Barangkeluar','0.00','2018-09-04 07:22:07','2018-09-04 07:22:07',NULL,'1',NULL,NULL,NULL,NULL),  ('26','6','14','App\\Permintaanbarang',NULL,'2018-09-04 08:12:47','2018-09-04 08:12:47',NULL,'1',NULL,NULL,NULL,NULL),  ('27','1','13','App\\Barangkeluar','0.00','2018-09-04 08:13:56','2018-09-04 08:13:56',NULL,'1',NULL,NULL,NULL,NULL),  ('28','6','15','App\\Permintaanbarang',NULL,'2018-09-05 07:34:08','2018-09-05 07:34:08',NULL,'1',NULL,NULL,NULL,NULL),  ('29','1','14','App\\Barangkeluar','0.00','2018-09-05 07:37:25','2018-09-05 07:37:25',NULL,'1',NULL,NULL,NULL,NULL),  ('30','6','16','App\\Permintaanbarang',NULL,'2018-09-06 06:12:18','2018-09-06 06:12:18',NULL,'1',NULL,NULL,NULL,NULL),  ('31','1','15','App\\Barangkeluar','0.00','2018-09-06 06:14:00','2018-09-06 06:14:00',NULL,'1',NULL,NULL,NULL,NULL),  ('32','1','16','App\\Barangkeluar','0.00','2018-09-06 06:24:37','2018-09-06 06:24:37',NULL,'1',NULL,NULL,NULL,NULL),  ('33','1','17','App\\Barangkeluar','0.00','2018-09-06 06:31:53','2018-09-06 06:31:53',NULL,'1',NULL,NULL,NULL,NULL),  ('34','1','25','App\\Barangkeluar','0.00','2018-09-06 07:29:12','2018-09-06 07:29:12',NULL,'1',NULL,NULL,NULL,NULL),  ('35','1','26','App\\Barangkeluar','0.00','2018-09-06 07:32:22','2018-09-06 07:32:22',NULL,'1',NULL,NULL,NULL,NULL),  ('36','1','27','App\\Barangkeluar','0.00','2018-09-06 07:39:28','2018-09-06 07:39:28',NULL,'1',NULL,NULL,NULL,NULL),  ('37','1','32','App\\Barangkeluar','0.00','2018-09-06 07:49:55','2018-09-06 07:49:55',NULL,'1',NULL,NULL,NULL,NULL),  ('38','6','17','App\\Permintaanbarang',NULL,'2018-09-06 08:00:52','2018-09-06 08:00:52',NULL,'1',NULL,NULL,NULL,NULL),  ('39','1','33','App\\Barangkeluar','0.00','2018-09-06 09:28:14','2018-09-06 09:28:14',NULL,'1',NULL,NULL,NULL,NULL),  ('40','1','34','App\\Barangkeluar','0.00','2018-09-06 09:30:50','2018-09-06 09:30:50',NULL,'1',NULL,NULL,NULL,NULL),  ('41','1','35','App\\Barangkeluar','0.00','2018-09-07 03:32:14','2018-09-07 03:32:14',NULL,'1',NULL,NULL,NULL,NULL),  ('42','1','37','App\\Barangkeluar','0.00','2018-09-10 04:20:23','2018-09-10 04:20:23',NULL,'1',NULL,NULL,NULL,NULL),  ('43','6','19','App\\Permintaanbarang',NULL,'2018-09-19 02:23:39','2018-09-19 02:23:39',NULL,'1',NULL,NULL,NULL,NULL),  ('44','1','38','App\\Barangkeluar','0.00','2018-09-19 06:18:56','2018-09-19 06:18:56',NULL,'1',NULL,NULL,NULL,NULL),  ('45','1','39','App\\Barangkeluar','0.00','2018-09-19 06:33:14','2018-09-19 06:33:14',NULL,'1',NULL,NULL,NULL,NULL),  ('46','6','20','App\\Permintaanbarang',NULL,'2018-09-24 23:57:23','2018-09-24 23:57:23',NULL,'1',NULL,NULL,NULL,NULL),  ('47','6','23','App\\Permintaanbarang',NULL,'2018-10-01 10:32:31','2018-10-01 10:32:31',NULL,'1',NULL,NULL,NULL,NULL),  ('48','6','24','App\\Permintaanbarang',NULL,'2018-10-04 04:57:19','2018-10-04 04:57:19',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `asset_details` VALUES ('44','15','111','16232909845b88fee3f0ef4','0',NULL,'2018-08-31 08:40:03','2018-08-31 08:40:03',NULL,'1',NULL,NULL,NULL,NULL),  ('45','15','112','12419067025b88fee404024','0',NULL,'2018-08-31 08:40:04','2018-09-01 04:01:04',NULL,'1',NULL,NULL,'2018-09-01 04:01:04','1'),  ('46','15','111','12419067025b88fee404024','1','45','2018-09-01 04:01:04','2018-09-01 04:01:04',NULL,'1',NULL,NULL,NULL,NULL),  ('47','16','123','488129045b8e34fc679c1','0',NULL,'2018-09-04 07:32:12','2018-09-04 08:25:26',NULL,'1',NULL,NULL,'2018-09-04 08:25:26','1'),  ('48','16','124','1087631045b8e34fc6b633','0',NULL,'2018-09-04 07:32:12','2018-09-04 07:32:12',NULL,'1',NULL,NULL,NULL,NULL),  ('49','17','125','488129045b8e34fc679c1','1','47','2018-09-04 08:25:26','2018-09-04 08:25:26',NULL,'1',NULL,NULL,NULL,NULL),  ('51',NULL,'137','18703697415b8f7e46a8802','0',NULL,'2018-09-05 06:57:10','2018-09-05 06:57:10',NULL,'1',NULL,NULL,NULL,NULL),  ('52',NULL,'138','16577982655b8f7e46ad028','0',NULL,'2018-09-05 06:57:10','2018-09-05 06:57:10',NULL,'1',NULL,NULL,NULL,NULL),  ('53',NULL,'139','13551782875b8f7e46b2324','0',NULL,'2018-09-05 06:57:10','2018-09-05 06:57:10',NULL,'1',NULL,NULL,NULL,NULL),  ('54',NULL,'140','8053242255b8f7e46b3bd5','0',NULL,'2018-09-05 06:57:10','2018-09-05 06:57:10',NULL,'1',NULL,NULL,NULL,NULL),  ('55',NULL,'141','18057470185b8f7e46b6ec1','0',NULL,'2018-09-05 06:57:10','2018-09-05 06:57:10',NULL,'1',NULL,NULL,NULL,NULL),  ('56','18','142','947319045b8f8c117d4f0','0',NULL,'2018-09-05 07:56:01','2018-09-05 07:56:01',NULL,'1',NULL,NULL,NULL,NULL),  ('57',NULL,'145','15940264405b9221400121d','0',NULL,'2018-09-07 06:57:04','2018-09-07 06:57:04',NULL,'1',NULL,NULL,NULL,NULL),  ('58',NULL,'146','14737493375b92214005aa0','0',NULL,'2018-09-07 06:57:04','2018-09-07 06:57:04',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `asset_transactions` VALUES ('1','111','1',NULL,NULL,NULL,NULL,'2','1',NULL,NULL,'2',NULL,'2018-08-31 00:00:00',NULL,'2018-08-31 07:05:52','2018-09-01 03:40:28',NULL,'1',NULL,NULL,NULL,NULL),  ('2','112','1',NULL,NULL,NULL,NULL,'4','1',NULL,NULL,'3',NULL,'2018-08-31 00:00:00',NULL,'2018-08-31 07:05:52','2018-09-01 03:40:15',NULL,'1',NULL,NULL,NULL,NULL),  ('8','119','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 06:48:00','2018-09-04 06:48:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','120','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 06:48:00','2018-09-04 06:48:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','121','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 06:48:00','2018-09-04 06:48:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','122','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 06:48:00','2018-09-04 06:48:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','123','1',NULL,NULL,NULL,NULL,'4','3',NULL,NULL,'2',NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 07:23:57','2018-09-04 07:24:41',NULL,'1',NULL,NULL,NULL,NULL),  ('13','124','1',NULL,NULL,NULL,NULL,'10','3',NULL,NULL,'3',NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 07:23:57','2018-09-04 07:27:39',NULL,'1',NULL,NULL,NULL,NULL),  ('14','125','1',NULL,NULL,NULL,NULL,'4','2',NULL,NULL,NULL,NULL,'2018-09-04 00:00:00',NULL,'2018-09-04 08:14:58','2018-09-04 08:15:15',NULL,'1',NULL,NULL,NULL,NULL),  ('15','125','4','2',NULL,NULL,'3','3','10',NULL,NULL,'2',NULL,'2018-09-04 00:00:00','serah terima barang','2018-09-04 10:11:27','2018-09-04 10:11:27',NULL,'1',NULL,NULL,NULL,NULL),  ('27','137','1',NULL,NULL,NULL,NULL,'1','9',NULL,NULL,'2',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 03:23:40','2018-09-05 07:13:12',NULL,'1','1',NULL,NULL,NULL),  ('28','138','1',NULL,NULL,NULL,NULL,'4','1',NULL,NULL,'3',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 03:23:40','2018-09-05 07:13:19',NULL,'1','1',NULL,NULL,NULL),  ('29','139','1',NULL,NULL,NULL,NULL,'2','1',NULL,NULL,'2',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 03:23:40','2018-09-05 07:13:28',NULL,'1','1',NULL,NULL,NULL),  ('30','140','1',NULL,NULL,NULL,NULL,'5','1',NULL,NULL,'1',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 03:23:40','2018-09-05 07:13:37',NULL,'1','1',NULL,NULL,NULL),  ('31','141','1',NULL,NULL,NULL,NULL,'1','1',NULL,NULL,'3',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 03:23:40','2018-09-05 07:13:43',NULL,'1','1',NULL,NULL,NULL),  ('32','142','1',NULL,NULL,NULL,NULL,'1','1',NULL,NULL,'1',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 07:52:22','2018-09-05 07:52:52',NULL,'1',NULL,NULL,NULL,NULL),  ('33','143','10',NULL,NULL,NULL,NULL,'1','1',NULL,NULL,'1',NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 08:03:57','2018-09-05 08:04:19',NULL,'1','1',NULL,NULL,NULL),  ('34','144','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-05 00:00:00',NULL,'2018-09-05 08:08:29','2018-09-05 08:08:29',NULL,'1',NULL,NULL,NULL,NULL),  ('35','145','0',NULL,NULL,NULL,NULL,'6','2',NULL,NULL,'1',NULL,'2018-09-07 00:00:00',NULL,'2018-09-07 04:03:19','2018-09-07 06:53:12',NULL,'1','1',NULL,NULL,NULL),  ('36','146','0',NULL,NULL,NULL,NULL,'2','3',NULL,NULL,'2',NULL,'2018-09-07 00:00:00',NULL,'2018-09-07 04:03:19','2018-09-07 06:53:39',NULL,'1','1',NULL,NULL,NULL),  ('37','146','2','3',NULL,NULL,'2','10','9',NULL,NULL,'3',NULL,'2018-09-07 00:00:00','adfasdf','2018-09-07 07:59:26','2018-09-07 07:59:26',NULL,'1',NULL,NULL,NULL,NULL),  ('38','147','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-19 00:00:00',NULL,'2018-09-19 10:53:28','2018-09-19 10:53:28',NULL,'1',NULL,NULL,NULL,NULL),  ('39','148','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-19 00:00:00',NULL,'2018-09-19 10:53:28','2018-09-19 10:53:28',NULL,'1',NULL,NULL,NULL,NULL),  ('40','147','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-19 00:00:00',NULL,'2018-09-20 02:27:03','2018-09-20 02:27:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','148','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-19 00:00:00',NULL,'2018-09-20 02:27:03','2018-09-20 02:27:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','149','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1',NULL,'2018-09-19 00:00:00',NULL,'2018-09-20 02:43:47','2018-09-20 09:43:55',NULL,'1',NULL,NULL,NULL,NULL),  ('43','150','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-19 00:00:00',NULL,'2018-09-20 02:43:47','2018-09-20 02:43:47',NULL,'1',NULL,NULL,NULL,NULL),  ('44','151','4',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-29 00:00:00',NULL,'2018-09-25 00:16:19','2018-09-25 00:16:19',NULL,'1',NULL,NULL,NULL,NULL),  ('45','152','4',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2018-09-29 00:00:00',NULL,'2018-09-25 00:16:19','2018-09-25 00:16:19',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `assets` VALUES ('111','15','15','App\\InventarisirDetail','2','3',NULL,'1','2020-09-10','500000.00','0.10','AC 2 PK merek samsung','0','2018-08-31 07:05:52','2018-10-02 10:04:52',NULL,'1','1',NULL,NULL,NULL),  ('112','15','15','App\\InventarisirDetail','2','3',NULL,'1','2020-09-10','100000.00','0.10','AC 2 PK','0','2018-08-31 07:05:52','2018-09-04 04:18:07','2018-09-04 04:18:07','1','1','1',NULL,NULL),  ('123','16','16','App\\InventarisirDetail','12','19',NULL,'1','2020-09-10','9000000.00','0.10','LAPTOP ACER / C&D','0','2018-09-04 07:23:57','2018-09-04 08:08:44','2018-09-04 08:08:44','1','1','1',NULL,NULL),  ('124','16','16','App\\InventarisirDetail','12','19',NULL,'1','2020-09-10','9000000.00','0.10','LAPTOP HP / C&D','0','2018-09-04 07:23:57','2018-09-04 07:34:57',NULL,'1','1',NULL,NULL,NULL),  ('125','17','17','App\\InventarisirDetail','12','19',NULL,'1','2020-09-10','6000000.00','0.10','LAPTOP','0','2018-09-04 08:14:58','2018-09-04 08:19:11',NULL,'1','1',NULL,NULL,NULL),  ('137',NULL,'1','App\\MutasiIn','2','3',NULL,'1','2020-09-10','100000.00','0.00','AC 2 PK','0','2018-09-05 03:23:40','2018-09-05 22:53:30',NULL,'1','1',NULL,NULL,NULL),  ('138',NULL,'1','App\\MutasiIn','2','3',NULL,'1','2020-09-10','7000000.00','0.10','AC 2 PK','0','2018-09-05 03:23:40','2018-09-05 22:55:15',NULL,'1','1',NULL,NULL,NULL),  ('139',NULL,'1','App\\MutasiIn','2','3',NULL,'1','2020-09-10','0.00','0.00','AC 2 PK','0','2018-09-05 03:23:40','2018-09-05 03:23:40',NULL,'1',NULL,NULL,NULL,NULL),  ('140',NULL,'1','App\\MutasiIn','2','3',NULL,'1','2020-09-10','0.00','0.00','AC 2 PK','0','2018-09-05 03:23:40','2018-09-05 03:23:40',NULL,'1',NULL,NULL,NULL,NULL),  ('141',NULL,'1','App\\MutasiIn','2','3',NULL,'1','2020-09-10','0.00','0.00','AC 2 PK','0','2018-09-05 03:23:40','2018-09-05 03:23:40',NULL,'1',NULL,NULL,NULL,NULL),  ('142','18','18','App\\InventarisirDetail','12','19',NULL,'1','2020-09-10','500000.00','0.10','LAPTOP','0','2018-09-05 07:52:22','2018-09-07 09:25:35',NULL,'1','1',NULL,NULL,NULL),  ('143',NULL,'3','App\\MutasiIn','12','19',NULL,'1','2020-09-10','0.00','0.10','LAPTOP','0','2018-09-05 08:03:57','2018-09-05 08:07:15',NULL,'1','1',NULL,NULL,NULL),  ('144',NULL,'5','App\\MutasiIn','12','19',NULL,'1','2020-09-10','0.00','0.10','LAPTOP Acer','0','2018-09-05 08:08:29','2018-09-05 10:36:26',NULL,'1','1',NULL,NULL,NULL),  ('145',NULL,'6','App\\MutasiIn','6','1',NULL,'1','2024-09-11','1200000.00','0.10','MEJA MEETING KEU','0','2018-09-11 04:03:19','2018-09-10 10:28:52',NULL,'1','1',NULL,NULL,NULL),  ('146',NULL,'6','App\\MutasiIn','6','1',NULL,'1','2020-09-10','5000000.00','0.10','MEJA MEETING C&D','0','2018-09-07 04:03:19','2018-09-07 09:07:43',NULL,'1','1',NULL,NULL,NULL),  ('149','19','19','App\\InventarisirDetail','1','4','70000','1','2023-09-20','1000000.00','0.10','INFOCUS / LCD','0','2018-09-20 02:43:47','2018-09-22 07:22:01',NULL,'1','1',NULL,NULL,NULL),  ('150','19','19','App\\InventarisirDetail','1','4',NULL,'1','2023-09-20','0.00','0.10','INFOCUS / LCD','0','2018-09-20 02:43:47','2018-09-20 02:43:47',NULL,'1',NULL,NULL,NULL,NULL),  ('151','20','20','App\\InventarisirDetail','7','13','0','1','2023-09-25','0.00','0.10','PULPEN SNOWMAN MERAH','0','2018-09-25 00:16:19','2018-09-25 00:16:19',NULL,'1',NULL,NULL,NULL,NULL),  ('152','20','20','App\\InventarisirDetail','7','13','0','1','2023-09-25','0.00','0.10','PULPEN SNOWMAN MERAH','0','2018-09-25 00:16:19','2018-09-25 00:16:19',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `banks` VALUES ('1','bca','bank central asia','2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('2','bni','bank negara asia','2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('3','mandiri','bank mandiri','2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('4','bri','bank rakyat asia','2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `bap_detail_itempekerjaans` VALUES ('1','1','1',NULL,'3.00','3.00','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2','2',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3','3',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4','4',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5','5',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6','6',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7','7',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8','8',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9','9',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10','10',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11','11',NULL,'3.00','3.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12','12',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13','13',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14','14',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15','15',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16','16',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17','17',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18','18',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19','19',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20','20',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21','21',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22','22',NULL,'3.00','3.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23','23',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24','24',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25','25',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26','26',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27','27',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28','28',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29','29',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30','30',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31','31',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32','32',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33','33',NULL,'3.00','3.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34','34',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35','35',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36','36',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37','37',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38','38',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39','39',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40','40',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41','41',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42','42',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43','43',NULL,'3.00','3.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `bap_details` VALUES ('1','1','1','App\\ProjectKawasan','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2','1','App\\ProjectKawasan','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3','9','App\\Project','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4','9','App\\Project','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5','9','App\\Project','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6','1','App\\ProjectKawasan','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7','1','App\\ProjectKawasan','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8','1','App\\ProjectKawasan','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9','1','App\\ProjectKawasan','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10','9','App\\Project','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11','9','App\\Project','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14','9','App\\Project','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21','1','App\\ProjectKawasan','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22','9','App\\Project','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30','9','App\\Project','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33','1','App\\ProjectKawasan','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34','1','App\\ProjectKawasan','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35','9','App\\Project','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36','1','App\\ProjectKawasan','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37','1','App\\ProjectKawasan','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38','9','App\\Project','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39','9','App\\Project','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40','1','App\\ProjectKawasan','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41','1','App\\ProjectKawasan','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42','9','App\\Project','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43','9','App\\Project','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `baps` VALUES ('1','1',NULL,'2015-02-23','1','039/SBM/1/1.12.5/II/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2',NULL,'2015-03-02','1','044/SBM/1/1.4.4/III/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3',NULL,'2015-03-23','1','057/SBM/1/1.27.3/III/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4',NULL,'2015-06-12','1','113/SBM/1/1.11.4/VI/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5',NULL,'2015-06-26','1','122/SBM/1/1.2.4/VI/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6',NULL,'2015-07-09','1','129/SBM/1/1.4.4/VII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7',NULL,'2015-08-11','1','140/SBM/1/41.3.4/VIII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8',NULL,'2015-08-19','1','146/SBM/1/41.4.4/VIII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9',NULL,'2015-08-31','1','154/SBM/1/41.3.4/VIII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10',NULL,'2015-09-01','1','156/SBM/1/1.13.4/IX/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11',NULL,'2015-09-14','1','164/SBM/1/1.1.7/IX/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12',NULL,'2015-09-22','1','170/SBM/1/1.6.6/IX/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13',NULL,'2015-10-23','1','189/SBM/1/1.12.5/X/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14',NULL,'2015-11-06','1','203/SBM/1/2.2.4/XI/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15',NULL,'2015-12-15','1','229/SBM/1/1.3.4/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16',NULL,'2015-12-17','1','234/SBM/1/41.6.6/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17',NULL,'2015-12-18','1','231/SBM/1/41.6.6/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18',NULL,'2015-12-18','1','232/SBM/1/1.6.6/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19',NULL,'2015-12-18','1','233/SBM/1/41.5.6/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20',NULL,'2015-12-18','1','235/SBM/1/41.5.6/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21',NULL,'2015-12-22','1','237/SBM/1/1.3.4/XII/15/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22',NULL,'2016-01-27','1','017/SBM/1/1.27.3/I/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23',NULL,'2016-02-04','1','023/SBM/1/41.12.5/II/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24',NULL,'2016-03-31','1','055/SBM/1/41.6.6/III/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25',NULL,'2016-03-31','1','056/SBM/1/41.5.6/III/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26',NULL,'2016-04-14','1','070/SBM/1/41.7.6/IV/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27',NULL,'2016-05-30','1','096/SBM/1/1.6.6/V/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28',NULL,'2016-08-05','1','133/SBM/1/41.12.5/VIII/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29',NULL,'2016-09-06','1','151/SBM/1/41.5.6/IX/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30',NULL,'2016-09-09','1','159/SBM/1/1.27.3/IX/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31',NULL,'2016-11-18','1','206/SBM/1/41.3.4/XI/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32',NULL,'2016-11-25','1','201/SBM/1/41.4.4/XI/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33',NULL,'2016-12-16','1','217/SBM/1/41.12.5/XII/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34',NULL,'2016-12-27','1','221/SBM/1/41.4.4/XII/16/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35',NULL,'2017-04-16','1','049/SBM/1/1.16.3/IV/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36',NULL,'2017-05-17','1','064/SBM/1/1.6.6/V/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37',NULL,'2017-06-07','1','072/SBM/1/1.5.6/VI/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38',NULL,'2017-07-24','1','093/SBM/1/1.1.8/VII/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39',NULL,'2017-07-24','1','094/SBM/1/34.1.8/VII/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40',NULL,'2017-07-26','1','089/SBM/1/41.7.6/VII/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41',NULL,'2017-08-04','1','101/SBM/1/41.7.6/VIII/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42',NULL,'2017-09-25','1','131/SBM/1/1.13.4/IX/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43',NULL,'2017-10-06','1','165/SBM/1/1.27.3/XI/17/BAP/01',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `barang_masuk_hibah_details` VALUES ('1','1','1','12','19',NULL,'3',NULL,NULL,'9000000.00','LAPTOP','1','2018-09-04 07:14:31','2018-09-04 07:14:31',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','1','12','19','3','3',NULL,NULL,'9000000.00','SUDAH DITERIMA',NULL,'2018-09-04 07:15:17','2018-09-04 07:15:17',NULL,'1',NULL,NULL,NULL,NULL),  ('3','2','1','1','4',NULL,'10',NULL,NULL,'2000000.00','INFOCUS / LCD','1','2018-09-18 08:04:31','2018-09-18 08:04:31',NULL,'1',NULL,NULL,NULL,NULL),  ('4','3','1','1','4',NULL,'1',NULL,NULL,'1000000.00','INFOCUS / LCD','1','2018-09-18 08:39:40','2018-09-18 08:39:40',NULL,'1',NULL,NULL,NULL,NULL),  ('5','4','4','1','4',NULL,'1',NULL,NULL,'0.00','INFOCUS / LCD','1','2018-09-18 08:43:09','2018-09-18 08:43:09',NULL,'1',NULL,NULL,NULL,NULL),  ('6','5','2','1','4',NULL,'1',NULL,NULL,'0.00','INFOCUS / LCD','1','2018-09-18 09:30:34','2018-09-18 09:30:34',NULL,'1',NULL,NULL,NULL,NULL),  ('7','6','2','1','4',NULL,'1',NULL,NULL,'0.00','INFOCUS / LCD','1','2018-09-18 09:31:24','2018-09-18 09:31:24',NULL,'1',NULL,NULL,NULL,NULL),  ('8','7','1','1','4',NULL,'1',NULL,NULL,'0.00','INFOCUS / LCD','1','2018-09-18 09:55:57','2018-09-18 09:55:57',NULL,'1',NULL,NULL,NULL,NULL),  ('9','8','1','4','8',NULL,'5',NULL,NULL,'50000.00','Semen Tiga Roda','1','2018-09-18 10:23:41','2018-09-18 10:23:41',NULL,'1',NULL,NULL,NULL,NULL),  ('10','9','1','1','4',NULL,'3',NULL,NULL,'500000.00','INFOCUS / LCD','1','2018-09-20 07:00:10','2018-09-20 07:00:10',NULL,'1',NULL,NULL,NULL,NULL),  ('11','10','1','1','4',NULL,'1',NULL,NULL,'5000.00','INFOCUS / LCD','1','2018-10-03 03:18:06','2018-10-03 03:18:06',NULL,'1',NULL,NULL,NULL,NULL),  ('12','10','1','2','3',NULL,'1',NULL,NULL,'5000.00','AC 2 PK','1','2018-10-03 03:18:06','2018-10-03 03:18:06',NULL,'1',NULL,NULL,NULL,NULL),  ('13','10','1','2','3','1','1',NULL,NULL,'7000.00',NULL,NULL,'2018-10-03 03:33:39','2018-10-03 14:42:29',NULL,'1','1',NULL,NULL,NULL),  ('14','10','1','1','4','1','1',NULL,NULL,'5000.00',NULL,NULL,'2018-10-03 03:33:47','2018-10-03 03:33:47',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `barang_masuk_hibahs` VALUES ('1','5','39','9','38','0001/BM/HRD/IX/2018/CG/CI','1','123445','2018-09-04','0','LAPTOP MASUK','2018-09-04 07:14:31','2018-10-03 14:36:29',NULL,'1','1',NULL,NULL,NULL),  ('2','5','39','9','38','0001/BM/HRD/IX/2018/CG/CI','1','123455','2018-09-18','0','test','2018-09-18 08:04:31','2018-09-18 08:04:31',NULL,'1',NULL,NULL,NULL,NULL),  ('3','8','39','9','38','0001/BM/HRD/IX/2018/CG/CI','1','123123213','2018-09-18','0','tets','2018-09-18 08:39:40','2018-09-18 08:39:40',NULL,'1',NULL,NULL,NULL,NULL),  ('4','5','39','9','38','0001/BM/HRD/IX/2018/CG/CI','1','123455','2018-09-18','0','test','2018-09-18 08:43:09','2018-09-18 08:43:09',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5','46','9','38','0001/BM/HRD/IX/2018/CG/CI','1','12333','2018-09-18','0','test','2018-09-18 09:30:34','2018-09-18 09:30:34',NULL,'1',NULL,NULL,NULL,NULL),  ('6','5','47','9','38','0006/BM/HRD/IX/2018/CG/CI','1','23424','2018-09-18','0','dsfsadf','2018-09-18 09:31:24','2018-09-18 09:31:24',NULL,'1',NULL,NULL,NULL,NULL),  ('7','32','38','9','53','0007/BM/HRD/IX/2018/CG/CI','1','123123','2018-09-19','0','test','2018-09-18 09:55:57','2018-10-03 04:26:37','2018-10-03 04:26:37','1','1','1',NULL,NULL),  ('8','10','51','9','38','0008/BM/HRD/IX/2018/CG/CI','1','4543545','2018-09-18','0','tet','2018-09-18 10:23:41','2018-09-18 10:23:41',NULL,'1',NULL,NULL,NULL,NULL),  ('9','5','52','9','38','0009/BM/HRD/IX/2018/CG/CI','1','1234567','2018-09-20','0','test','2018-09-20 07:00:10','2018-09-20 07:00:10',NULL,'1',NULL,NULL,NULL,NULL),  ('10','32','39','9','38','0001/BM/HRD/X/2018/CG/CI','1','test123','2018-10-03','2','test','2018-10-03 03:18:06','2018-10-03 14:39:02',NULL,'1','1',NULL,NULL,NULL);
INSERT INTO `barangkeluar_details` VALUES ('13','11','12','2','2',NULL,'3','2',NULL,'0.00','1','2018-08-31 06:48:13','2018-10-02 07:11:41',NULL,'1','1',NULL,NULL,NULL),  ('14','12','13','12','1',NULL,'19','2',NULL,'0.00',NULL,'2018-09-04 07:22:06','2018-09-04 07:22:06',NULL,'1',NULL,NULL,NULL,NULL),  ('15','13','14','12','1',NULL,'19','1',NULL,'0.00',NULL,'2018-09-04 08:13:55','2018-09-04 08:13:55',NULL,'1',NULL,NULL,NULL,NULL),  ('16','14','15','12','1',NULL,'19','1',NULL,'0.00',NULL,'2018-09-05 07:37:25','2018-09-05 07:37:25',NULL,'1',NULL,NULL,NULL,NULL),  ('28','32','16','2','1',NULL,'3','1',NULL,'0.00',NULL,'2018-09-06 07:49:41','2018-09-06 07:49:41',NULL,'1',NULL,NULL,NULL,NULL),  ('29','32','16','2','2',NULL,'3','2',NULL,'0.00',NULL,'2018-09-06 07:49:54','2018-09-06 07:49:54',NULL,'1',NULL,NULL,NULL,NULL),  ('33','37','17','1','1',NULL,'4','2',NULL,'0.00','1','2018-09-10 04:20:23','2018-09-10 04:51:25',NULL,'1','1',NULL,NULL,NULL),  ('34','40','20','7','4',NULL,'13','2',NULL,'0.00','1','2018-09-25 00:11:47','2018-09-25 08:51:13',NULL,'1','1',NULL,NULL,NULL);
INSERT INTO `barangkeluars` VALUES ('11','12','1','1','0001/BK/EST/VIII/2018/CG/CI','2018-08-31','mengeluarkan ac untuk Estate','2018-08-31 06:48:08','2018-08-31 06:48:30',NULL,'1','1',NULL,NULL,NULL),  ('12','13','1','1','0001/BK/C&D/IX/2018/CG/CI','2018-09-04','mengeluarkan laptop','2018-09-04 07:22:01','2018-09-04 07:22:39',NULL,'1','1',NULL,NULL,NULL),  ('13','14','1','1','0001/BK/KEU/IX/2018/CG/CI','2018-09-04','mengeluarkan barang laptop','2018-09-04 08:13:51','2018-09-04 08:14:10',NULL,'1','1',NULL,NULL,NULL),  ('14','15','1','1','0001/BK/EST/IX/2018/CG/CI','2018-09-05','mengeluarkan laptop','2018-09-05 07:36:57','2018-09-05 07:45:54',NULL,'1','1',NULL,NULL,NULL),  ('32','16','1','1','0001/BK/PRM/IX/2018/CG/CI','2018-09-06','menegluarkan ac','2018-09-06 07:49:12','2018-09-06 07:50:17',NULL,'1','1',NULL,NULL,NULL),  ('37','17','1','1','0002/BK/EST/IX/2018/CG/CI','2018-09-10','mengeluarkan barang','2018-09-10 04:19:54','2018-09-19 10:52:59',NULL,'1','1',NULL,NULL,NULL),  ('38','19','0','1','0003/BK/EST/IX/2018/CG/CI','2018-09-19','barang keluar','2018-09-19 04:20:59','2018-09-19 04:20:59',NULL,'1',NULL,NULL,NULL,NULL),  ('39','19','0','1','0004/BK/EST/IX/2018/CG/CI','2018-09-19','menegluar','2018-09-19 06:22:20','2018-09-19 06:22:20',NULL,'1',NULL,NULL,NULL,NULL),  ('40','20','1','1','0005/BK/EST/IX/2018/CG/CI','2018-09-25','mengeluarkan barang','2018-09-25 00:11:33','2018-09-25 00:14:12',NULL,'1','1',NULL,NULL,NULL),  ('41','20','0','1','0006/BK/EST/IX/2018/CG/CI','2018-09-25','mengeluarkan','2018-09-25 08:51:56','2018-09-25 08:51:56',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `brands` VALUES ('1','SAMSUNG','2018-09-24 09:11:07','2018-09-24 09:11:07',NULL,'1',NULL,NULL,NULL,NULL),  ('2','LG','2018-09-24 09:13:52','2018-09-24 09:13:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3','HITACHI','2018-09-24 09:13:56','2018-09-24 09:13:56',NULL,'1',NULL,NULL,NULL,NULL),  ('4','TOTO','2018-09-24 09:14:31','2018-09-24 09:14:31',NULL,'1',NULL,NULL,NULL,NULL),  ('5','HOLCIM','2018-09-24 09:14:41','2018-09-24 09:14:41',NULL,'1',NULL,NULL,NULL,NULL),  ('6','OLYMPIC','2018-09-24 09:14:57','2018-09-24 09:15:52',NULL,'1','1',NULL,NULL,NULL);
INSERT INTO `cities` VALUES ('1','3','KUNINGAN','20000','GUDANG KUNINGAN HRD','2018-08-20 10:46:23','2018-08-20 10:46:26',NULL,NULL,NULL,NULL,NULL,NULL),  ('2','3','CENGKARENG','30000','GUDANG DI CENGKARENG','2018-08-20 10:46:55','2018-08-20 10:47:00',NULL,NULL,NULL,NULL,NULL,NULL),  ('3','3','SENAYAN','40000','GUDANG SENAYAN','2018-08-20 10:47:53','2018-08-20 10:47:56',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `coas` VALUES ('1',NULL,'51.00.308','Representative & Intertainment',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('2',NULL,'11.41.211','Biaya SK Ijin Prinsip dan Ijin ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('3',NULL,'11.41.213','Biaya Sertifikat Induk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('4',NULL,'11.41.221','Biaya Disain dan Rencana',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('5',NULL,'11.41.222','Cut & Fill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('6',NULL,'11.41.223','Pemagaran Batas Proyek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('7',NULL,'11.41.224','Jalan, Jembatan dan Saluran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('8',NULL,'11.41.225','Instalasi Listrik dan PJU',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('9',NULL,'11.41.226','Jaringan dan Pengolahan Air Bersih',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('10',NULL,'11.41.227','Instalasi Telepon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('11',NULL,'11.41.228','Instalasi Parabola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('12',NULL,'11.41.231','Gerbang Masuk dan Monumen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('13',NULL,'11.41.232','Lansekap dan Pembibitan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('14',NULL,'11.41.239','Prasarana Lainnya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('15',NULL,'11.41.248','Prasarana Lainnya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('16',NULL,'11.41.239','Biaya Operasional Proyek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('17',NULL,'11.41.270','Biaya Operasional Proyek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('18',NULL,'11.42.100','Biaya Konstruksi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('19',NULL,'11.42.130','Konsultan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('20',NULL,'11.41.211','Biaya IMB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('21',NULL,'11.42.300','Biaya SR (Listrik,Air,Telp.)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('22',NULL,'41.40.100','Beban Purna Jual',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('23',NULL,'41.40.100','Biaya Perbaikan Komplin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('24',NULL,'16.10.000','Tanah',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('25',NULL,'16.20.000','Bangunan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('26',NULL,'16.30.100','Kendaraan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('27',NULL,'16.30.200','Alat Berat',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('28',NULL,'16.40.100','Inventaris Kantor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('29',NULL,'16.40.200','Inventaris Proyek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('30',NULL,'16.40.300','Inventaris Rumah Contoh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('31',NULL,'51.00.305','Biaya Pemeliharaan Gedung Dan Inventaris',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('32',NULL,'61.50.820','Pengurusan Cut& Fill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('33',NULL,'62.00.102','Biaya Plumbing Distribusi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('34',NULL,'62.00.103','Biaya Sambungan Rumah',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('35',NULL,'62.00.104','Biaya Perawatan Taman & Lingkungan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('36',NULL,'62.00.106','Biaya Bahan Kimia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('37',NULL,'62.00.107','Biaya Signage,Rambu-Rambu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('38',NULL,'62.00.108','Biaya Pos,Portal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('39',NULL,'62.00.110','Biaya Pju Dan Jaringan Listrik',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('40',NULL,'62.00.111','Biaya Irigasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('41',NULL,'62.00.112','Biaya Perlengkapan Kerja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('42',NULL,'62.00.113','Biaya Saluran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('43',NULL,'62.00.114','Biaya Jalan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('44',NULL,'62.00.115','Biaya Warta Kota',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('45',NULL,'62.00.116','Biaya Pengomposan/Pengolahan Sampah',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('46',NULL,'62.00.117','Biaya Nursery',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('47',NULL,'62.00.118','Biaya Listrik, Maintenance jar. listrik, Telp SO-MO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('48',NULL,'62.00.119','Biaya Lain-Lain City Management',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('49',NULL,'62.00.120','Biaya Kendaraan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('50',NULL,'62.00.122','Biaya Atk,Cetakan,F.Copy,Film',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('51',NULL,'62.00.124','Biaya Pemeliharaan Gedung Dan Inventaris',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('52',NULL,'62.00.126','Biaya Rumah Tangga Kantor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('53',NULL,'62.00.128','Biaya Keamanan Dan Kebersihan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('54',NULL,'62.00.129','Biaya Event & Promotion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('55',NULL,'62.00.130','Biaya Bandwidth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('56',NULL,'62.00.131','Biaya Pemagaran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('57',NULL,'62.00.132','Pemeliharan Kota',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('58',NULL,'62.00.104','Improvement Kota',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('59',NULL,'61.40.810','Pengurusan Tambah Daya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('60',NULL,'61.50.820','Pengurusan Pengurusan Cut & Fill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('61',NULL,'52.00.101','Biaya Iklan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('62',NULL,'52.00.102','Biaya Bilboard, Spanduk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('63',NULL,'52.00.103','Biaya Brosur dan Cetakan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('64',NULL,'52.00.104','Biaya Video Klip dan Jingle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('65',NULL,'52.00.105','Biaya Pameran dan Site Promotion/Event',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('66',NULL,'51.00.300','Biaya Operasional kantor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('67',NULL,'52.00.108','Biaya Perawatan Rumah Contoh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('68',NULL,'52.00.106','Biaya Perawatan Rumah Contoh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('69',NULL,'51.00.409','Biaya Operasional Bangunan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('70',NULL,'52.00.108','Biaya Operasional Bangunan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('71',NULL,'19.10.000','Bangunan Dalam Pelaksanaan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('72',NULL,'19.10.000','Biaya Operasional Proyek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('73',NULL,'21.30.900','Biaya YMHD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('74',NULL,'41.00.120','Gaji dan Tunjangan Outsource',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('75',NULL,'41.00.210','Biaya Pemelihaaraan Kolam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('76',NULL,'41.00.220','Beban Listrik',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('77',NULL,'41.00.230','Biaya Air',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('78',NULL,'41.00.240','Biaya Kebersihan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('79',NULL,'41.00.300','Biaya Cetak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('80',NULL,'51.00.305','Biaya Pemelihaaraan gedung dan Inventaris',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('81',NULL,'51.00.409','Biaya Operasional Proyek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('82',NULL,'52.00.102','Biaya Bilboard dan Spanduk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('83',NULL,'52.00.103','Biaya Brosur dan cetak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('84',NULL,'52.00.104','Biaya Video Clip dan Jingle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('85',NULL,'21.40.110','Pph Pasal 21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('86',NULL,'21.40.130','Pph Pasal 23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('87',NULL,'21.40.170','Pph Final',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),  ('88',NULL,'21.40.330','Ppn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `countries` VALUES ('1','indonesia','auto','2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `departments` VALUES ('1','EST','ESTATE','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('2','KEU','KEUANGAN','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('3','C&D','CONSTRUCTION & DEVELOPMENT','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('4','MAL','MAL','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('5','P&D','PLAN & DESIGN','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('6','PRM','PROMOSI','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('7','FP','FAMILY PARK','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('8','HCM','HUMAN CAPITAL MANAGEMENT','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('9','HRD','HUMAN RESOURCE DEVELOPMENT','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('10','LAND','LAND','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('11','CM','CM','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('12','MKT','MARKETING','','2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('14','123','test','etst','2018-09-28 09:15:51','2018-09-28 09:15:51',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `divisions` VALUES ('1','A01','first division',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `document_types` VALUES ('1','App\\Budget','budget global','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','App\\BudgetTahunan','budget tahunan','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('3','App\\Workorder','work order','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('4','App\\Rab','rab','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('5','App\\Tender','tender','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('6','App\\TenderKorespondensi','keputusan pemenang tender','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('7','App\\Spk','spk','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('8','App\\Purchaserequest','purchase request','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('9','App\\Purchaseorder','purchase order','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('10','App\\Goodreceive','good receive','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('11','App\\Permintaanbarang','penerimaan barang','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('12','App\\Barangretur','retur','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('13','App\\Bap','bap','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('14','App\\Voucher','voucher','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `globalsettings` VALUES ('1','coa_id_ppn','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('2','max_value_multiplier_App\\Nontender','0.5','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('3','denda_a','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('4','denda_b','1000','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('5','retensi_percent','5','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('6','retensi_hari','90','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('7','coa_id_pph','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('8','coa_value_pph','2','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('9','coa_id_potongan','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('10','coa_id_administrasi','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('11','coa_id_denda','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('12','coa_id_selisih','1','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('13','ppn','10','2018-09-05 07:16:15','2018-09-05 07:16:15',NULL,'1',NULL,NULL,NULL,NULL),  ('14','test','2','2018-09-25 03:20:38','2018-09-25 03:20:38',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `group_items` VALUES ('1','pondasi','auto generated','2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('2','dinding','auto generated','2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('3','atap','auto generated','2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('4','finishing','auto generated','2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `group_privileges` VALUES ('1','1','1','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','2','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','3','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','4','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','5','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('6','1','6','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','7','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('8','1','8','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','9','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('10','1','10','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','11','1','1','1','1','1','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('12','2','1','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('13','2','2','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('14','2','3','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('15','2','4','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('16','2','5','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('17','2','6','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('18','2','7','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('19','2','8','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('20','2','9','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('21','2','10','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('22','2','11','0','0','0','0','0','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `history_approval_permintaanbarangs` VALUES ('11','12','2','3','10','2','8','2018-08-31','2018-08-31 06:47:29','2018-08-31 06:47:29',NULL,'1',NULL,NULL,NULL,NULL),  ('12','13','12','19','3','2','1','2018-09-04','2018-09-04 07:21:43','2018-09-04 07:21:43',NULL,'1',NULL,NULL,NULL,NULL),  ('13','14','12','19','2','1','1','2018-09-04','2018-09-04 08:13:08','2018-09-04 08:13:08',NULL,'1',NULL,NULL,NULL,NULL),  ('14','15','12','19','1','1','0','2018-09-05','2018-09-05 07:35:36','2018-09-05 07:35:36',NULL,'1',NULL,NULL,NULL,NULL),  ('15','17','1','4','5','2','3','2018-09-06','2018-09-06 08:01:08','2018-09-06 08:01:08',NULL,'1',NULL,NULL,NULL,NULL),  ('16','19','7','13','156','4','149','2018-09-19','2018-09-19 04:20:34','2018-09-19 04:20:34',NULL,'1',NULL,NULL,NULL,NULL),  ('17','20','11','17',NULL,'3',NULL,'2018-11-09','2018-09-25 00:08:57','2018-09-25 00:08:57',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `inventarisir_details` VALUES ('15','13','13','2','2','3','2018-08-31 06:49:32','2018-08-31 06:49:32',NULL,'1',NULL,NULL,NULL,NULL),  ('16','14','14','12','2','19','2018-09-04 07:23:47','2018-09-04 07:23:47',NULL,'1',NULL,NULL,NULL,NULL),  ('17','15','15','12','1','19','2018-09-04 08:14:53','2018-09-04 08:14:53',NULL,'1',NULL,NULL,NULL,NULL),  ('18','16','16','12','1','19','2018-09-05 07:48:34','2018-09-05 07:48:34',NULL,'1',NULL,NULL,NULL,NULL),  ('19','17','33','1','2','4','2018-09-19 10:53:24','2018-09-19 10:53:24',NULL,'1',NULL,NULL,NULL,NULL),  ('20','18','34','7','2','13','2018-09-25 00:16:11','2018-09-25 00:16:11',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `inventarisirs` VALUES ('13','11','0001/MIN/EST/VIII/2018/CG/CI','1','2','2018-08-31',NULL,'2018-08-31 06:49:32','2018-08-31 06:49:32',NULL,'1',NULL,NULL,NULL,NULL),  ('14','12','0001/MIN/C&D/IX/2018/CG/CI','1','4','2018-09-04',NULL,'2018-09-04 07:23:47','2018-09-04 07:23:47',NULL,'1',NULL,NULL,NULL,NULL),  ('15','13','0001/MIN/KEU/IX/2018/CG/CI','1','6','2018-09-04',NULL,'2018-09-04 08:14:53','2018-09-04 08:14:53',NULL,'1',NULL,NULL,NULL,NULL),  ('16','14','0001/MIN/EST/IX/2018/CG/CI','1','2','2018-09-05',NULL,'2018-09-05 07:48:34','2018-09-05 07:48:34',NULL,'1',NULL,NULL,NULL,NULL),  ('17','37','0001/MIN/EST/IX/2018/CG/CI','1','4','2018-09-19',NULL,'2018-09-19 10:53:24','2018-09-19 10:53:24',NULL,'1',NULL,NULL,NULL,NULL),  ('18','40','0001/MIN/EST/IX/2018/CG/CI','4','1','2018-09-29',NULL,'2018-09-25 00:16:11','2018-09-25 00:16:11',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `inventories` VALUES ('1','1','0','1','2','Rekanan','2018-08-20','5','4',NULL,NULL,NULL,NULL,'2018-08-20 13:51:42','2018-08-20 13:51:45',NULL,NULL,NULL,NULL,NULL,NULL),  ('2','2','0','2','3','Rekanan','2018-08-20','10','3',NULL,NULL,NULL,NULL,'2018-08-20 13:53:12','2018-08-20 13:53:15',NULL,NULL,NULL,NULL,NULL,NULL),  ('3','3','0','2','4','Rekanan','2018-08-20','25','6',NULL,NULL,NULL,NULL,'2018-08-20 13:54:23','2018-08-20 13:54:26',NULL,NULL,NULL,NULL,NULL,NULL),  ('4','4','0','2','5','Rekanan','2018-08-20','10','8',NULL,NULL,NULL,NULL,'2018-08-20 13:55:12','2018-08-20 13:55:14',NULL,NULL,NULL,NULL,NULL,NULL),  ('5','5','0','2','6','Rekanan','2018-08-20','15','2',NULL,NULL,NULL,NULL,'2018-08-20 13:55:45','2018-08-20 13:55:48',NULL,NULL,NULL,NULL,NULL,NULL),  ('6','6','0','2','7','Rekanan','2018-08-20','10','1',NULL,NULL,NULL,NULL,'2018-08-20 13:56:15','2018-08-20 13:56:18',NULL,NULL,NULL,NULL,NULL,NULL),  ('7','7','0','4','8','Rekanan','2018-08-20','13','14',NULL,NULL,NULL,NULL,'2018-08-20 13:56:46','2018-08-20 13:56:49',NULL,NULL,NULL,NULL,NULL,NULL),  ('8','8','0','4','9','Rekanan','2018-08-20','12','16',NULL,NULL,NULL,NULL,'2018-08-20 13:57:14','2018-08-20 13:57:16',NULL,NULL,NULL,NULL,NULL,NULL),  ('9','9','0','1','10','Rekanan','2018-08-20','11','10',NULL,NULL,NULL,NULL,'2018-08-20 13:57:39','2018-08-20 13:57:42',NULL,NULL,NULL,NULL,NULL,NULL),  ('10','10','0','4','11','Rekanan','2018-08-20','20','12',NULL,NULL,NULL,NULL,'2018-08-20 13:58:05','2018-08-20 13:58:08',NULL,NULL,NULL,NULL,NULL,NULL),  ('46','2',NULL,'2','13','App\\BarangkeluarDetail','2018-08-31','-2','3',NULL,NULL,NULL,'barang keluar','2018-08-31 06:48:30','2018-08-31 06:48:30',NULL,'1',NULL,NULL,NULL,NULL),  ('47','2',NULL,'1','17','App\\MutasiOut','2018-09-04','1','3',NULL,NULL,NULL,'labeled','2018-09-04 04:18:07','2018-09-04 04:18:07',NULL,'1',NULL,NULL,NULL,NULL),  ('48','12',NULL,'1','2','App\\BarangMasukHibahDetail','2018-09-04','3','19',NULL,'9000000.00',NULL,'SUDAH DITERIMA','2018-09-04 07:15:43','2018-10-03 14:36:29','2018-10-03 14:36:29','1',NULL,NULL,NULL,NULL),  ('49','12',NULL,'1','14','App\\BarangkeluarDetail','2018-09-04','-2','19',NULL,NULL,NULL,'barang keluar','2018-09-04 07:22:39','2018-09-04 07:22:39',NULL,'1',NULL,NULL,NULL,NULL),  ('50','12',NULL,'1','18','App\\MutasiOut','2018-09-04','1','19',NULL,NULL,NULL,'labeled','2018-09-04 08:08:44','2018-09-04 08:08:44',NULL,'1',NULL,NULL,NULL,NULL),  ('51','12',NULL,'1','15','App\\BarangkeluarDetail','2018-09-04','-1','19',NULL,NULL,NULL,'barang keluar','2018-09-04 08:14:10','2018-09-04 08:14:10',NULL,'1',NULL,NULL,NULL,NULL),  ('52','12',NULL,'1','16','App\\BarangkeluarDetail','2018-09-05','-1','19',NULL,NULL,NULL,'barang keluar','2018-09-05 07:45:54','2018-09-05 07:45:54',NULL,'1',NULL,NULL,NULL,NULL),  ('54','2',NULL,'1','28','App\\BarangkeluarDetail','2018-09-06','-1','3',NULL,NULL,NULL,'barang keluar','2018-09-06 07:50:17','2018-09-06 07:50:17',NULL,'1',NULL,NULL,NULL,NULL),  ('55','2',NULL,'2','29','App\\BarangkeluarDetail','2018-09-06','-2','3',NULL,NULL,NULL,'barang keluar','2018-09-06 07:50:17','2018-09-06 07:50:17',NULL,'1',NULL,NULL,NULL,NULL),  ('56','1',NULL,'1','31','App\\BarangkeluarDetail','2018-09-06','-1','4',NULL,NULL,NULL,'barang keluar','2018-09-06 09:31:37','2018-09-06 09:31:37',NULL,'1',NULL,NULL,NULL,NULL),  ('57','1',NULL,'1','33','App\\BarangkeluarDetail','2018-09-19','-2','4',NULL,NULL,NULL,'barang keluar','2018-09-19 10:52:59','2018-09-19 10:52:59',NULL,'1',NULL,NULL,NULL,NULL),  ('58','7',NULL,'4','34','App\\BarangkeluarDetail','2018-09-25','-2','13',NULL,NULL,NULL,'barang keluar','2018-09-25 00:14:12','2018-09-25 00:14:12',NULL,'1',NULL,NULL,NULL,NULL),  ('59','2',NULL,'1','13','App\\BarangMasukHibahDetail','2018-10-03','1','3',NULL,'5000.00',NULL,NULL,'2018-10-03 14:39:02','2018-10-03 14:39:02',NULL,'1',NULL,NULL,NULL,NULL),  ('60','1',NULL,'1','14','App\\BarangMasukHibahDetail','2018-10-03','1','4',NULL,'5000.00',NULL,NULL,'2018-10-03 14:39:02','2018-10-03 14:39:02',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `item_categories` VALUES ('1','0','ELEKTRONIK','2018-08-20 03:41:06','2018-08-20 03:41:06',NULL,'1',NULL,NULL,NULL,NULL),  ('2','0','FURNITURE','2018-08-20 03:41:19','2018-08-20 03:41:19',NULL,'1',NULL,NULL,NULL,NULL),  ('3','0','BAHAN BANGUNAN','2018-08-20 03:41:33','2018-08-20 03:41:33',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','AC','2018-08-20 06:35:55','2018-08-20 06:35:55',NULL,'1',NULL,NULL,NULL,NULL),  ('5','3','Semen','2018-08-20 06:37:35','2018-08-20 06:37:35',NULL,'1',NULL,NULL,NULL,NULL),  ('6','2','KURSI','2018-08-20 06:39:04','2018-08-20 06:39:04',NULL,'1',NULL,NULL,NULL,NULL),  ('7','2','MEJA','2018-08-20 06:39:45','2018-08-20 06:39:45',NULL,'1',NULL,NULL,NULL,NULL),  ('8','0','ATK','2018-08-20 06:45:34','2018-08-20 06:45:34',NULL,'1',NULL,NULL,NULL,NULL),  ('9','0','KERTAS','2018-08-20 06:45:47','2018-08-20 06:45:47',NULL,'1',NULL,NULL,NULL,NULL),  ('10','8','PULPEN','2018-08-20 06:45:54','2018-08-20 06:45:54',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','KOMPUTER','2018-09-04 07:09:52','2018-09-04 07:09:52',NULL,'1',NULL,NULL,NULL,NULL),  ('12','0','MATERIAL','2018-09-24 09:17:48','2018-09-24 09:17:48',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `item_prices` VALUES ('1','11','17','9','1500000.00',NULL,NULL,'2018-08-27 00:00:00',NULL,NULL,NULL,NULL,'2018-08-27 06:51:45','2018-08-27 06:51:45',NULL,'1',NULL,NULL,NULL,NULL),  ('2','13','20','9','4000000.00',NULL,NULL,'2018-09-24 00:00:00',NULL,NULL,NULL,'harga per-unit','2018-09-24 14:00:51','2018-09-24 14:00:51',NULL,'1',NULL,NULL,NULL,NULL),  ('3','6','1','9','5000000.00',NULL,NULL,'2018-09-24 00:00:00',NULL,NULL,NULL,NULL,'2018-09-24 14:02:29','2018-09-24 14:02:29',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `item_satuans` VALUES ('1','6','UNIT','1','2018-08-20 06:42:48','2018-08-20 06:42:48',NULL,'1',NULL,NULL,NULL,NULL),  ('2','5','UNIT','1','2018-08-20 06:43:07','2018-08-20 06:43:07',NULL,'1',NULL,NULL,NULL,NULL),  ('3','2','UNIT','1','2018-08-20 06:43:21','2018-08-20 06:43:21',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','UNIT','1','2018-08-20 06:44:00','2018-08-20 06:44:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','3','KG','1','2018-08-20 06:44:18','2018-08-20 06:44:18',NULL,'1',NULL,NULL,NULL,NULL),  ('6','3','SAK','50','2018-08-20 06:44:29','2018-08-20 06:44:29',NULL,'1',NULL,NULL,NULL,NULL),  ('7','4','KG','1','2018-08-20 06:44:44','2018-08-20 06:44:44',NULL,'1',NULL,NULL,NULL,NULL),  ('8','4','SAK','50','2018-08-20 06:44:47','2018-08-20 06:44:56',NULL,'1','1',NULL,NULL,NULL),  ('9','9','LEMBAR','1','2018-08-20 06:47:43','2018-08-20 06:47:43',NULL,'1',NULL,NULL,NULL,NULL),  ('10','9','RIM','500','2018-08-20 06:47:48','2018-08-20 06:47:48',NULL,'1',NULL,NULL,NULL,NULL),  ('11','10','LEMBAR','1','2018-08-20 06:48:01','2018-08-20 06:48:01',NULL,'1',NULL,NULL,NULL,NULL),  ('12','10','RIM','500','2018-08-20 06:48:04','2018-08-20 06:48:17',NULL,'1','1',NULL,NULL,NULL),  ('13','7','BUAH','1','2018-08-20 06:48:42','2018-08-20 06:48:42',NULL,'1',NULL,NULL,NULL,NULL),  ('14','7','LUSIN','12','2018-08-20 06:48:45','2018-08-20 06:48:45',NULL,'1',NULL,NULL,NULL,NULL),  ('15','8','BUAH','1','2018-08-20 06:48:58','2018-08-20 06:48:58',NULL,'1',NULL,NULL,NULL,NULL),  ('16','8','LUSIN','12','2018-08-20 06:49:02','2018-08-20 06:49:09',NULL,'1','1',NULL,NULL,NULL),  ('17','11','UNIT','1','2018-08-27 06:51:14','2018-08-27 06:51:14',NULL,'1',NULL,NULL,NULL,NULL),  ('18','7','PACK','40','2018-08-27 06:52:38','2018-08-27 06:53:54','2018-08-27 06:53:54','1','1','1',NULL,NULL),  ('19','12','UNIT','1','2018-09-04 07:11:07','2018-09-04 07:11:07',NULL,'1',NULL,NULL,NULL,NULL),  ('20','13','UNIT','1','2018-09-24 13:59:51','2018-09-24 13:59:51',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `itempekerjaans` VALUES ('1',NULL,'10','3','000','0','PERSEDIAAN TANAH','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','10','3','000.0','0','PERSEDIAAN TANAH','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('3',NULL,'10','3','100','0','Pembelian Tanah Mentah','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('4','3','10','3','100.0','0','Pembelian Tanah Mentah','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('5',NULL,'3','1','200','0','BIAYA PENGEMBANGAN LAHAN','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('6','5','3','1','200.0','0','BIAYA PENGEMBANGAN LAHAN','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('7',NULL,'3','1','210','0','BIAYA LEGAL dan PERIJINAN','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('8','7','3','1','210.0','0','BIAYA LEGAL dan PERIJINAN','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('9',NULL,'3','1','211','0','Biaya SK Ijin Prinsip dan Ijin Lokasi','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('10',NULL,'3','1','212','0','Biaya Blok Plan dan Advice Planning','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('11',NULL,'3','1','213','0','Biaya Sertifikat Induk','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('12',NULL,'3','1','214','0','Biaya PBB, Legal dan Perkara','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('13',NULL,'3','1','215','0','Biaya Ijin Pembangunan Prasarana','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('14',NULL,'3','1','216','0','Biaya Operasi Proyek','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('15',NULL,'3','1','220','0','BIAYA PEMBANGUNAN PRASARANA','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('16',NULL,'3','1','221','0','Biaya Disain dan Rencana','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('17','16','3','1','221.0','0','Biaya Disain Dan Rencana','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('18','16','3','1','221.1','0','Biaya Perencanaan / Konsultan','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('19','18','3','1','221.1.1','0','Biaya Perencanaan / konsultan Struktur infra','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('20','18','3','1','221.1.2','0','Biaya Perencanaan / konsultan Arsitektur Infra','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('21','18','3','1','221.1.3','0','Biaya Perencanaan / konsultan Taman/Lanscape/Danau','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('22','18','3','1','221.1.4','0','Biaya Perencanaan / konsultan Grading,Jalan-Saluran Kawasan','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('23','18','3','1','221.1.5','0','Biaya Perencanaan / konsultan QS/ME Kawasan','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('24','16','3','1','221.2','0','Biaya Test Tanah ( Soil Test )','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('25','16','3','1','221.3','0','Biaya Pengukuran BatasTanah Property','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('26','16','3','1','221.4','0','Biaya PengukuranTopografi','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('27',NULL,'3','1','222','0','Cut & Fill','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('28',NULL,'3','1','223','0','Pemagaran Batas Proyek','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('29',NULL,'3','1','224','0','Jalan, Jembatan dan Saluran','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('30','29','3','1','224.1','0','Jalan Aspal / Hot Mix (incl. Sirtu, Base Coarse, ATB)','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('31','30','3','1','224.1.0','0','Jalan Aspal / Hot Mix (incl. Sirtu, Base Coarse, ATB)','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('32','29','3','1','224.2','0','Jalan Paving (incl. Sirtu, Base Coarse)','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('33','32','3','1','224.2.0','0','Pekerjaan Jalan Paving','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('34','32','3','1','224.2.1','0','Pekerjaan Sirtu','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('35','32','3','1','224.2.2','0','Pekerjaan Base Coarse','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('36','32','3','1','224.2.3','0','Pekerjaan Paving','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('37','32','3','1','224.2.4','0','Pekerjaan Kanstein','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('38','32','3','1','224.2.5','0','Pekerjaan Street Inlet','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('39','32','3','1','224.2.6','0','Pekerjaan Marka Jalan','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('40','32','3','1','224.2.7','0','Pekerjaan Pendestrian','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('41','29','3','1','224.3','0','Saluran Drainase, Street Inlet,Bak Kontrol','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('42','29','3','1','224.4','0','Jembatan dalam Cluster','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('43','29','3','1','224.5','0','Pedestrian','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('44','29','3','1','224.6','0','Jalan Rigit (incl. Sirtu, Base Coarse, Beton)','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('45','29','3','1','224.7','0','Driver Way','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('46',NULL,'3','1','225','0','Instalasi Listrik dan PJU','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('47',NULL,'3','1','226','0','Jaringan dan Pengolahan Air Bersih','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('48',NULL,'3','1','227','0','Instalasi Telepon','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('49',NULL,'3','1','228','0','Instalasi Parabola','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('50',NULL,'3','1','229','0','Pembentukan danau dan Alur Sungai','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('51',NULL,'3','1','230','0','Jalan Akses Ke Lokasi','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('52',NULL,'3','1','231','0','Gerbang Masuk dan Monumen','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('53',NULL,'3','1','232','0','Lansekap dan Pembibitan','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('54',NULL,'3','1','239','0','Prasarana Lain','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('55',NULL,'3','1','240','0','BIAYA PEMBANGUNAN FASOS-FASUM','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('56',NULL,'3','1','241','0','Klub Keluarga','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('57',NULL,'3','1','242','0','Puskesmas','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('58',NULL,'3','1','243','0','Tempat Ibadah','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('59',NULL,'3','1','244','0','Tempat Pemakamam','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('60',NULL,'3','1','245','0','Kantor Pos, Polisi, Pmk','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('61',NULL,'3','1','246','0','Kantor Pemerintahan','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('62',NULL,'3','1','247','0','Sekolah','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('63',NULL,'3','1','248','0','Pasar dan Pujasera','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('64',NULL,'3','1','249','0','Terminal','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('65',NULL,'3','1','250','0','Fasilitas Olah Raga','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('66',NULL,'3','1','260','0','Biaya Pemeliharaan Prasarana dan Sarana','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('67',NULL,'3','1','270','0','Biaya Operasi Teknik','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('68','9','3','1','211.0','0','Biaya SK Ijin Prinsip dan Ijin Lokasi','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('69','10','3','1','212.0','0','Biaya Blok Plan dan Advice Planning','0.10',NULL,'2018-08-19 01:57:47','2018-08-19 01:57:47',NULL,'1',NULL,NULL,NULL,NULL),  ('70','11','3','1','213.0','0','Biaya Sertifikat Induk','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('71','12','3','1','214.0','0','Biaya PBB, Legal dan Perkara','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('72','13','3','1','215.0','0','Biaya Ijin Pembangunan Prasarana','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('73','14','3','1','216.0','0','Biaya Operasi Proyek','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('74','15','3','1','220.0','0','BIAYA PEMBANGUNAN PRASARANA','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('75','27','3','1','222.0','0','Cut & Fill','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('76','27','3','1','222.1','0','Pek, Galian, Timbunan dan Pemadatan Tanah (Cut & Fill)','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('77','27','3','1','222.2','0','Pek. Urugan dan Cut & Fill Penguasaan Lahan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('78','27','3','1','222.3','0','Penahan Tanah & Turap Batas tanah Property','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('79','27','3','1','222.4','0','Penahan Tanah & Turap antar Bangunan/Jalan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('80','27','3','1','222.5','0','Pek Timbunan Tanah import ( Fill )','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('81','28','3','1','223.0','0','Pemagaran Batas Proyek','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('82','28','3','1','223.1','0','Pagar Panel / Precast','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('83','28','3','1','223.2','0','Pagar Bata','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('84','28','3','1','223.3','0','Pagar BRC','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('85','28','3','1','223.4','0','Pagar Seng','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('86','28','3','1','223.5','0','Pos Jaga','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('87','28','3','1','223.6','0','Pagar Batas Property','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('88','28','3','1','223.7','0','Pagar Batas Kawasan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('89','46','3','1','225.0','0','Instalasi Listrik dan PJU','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('90','46','3','1','225.1','0','Instalasi Jaringan Listrik (TM, TR, SR dan Panel Distribusi)','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('91','46','3','1','225.2','0','Pembangunan Gardu Listrik + Intalasi + Travo/Kubikal','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('92','46','3','1','225.3','0','Pembangunan Tiang Gardu Listrik + Trafo/Kubikal','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('93','46','3','1','225.4','0','Maintenance Jaringan Listrik (termsk Panel PJU)','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('94','46','3','1','225.5','0','Instalasi Jaringan PJU + Tiang + Lampu','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('95','46','3','1','225.6','0','Maintenance Jaringan PJU ( termsk Panel PJU )','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('96','46','3','1','225.7','0','PJU Temporer','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('97','46','3','1','225.8','0','Instalasi Jaringan Listrik Temporer Bedeng (KWH tarif Pesta)','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('98','47','3','1','226.0','0','Jaringan Dan Pengolahan Air Bersih','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('99','47','3','1','226.1','0','Instalasi Jaringan Air Bersih','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('100','47','3','1','226.2','0','Maintenance Jaringan Air Bersih','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('101','48','3','1','227.0','0','Instalasi Telepon / Fiber Optic','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('102','48','3','1','227.1','0','Instalasi Jaringan Telpon/Fiber Optic','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('103','48','3','1','227.2','0','Maintenance Jaringan Telepon/ Fiber Optic','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('104','49','3','1','228.0','0','Instalasi Parabola','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('105','49','3','1','228.1','0','Instalasi Jaringan Parabola','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('106','49','3','1','228.2','0','Maintenance Jaringan Parabola','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('107','50','3','1','229.0','0','Pembentukan Danau Dan Alur Sungai','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('108','50','3','1','229.1','0','Pembentukan Danau Dan Alur Sungai','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('109','51','3','1','230.0','0','Jalan Akses Ke Lokasi','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('110','51','3','1','230.1','0','Jalan Akses ke Lokasi','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('111','52','3','1','231.0','0','Gerbang Masuk Dan Monumen','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('112','52','3','1','231.2','0','Gerbang Masuk Cluster/ Sclupture Cluster','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('113','52','3','1','231.3','0','Taman Bertema / Kolam dalam Cluster','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('114','52','3','1','231.4','0','Children Play Ground / Fasilitas OR','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('115','53','3','1','232.0','0','Lansekap dan Pembibitan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('116','53','3','1','232.1','0','Pengadaan & Penanaman semua jenis Tanaman','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('117','53','3','1','232.2','0','Perawatan dan Pemeliharaan Lingkungan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('118','53','3','1','232.3','0','Pembuatan Taman Rumah / Kawasan / Lampu Taman','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('119','53','3','1','232.4','0','Jaringan Irigasi ','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('120','53','3','1','232.5','0','Pembibitan (Nursery)','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('121','53','3','1','232.6','0','Pembuatan Danau Cluster / Proyek','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('122','54','3','1','239.0','0','Prasarana Lain','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('123','54','3','1','239.1','0','Biaya Keamanan / Outsource ','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('124','54','3','1','239.2','0','Pembersihan / Penyiraman Jalan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('125','54','3','1','239.3','0','Pembuatan Signage, Patok Petunjuk Kavling','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('126','55','3','1','240.0','0','BIAYA PEMBANGUNAN FASOS-FASUM','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('127','56','3','1','241.0','0','Klub Keluarga/Water Park / Klub House','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('128','57','3','1','242.0','0','Puskesmas','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('129','58','3','1','243.0','0','Tempat Ibadah','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('130','59','3','1','244.0','0','Tempat Pemakamam','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('131','60','3','1','245.0','0','Kantor Pos, Polisi, Pmk','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('132','61','3','1','246.0','0','Kantor Pemerintahan','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('133','62','3','1','247.0','0','Sekolah','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('134','63','3','1','248.0','0','Pasar Dan Pujasera','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('135','64','3','1','249.0','0','Terminal','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('136','65','3','1','250.0','0','Fasilitas Olah Raga','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('137','66','3','1','260.0','0','Biaya Pemeliharaan Prasarana Dan Sarana','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('138','67','3','1','270.0','0','Biaya Operasi Teknik','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('139',NULL,'3','2','100','0','Biaya Konstruksi','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('140','139','3','2','100.0','0','Biaya Konstruksi','0.10',NULL,'2018-08-19 01:57:48','2018-08-19 01:57:48',NULL,'1',NULL,NULL,NULL,NULL),  ('141','139','3','2','100.1','0','Biaya Konstruksi Rumah','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('142','141','3','2','100.1.1','0','Main Kontraktor Bangunan Rumah','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('143','141','3','2','100.1.2','0','Sub Kontraktor Bangunan Rumah','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('144','143','3','2','100.1.2.1','0','Anti Rayap','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('145','143','3','2','100.1.2.2','0','Pek. Pondasi (Pancang, Bor Strouss)','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('146','143','3','2','100.1.2.3','0','Interior','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('147','143','3','2','100.1.2.4','0','Landscape','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('148','143','3','2','100.1.2.5','0','Pemasangan Carport','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('149','143','3','2','100.1.2.6','0','Penunjang (Tandon, Canopy, No Rumah dll)','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('150','141','3','2','100.1.3','0','Purna Jual Rumah ','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('151','139','3','2','100.2','0','Biaya Konstruksi Ruko','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('152','151','3','2','100.2.1','0','Main Kontraktor Bangunan Ruko','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('153','151','3','2','100.2.2','0','Sub Kontraktor Bangunan Ruko','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('154','153','3','2','100.2.2.1','0','Anti Rayap','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('155','153','3','2','100.2.2.2','0','Pek. Pondasi (Pancang, Bor Strouss)','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('156','153','3','2','100.2.2.3','0','Interior','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('157','153','3','2','100.2.2.4','0','Landscape','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('158','153','3','2','100.2.2.5','0','Penunjang (Tandon, Canopy dll)','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('159','139','3','2','100.3','0','Purna Jual Ruko ','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('160','139','3','2','100.5','0','Biaya Disain dan Perencanaan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('161','160','3','2','100.5.1','0','Konsultan Arsitektur Bangunan/Gedung','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('162','160','3','2','100.5.2','0','Konsultan Struktur Bangunan/Gedung','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('163','160','3','2','100.5.3','0','Konsultan QS / ME Bangunan/Gedung','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('164','160','3','2','100.5.4','0','Konsultan Gambar Kerja Bangunan / Struktur','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('165',NULL,'3','2','200','0','Biaya IMB / PBB','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('166','165','3','2','200.0','0','Biaya IMB/PBB','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('167',NULL,'3','2','300','0','Biaya Listrik / Air / Parabola','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('168','167','3','2','300.0','0','Biaya SR (Listrik / Air / Telp / Internet)','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('169','167','3','2','300.1','0','Biaya SR Listrik (KWH Meter, JBST)','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('170','167','3','2','200.2','0','Biaya SR Air','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('171','167','3','2','300.3','0','Biaya SR Telp','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('172','167','3','2','300.4','0','Biaya SR TV, Internet','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('173',NULL,'12','4','000','0','BIAYA MARKETING','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('174',NULL,'12','4','100','0','BIAYA PROMOSI','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('175',NULL,'12','4','101','0','Biaya Iklan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('176',NULL,'12','4','102','0','Biaya Billboard dan Spanduk','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('177',NULL,'12','4','103','0','Biaya Brosur dan Cetakan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('178',NULL,'12','4','104','0','Biaya Video Clip dan Jingle','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('179',NULL,'12','4','105','0','Biaya Pameran dan Site Promotion / Event','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('180',NULL,'12','4','106','0','Hadiah dan Souvenir','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('181',NULL,'12','4','107','0','Sponsorship dan Sumbangan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('182',NULL,'12','4','108','0','Biaya Asuransi Ciputra Life','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('183',NULL,'12','4','200','0','KOMISI PENJUALAN','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('184',NULL,'12','4','201','0','Komisi Broker','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('185',NULL,'12','4','202','0','Komisi Karyawan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('186',NULL,'12','4','300','0','BIAYA ADMINISTRASI PENJUALAN dan LEGAL','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('187',NULL,'12','4','301','0','Biaya KPR','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('188',NULL,'12','4','302','0','Biaya Perkara AJB-BBN Ulang','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('189','173','12','4','000.0','0','BIAYA MARKETING','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('190','174','12','4','100.0','0','BIAYA PROMOSI','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('191','175','12','4','101.0','0','Biaya Iklan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('192','176','12','4','102.0','0','Biaya Billboard Dan Spanduk','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('193','177','12','4','103.0','0','Biaya Brosur Dan Cetakan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('194','178','12','4','104.0','0','Biaya Video Clip Dan Jingle','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('195','179','12','4','105.0','0','Biaya Pameran Dan Site Promotion / Event','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('196','180','12','4','106.0','0','Hadiah Dan Souvenir','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('197','181','12','4','107.0','0','Sponsorship Dan Sumbangan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('198','182','12','4','108.0','0','Biaya Asuransi Ciputra Life','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('199','183','12','4','200.0','0','KOMISI PENJUALAN','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('200','184','12','4','201.0','0','Komisi Broker','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('201','185','12','4','202.0','0','Komisi Karyawan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('202','186','12','4','300.0','0','BIAYA ADMINISTRASI PENJUALAN dan LEGAL','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('203','187','12','4','301.0','0','Biaya Kpr','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('204','188','12','4','302.0','0','Biaya Perkara Ajb-Bbn Ulang','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('205',NULL,'11','5','100','0','BEBAN CITY MANAGEMENT','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('206',NULL,'11','5','101','0','Biaya Kebersihan & Pengelolaan Lingkungan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('207',NULL,'11','5','102','0','Biaya Listrik PJU & Utilities','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('208',NULL,'11','5','103','0','Biaya Pengolahan Air Bersih','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('209',NULL,'11','5','104','0','Biaya Klub Keluarga','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('210',NULL,'11','5','105','0','Biaya Keamanan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('211',NULL,'11','5','106','0','Biaya Operasional Kantor','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('212','205','11','5','100.1','0','Biaya purna Jual Bangunan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('213','206','11','5','101.0','0','Biaya Kebersihan & Pengelolaan Lingkungan','0.10',NULL,'2018-08-19 01:57:49','2018-08-19 01:57:49',NULL,'1',NULL,NULL,NULL,NULL),  ('214','207','11','5','102.0','0','Biaya Listrik PJU & Utilities','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('215','208','11','5','103.0','0','Biaya Pengolahan Air Bersih','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('216','209','11','5','104.0','0','Biaya Klub Keluarga','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('217','210','11','5','105.0','0','Biaya Keamanan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('218','211','11','5','106.0','0','Biaya Operasional Kantor','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('219',NULL,'8','6','010','0','Tanah','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('220',NULL,'8','6','020','0','Bangunan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('221',NULL,'8','6','030','0','Kendaraan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('222',NULL,'8','6','100','0','Inventaris Kantor','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('223',NULL,'8','6','200','0','Inventaris Proyek','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('224',NULL,'8','6','300','0','Inventaris Rumah Contoh','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('225',NULL,'8','6','101','0','Gaji, THR dan Bonus','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('226',NULL,'8','6','102','0','Lembur','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('227',NULL,'8','6','103','0','Tunjangan Pengobatan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('228',NULL,'8','6','104','0','Tunjangan Jamsostek','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('229',NULL,'8','6','105','0','Tunjangan Lain','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('230',NULL,'8','6','106','0','Biaya Tenaga Honorer','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('231',NULL,'8','6','107','0','Biaya PPh Pasal 21','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('232',NULL,'8','6','201','0','Biaya Rekruitmen Karyawan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('233',NULL,'8','6','202','0','Biaya Pendidikan dan Latihan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('234',NULL,'8','6','203','0','Biaya Perjalanan Dinas','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('235',NULL,'8','6','204','0','Biaya SDM Lainnya','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('236',NULL,'8','6','301','0','Biaya Listrik/Air MO dan SO','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('237',NULL,'8','6','302','0','Biaya Rumah Tangga Kantor','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('238',NULL,'8','6','303','0','Biaya ATK, Cetakan, F.Copy, Film','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('239',NULL,'8','6','304','0','Biaya Kendaraan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('240',NULL,'8','6','305','0','Biaya Pemeliharaan Gedung dan Inventaris','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('241',NULL,'8','6','306','0','Biaya Kepustakaan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('242',NULL,'8','6','307','0','Biaya Telekomunikasi dan Pos','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('243',NULL,'8','6','308','0','Biaya Representasi dan Entertainment','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('244',NULL,'8','6','401','0','Biaya Administrasi Bank','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('245',NULL,'8','6','402','0','Piutang Tak Tertagih','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('246',NULL,'8','6','403','0','Biaya RUPS / RUPO / Bapepam','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('247',NULL,'8','6','404','0','Biaya Keanggotaan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('248',NULL,'8','6','405','0','Biaya Auditor, Hukum dan Notaris','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('249',NULL,'8','6','406','0','Biaya Konsultan Hukum dan Notaris','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('250',NULL,'8','6','407','0','Biaya Asuransi','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('251',NULL,'8','6','408','0','Biaya Penyusutan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('252',NULL,'8','6','409','0','Biaya Operasional Lainnya','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('253','219','8','6','010.0','0','Tanah','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('254','220','8','6','020.0','0','Bangunan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('255','221','8','6','030.0','0','Kendaraan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('256','222','8','6','100.0','0','Inventaris Kantor','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('257','223','8','6','200.0','0','Inventaris Proyek','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('258','224','8','6','300.0','0','Inventaris Rumah Contoh','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('259','225','8','6','101.0','0','Gaji, THR dan Bonus','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('260','226','8','6','102.0','0','Lembur','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('261','227','8','6','103.0','0','Tunjangan Pengobatan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('262','228','8','6','104.0','0','Tunjangan Jamsostek','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('263','229','8','6','105.0','0','Tunjangan Lain','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('264','230','8','6','106.0','0','Biaya Tenaga Honorer','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('265','231','8','6','107.0','0','Biaya PPh Pasal 21','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('266','232','8','6','201.0','0','Biaya Rekruitmen Karyawan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('267','233','8','6','202.0','0','Biaya Pendidikan dan Latihan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('268','234','8','6','203.0','0','Biaya Perjalanan Dinas','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('269','235','8','6','204.0','0','Biaya SDM Lainnya','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('270','236','8','6','301.0','0','Biaya Listrik/Air MO dan SO','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('271','237','8','6','302.0','0','Biaya Rumah Tangga Kantor','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('272','238','8','6','303.0','0','Biaya ATK, Cetakan, F.Copy, Film','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('273','239','8','6','304.0','0','Biaya Kendaraan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('274','240','8','6','305.0','0','Biaya Pemeliharaan Gedung dan Inventaris','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('275','241','8','6','306.0','0','Biaya Kepustakaan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('276','242','8','6','307.0','0','Biaya Telekomunikasi dan Pos','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('277','243','8','6','308.0','0','Biaya Representasi dan Entertainment','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('278','244','8','6','401.0','0','Biaya Administrasi Bank','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('279','245','8','6','402.0','0','Piutang Tak Tertagih','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('280','246','8','6','403.0','0','Biaya RUPS / RUPO / Bapepam','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('281','247','8','6','404.0','0','Biaya Keanggotaan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('282','248','8','6','405.0','0','Biaya Auditor, Hukum dan Notaris','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('283','249','8','6','406.0','0','Biaya Konsultan Hukum dan Notaris','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('284','250','8','6','407.0','0','Biaya Asuransi','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('285','251','8','6','408.0','0','Biaya Penyusutan','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL),  ('286','252','8','6','409.0','0','Biaya Operasional Lainnya','0.10',NULL,'2018-08-19 01:57:50','2018-08-19 01:57:50',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `items` VALUES ('1',NULL,NULL,'1',NULL,NULL,'INFOCUS / LCD','1','0','1','0',NULL,NULL,'2018-08-20 03:41:59','2018-08-20 03:41:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2',NULL,NULL,'1','4','1','AC 2 PK','1','0','1','0',NULL,NULL,'2018-08-20 06:36:18','2018-08-20 06:36:18',NULL,'1',NULL,NULL,NULL,NULL),  ('3',NULL,NULL,'3','5','2','Semen Holcim','1','0','1','0',NULL,NULL,'2018-08-20 06:38:03','2018-08-20 06:38:03',NULL,'1',NULL,NULL,NULL,NULL),  ('4',NULL,NULL,'3','5','3','Semen Tiga Roda','1','1','1','0',NULL,NULL,'2018-08-20 06:38:30','2018-08-20 06:38:30',NULL,'1',NULL,NULL,NULL,NULL),  ('5',NULL,NULL,'2','6','1','KURSI SOFA','1','1','1','0','TEST',NULL,'2018-08-20 06:39:31','2018-08-20 06:39:31',NULL,'1',NULL,NULL,NULL,NULL),  ('6',NULL,NULL,'2','7','1','MEJA MEETING','1','1','1','0',NULL,NULL,'2018-08-20 06:40:14','2018-08-20 06:40:14',NULL,'1',NULL,NULL,NULL,NULL),  ('7',NULL,NULL,'8','10','1','PULPEN SNOWMAN MERAH','1','0','1','1',NULL,NULL,'2018-08-20 06:46:26','2018-08-20 06:46:26',NULL,'1',NULL,NULL,NULL,NULL),  ('8',NULL,NULL,'8','10','4','PULPEN PILOT HITAM','1','0','1','1',NULL,NULL,'2018-08-20 06:46:54','2018-08-20 06:46:54',NULL,'1',NULL,NULL,NULL,NULL),  ('9',NULL,NULL,'9',NULL,'1','KERTAS HVS','1','1','1','1',NULL,NULL,'2018-08-20 06:47:11','2018-08-20 06:47:11',NULL,'1',NULL,NULL,NULL,NULL),  ('10',NULL,NULL,'9',NULL,'4','KERTAS A4','1','1','1','1',NULL,NULL,'2018-08-20 06:47:26','2018-08-20 06:47:26',NULL,'1',NULL,NULL,NULL,NULL),  ('11',NULL,NULL,'1',NULL,'1','KULKAS','1','1','1','0',NULL,NULL,'2018-08-27 06:50:56','2018-08-27 06:50:56',NULL,'1',NULL,NULL,NULL,NULL),  ('12',NULL,NULL,'1','11','1','LAPTOP','1','0','1','0','LAPTPO',NULL,'2018-09-04 07:10:45','2018-09-04 07:10:45',NULL,'1',NULL,NULL,NULL,NULL),  ('13',NULL,'1','1','11','1','KOMPUTER PERSONAL LAYAR 22 INCH','1','1','1','0','TEST',NULL,'2018-09-24 09:42:15','2018-09-24 09:42:15',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `locations` VALUES ('1','1','dummy location','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `mappingperusahaans` VALUES ('1','38','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','38','2','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('3','38','3','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('4','38','4','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('5','38','5','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('6','38','6','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('7','38','7','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('8','38','8','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('9','38','9','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('10','38','10','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('11','38','11','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('12','38','12','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('13','39','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('14','39','2','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('15','39','3','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('16','39','4','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('17','39','5','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('18','39','6','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('19','39','7','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('20','39','8','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('21','39','9','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('22','39','10','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('23','39','11','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('24','39','12','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('25','154','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('26','154','2','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('27','154','3','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('28','154','4','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('29','154','5','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('30','154','6','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('31','154','7','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('32','154','8','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('33','154','9','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('34','154','10','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('35','154','11','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('36','154','12','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('37','46','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('38','46','2','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('39','46','3','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('40','46','4','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('41','46','5','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('42','46','6','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('43','46','7','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('44','46','8','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('45','46','9','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('46','46','10','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('47','46','11','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('48','46','12','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('49','47','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('50','47','2','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('51','47','3','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('52','47','4','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('53','47','5','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('54','47','6','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('55','47','7','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('56','47','8','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('57','47','9','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('58','47','10','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('59','47','11','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('60','47','12','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('61','48','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('62','48','2','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('63','48','3','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('64','48','4','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('65','48','5','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('66','48','6','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('67','48','7','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('68','48','8','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('69','48','9','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('70','48','10','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('71','48','11','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('72','48','12','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('73','49','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('74','49','2','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('75','49','3','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('76','49','4','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('77','49','5','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('78','49','6','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('79','49','7','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('80','49','8','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('81','49','9','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('82','49','10','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('83','49','11','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('84','49','12','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('85','50','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('86','50','2','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('87','50','3','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('88','50','4','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('89','50','5','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('90','50','6','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('91','50','7','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('92','50','8','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('93','50','9','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('94','50','10','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('95','50','11','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('96','50','12','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('97','51','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('98','51','2','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('99','51','3','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('100','51','4','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('101','51','5','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('102','51','6','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('103','51','7','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('104','51','8','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('105','51','9','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('106','51','10','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('107','51','11','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('108','51','12','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('109','52','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('110','52','2','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('111','52','3','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('112','52','4','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('113','52','5','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('114','52','6','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('115','52','7','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('116','52','8','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('117','52','9','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('118','52','10','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('119','52','11','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('120','52','12','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('121','53','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('122','53','2','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('123','53','3','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('124','53','4','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('125','53','5','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('126','53','6','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('127','53','7','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('128','53','8','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('129','53','9','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('130','53','10','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('131','53','11','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('132','53','12','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('133','54','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('134','54','2','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('135','54','3','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('136','54','4','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('137','54','5','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('138','54','6','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('139','54','7','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('140','54','8','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('141','54','9','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('142','54','10','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('143','54','11','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('144','54','12','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('145','55','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('146','55','2','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('147','55','3','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('148','55','4','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('149','55','5','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('150','55','6','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('151','55','7','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('152','55','8','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('153','55','9','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('154','55','10','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('155','55','11','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('156','55','12','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('157','56','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('158','56','2','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('159','56','3','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('160','56','4','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('161','56','5','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('162','56','6','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('163','56','7','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('164','56','8','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('165','56','9','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('166','56','10','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('167','56','11','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('168','56','12','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('169','57','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('170','57','2','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('171','57','3','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('172','57','4','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('173','57','5','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('174','57','6','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('175','57','7','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('176','57','8','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('177','57','9','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('178','57','10','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('179','57','11','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('180','57','12','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('181','58','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('182','58','2','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('183','58','3','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('184','58','4','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('185','58','5','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('186','58','6','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('187','58','7','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('188','58','8','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('189','58','9','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('190','58','10','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('191','58','11','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('192','58','12','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('193','59','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('194','59','2','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('195','59','3','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('196','59','4','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('197','59','5','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('198','59','6','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('199','59','7','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('200','59','8','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('201','59','9','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('202','59','10','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('203','59','11','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('204','59','12','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('205','60','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('206','60','2','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('207','60','3','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('208','60','4','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('209','60','5','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('210','60','6','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('211','60','7','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('212','60','8','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('213','60','9','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('214','60','10','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('215','60','11','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('216','60','12','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('217','61','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('218','61','2','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('219','61','3','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('220','61','4','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('221','61','5','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('222','61','6','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('223','61','7','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('224','61','8','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('225','61','9','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('226','61','10','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('227','61','11','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('228','61','12','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('229','62','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('230','62','2','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('231','62','3','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('232','62','4','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('233','62','5','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('234','62','6','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('235','62','7','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('236','62','8','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('237','62','9','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('238','62','10','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('239','62','11','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('240','62','12','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('241','63','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('242','63','2','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('243','63','3','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('244','63','4','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('245','63','5','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('246','63','6','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('247','63','7','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('248','63','8','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('249','63','9','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('250','63','10','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('251','63','11','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('252','63','12','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('253','80','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('254','80','2','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('255','80','3','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('256','80','4','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('257','80','5','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('258','80','6','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('259','80','7','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('260','80','8','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('261','80','9','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('262','80','10','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('263','80','11','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('264','80','12','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('265','89','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('266','89','2','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('267','89','3','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('268','89','4','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('269','89','5','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('270','89','6','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('271','89','7','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('272','89','8','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('273','89','9','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('274','89','10','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('275','89','11','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('276','89','12','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('277','147','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('278','147','2','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('279','147','3','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('280','147','4','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('281','147','5','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('282','147','6','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('283','147','7','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('284','147','8','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('285','147','9','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('286','147','10','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('287','147','11','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('288','147','12','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('289','148','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('290','148','2','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('291','148','3','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('292','148','4','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('293','148','5','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('294','148','6','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('295','148','7','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('296','148','8','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('297','148','9','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('298','148','10','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('299','148','11','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('300','148','12','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('301','149','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('302','149','2','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('303','149','3','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('304','149','4','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('305','149','5','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('306','149','6','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('307','149','7','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('308','149','8','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('309','149','9','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('310','149','10','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('311','149','11','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('312','149','12','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('313','150','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('314','150','2','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('315','150','3','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('316','150','4','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('317','150','5','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('318','150','6','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('319','150','7','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('320','150','8','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('321','150','9','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('322','150','10','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('323','150','11','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('324','150','12','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('325','151','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('326','151','2','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('327','151','3','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('328','151','4','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('329','151','5','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('330','151','6','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('331','151','7','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('332','151','8','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('333','151','9','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('334','151','10','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('335','151','11','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('336','151','12','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('337','152','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('338','152','2','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('339','152','3','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('340','152','4','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('341','152','5','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('342','152','6','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('343','152','7','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('344','152','8','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('345','152','9','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('346','152','10','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('347','152','11','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('348','152','12','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('349','180','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('350','180','2','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('351','180','3','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('352','180','4','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('353','180','5','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('354','180','6','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('355','180','7','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('356','180','8','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('357','180','9','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('358','180','10','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('359','180','11','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('360','180','12','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('361','181','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('362','181','2','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('363','181','3','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('364','181','4','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('365','181','5','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('366','181','6','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('367','181','7','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('368','181','8','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('369','181','9','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('370','181','10','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('371','181','11','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('372','181','12','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('373','131','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('374','131','2','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('375','131','3','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('376','131','4','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('377','131','5','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('378','131','6','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('379','131','7','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('380','131','8','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('381','131','9','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('382','131','10','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('383','131','11','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('384','131','12','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('385','96','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('386','96','2','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('387','96','3','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('388','96','4','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('389','96','5','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('390','96','6','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('391','96','7','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('392','96','8','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('393','96','9','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('394','96','10','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('395','96','11','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('396','96','12','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('397','202','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('398','202','2','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('399','202','3','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('400','202','4','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('401','202','5','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('402','202','6','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('403','202','7','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('404','202','8','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('405','202','9','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('406','202','10','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('407','202','11','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('408','202','12','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('409','208','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('410','208','2','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('411','208','3','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('412','208','4','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('413','208','5','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('414','208','6','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('415','208','7','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('416','208','8','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('417','208','9','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('418','208','10','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('419','208','11','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('420','208','12','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('421','200','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('422','200','2','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('423','200','3','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('424','200','4','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('425','200','5','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('426','200','6','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('427','200','7','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('428','200','8','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('429','200','9','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('430','200','10','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('431','200','11','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('432','200','12','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('433','205','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('434','205','2','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('435','205','3','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('436','205','4','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('437','205','5','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('438','205','6','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('439','205','7','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('440','205','8','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('441','205','9','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('442','205','10','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('443','205','11','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('444','205','12','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('445','206','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('446','206','2','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('447','206','3','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('448','206','4','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('449','206','5','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('450','206','6','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('451','206','7','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('452','206','8','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('453','206','9','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('454','206','10','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('455','206','11','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('456','206','12','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('457','232','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('458','232','2','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('459','232','3','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('460','232','4','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('461','232','5','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('462','232','6','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('463','232','7','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('464','232','8','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('465','232','9','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('466','232','10','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('467','232','11','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('468','232','12','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('469','196','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('470','196','2','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('471','196','3','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('472','196','4','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('473','196','5','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('474','196','6','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('475','196','7','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('476','196','8','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('477','196','9','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('478','196','10','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('479','196','11','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('480','196','12','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('481','233','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('482','233','2','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('483','233','3','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('484','233','4','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('485','233','5','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('486','233','6','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('487','233','7','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('488','233','8','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('489','233','9','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('490','233','10','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('491','233','11','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('492','233','12','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('493','201','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('494','201','2','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('495','201','3','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('496','201','4','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('497','201','5','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('498','201','6','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('499','201','7','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('500','201','8','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('501','201','9','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('502','201','10','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('503','201','11','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('504','201','12','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('505','229','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('506','229','2','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('507','229','3','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('508','229','4','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('509','229','5','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('510','229','6','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('511','229','7','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('512','229','8','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('513','229','9','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('514','229','10','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('515','229','11','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('516','229','12','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('517','234','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('518','234','2','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('519','234','3','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('520','234','4','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('521','234','5','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('522','234','6','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('523','234','7','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('524','234','8','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('525','234','9','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('526','234','10','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('527','234','11','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('528','234','12','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('529','203','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('530','203','2','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('531','203','3','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('532','203','4','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('533','203','5','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('534','203','6','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('535','203','7','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('536','203','8','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('537','203','9','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('538','203','10','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('539','203','11','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('540','203','12','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('541','97','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('542','97','2','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('543','97','3','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('544','97','4','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('545','97','5','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('546','97','6','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('547','97','7','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('548','97','8','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('549','97','9','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('550','97','10','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('551','97','11','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('552','97','12','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('553','199','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('554','199','2','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('555','199','3','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('556','199','4','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('557','199','5','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('558','199','6','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('559','199','7','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('560','199','8','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('561','199','9','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('562','199','10','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('563','199','11','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('564','199','12','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('565','207','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('566','207','2','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('567','207','3','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('568','207','4','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('569','207','5','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('570','207','6','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('571','207','7','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('572','207','8','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('573','207','9','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('574','207','10','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('575','207','11','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('576','207','12','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('577','198','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('578','198','2','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('579','198','3','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('580','198','4','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('581','198','5','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('582','198','6','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('583','198','7','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('584','198','8','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('585','198','9','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('586','198','10','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('587','198','11','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('588','198','12','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('589','87','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('590','87','2','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('591','87','3','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('592','87','4','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('593','87','5','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('594','87','6','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('595','87','7','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('596','87','8','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('597','87','9','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('598','87','10','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('599','87','11','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('600','87','12','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('601','128','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('602','128','2','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('603','128','3','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('604','128','4','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('605','128','5','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('606','128','6','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('607','128','7','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('608','128','8','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('609','128','9','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('610','128','10','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('611','128','11','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('612','128','12','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('613','91','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('614','91','2','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('615','91','3','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('616','91','4','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('617','91','5','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('618','91','6','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('619','91','7','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('620','91','8','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('621','91','9','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('622','91','10','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('623','91','11','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('624','91','12','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('625','92','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('626','92','2','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('627','92','3','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `mappingperusahaans` VALUES ('628','92','4','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('629','92','5','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('630','92','6','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('631','92','7','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('632','92','8','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('633','92','9','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('634','92','10','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('635','92','11','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('636','92','12','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('637','93','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('638','93','2','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('639','93','3','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('640','93','4','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('641','93','5','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('642','93','6','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('643','93','7','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('644','93','8','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('645','93','9','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('646','93','10','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('647','93','11','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('648','93','12','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('649','94','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('650','94','2','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('651','94','3','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('652','94','4','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('653','94','5','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('654','94','6','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('655','94','7','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('656','94','8','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('657','94','9','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('658','94','10','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('659','94','11','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('660','94','12','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('661','95','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('662','95','2','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('663','95','3','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('664','95','4','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('665','95','5','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('666','95','6','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('667','95','7','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('668','95','8','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('669','95','9','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('670','95','10','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('671','95','11','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('672','95','12','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('673','226','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('674','226','2','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('675','226','3','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('676','226','4','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('677','226','5','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('678','226','6','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('679','226','7','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('680','226','8','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('681','226','9','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('682','226','10','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('683','226','11','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('684','226','12','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('685','163','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('686','163','2','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('687','163','3','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('688','163','4','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('689','163','5','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('690','163','6','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('691','163','7','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('692','163','8','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('693','163','9','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('694','163','10','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('695','163','11','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('696','163','12','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('697','204','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('698','204','2','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('699','204','3','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('700','204','4','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('701','204','5','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('702','204','6','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('703','204','7','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('704','204','8','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('705','204','9','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('706','204','10','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('707','204','11','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('708','204','12','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('709','175','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('710','175','2','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('711','175','3','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('712','175','4','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('713','175','5','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('714','175','6','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('715','175','7','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('716','175','8','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('717','175','9','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('718','175','10','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('719','175','11','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('720','175','12','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('721','167','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('722','167','2','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('723','167','3','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('724','167','4','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('725','167','5','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('726','167','6','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('727','167','7','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('728','167','8','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('729','167','9','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('730','167','10','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('731','167','11','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('732','167','12','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('733','168','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('734','168','2','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('735','168','3','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('736','168','4','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('737','168','5','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('738','168','6','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('739','168','7','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('740','168','8','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('741','168','9','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('742','168','10','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('743','168','11','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('744','168','12','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('745','169','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('746','169','2','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('747','169','3','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('748','169','4','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('749','169','5','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('750','169','6','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('751','169','7','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('752','169','8','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('753','169','9','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('754','169','10','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('755','169','11','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('756','169','12','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('757','170','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('758','170','2','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('759','170','3','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('760','170','4','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('761','170','5','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('762','170','6','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('763','170','7','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('764','170','8','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('765','170','9','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('766','170','10','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('767','170','11','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('768','170','12','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('769','171','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('770','171','2','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('771','171','3','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('772','171','4','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('773','171','5','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('774','171','6','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('775','171','7','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('776','171','8','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('777','171','9','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('778','171','10','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('779','171','11','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('780','171','12','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('781','189','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('782','189','2','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('783','189','3','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('784','189','4','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('785','189','5','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('786','189','6','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('787','189','7','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('788','189','8','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('789','189','9','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('790','189','10','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('791','189','11','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('792','189','12','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('793','176','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('794','176','2','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('795','176','3','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('796','176','4','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('797','176','5','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('798','176','6','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('799','176','7','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('800','176','8','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('801','176','9','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('802','176','10','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('803','176','11','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('804','176','12','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('805','162','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('806','162','2','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('807','162','3','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('808','162','4','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('809','162','5','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('810','162','6','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('811','162','7','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('812','162','8','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('813','162','9','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('814','162','10','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('815','162','11','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('816','162','12','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('817','225','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('818','225','2','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('819','225','3','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('820','225','4','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('821','225','5','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('822','225','6','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('823','225','7','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('824','225','8','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('825','225','9','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('826','225','10','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('827','225','11','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('828','225','12','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('829','153','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('830','153','2','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('831','153','3','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('832','153','4','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('833','153','5','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('834','153','6','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('835','153','7','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('836','153','8','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('837','153','9','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('838','153','10','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('839','153','11','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('840','153','12','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('841','227','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('842','227','2','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('843','227','3','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('844','227','4','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('845','227','5','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('846','227','6','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('847','227','7','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('848','227','8','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('849','227','9','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('850','227','10','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('851','227','11','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('852','227','12','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `members` VALUES ('1','PEMPROVSU','PEMERINTAH PROVINSI SUMATERA UTARA','2018-08-28 08:54:43','2018-08-28 08:54:43',NULL,'1',NULL,NULL,NULL,NULL),  ('2','PEMPROV DKI','PEMERINTAH PROVINSI DKI JAKARTA','2018-08-28 08:56:42','2018-08-28 08:56:42',NULL,'1',NULL,NULL,NULL,NULL),  ('3','PEMKOT CENGKARENG','PEMERINTAH KOTA CENGKARENG','2018-08-28 08:57:06','2018-08-28 08:57:06',NULL,'1',NULL,NULL,NULL,NULL),  ('4','PEMKOT DKI','PEMERINTAH KOTA DKI JAKARTA','2018-08-28 08:57:22','2018-08-28 08:57:22',NULL,'1',NULL,NULL,NULL,NULL),  ('5','aaa','aaa','2018-09-24 15:35:14','2018-09-24 15:35:14',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `menus` VALUES ('1','masterdata',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','planning',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('3','budgeting',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('4','pembelian',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('5','inventory',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('6','pekerjaan',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('7','setting',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('8','progress lapangan',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('9','workorder',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('10','item pekerjaan',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('11','approval',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `migrations` VALUES ('2883','2014_10_12_000000_create_users_table','1'),  ('2884','2014_10_12_100000_create_password_resets_table','1'),  ('2885','2017_09_22_104421_create_user_details_table','1'),  ('2886','2017_09_22_104459_create_user_jabatans_table','1'),  ('2887','2017_09_22_104602_create_project_pt_users_table','1'),  ('2888','2017_09_22_104636_create_user_groups_table','1'),  ('2889','2017_09_22_104728_create_user_group_details_table','1'),  ('2890','2017_09_22_104809_create_group_privileges_table','1'),  ('2891','2017_09_22_105858_create_menus_table','1'),  ('2892','2017_09_22_111207_create_coas_table','1'),  ('2893','2017_09_22_112045_create_itempekerjaans_table','1'),  ('2894','2017_09_22_112525_create_itempekerjaan_coas_table','1'),  ('2895','2017_09_22_112623_create_itempekerjaan_details_table','1'),  ('2896','2017_09_23_164716_create_group_items_table','1'),  ('2897','2017_09_23_164759_create_group_tahapans_table','1'),  ('2898','2017_09_23_165008_create_templatepekerjaans_table','1'),  ('2899','2017_09_23_165255_create_templatepekerjaan_details_table','1'),  ('2900','2017_09_23_165331_create_banks_table','1'),  ('2901','2017_09_23_170310_create_countries_table','1'),  ('2902','2017_09_23_170338_create_provinces_table','1'),  ('2903','2017_09_23_170405_create_cities_table','1'),  ('2904','2017_09_23_170432_create_rekanans_table','1'),  ('2905','2017_09_23_170459_create_rekanan_kelas_table','1'),  ('2906','2017_09_23_170525_create_rekanan_rekenings_table','1'),  ('2907','2017_09_23_170556_create_supp_templates_table','1'),  ('2908','2017_09_23_170625_create_supp_revisions_table','1'),  ('2909','2017_09_23_170739_create_rekanan_supps_table','1'),  ('2910','2017_09_23_170804_create_rekanan_supp_vos_table','1'),  ('2911','2017_09_23_170832_create_rekanan_types_table','1'),  ('2912','2017_09_23_170856_create_rekanan_type_details_table','1'),  ('2913','2017_09_23_170926_create_pts_table','1'),  ('2914','2017_09_23_170952_create_departments_table','1'),  ('2915','2017_09_23_171018_create_divisions_table','1'),  ('2916','2017_09_23_171045_create_mappingperusahaans_table','1'),  ('2917','2017_09_23_171115_create_projects_table','1'),  ('2918','2017_09_23_171141_create_project_types_table','1'),  ('2919','2017_09_23_171206_create_project_type_groups_table','1'),  ('2920','2017_09_23_171236_create_project_contactpeople_table','1'),  ('2921','2017_09_23_172107_create_project_kawasans_table','1'),  ('2922','2017_09_23_172150_create_bloks_table','1'),  ('2923','2017_09_23_172219_create_peruntukans_table','1'),  ('2924','2017_09_23_172247_create_unit_arahs_table','1'),  ('2925','2017_09_23_172352_create_unit_types_table','1'),  ('2926','2017_09_23_172416_create_units_table','1'),  ('2927','2017_09_23_172442_create_unit_progresses_table','1'),  ('2928','2017_09_23_172536_create_templatepekerjaan_lapangans_table','1'),  ('2929','2017_09_23_172616_create_unit_progress_details_table','1'),  ('2930','2017_09_23_172645_create_unit_progress_detail_pictures_table','1'),  ('2931','2017_09_23_172718_create_unit_subs_table','1'),  ('2932','2017_09_23_172823_create_budgets_table','1'),  ('2933','2017_09_23_172848_create_budget_details_table','1'),  ('2934','2017_09_23_172916_create_budget_tahunans_table','1'),  ('2935','2017_09_23_173001_create_budget_tahunan_details_table','1'),  ('2936','2017_09_23_173030_create_workorders_table','1'),  ('2937','2017_09_23_173102_create_workorder_details_table','1'),  ('2938','2017_09_23_173142_create_department_supports_table','1'),  ('2939','2017_09_23_173212_create_department_support_details_table','1'),  ('2940','2017_09_23_173241_create_rabs_table','1'),  ('2941','2017_09_23_173309_create_rab_units_table','1'),  ('2942','2017_09_23_173337_create_rab_pekerjaans_table','1'),  ('2943','2017_09_23_173419_create_tenders_table','1'),  ('2944','2017_09_23_173445_create_tender_units_table','1'),  ('2945','2017_09_23_173511_create_tender_rekanans_table','1'),  ('2946','2017_09_23_173540_create_tender_penawarans_table','1'),  ('2947','2017_09_23_173606_create_tender_penawaran_details_table','1'),  ('2948','2017_09_23_173646_create_tender_korespondensis_table','1'),  ('2949','2017_09_23_173713_create_tender_menangs_table','1'),  ('2950','2017_09_23_173739_create_tender_menang_details_table','1'),  ('2951','2017_09_23_173819_create_rekanan_penilaians_table','1'),  ('2952','2017_09_23_173902_create_rekanan_penilaian_details_table','1'),  ('2953','2017_09_23_173934_create_spk_types_table','1'),  ('2954','2017_09_23_174012_create_spks_table','1'),  ('2955','2017_09_23_174241_create_spk_po_pics_table','1'),  ('2956','2017_09_23_174324_create_spk_details_table','1'),  ('2957','2017_09_23_174358_create_spkvo_units_table','1'),  ('2958','2017_09_23_174730_create_spk_retensis_table','1'),  ('2959','2017_09_23_174855_create_suratinstruksis_table','1'),  ('2960','2017_09_23_174922_create_vos_table','1'),  ('2961','2017_09_23_174952_create_baps_table','1'),  ('2962','2017_09_23_175017_create_bap_details_table','1'),  ('2963','2017_09_23_175115_create_bap_detail_itempekerjaans_table','1'),  ('2964','2017_09_23_175145_create_bap_pphs_table','1'),  ('2965','2017_09_23_175229_create_bap_goodreceive_potongans_table','1'),  ('2966','2017_09_23_175257_create_piutangs_table','1'),  ('2967','2017_09_23_175543_create_piutang_pembayarans_table','1'),  ('2968','2017_09_23_175624_create_piutang_project_rekanans_table','1'),  ('2969','2017_09_23_175723_create_vouchers_table','1'),  ('2970','2017_09_23_175757_create_voucher_details_table','1'),  ('2971','2017_09_23_175829_create_approvals_table','1'),  ('2972','2017_09_23_175941_create_approval_histories_table','1'),  ('2973','2017_09_23_180023_create_sys_logs_table','1'),  ('2974','2017_09_23_180052_create_approval_actions_table','1'),  ('2975','2017_09_23_180122_create_document_types_table','1'),  ('2976','2017_09_23_180154_create_approval_references_table','1'),  ('2977','2017_09_23_180224_create_globalsettings_table','1'),  ('2978','2017_10_22_065959_create_item_categories_table','1'),  ('2979','2017_10_22_070133_create_items_table','1'),  ('2980','2017_10_22_070217_create_item_category_user_table','1'),  ('2981','2017_10_22_070308_create_item_satuans_table','1'),  ('2982','2017_10_22_070414_create_item_prices_table','1'),  ('2983','2017_10_22_070444_create_mou_items_table','1'),  ('2984','2017_10_22_070527_create_warehouses_table','1'),  ('2985','2017_10_22_070557_create_locations_table','1'),  ('2986','2017_10_22_070652_create_purchaserequests_table','1'),  ('2987','2017_10_22_070721_create_purchaserequest_cancellations_table','1'),  ('2988','2017_10_22_070750_create_brands_table','1'),  ('2989','2017_10_22_070818_create_purchaserequest_details_table','1'),  ('2990','2017_10_22_070852_create_purchaserequest_cancellation_details_table','1'),  ('2991','2017_10_22_070928_create_purchaserequest_detail_penawarans_table','1'),  ('2992','2017_10_22_071007_create_purchaseorders_table','1'),  ('2993','2017_10_22_071047_create_purchaseorder_cancellations_table','1'),  ('2994','2017_10_22_071115_create_purchaseorder_cancellation_details_table','1'),  ('2995','2017_10_22_071144_create_purchaseorder_dps_table','1'),  ('2996','2017_10_22_071213_create_purchaseorder_details_table','1'),  ('2997','2017_10_22_071252_create_barangmasuks_table','1'),  ('2998','2017_10_22_071318_create_barangmasuk_details_table','1'),  ('2999','2017_10_22_071350_create_goodreceives_table','1'),  ('3000','2017_10_22_071418_create_goodreceive_details_table','1'),  ('3001','2017_10_22_071458_create_pengajuanbiayas_table','1'),  ('3002','2017_10_22_071527_create_pengajuanbiaya_details_table','1'),  ('3003','2017_10_22_071610_create_inventories_table','1'),  ('3004','2017_10_22_071701_create_user_warehouse_table','1'),  ('3005','2017_10_22_071812_create_inventory_transfers_table','1'),  ('3006','2017_10_22_071851_create_inventory_transfer_details_table','1'),  ('3007','2017_10_22_071952_create_permintaanbarangs_table','1'),  ('3008','2017_10_22_072044_create_permintaanbarang_details_table','1'),  ('3009','2017_10_22_072131_create_barangkeluars_table','1'),  ('3010','2017_10_22_072201_create_barangkeluar_details_table','1'),  ('3011','2017_10_22_072344_create_barangkeluar_detail_prices_table','1'),  ('3012','2017_10_22_072416_create_assets_table','1'),  ('3013','2017_10_23_010351_create_asset_details_table','1'),  ('3014','2017_10_23_010442_create_asset_detail_items_table','1'),  ('3015','2017_10_23_010601_create_asset_transactions_table','1'),  ('3016','2017_10_23_010632_create_asset_transaction_details_table','1'),  ('3017','2017_10_23_010711_create_asset_transaction_detail_images_table','1'),  ('3018','2017_10_23_010743_create_inventory_corrections_table','1'),  ('3019','2017_10_23_010814_create_inventory_correction_details_table','1'),  ('3020','2017_10_23_010856_create_barangreturs_table','1'),  ('3021','2017_10_23_010940_create_barangretur_details_table','1'),  ('3022','2017_10_23_011011_create_forums_table','1'),  ('3023','2017_10_23_011042_create_forum_images_table','1'),  ('3024','2017_10_23_011111_create_forum_comments_table','1'),  ('3025','2017_10_23_011139_create_chats_table','1'),  ('3026','2018_01_04_102643_create_pt_rekenings_table','1'),  ('3027','2018_01_04_104254_create_templatepekerjaan_detail_subs_table','1'),  ('3028','2018_02_12_071643_create_asset_progress','1'),  ('3029','2018_03_19_060813_create_rekanan_groups_table','1'),  ('3030','2018_04_12_100409_create_spk_pengembalians_table','1'),  ('3031','2018_04_26_072244_create_inventarisirs_table','1'),  ('3032','2018_04_26_072936_create_inventarisir_details_table','1'),  ('3033','2018_05_03_085131_create_asset_transaction_images_table','1'),  ('3034','2018_05_04_033618_create_barang_masuk_hibahs_table','1'),  ('3035','2018_05_04_035432_create_barang_masuk_hibah_details_table','1'),  ('3036','2018_05_08_072506_create_workorder_budget_details_table','1'),  ('3037','2018_05_22_091230_create_pengembalianbarangs_table','1'),  ('3038','2018_06_29_031053_create_period_op_names_table','1'),  ('3039','2018_06_29_031121_create_op_name_assets_table','1'),  ('3040','2018_07_15_103815_create_mutasi_outs_table','1'),  ('3041','2018_07_16_071217_create_rotasis_table','1'),  ('3042','2018_07_18_064910_create_rooms_table','1'),  ('3043','2018_07_18_065132_create_members_table','1'),  ('3044','2018_07_24_040626_create_mutasi_ins_table','1'),  ('3045','2018_08_01_101213_create_keterangans_table','1'),  ('3046','2018_08_06_080819_create_barangmasuk_hibah_detail_pengisians_table','1'),  ('3047','2018_08_13_103256_create_pengembalianbarang_details_table','1'),  ('3048','2018_08_15_074638_create_history_approval_permintaanbarangs_table','1'),  ('3049','2018_08_20_075819_create_status_permintaans_table','2'),  ('3050','2018_08_23_071222_create_mutasi_in_details_table','3');
INSERT INTO `mutasi_ins` VALUES ('1',NULL,'5','2','3',NULL,NULL,'1','Admin','2','Administrator','1','Admin','1','0','0','0','9','CITRAGRAN -  CIBUBUR','1','0','0',NULL,NULL,NULL,NULL,'2018-09-03 04:00:21','2018-09-04 04:31:18',NULL,'1','1',NULL,NULL,NULL),  ('2',NULL,'5','3','6',NULL,NULL,'1','Admin','2','Administrator','1','Admin','1','0','0','0','9','CITRAGRAN -  CIBUBUR','1','0','0',NULL,NULL,NULL,NULL,'2018-09-03 04:01:03','2018-10-04 04:02:26',NULL,'1','1',NULL,NULL,NULL),  ('3',NULL,'1','12','19',NULL,NULL,'10','basri','3','Direktur','10','basri','1','0','0','0','9','CITRAGRAN -  CIBUBUR','1','0','0',NULL,NULL,NULL,NULL,'2018-09-04 10:27:31','2018-09-04 10:30:50',NULL,'1','1',NULL,NULL,NULL),  ('4',NULL,'1','12','19',NULL,NULL,'10','basri','4','Manager','10','basri','1','0','0','0','9','CITRAGRAN -  CIBUBUR','1','0','0',NULL,NULL,NULL,NULL,'2018-09-04 10:29:40','2018-09-04 10:30:53',NULL,'1','1',NULL,NULL,NULL),  ('5',NULL,'1','12','19',NULL,NULL,'3','Direktur','1','Admin','3','Direktur','1','0','0','0','9','CITRAGRAN -  CIBUBUR','1','0','0',NULL,NULL,NULL,NULL,'2018-09-05 08:07:56','2018-09-05 08:08:16',NULL,'1','1',NULL,NULL,NULL),  ('6',NULL,'2','6','1',NULL,NULL,'0','Syarifuddin','4','adminGUDANG','2','PEMPROV DKI','0','0','0','1','9','CITRAGRAN -  CIBUBUR','1','0','0',NULL,NULL,NULL,NULL,'2018-09-07 04:01:40','2018-09-07 04:02:50',NULL,'1','1',NULL,NULL,NULL);
INSERT INTO `mutasi_outs` VALUES ('15',NULL,NULL,'2','Administrator','1','Admin','9','2','3','100','8227844255b8771326a0fe','2',NULL,NULL,NULL,NULL,'1','1','0',NULL,'2018-08-30 06:24:18','2018-08-30 06:24:51',NULL,'1','1',NULL,NULL,NULL),  ('16',NULL,NULL,'2','Administrator','1','Admin','9','2','3','102','12996641325b8795f65b5b9','1',NULL,NULL,NULL,NULL,'1','1','0',NULL,'2018-08-30 07:30:08','2018-08-30 07:30:29',NULL,'1','1',NULL,NULL,NULL),  ('17',NULL,NULL,'2','Administrator','1','Admin','9','2','3','112','12419067025b88fee404024','1',NULL,NULL,NULL,NULL,'1','1','0',NULL,'2018-09-01 03:57:58','2018-09-04 04:18:07',NULL,'1','1',NULL,NULL,NULL),  ('18',NULL,NULL,'1','Admin','4','Manager','9','12','19','123','488129045b8e34fc679c1','1',NULL,NULL,NULL,NULL,'1','1','0',NULL,'2018-09-04 08:08:23','2018-09-04 08:08:44',NULL,'1','1',NULL,NULL,NULL);
INSERT INTO `period_op_names` VALUES ('1','2018-09-26','2018-09-26','2','opname','2018-09-26 10:02:24','2018-09-26 10:02:24',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2018-10-18','2018-10-31','3','test','2018-10-03 09:12:16','2018-10-03 09:12:16',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `permintaanbarang_details` VALUES ('12','12','2','3','1','2','2018-08-31','AC 2 PK','2018-08-31 04:39:19','2018-08-31 04:39:19',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13','12','19','1','2','2018-09-04','LAPTOP','2018-09-04 07:20:34','2018-09-04 07:20:34',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14','12','19','1','1','2018-09-04','LAPTOP','2018-09-04 08:12:33','2018-09-04 08:12:33',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15','12','19','1','1','2018-09-05','LAPTOP','2018-09-05 07:33:45','2018-09-05 07:33:45',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16','2','3','3','3','2018-09-06','AC 2 PK','2018-09-06 06:12:10','2018-09-06 06:12:10',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17','1','4','1','2','2018-09-06','INFOCUS / LCD','2018-09-06 08:00:39','2018-09-06 08:00:39',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18','7','13','1','3','2018-09-07','PULPEN SNOWMAN MERAH','2018-09-07 09:45:50','2018-09-07 09:45:50',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19','7','13','1','4','2018-09-19','PULPEN SNOWMAN MERAH','2018-09-19 02:23:29','2018-09-19 02:23:29',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20','7','13','2','2','2018-09-26','PULPEN SNOWMAN MERAH','2018-09-24 23:57:09','2018-09-24 23:57:09',NULL,'1',NULL,NULL,NULL,NULL),  ('21','20','11','17','2','3','2018-11-09','KULKAS','2018-09-24 23:57:09','2018-09-24 23:57:09',NULL,'1',NULL,NULL,NULL,NULL),  ('22','21','7','13','1','4','2018-09-25','PULPEN SNOWMAN MERAH','2018-09-25 08:58:19','2018-09-25 08:58:19',NULL,'1',NULL,NULL,NULL,NULL),  ('23','21','8','15','1','4','2018-09-25','PULPEN PILOT HITAM','2018-09-25 08:58:19','2018-09-25 08:58:19',NULL,'1',NULL,NULL,NULL,NULL),  ('24','22','7','13','2','2','2018-09-27','PULPEN SNOWMAN MERAH','2018-09-27 07:49:39','2018-09-27 07:49:39',NULL,'1',NULL,NULL,NULL,NULL),  ('25','23','7','13','2','5','2018-10-01','PULPEN SNOWMAN MERAH SEkali','2018-10-01 10:10:45','2018-10-01 10:30:06',NULL,'1','1',NULL,NULL,NULL),  ('26','23','1','4','2','2','2018-10-01','INFOCUS / LCD','2018-10-01 10:10:45','2018-10-01 10:10:45',NULL,'1',NULL,NULL,NULL,NULL),  ('27','24','2','3','2','5','2018-10-24','AC 2 PK bagus','2018-10-04 04:40:15','2018-10-04 04:55:41','2018-10-04 04:55:41','1','1','1',NULL,NULL),  ('28','24','2','3','2','1','2018-10-04','AC 2 PK','2018-10-04 04:57:06','2018-10-04 04:57:06',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `permintaanbarangs` VALUES ('12','9','38','1',NULL,'1','0001/PB/EST/VIII/2018/CG/CI','1','1','1','2018-08-31','mengeluar ac','2018-08-31 04:29:53','2018-08-31 06:47:29',NULL,'1','1',NULL,NULL,NULL),  ('13','9','38','3',NULL,'1','0001/PB/C&D/IX/2018/CG/CI','1','1','1','2018-09-04','minta laptop 2','2018-09-04 07:18:20','2018-09-04 07:21:43',NULL,'1','1',NULL,NULL,NULL),  ('14','9','38','2',NULL,'1','0001/PB/KEU/IX/2018/CG/CI','1','1','1','2018-09-04','keuangan minta laptop','2018-09-04 08:11:09','2018-09-04 08:13:08',NULL,'1','1',NULL,NULL,NULL),  ('15','9','154','1',NULL,'1','0001/PB/EST/IX/2018/CG/CI','1','1','1','2018-09-05','minta laptop','2018-09-05 07:29:14','2018-09-05 07:35:36',NULL,'1','1',NULL,NULL,NULL),  ('16','9','38','6',NULL,'1','0001/PB/PRM/IX/2018/CG/CI','3','1','1','2018-09-06','minta ac','2018-09-06 06:11:20','2018-09-06 06:12:46',NULL,'1','1',NULL,NULL,NULL),  ('17','9','38','1',NULL,'1','0002/PB/EST/IX/2018/CG/CI','1','1','1','2018-09-06','mengeluarkan infocus untuk estate','2018-09-06 07:59:58','2018-09-06 08:01:08',NULL,'1','1',NULL,NULL,NULL),  ('18','9','38','1',NULL,'1','0003/PB/EST/IX/2018/CG/CI','1',NULL,NULL,'2018-09-07',NULL,'2018-09-07 09:45:17','2018-09-07 09:45:17',NULL,'1',NULL,NULL,NULL,NULL),  ('19','9','38','1','1','1','0004/PB/EST/IX/2018/CG/CI','1','1','1','2018-09-19','minta laptop','2018-09-19 02:22:46','2018-09-19 04:20:34',NULL,'1','1',NULL,NULL,NULL),  ('20','9','38','1','2','1','0005/PB/EST/IX/2018/CG/CI','2','1','1','2018-09-27','adfasdf','2018-09-24 15:37:30','2018-09-25 00:08:57',NULL,'1','1',NULL,NULL,NULL),  ('21','9','38','1','2','1','0006/PB/EST/IX/2018/CG/CI','1',NULL,NULL,'2018-09-25','test','2018-09-25 08:54:23','2018-09-25 08:54:23',NULL,'1',NULL,NULL,NULL,NULL),  ('22','9','38','1',NULL,'1','0007/PB/EST/IX/2018/CG/CI','2',NULL,NULL,'2018-09-27','test','2018-09-27 07:49:15','2018-09-27 07:49:15',NULL,'1',NULL,NULL,NULL,NULL),  ('23','9','38','1','2','1','0001/PB/EST/X/2018/CG/CI','2','1','1','2018-10-01','test','2018-10-01 09:21:19','2018-10-01 10:30:12',NULL,'1','1',NULL,NULL,NULL),  ('24','9','39','5','5','1','0001/PB/P&D/X/2018/CG/CI','2',NULL,'1','2018-10-04','pinjam','2018-10-04 04:21:08','2018-10-04 04:57:19',NULL,'1','1',NULL,NULL,NULL);
INSERT INTO `peruntukans` VALUES ('1','Housing',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('2','Business',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `project_kawasans` VALUES ('1','9',NULL,NULL,'','fasilitas kota',NULL,'0.00','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2','9',NULL,'2171','NSDUA','nusa dua',NULL,'187804.91','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3','9',NULL,'2150','ASHBE','ruko r1, r2, r3, r5',NULL,'20679.19','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('4','9',NULL,NULL,'','blok e ext',NULL,'102210.11','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('5','9',NULL,'2158','FLIND','blok f',NULL,'44997.43','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('6','9',NULL,'2180','TRGRD','blok g',NULL,'171359.81','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('7','9',NULL,'2169','NEOCL','blok h',NULL,'119605.94','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('8','9',NULL,'2150','ASHBE','ruko r6, r7, r8, r9, r10, r11, r12, r15',NULL,'38601.15','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9',NULL,'2161','GRVLY','blok i',NULL,'94001.86','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('10','9',NULL,'2154','CTWLK','ruko city walk',NULL,'20004.83','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('11','9',NULL,'2152','BRNWD','blk rcw',NULL,'41186.14','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('12','9',NULL,'2175','RSWOD','blok j',NULL,'59554.87','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('13','9',NULL,'2168','MSGRD','blok k',NULL,'46982.94','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('14','9',NULL,'2167','MDOWS','blok l',NULL,'67193.74','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('15','9',NULL,'2172','PRAIR','blok m + ruko novo',NULL,'72864.41','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('16','9',NULL,'2155','CYPRS','blok n',NULL,'86284.77','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('17','9',NULL,'2177','TARN','blok o',NULL,'54927.27','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('18','9',NULL,'2156','DENSE','blok p',NULL,'44962.30','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('19','9',NULL,'2160','GRASS','blok q',NULL,'35700.66','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('20','9',NULL,'2181','VARDN','blok s',NULL,'31357.23','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('21','9',NULL,'2182','WEST','blok t',NULL,'40973.83','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('22','9',NULL,'2166','LKWOD','blok u',NULL,'68521.06','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('23','9',NULL,'2151','AVERS','blok aa',NULL,'67663.72','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('24','9',NULL,'2176','SPRNG','blok bb',NULL,'49021.84','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('25','9',NULL,'2617','CLGRD','blok cc',NULL,'36013.15','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('26','9',NULL,'2164','LKDEN','blok p ext',NULL,'60400.14','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('27','9',NULL,'2174','RKIR','blok i ext + ruko',NULL,'2174.37','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('28','9',NULL,'2152','BRNWD','rc ext + e 18',NULL,'5186.46','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('29','9',NULL,'2151','AVERS','aa ext',NULL,'6661.61','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('30','9',NULL,'2165','LKLF','p ext 2',NULL,'17128.30','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('31','2069',NULL,NULL,'','fasilitas kota',NULL,'0.00','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('32','2069',NULL,NULL,'davinci','blok a',NULL,'56139.00','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('33','2069',NULL,'2326','michelangelo','blok b',NULL,'43981.18','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('34','2069',NULL,'2327','premium','blok aa',NULL,'6846.00','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('35','2069',NULL,NULL,'','blok c',NULL,'76724.93','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('36','2069',NULL,NULL,'','blok d',NULL,'70793.31','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('37','2069',NULL,'2328','blok e','blok ee',NULL,'54579.00','0','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('38','53',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('39','2080',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('40','4063',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('41',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('42',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('43','3026',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('44','3026',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('45','35',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('46','30',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('47','52',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('48','97',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('49','2075',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('50','55',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('51','33',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('52',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('53','86',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('54','61',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('55',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('56','32',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('57',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('58',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('59','107',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('60','41',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('61','5',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('62','43',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('63','50',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('64','101',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('65','102',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('66','103',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('67','2076',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('68',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('69','3028',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('70','46',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('71','105',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('72','47',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('73','2077',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('74',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('75','49',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('76','31',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('77','31',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('78',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('79','39',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('80','54',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('81','2078',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('82',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('83','40',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('84','2045',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('85','3032',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('86','8',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('87','36',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('88','37',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('89','85',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('90','51',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('91','5087',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('92','58',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('93','2072',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('94','24',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('95','111',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('96','93',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('97','45',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('98','56',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('99','63',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('100','106',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('101','94',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('102','10',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('103','100',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('104','23',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('105','3030',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('106','44',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('107',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('108','20',NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('109',NULL,NULL,NULL,'','fasilitas kota',NULL,'0.00','','1',NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `project_pt_users` VALUES ('1','1','38','9',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','39','9',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','154','9',NULL,'2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','46','9',NULL,'2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','47','9',NULL,'2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('6','1','48','9',NULL,'2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','49','9',NULL,'2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('8','1','50','9',NULL,'2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','51','9',NULL,'2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('10','1','52','9',NULL,'2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','53','9',NULL,'2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('12','1','54','9',NULL,'2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('13','1','55','9',NULL,'2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('14','1','56','9',NULL,'2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('15','1','57','9',NULL,'2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('16','1','58','5',NULL,'2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('17','1','59','5',NULL,'2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('18','1','60','5',NULL,'2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('19','1','61','5',NULL,'2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('20','1','62','5',NULL,'2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('21','1','63','5',NULL,'2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('22','1','80','5',NULL,'2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('23','1','89','5',NULL,'2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('24','1','147','5',NULL,'2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('25','1','148','5',NULL,'2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('26','1','149','5',NULL,'2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('27','1','150','5',NULL,'2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('28','1','151','5',NULL,'2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('29','1','152','5',NULL,'2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('30','1','180','5',NULL,'2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('31','1','181','5',NULL,'2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('32','1','131','5',NULL,'2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('33','1','96','5',NULL,'2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('34','1','202','5',NULL,'2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('35','1','208','5',NULL,'2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('36','1','200','5',NULL,'2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('37','1','205','5',NULL,'2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('38','1','206','5',NULL,'2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('39','1','232','5',NULL,'2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('40','1','196','5',NULL,'2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('41','1','233','5',NULL,'2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('42','1','201','5',NULL,'2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('43','1','229','5',NULL,'2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('44','1','234','5',NULL,'2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('45','1','203','5',NULL,'2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('46','1','97','5',NULL,'2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('47','1','199','5',NULL,'2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('48','1','207','5',NULL,'2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('49','1','198','5',NULL,'2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('50','1','87','5',NULL,'2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('51','1','128','5',NULL,'2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('52','1','91','5',NULL,'2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('53','1','92','5',NULL,'2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('54','1','93','5',NULL,'2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('55','1','94','5',NULL,'2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('56','1','95','5',NULL,'2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('57','1','226','5',NULL,'2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('58','1','163','5',NULL,'2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('59','1','204','5',NULL,'2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('60','1','175','5',NULL,'2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('61','1','167','5',NULL,'2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('62','1','168','5',NULL,'2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('63','1','169','5',NULL,'2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('64','1','170','5',NULL,'2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('65','1','171','5',NULL,'2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('66','1','189','5',NULL,'2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('67','1','176','5',NULL,'2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('68','1','162','5',NULL,'2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('69','1','225','5',NULL,'2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('70','1','153','5',NULL,'2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('71','1','227','5',NULL,'2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `projects` VALUES ('5','2',NULL,NULL,'CI','CITRA INDAH','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('8','2',NULL,NULL,'CR','CITRA RAYA - SURABAYA','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('9','2',NULL,NULL,'CG','CITRAGRAN -  CIBUBUR','5186.46',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('10','2',NULL,NULL,'SCC','SEKOLAH CIPUTRA - CITRARAYA','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('20','2',NULL,NULL,'UC','UNIVERSITAS CIPUTRA','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('23','2',NULL,NULL,'SCS','SEKOLAH CIPUTRA-SURABAYA','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('24','2',NULL,NULL,'LA','LAMPUNG','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('30','2',NULL,NULL,'CBCM','CitraLand Bagya City Medan','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('31','2',NULL,NULL,'CLP','CitraLand Pekanbaru','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('32','2',NULL,NULL,'CGP','CitraGarden Pekanbaru','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('33','2',NULL,NULL,'CGL','CitraGarden Lampung','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('34','2',NULL,NULL,'BPP','BizPark 2 - Penggilingan','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('35','2',NULL,NULL,'BPB','BizPark Bandung','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('36','2',NULL,NULL,'CSGS','CitraSun Garden Semarang','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('37','2',NULL,NULL,'CSGY','CitraSun Garden Yogyakarta','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('38','2',NULL,NULL,'CGS','CitraGrand Semarang','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('39','2',NULL,NULL,'CLS','CitraLand Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('40','2',NULL,NULL,'CLU','CitraLand Utara','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('41','2',NULL,NULL,'CHS','CitraHarmoni Sidoarjo','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('42','2',NULL,NULL,'CGS','CitraGarden Sidoarjo','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('43','2',NULL,NULL,'CIS','CitraIndah Sidoarjo','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('44','2',NULL,NULL,'TDP','The Taman Dayu Pandaaan','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('45','2',NULL,NULL,'PMP','Paradise Memorial Park','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('46','2',NULL,NULL,'CLD','CitraLand Denpasar','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('47','2',NULL,NULL,'CLK','CitraLand Kendari','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('48','2',NULL,NULL,'CLP','CitraLand Palu','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('49','2',NULL,NULL,'CLM','CitraLand Manado','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('50','2',NULL,NULL,'CLA','CitraLand Ambon','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('51','2',NULL,NULL,'CWS','Ciputra World Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('52','2',NULL,NULL,'CCLS','Comercial - CitraLand Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('53','2',NULL,NULL,'ACLS','Apartment - CitraLand Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('54','2',NULL,NULL,'CLSU','CitraLand Surabaya - Utara','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('55','2',NULL,NULL,'CGCI','CitraGarden & CitraIndah Sidoharjo','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('56','2',NULL,NULL,'RCLS','Rumah - CitraLand Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('58','2',NULL,NULL,'HCW','Hotel CiputraWorld','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('61','2',NULL,NULL,'CGMY','CitraGrand Mutiara Yogyakarta','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('63','2',NULL,NULL,'SCBCI','Sekolah Citra Berkat Citra Indah','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('68','2',NULL,NULL,'BPP','BizPark 1 - Pulogadung','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('72','2',NULL,NULL,'TDP','The Taman Dayu Pandaaan','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('73','2',NULL,NULL,'UC','UC.COM','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('85','2',NULL,NULL,'CWPS','Ciputra Waterpark Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('86','2',NULL,NULL,'CGM','CitraGarden Medan','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('88','2',NULL,NULL,'CGS','Ciputra Golf Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('93','2',NULL,NULL,'MCSP','Mall Ciputra Seraya Pekanbaru','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('94','2',NULL,NULL,'SCBT','Sekolah Citra Berkat Tangerang','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:51','2018-08-19 01:57:51',NULL,'1',NULL,NULL,NULL,NULL),  ('97','2',NULL,NULL,'CGC','CitraGran Cibubur','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('100','2',NULL,NULL,'SCKJ','Sekolah Citra Kasih Jakarta','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('101','2',NULL,NULL,'CLBC1','Ruko - CitraLand Bagya City','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('102','2',NULL,NULL,'CLBC2','Rumah - CitraLand Bagya City','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('103','2',NULL,NULL,'CLBC3','Kavling - CitraLand Bagya City','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('105','2',NULL,NULL,'CLGL','CitraLand The Green Lake','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('106','2',NULL,NULL,'SCBS','Sekolah Citra Berkat Surabaya','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('107','2',NULL,NULL,'CGWS','CitraGarden Waterpark Sidoarjo','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('111','2',NULL,NULL,'MCC','Mall Ciputra Cibubur','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2013','2',NULL,NULL,'CGL','Citra Garden Lampung','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2019','2',NULL,NULL,'BPB','BizPark 3 - CE Bekasi','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2045','2',NULL,NULL,'CLWCM','CitraLand Waterfront City Makassar','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2069','2',NULL,NULL,'CLL','CitraLand Lampung','390734.16',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2072','2',NULL,NULL,'HCWS','CWS - Hotel','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2075','2',NULL,NULL,'CGCBD','CitraGrand CBD Cibubur','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2076','2',NULL,NULL,'CLC','CitraLand Cibubur','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2077','2',NULL,NULL,'CLKM','CitraLand Kairagi Manado','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2078','2',NULL,NULL,'CLTCM','CitraLand Tallasa City Makassar','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2079','2',NULL,NULL,'CLP','CitraLand Palembang','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('2080','2',NULL,NULL,'ACLSC','Apartment CitraLand Surabaya-Cornell','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3026','2',NULL,NULL,'BP3','BizPark 3','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3027','2',NULL,NULL,'CLC','CitraLand Cileungsi','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3028','2',NULL,NULL,'CLCLM','CitraLand City Losari Makasar','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3030','2',NULL,NULL,'SH2','KANTOR PUSAT SH2','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3031','2',NULL,NULL,'CLTCM','CitraLand Tallasa City Makasar','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3032','2',NULL,NULL,'CLWM','CitraLand Winagun Manado','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('3033','2',NULL,NULL,'CLKM','CitraLand Kairagi Manado','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('4063','2',NULL,NULL,'BCY','Barsa City Yogyakarta','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL),  ('5087','2',NULL,NULL,'CWSV','Ciputra World Surabaya - The Vertu','0.00',NULL,'0',NULL,NULL,NULL,NULL,'2018-08-19 01:57:52','2018-08-19 01:57:52',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `provinces` VALUES ('1','1','bali',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','di yogyakarta',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','dki jakarta',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','jawa barat',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','jawa timur',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('6','1','lampung',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','maluku',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('8','1','riau',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','sulawesi selatan',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('10','1','sulawesi tengah',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','sulawesi tenggara',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('12','1','sumatera utara',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `pts` VALUES ('38',NULL,'CI','PT. CIPUTRA INDAH','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('39',NULL,'ME','PT. MITRAKUSUMA ERASEMESTA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('154',NULL,'AMP','PT. ANEKAINDAH MITRAPERKASA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('46',NULL,'CS','PT. CIPUTRA SURYA - KP','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('47',NULL,'AS','PT. APTACITRA SURYA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('48',NULL,'BP','PT. BUMIINDAH PERMAITERANG','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('49',NULL,'TS','PT. TAMANCITRA SURYAHIJAU','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('50',NULL,'SJ','PT. SUBURHIJAU JAYAMAKMUR','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('51',NULL,'CT','PT. CAHAYAHIJAU TAMANINDAH','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('52',NULL,'GA','PT. GALAXY ALAMSEMESTA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('53',NULL,'GC','PT. GALAXY CITRAPERDANA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('54',NULL,'CBE','PT. CITRA BAHAGIA ELOK','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('55',NULL,'CBM','PT. CIPUTRA BANGUN MITRA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('56',NULL,'CFM','PT. CIPUTRA FAJAR MITRA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('57',NULL,'CEM','PT. CIPUTRA ELOK MITRA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('58',NULL,'CS','PT. CIPUTRA SPIRIT','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('59',NULL,'SH','PT. SAPTAMULIA HIJAUBANGUN','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('60',NULL,'IK','PT. INTILOKAHITA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('61',NULL,'KH','PT. KARYAPRIMA HIJAUSELARAS','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('62',NULL,'SBM','PT. SINAR BAHANA MULYA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('63',NULL,'CA','PT. CIPTAULUNG ARTAJAYA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('80',NULL,'WWR','PT. WIN WIN REALTY','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('89',NULL,'CKPN','JO CIPUTRA KARYA PANCASAKTI NUGRAHA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('147',NULL,'CIM','PT. CIPUTRA INTERNASIONAL MDN','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('148',NULL,'CIE','PT.CIPUTRA INTERNASIONAL ESC','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('149',NULL,'CID','PT.CIPUTRA INTERNASIONAL DK','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('150',NULL,'CBS','PT.CIPUTRA BANGUN SELARAS','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('151',NULL,'JCKPN','JO CIPUTRA KARYA PANCASAKTI NUGRAHA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('152',NULL,'CK','PT.CIPUTRA KPSN','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('180',NULL,'CS','PT. CIPUTRA SYMPHONY','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('181',NULL,'CAK','PT. CIPUTRA ABADI KARYA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('131',NULL,'UAT','PT. UAT Company','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('96',NULL,'CIP','PT. Central International Property','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('202',NULL,'CSP','JO Ciputra Sunindo Property','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('208',NULL,'SGU','JO Sunindo Graha Utama','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('200',NULL,'CKU','JO CIPUTRA KARYA UTAMA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('205',NULL,'CIP','PT. Ciputra Inti Pratama','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('206',NULL,'KUB','PT. Karya Utama Bumi','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('232',NULL,'CD','PT. CIPUTRA DELTA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('196',NULL,'CFA','PT. CAHAYA FAJAR ABADITAMA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('233',NULL,'CSSP','JO Ciputra Surya Sidoarjo Permai (JOCSSP)','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('201',NULL,'CD','PT. CIPUTRA DEVELOPMENT TBK.','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('229',NULL,'TD','PT. TAMAN DAYU','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('234',NULL,'CKM','JO CIPUTRA KARYA MAKMUR','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('203',NULL,'CAP','PT. CIPUTRA ABDI PERSADA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('97',NULL,'CLP','JO CITRALAND PALU','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('199',NULL,'CI','PT. CIPUTRA INTERNASIONAL','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('207',NULL,'CGT','JO. Ciputra Graha Terasama','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('198',NULL,'CMCA','JO Ciputra Mutiara Cemerlang Abadi','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('87',NULL,'AP','PT. Asendabangun Persada','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('128',NULL,'','PT. TEST 01','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('91',NULL,'','PT. Kosong','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('92',NULL,'MMB','PT. Mitra Makmur Bagya','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('93',NULL,'CNI','PT. Ciputra Nugraha International','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('94',NULL,'','PT. Kosong','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('95',NULL,'PGM','PT. PANASIA GRIYA MEKARASRI','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('226',NULL,'GM','PT. GRIYA MEKARASRI','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('163',NULL,'CGK','PT Citra Grand Khatulistiwa','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('204',NULL,'ACK','PT ARDAYA CIPTA KARSA','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('175',NULL,'CYBA','JO CIPUTRA YASMIN BUMI ASRI','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('167',NULL,'CN','PT Ciputra Nusantara','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('168',NULL,'CM','PT Cipglobal megahkarya','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('169',NULL,'CINT','PT Ciputra Internasional','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('170',NULL,'CY','Ciputra Yasmin','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('171',NULL,'CTS','PT Citra Tirta Surabaya','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('189',NULL,'CINT','CIPUTRA INTERNATIONAL','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('176',NULL,'CT','CIPUTRA TALLASA JO','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('162',NULL,'CIM','PT CIPUTRA INTERNASIONAL MANADO','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('225',NULL,'CLM','JO CITRALAND MANADO','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('153',NULL,'PGM','PT. Panasia Griya Mekarasri','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('227',NULL,'CSPU','JO Ciputra Sunindo Prima Utama','','','','',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `rekanan_groups` VALUES ('1',NULL,'3RODA','PT. SUMBER ABADI SUKSES',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('2',NULL,'A2J DESIGN','A2J DESIGN ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('3',NULL,'ABDU SOMAD','ABDU SOMAD BUDIONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('4',NULL,'ABI KUSMAWAN','ABI KUSMAWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('5',NULL,'ADDEL','PT. ADDEL CIPTA GRAHA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('6',NULL,'ADE SUNARYA','ADE SUNARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('7',NULL,'ADEKA ','PT. ADEKAKARYA INDAHPERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('8',NULL,'ADHIKARA','PT. ADHIKARA MITRACIPTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('9',NULL,'ADIKARSA','PT. ADIKARSA WIRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('10',NULL,'ADISENA','PT. ADISENA WISESA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('11',NULL,'ADPD','PT.ADPD SARANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('12',NULL,'AGRICON','PT. AGRICON PUTRA CITRA OPTIMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('13',NULL,'AGUNG NAMASKARA','PT. AGUNG NAMASKARA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('14',NULL,'AGUS SETIAWAN','AGUS SETIAWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('15',NULL,'AIRMAS','PT. AIRMAS ASRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('16',NULL,'AJISAKA','PT.AJISAKA ANDALANSAKTI ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('17',NULL,'ALAM JAYA','YUDI HARYSUWANDI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('18',NULL,'ALFINCO','PT. ALFINCO DHARMA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('19',NULL,'ALIMAN','PT. ALIMAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('20',NULL,'AMUKTI','PT. AMUKTI MITRA PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('21',NULL,'Anaya','PT.ANAYA BERKAH CEMERLANG',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('22',NULL,'ANDRI','PT. ANDRI TECHNINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('23',NULL,'ANGGARA','PT.ANGGARA ARCHITEAM',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('24',NULL,'ANGKASA','PT. ANGKASA WASTU PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('25',NULL,'ANISA','ANISA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('26',NULL,'ANTON ','ANTON SUDARSONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('27',NULL,'ANUGERAH SEJAHTERA','PT.ANUGERAH SEJAHTERA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('28',NULL,'ANUGRAH','CV. ANUGRAH RINA\'S MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('29',NULL,'ANUGRAH ALAM','CV. ANUGRAH ALAM MAKMUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('30',NULL,'APINDO','PT. APINDO KARYA LESTARI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('31',NULL,'ARCHINDO','PT. ARCHINDO ARYA UTARA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('32',NULL,'ARCHITEKA','ARCHITEKA RAYA STUDIO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('33',NULL,'ARETA SCALE','CV.ARETA SCALE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('34',NULL,'ARIS','ARIS SUGIHARTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('35',NULL,'ART SCULPTURE','ART SCULPTURE STUDIO PATUNG SATU',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('36',NULL,'ARTHA','PT. ARTHA ESTETIKA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('37',NULL,'ARTHA KARUNIA','PT. ARTHA KARUNIA ARVIA ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('38',NULL,'ARTHAREKA','PT.ARTHAREKA GRAHA SARANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('39',NULL,'ASEP','ASEP',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('40',NULL,'ASHTHA','CV. Ashtha Mustika Prima',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('41',NULL,'ASIA PASIFIK','PT. ASIA PACIFIC KONSTRUKSI & REKAYASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('42',NULL,'ASIM SUPRIATNA','ASIM SUPRIATNA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('43',NULL,'ASTADIA','PT. ASTADIA PURIARTHA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('44',NULL,'AZHAR','MUHAMAD AZHAR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('45',NULL,'BAGANUSA','PT.BAGANUSA DAYAPRIMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('46',NULL,'BAHANA PUTRA','CV. BAHANA PUTRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('47',NULL,'BAMBANG','BAMBANG SURYANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('48',NULL,'BAMBANG P','BAMBANG PURWONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('49',NULL,'BAMBANG ROSANTO','BAMBANG ROSANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('50',NULL,'BANGUN','PT. BANGUN SARANA INDAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('51',NULL,'BANGUN JAYA MANDIRI','CV. BANGUN JAYA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('52',NULL,'BANGUN SARANA','PT. BANGUN SARANA ENGGAL',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('53',NULL,'BAYU DHIKA','CV. BAYU DHIKA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('54',NULL,'BENNY HONG','BENNY HONG SIE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('55',NULL,'BENTARA','PT. BENTARA KARYA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('56',NULL,'BERKAH','PT. BERKAH BINA SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('57',NULL,'BERKAH MATRA','PT.BERKAH MATRAGRIYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('58',NULL,'BERKAT ','PT.BERKAT MANUNGGAL ENERGI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('59',NULL,'BESTINDO','PT. ESTINDO AQUATEK SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('60',NULL,'BETON','PT. BETON ELEMENINDO PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('61',NULL,'BINA BANGUNAN','CV. BINA  INDAH BANGUNAN ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('62',NULL,'BINA PRATAMA','PT. BINA PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('63',NULL,'BINA UNGGULAN','PT.BINA UNGGULAN MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('64',NULL,'BINTANG','PT. BINTANG PEPINDO INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('65',NULL,'BIORINDO','CV.BIORINDO PRIMA KARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('66',NULL,'BUANA CIPTA','PT.BUANA CIPTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('67',NULL,'BUDI DHARMA PUTERA','CV. BUDI DHARMA PUTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('68',NULL,'BUMIPUTERA','PT. BUMIPUTERA MITRASARANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('69',NULL,'CAHAYA','PT. CAHAYA BARU MULIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('70',NULL,'CAKRA','CV. CAKRAWALA TEKNIK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('71',NULL,'CAKRAWALA','PT. CAKRAWALA MAJU MAKMUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('72',NULL,'CALMIC','PT. CALMIC INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('73',NULL,'CAS','PT. CARDIG ANUGRA SARANA BERSAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('74',NULL,'CATUR EKA','PT. CATUR EKA MANUNGGAL JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('75',NULL,'CBA','CBA STUDIO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('76',NULL,'CDAM','PT. CIPTA DESAIN ARSITEKTUR MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('77',NULL,'CENGKARENG ','PT. CENGKARENG PERMAI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('78',NULL,'CEPI M','CEPI MULYANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('79',NULL,'CERARUFINDO','PT. CERARUFINDO PRIMAMANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('80',NULL,'CINDELARAS','PT.CINDELARAS BIORINDOJO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('81',NULL,'CIPTA','PT. CIPTA ADIGRAHA PROPERTI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('82',NULL,'CIPTA DESIGN','PT. CIPTA DESAIN ARSITEKTUR MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('83',NULL,'CIPTA GRAHA','PT. CIPTAGRAHA KONSTRUKSINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('84',NULL,'CIPTA KARYA','CV. CIPTA KARYA BERSAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('85',NULL,'Cipta Pratama','PT. CIPTA PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('86',NULL,'CIPTA SUKSES','PT.CIPTA SUKSES',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('87',NULL,'CIPTAKARYA','PT. CIPTA KARYA ELECTRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('88',NULL,'CITRA','CITRA KEMILAU ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('89',NULL,'CITRA ARTHA','PT. CITRA ARTHA RODA KENCANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('90',NULL,'CITRA ASRI','PT. CITRA ASRI PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('91',NULL,'CITRA GRIYA','PT.CITRA GRIYA RAHARJA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('92',NULL,'CITRA HARDA','PT. CITRA HARDA KONSTRUKSI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('93',NULL,'CITRA KARSA','PT. CITRA KARSA PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('94',NULL,'CITRAMAR','PT. CITRAMAR LINTAS NUSANTARA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('95',NULL,'CITY AD EXPO','CITY - AD EXPO INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('96',NULL,'COBRA','PT. COBRA JAYA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('97',NULL,'CONBLOC','PT. CONBLOC INTERNUSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('98',NULL,'CP','PT. CENGKARENG PERMAI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('99',NULL,'CRISNADI','CV. CRISNADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('100',NULL,'D\'LITE','PT.DENATA LITE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('101',NULL,'DACORAL','PT. DACORAL ENGINEERING INTERNATIONAL',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('102',NULL,'DANIA PRATAMA','PT. DANIA PRATAMA INTERNASIONAL',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('103',NULL,'DANTOSAN','PT. DANTOSAN PRECON PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('104',NULL,'DARCANIYA','PT. DARCANIYA CINITRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('105',NULL,'DARMONO','DARMONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('106',NULL,'DARNO','DARNO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('107',NULL,'DASA','PT. DASA INTRA BUANA ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('108',NULL,'DAVITAMA','DAVITAMA KREASI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('109',NULL,'DAYA CREASI','PT. DAYA CREASI MITRAYASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('110',NULL,'DAYACIPTA','PT. DAYA CIPTA ANUGERAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('111',NULL,'DEDAH','OKE CCTV ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('112',NULL,'DEDI HIDAYAT','DEDI HIDAYAT',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('113',NULL,'DEDY','DEDY LASTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('114',NULL,'DEKORAMIK ','PT. DEKORAMIK PERDANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('115',NULL,'DELCO WATER','PT.DELCO WATER ENGINEERING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('116',NULL,'DELI PUTRA','PT. DELI PUTRA KARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('117',NULL,'DELIMA','CV. DELIMA INDAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('118',NULL,'DELTASUPLINDO','PT. DELTASUPLINDO INTERNUSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('119',NULL,'DENATA','PT. DENATA PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('120',NULL,'DENI SOBURANY R','DENI SOBURANY R',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('121',NULL,'DETAILDESIGN','PT. DETAIL DESIGN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('122',NULL,'DEWATA','PT.DEWATA BULUGADING PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('123',NULL,'DHARMA CIPTA','PT. DHARMA CIPTA ADHIYASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('124',NULL,'DHIART','PT. DHIART INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('125',NULL,'DHIART KREASI','PT. DHIART KREASI INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('126',NULL,'DIDY','DIDY HERMAWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('127',NULL,'DUASIA','PT. DUASIA PADUSEJATI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('128',NULL,'DUATIRTA','PT. DUA TIRTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('129',NULL,'DUTA','PT. DUTA MARGA SILIMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('130',NULL,'DWI','PT. DWI LESTARI NUSANTARA ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('131',NULL,'DWI EKA','CV. DWI EKA JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('132',NULL,'DWI LATU','CV. DWI LATU KARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('133',NULL,'DWI PRIMA','PT. DWI PRIMA ENGINEERING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('134',NULL,'DWISAKARYA','CV. DWISA KARYA CIPTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('135',NULL,'EBENHAEZER','PT. EBENHAEZER KARYA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('136',NULL,'ECOCARE','PT. INDOCARE PACIFIC',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('137',NULL,'EDDY','EDDY SUSILO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('138',NULL,'EDDY SUSILO','EDDY SUSILO ( CV.Baladewa Creator Nuswantara',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('139',NULL,'EDI JUNAEDI','EDI JUNAEDI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('140',NULL,'EKA','EKA SATIA PERKASA. CV',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('141',NULL,'EKATAMA','PT. EKATAMA B',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('142',NULL,'EMAN','EMAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('143',NULL,'ENDANG','C. ENDANG SRI REDJEKI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('144',NULL,'ENDANG KUS','ENDANG KUSNADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('145',NULL,'ENNET','PT. ENNET MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('146',NULL,'ERA CAKRAWALA','ERA CAKRAWALA INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('147',NULL,'ERAWATI','ERAWATI GUNAWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('148',NULL,'EUPHORBIA','CV. EUPHORBIA LANDSCAPE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('149',NULL,'FAJAR','FAJAR WIDIANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('150',NULL,'FELIX','FELIX TJAHYADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('151',NULL,'FERY FIRMANSYAH','FERY FIRMANSYAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('152',NULL,'FL AFIF','F.L AFIF YOSHIOKA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('153',NULL,'FLORA TERUS','PT. FLORA TERUS BERSEMI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('154',NULL,'FRIDAWATI','FRIDAWATI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('155',NULL,'GABRIEL','GABRIEL GOLE (GEBY)',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('156',NULL,'GALANG ESA MANDIRI','PT. GALANG ESA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('157',NULL,'GAYA BANGUN','PT.GAYA BANGUN PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('158',NULL,'GELEGAR','PT. GELEGAR RINTISAN SEJATI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('159',NULL,'GEONUSA','PT. GEONUSA INFOTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('160',NULL,'GINI','PT. GINI MEGAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('161',NULL,'GLOBAL','PT. GLOBALINDO BUANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('162',NULL,'GLOBAL MULYA','CV. GLOBAL MULYA PERSADA ADVERTISING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('163',NULL,'GODANG TUAJAYA','PT. GODANG TUAJAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('164',NULL,'GRAHA CIPTA','PT.GRAHA CIPTA HADIPRANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('165',NULL,'GRAHA CIPTA SARANA','CV. GRAHA CIPTA SARANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('166',NULL,'GRAHA SARANA','PT.GRAHA SARANA BUANA JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('167',NULL,'GRATIA','PT. GRATIA ALFAOMEGA KONSTRUKSI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('168',NULL,'GRAVIDECO','CV. GRAVIDECO JAYAMAS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('169',NULL,'GREATHEART','PT. GREAT HEART MEDIA INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('170',NULL,'GRIIYA BERSIH ','CV. GRIYA BERSIH PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('171',NULL,'GRIYA','PT. GRIYA REMIZA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('172',NULL,'GUDANG IMAJINASI','GUDANG IMAJINASI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('173',NULL,'GUMILANG','PT. GUMILANG ARTHA LUMINTU',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('174',NULL,'H. UJANG','H. UJANG SURYADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('175',NULL,'HADI ','V. HADI SOETJIADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('176',NULL,'HANDAL','PT. HANDAL SOLUSITAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('177',NULL,'Handi Sudardja','Ir. Handi Sudardja, M Eng',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('178',NULL,'HANDOYO','HANDOYO JO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('179',NULL,'HARSENAL','PT. HARSENAL PUTRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('180',NULL,'HARTONO','HARTONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('181',NULL,'HARY','HARY ADENAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('182',NULL,'HASTAMANDIRI','PT. HASTA MARGA SARANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('183',NULL,'HASTAMARGA','PT. HASTA MARGA SARANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('184',NULL,'HERI ','HERI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('185',NULL,'HERMAN PELANI','HERMAN PELANI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('186',NULL,'HIDROLIK','PT. HIDROLIK PONDASI INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('187',NULL,'HUNIPERSADA','PT. HUNIPERSADA CITRANUSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('188',NULL,'IJA','CV. INTAN JAYA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('189',NULL,'IKA GRIYA','PT. IKAGRIYA DARMAPERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('190',NULL,'IKAGRIYA','PT. IKAGRIYA DARMAPERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('191',NULL,'ILLUSTRATION ','ILLUSTRATION SPECIALIST ASIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('192',NULL,'INDECO','PT. INDECO PRIMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('193',NULL,'INDONESIA','PT. INDONESIA ENVIRONMENT CONSULTAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('194',NULL,'INDOPRATAMA','PT. INDOPRATAMA MANDIRI MAKMUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('195',NULL,'INDRA','INDRA JUANLI RITONGA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('196',NULL,'INTAN JAYA','CV. INTAN JAYA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('197',NULL,'INTRA SINERGI','PT. INTRA SINERGI SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('198',NULL,'IRA','KETIRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('199',NULL,'IRWAN ','IRWAN SUKIRNO , S. AP. MM',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('200',NULL,'ISTANA','CV. ISTANA MULIA MAKMUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('201',NULL,'IWAN ','IWAN RIDWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('202',NULL,'IYAN','IYAN ASMANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('203',NULL,'JAHJA','JAHJA NOER JUSUF',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('204',NULL,'Jajang Rosid,Bpk','SINAR JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('205',NULL,'JAJANG ROSYID','JAJANG ROSYID',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('206',NULL,'JALA','PT. JALA PERMATA & CO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('207',NULL,'JAMINAN','Bpk. JARIMAN BIN PANGI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('208',NULL,'Januri','JANURI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('209',NULL,'JASON','JASON DESIGN EXHIBITION & INTERIOR CONTRACTOR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('210',NULL,'JAYA','JAYA MANDIRI GYPS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('211',NULL,'JAYA ABADI','CV.JAYA ABADI GLOBALINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('212',NULL,'JAYA KENCANA','PT. JAYA KENCANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('213',NULL,'JAYA TRISARANA','PT. JAYA TRISARANA RAFLINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('214',NULL,'JAYACON','PT. JAYACON PANEL UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('215',NULL,'JAYADI SAPUTRA','JAYADI SAPUTRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('216',NULL,'JELAJAH','PT. JELAJAH HARMONI CIPTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('217',NULL,'JITO','M. ARIF SUJITO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('218',NULL,'Jordi Tamba','JORDI TAMBA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('219',NULL,'KADU','PT. KADU BUNDER ARSITEK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('220',NULL,'KALIKA','PT. KALIKA SERVICE INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('221',NULL,'KARTIKA','CV. KARTIKA FLORA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('222',NULL,'KARTIKA EKA','PT. KARTIKA EKA JAYA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('223',NULL,'KARYA','PT. KARYA BANGUN SEJATI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('224',NULL,'KARYA MANDIRI','CV. KARYA MANDIRI SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('225',NULL,'KARYA PRIMA','PT. KARYA PRIMA LESTARIJAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('226',NULL,'KARYACIPTA','CV. KARYACIPTA Reklame',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('227',NULL,'KARYAGUNA','PT. KARYAGUNA HASTA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('228',NULL,'Ketira','PT. KETIRA ENGINEERING CONSULTAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('229',NULL,'KOMSHA','CV. KOMSHA AKUR PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('230',NULL,'KONE','PT.KONE INDO ELEVATOR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('231',NULL,'KOPEGTEL','KOPEGTEL DINASTI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('232',NULL,'KREAMATRA','PT. KREAMATRA CIPTA RUPA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('233',NULL,'KREASI LESTARI','PT. KREASI LESTARI WIBOWO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('234',NULL,'KREASIART','PT. MULTI KREASI MITRAUTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('235',NULL,'KREASINDO','PT. KREASINDO GRAHA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('236',NULL,'KURNIA','CV. KURNIA SUKSES TAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('237',NULL,'KURNIA BERKAH','CV. KURNIA BERKAH ABADI PERMAI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('238',NULL,'LADIYO','LADIYO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('239',NULL,'LAMPIRI','LAMPIRI DJAYA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('240',NULL,'LANCARJAYA','PT. LANCARJAYA MANDIRI ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('241',NULL,'LAUTAN GRAHA','CV.LAUTAN GRAHA MAS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('242',NULL,'LENTERA','PT. LENTERA MULIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('243',NULL,'LILIK SUGIJONO','IR. LILIK SUGIJONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('244',NULL,'LINSEA','PT. LINSEA PRIMA INTERIN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('245',NULL,'LISAKONSULINDO','PT. LISAKONSULINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('246',NULL,'LISTON','CV. LISTON BANGUN PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('247',NULL,'LOGVEST','PT. LOGVEST AGRO MAKMUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('248',NULL,'LOKACIPTA','PT. LOKACIPTA MANDIRI MULYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('249',NULL,'LOUSERINDO','PT. LOUSERINDO MEGAH PERMAI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('250',NULL,'LUKMAN','M. LUKMAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('251',NULL,'LUSAVINDRA','PT. LUSAVINDRA JAYAMADYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('252',NULL,'MAHESA','PT. MAHESA CIPTA SENTOSA PUTRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('253',NULL,'MANAR','PT. MANAR DWIKARSA ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('254',NULL,'MANDIRI KREASITAMA','CV. MANDIRI KREASITAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('255',NULL,'MANDIRI PERSADA','PT.MANDIRI PERSADA UTAMA JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('256',NULL,'MANDROSA','PT. MANDROSA SUKSES',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('257',NULL,'MANUNGGAL','PT.MANUNGGAL SEJAHTERA RAKKUTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('258',NULL,'MANUNGGAL JAYA','CV. MANUNGGAL JAYA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('259',NULL,'MARKINDO','PT. MARKINDO CATUR MITRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('260',NULL,'Maryanto','MARYANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('261',NULL,'MASKITANI','MASKITANI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('262',NULL,'MASTERPIECE','MASTERPIECE VISUAL STUDIO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('263',NULL,'MASTRIP','PT.MASTRIP SARANA CONSULTANT',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('264',NULL,'MATAHARI','PT. MATAHARI GRHA ISTANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('265',NULL,'MAWAR','CV. MAWAR TEKNIK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('266',NULL,'MAYAGI','PT. MAYAGI ARTHA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('267',NULL,'MEDIA','PT. MEDIA DESAIN INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('268',NULL,'MEDIAN','PT. MEDIAN CIPTA GRAHA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('269',NULL,'MEGA CIPTA','PT. MEGACIPTA BESTARI PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('270',NULL,'MEGA TIRTA','PT.MEGA TIRTA PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('271',NULL,'MEGA UNGGUL','PT. MEGA UNGGUL TEHNIK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('272',NULL,'MEGAH ALAM','MEGAH ALAM SEMESTA ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('273',NULL,'MEKANINDO','PT. MEKANINDO LESTANUSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('274',NULL,'MEMIONTEC','PT. MEMIONTEC INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('275',NULL,'MENARA','PT. MENARA UNBOR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('276',NULL,'MESINDO','PT. MESINDO AGUNG NUSANTARA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('277',NULL,'MESTIKA','CV. MESTIKA JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('278',NULL,'METAKOM','PT.METAKOM PRANATA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('279',NULL,'METALINDO','PT. METALINDO GUNA TEKNIK INDUSTRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('280',NULL,'METRICO','PT. METRICO PRIMAKARSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('281',NULL,'METRIX','CV.METRIX AGUNG SENTOSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('282',NULL,'MIRA CIPTA','CV. MIRA CIPTA PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('283',NULL,'MITRA','PT. MITRA PEMUDA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('284',NULL,'MITRA AP','CV. MITRA AGUNG PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('285',NULL,'MITRA CEPU','MITRA CEPU ALUMUNIUM',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('286',NULL,'MITRA GRIYA','PT.MITRA GRIYA PERSADA NUSANTARA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('287',NULL,'MITRA MANDIRI','CV. MITRA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('288',NULL,'MITRA SETYA','PT. MITRA SETYA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('289',NULL,'MITRABANGUN','PT. MITRA BANGUN SELARAS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('290',NULL,'MITRAGIRI','PT. MITRA GIRI RATNA MULYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('291',NULL,'MITRAUTAMA','PT. MITRA UTAMA KARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('292',NULL,'MITREKA','CV. MITRA REZEKI ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('293',NULL,'MKS','PT. MITRA KREASI SINERGI ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('294',NULL,'MOENIR','MOENIR PAMUNCAK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('295',NULL,'MOOGO','PT. MOOGO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('296',NULL,'MUCHAMAD','MUCHAMAD MUNANDAR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('297',NULL,'MUHAMAD IKHSANUDIN','MUHAMAD IKHSANUDIN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('298',NULL,'MUJI','PT. MUJI SENTOSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('299',NULL,'MULFORD','PT. MULFORD INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('300',NULL,'MULTI','PT. MULTIBANGUN REKATAMA PATRIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('301',NULL,'MULTI DAYA SUPRA','PT. MULTI DAYA SUPRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('302',NULL,'MULTI KREASI','PT. MULTI KREASI MITRA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('303',NULL,'MULTI SIGMA','PT. MULTI SIGMA CAKRAWALA TEKNIK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('304',NULL,'MULTIBANGUN','PT. MULTIBANGUN ADHITAMA KONSTRUKSI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('305',NULL,'MULTICHEM','PT. MULTICHEM INDO PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('306',NULL,'MULTIGUNA','PT. MULTIGUNA BANGUNJAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('307',NULL,'MULTISARANA','PT. MULTI SARANA PROPERTINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('308',NULL,'MULYA ABADI','CV.MULYA ABADI ADVERTISING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('309',NULL,'MULYONO','MULYONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('310',NULL,'MUNASIR','MUNASIR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('311',NULL,'Mutiara','PT. MUTIARA INTRAREKSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('312',NULL,'NADYA','PT. NADYA KARSA AMERTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('313',NULL,'Namid Yadi','NAMID YADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('314',NULL,'NANDA','PT. NANDA KARYA SAKTI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('315',NULL,'NEPROTAMA','PT. NAPROTAMA PACIFIC',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('316',NULL,'NET','PT. NEUTRAL ERA TRITAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('317',NULL,'NOAH','PT.NOAH FUNTASTIC POOLS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('318',NULL,'Now++','Now++architecture',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('319',NULL,'NURYADI','NURYADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('320',NULL,'NUSARAYA','PT. NUSA RAYA CIPTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('321',NULL,'OKTOVIANUS','OKTOVIANUS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('322',NULL,'OMEGA CIPTA','PT. OMEGA CIPTA BANGUN CEMERLANG',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('323',NULL,'OMEGA MITRA','PT. OMEGA MITRA GEMILANG',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('324',NULL,'OSCARINDO','PT. OSCARINDO UTAMA GEMILANG',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('325',NULL,'OSTARICA','PT. OSTARICA SUKSES TANINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('326',NULL,'PAINI','PAINI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('327',NULL,'PALEM ','PT. PALEM HARDWARE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('328',NULL,'PALUMAS','PT. PALUMAS SEJATI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('329',NULL,'PANCAWIRA','PT. PANCA WIRA DHARMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('330',NULL,'PANDU JAYA','DARMANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('331',NULL,'PANTONPILE','PT. PANTON PILE KWARTATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('332',NULL,'PARAMA','PT. PARAMA SPEKTRUM SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('333',NULL,'PARAMA RUMAH','PT. PARAMA RUMAH KREASI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('334',NULL,'PARAMAJAYA','PT. PARAMAJAYA WIDYA KONSTRUKSI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('335',NULL,'PAREL','PT. PAREL TEHNIK UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('336',NULL,'PEIL','PETRUS LOEKITO,ARCH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('337',NULL,'PEIL ANUGRAH','PT. PEIL ANUGRAH ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('338',NULL,'PENDEKAR BODOH','PT. PENDEKAR BODOH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('339',NULL,'Pendi','PENDI B ASIM',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('340',NULL,'PERDANA','PT. PERDANA RANCANG BANGUN UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('341',NULL,'PERKASA ','PT. PERKASA GRAHA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('342',NULL,'PERMATA','PT. PERMATANUSA PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('343',NULL,'PESAT','PT. PESAT JAYA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('344',NULL,'PESONA','PT. PESONA TAMANINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('345',NULL,'PIRANASIA','PT. PIRANASIA IMPRESSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('346',NULL,'PLATBOARD','PT. PLATBOARD LUTDESINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('347',NULL,'POLA','POLA KARYA STUDIO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('348',NULL,'POLARAYA','POLA RAYA STUDIO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('349',NULL,'POWER SYSTEM ','PT. POWER SYSTEM INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('350',NULL,'POWERBLOK','PT. POWER BLOCK INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('351',NULL,'PRAKARSA UTAMA','CV.PRAKARSA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('352',NULL,'PRAMUNDARI','PRAMUNDARI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('353',NULL,'PRANA ','PT.PRANA INTI KARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('354',NULL,'PRASASTI','PT. PRASASTI KARYA SENTOSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('355',NULL,'PRATAMA','CV. PRATAMA MANDIRI SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('356',NULL,'PRIMAKON','PT. PRIMAKONSTRUKSI UTAMAJAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('357',NULL,'PRISMA','PT. PRISMA SARANA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('358',NULL,'PROMISCO','PT. PROMISCO SINERGI INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('359',NULL,'PUJO','PUJO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('360',NULL,'PULAU INTAN','PT. PULAUINTAN BAJA PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('361',NULL,'PURITEKNIK','PT. PURITEKNIK PERMATA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('362',NULL,'PURWOKO','PURWOKO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('363',NULL,'PUSAKA SINAR','PT. PUSAKA SINAR INTAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('364',NULL,'PUTRI ','PT. PUTRI INTAN ANUGERAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('365',NULL,'Q-PLUS','Q-PLUS POOL & SPA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('366',NULL,'QUANTUM','PT. QUANTUM NUSATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('367',NULL,'RABAY','RABAY',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('368',NULL,'RAGAM','PT. RAGAM KREASI SAPA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('369',NULL,'RAINBOW','PT. RAINBOW ASIA POSTERS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('370',NULL,'RAJAWALI','CV. RAJAWALI SUKSES PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('371',NULL,'RANTAU','PT. RANTAUSINDU',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('372',NULL,'RASAM','RASAM BIN KAMAN ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('373',NULL,'RAYNI','PT. ANUGRAH RAYNI SENTOSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('374',NULL,'REKA CIPTA','PT. REKA CIPTA BANGUN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('375',NULL,'RELINDO','PT. RELINDO UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('376',NULL,'REMIN','REMIN BIN ATMO SUKIJO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('377',NULL,'RESAKINDO','PT. RESAKINDO UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('378',NULL,'RETINDO','PT.RETINDO JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('379',NULL,'RIDEMASU','PT. RIDEMASU MULTI SOLUTION',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('380',NULL,'RIDEMATSU','PT. RIDEMATSU MULTI SOLUTION',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('381',NULL,'RIMANTARA','PT. RIMANTARA PUTRA PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('382',NULL,'RIMBUN','PT. RIMBUN ANGSANA NUANSA PERSADA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('383',NULL,'RIYANTO','RIYANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('384',NULL,'RONAPILAR','PT. RONAPILAR MULIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('385',NULL,'RONGGO','RONGGONOTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('386',NULL,'RUD','RUDI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('387',NULL,'RUDI','RUDI KURNIYANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('388',NULL,'RUSTAMAJI','RUSTAMAJI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('389',NULL,'SABA METROKARYA','PT. SABA METROKARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('390',NULL,'SABRINA','PT. SABRINA REKA BANGUN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('391',NULL,'SADI EMAD','SADI EMAD',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('392',NULL,'SAID HARMIYUZAR','SAID HARMIYUZAR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('393',NULL,'SALAMANDER','CV. SALAMANDER',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('394',NULL,'SAMUDERA','PT. SAMUDERA BERLIAN JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('395',NULL,'SANALI','PT. SANALI BANGUN LESTARI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('396',NULL,'SANDI ','SANDI GUNAWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('397',NULL,'SANGSAKA','PT. SANGSAKA AGUNG',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('398',NULL,'SANIRAN','SANIRAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('399',NULL,'SANTOSO','SANTOSO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('400',NULL,'SARANA','PT. SARANA TEKNIK INDAH ASRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('401',NULL,'SARANA BANGUN','PT. SARANA BANGUN GRIYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('402',NULL,'SARMA RAYA','PT. SARMA RAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('403',NULL,'SASA','PT. SINAR ALAM SEMESRA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('404',NULL,'SATRIA MANDIRI','PT. SATRIA MANDIRI UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('405',NULL,'SATRIA MAYANGKARA','PT. SATRIA MAYANGKARA SERVICE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('406',NULL,'SATRIACIPTA','PT. SATRIACIPTA PUTRAJAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('407',NULL,'SATU SOLUSI','PT. SATU SOLUSI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('408',NULL,'SAYAPMAS','PT. SAYAP MAS UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('409',NULL,'SBI','PT. SINAR BUMI INDAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('410',NULL,'SERUNI','PT. SERUNI HARUM MAS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('411',NULL,'SERVINDO','PT. SERVINDO GARDATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('412',NULL,'SERVISINDO','PT. SERVISINDO KUALITA PRIMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('413',NULL,'SETAR','PT.SETAR PRIMA TEKNIK',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('414',NULL,'SETUPA','SETUPA TEKMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('415',NULL,'SETYAWATI','SETYAWATI NUGRAHENI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('416',NULL,'SIGMA','PT.SIGMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('417',NULL,'SIHONO','SIHONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('418',NULL,'SINAR','PT. SINAR ABADI SEMESTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('419',NULL,'SINAR BUMI','PT. SINAR BUMI INDAH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('420',NULL,'SINAR CITRA','PT. SINAR CITRA SELARAS',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('421',NULL,'SINAR KARYA','SINAR KARYA MUTIARA CV',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('422',NULL,'SINDANG',' ',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('423',NULL,'SINERGI','PT. SINDANG KELINGI YUDISTIRA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('424',NULL,'SIRAJASA','PT. SINERGI USAHA BERSAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('425',NULL,'SIRKEL','PT. SIRAJASA BENTALATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('426',NULL,'SISTEK KARYA','PT. SIRKEL UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('427',NULL,'SISWANTO','PT. SISTEK KARYA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('428',NULL,'SLAMET','S. SISWANTO, SE',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('429',NULL,'SOLA GRACIA','SLAMET SUPRIYADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('430',NULL,'SOLUSI','PT. SOLA GRACIA JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('431',NULL,'SOMAD','PT. SOLUSI TEKNIKA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('432',NULL,'SSE','SOMAD',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('433',NULL,'STARCON','PT. SARANA STEEL ENGINEERING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('434',NULL,'STEFANUS ERIK','PT. STARCON ANUGRAH PRECASTPRODUCT',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('435',NULL,'SUBANDI','IR. STEFANUS ERIK PRATAMA, IPM',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('436',NULL,'SUDARMIN','SUBANDI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('437',NULL,'SUKSES','SUDARMIN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('438',NULL,'SUKSES AGUNG PERDANA','',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('439',NULL,'SULHADI','PT.SUKSES AGUNG PERDANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('440',NULL,'SULTAN ','SULHADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('441',NULL,'SULUNG','PT. SULTAN TRETES ADV.',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('442',NULL,'SUMAN JAYA','SULUNG DARMOKO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('443',NULL,'SUMBER KARYA','PT.SUMAN JAYA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('444',NULL,'SUMITON','PT. SUMBER KARYA ADVERTISING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `rekanan_groups` VALUES ('445',NULL,'SUNBASEL','PT. SUMITON MAKMUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('446',NULL,'SUPARDI','PT.SUNBASEL',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('447',NULL,'SUPERHELINDO','TOKO VIOSIE BERKAH CIBUBUR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('448',NULL,'SUPRIYONO','PT.SUPERHELINDO JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('449',NULL,'SURAJU','SUPRIYONO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('450',NULL,'SURYA','SURAJU',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('451',NULL,'SUTISNA','PT. SURYA GUNA CIPTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('452',NULL,'SUWARDI','SUTISNA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('453',NULL,'SUWARTO','SUWARDI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('454',NULL,'SUYANTO','SUWARTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('455',NULL,'SUYATNO','SUYANTO SUPRIATNA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('456',NULL,'SWASTIUNGGUL','SUYATNO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('457',NULL,'TALENTA','PT. SWASTI UNGGUL SUPLAINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('458',NULL,'TARGET','PT. TALENTA PUTRA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('459',NULL,'Tarumanagara','PT. TARGET KARYA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('460',NULL,'TASMANIA','PT. TARUMANAGARA BUMIYASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('461',NULL,'TATA BANGUN','PT. TASMANIA JAYA SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('462',NULL,'TATA GRIYA','PT. TATA BANGUN MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('463',NULL,'TB 3D','CV. TATA GRIYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('464',NULL,'TECHON','3D ARCHITECTURAL IMPRESSION ART',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('465',NULL,'TEKKEN','PT.TECHCON PRATAMA ABADI JAYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('466',NULL,'TEKOMINDO','PT. TEKKEN PRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('467',NULL,'TERANG','PT. TELEKOMINDO PRIMAKARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('468',NULL,'TESTANA','PT. TERANG INDAH LESTARI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('469',NULL,'TITIKINDAH','PT. TESTANA INDOTEKNIKA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('470',NULL,'TITISARI','PT. TITIK INDAH PERMAI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('471',NULL,'TODO','R R TITISARI HASTI W',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('472',NULL,'TONGGAK AMPUH','PT. TODO HUTAMA SENTOSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('473',NULL,'TONI','PT. TONGGAK AMPUH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('474',NULL,'TOTO','TONI WIDHYANTO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('475',NULL,'TOWNLAND','PT. SURYA PERTIWI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('476',NULL,'Tri3ch','PT. TOWNLAND INTERNASIONAL',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('477',NULL,'TRIARMILLA','TRI3CH ADVERTISING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('478',NULL,'TRIDAYA','PT. TRIARMILLA BETON PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('479',NULL,'TRIJAYA','PT. TRIDAYA WIBAWA MUKTI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('480',NULL,'TRIKARSA','PT. TRIJAYA CITRA PERDANA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('481',NULL,'TRIKARSA ANUGRAH','PT. TRIKARSA GRAHA DUTATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('482',NULL,'TRINITAS','PT. TRIKARSA ANUGRAH , JO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('483',NULL,'TRITUNGGAL','PT. TRINITAS ANUGRAH ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('484',NULL,'TULIP','PT. TRI TUNGGAL KARYA SATYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('485',NULL,'TUNAS SENTOSA','PT. TULIPMAS TRACO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('486',NULL,'UJANG','PT. TUNAS SENTOSA ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('487',NULL,'UMAR','H. UJANG SURYADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('488',NULL,'UNINDO','UMAR OKBERSON BAMBUTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('489',NULL,'UNION','PT. UNINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('490',NULL,'UNITAMA MULIA','PT. UTAMA KARYA SENTOSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('491',NULL,'UPTD','PT. UNITAMA MULIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('492',NULL,'USAHAGED','UPTD KEBERSIHAN KECAMATAN JATISAMPURNA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('493',NULL,'UTAMA SUBUR','PT. USAHA GEDUNG BANK DAGANG NEGARA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('494',NULL,'UTOMO','CV.Utama Subur',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('495',NULL,'Valentine','PT. UTOMO PRATAMA SEMESTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('496',NULL,'VISUAL','Valentine Triredjeki',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('497',NULL,'WACOS','PT. VISUAL KRASINDO',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('498',NULL,'WAHANA','PT. WACOS TOTAL ENGINEERING',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('499',NULL,'WAHANAKURANTA','PT. WAHANA INTI MAKMUR SEJAHTERA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('500',NULL,'WAHANAPAPAN','CV. WAHANA KURANTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('501',NULL,'WAHYU','PT. WAHANAPAPAN SEJATI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('502',NULL,'WALIS','PT. WAHYU ARTIKA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('503',NULL,'WANINDO','WALIS SURKA\'IN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('504',NULL,'WASECO','PT. WANINDO SENA PERKASA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('505',NULL,'WAYANG ','PT. WASECO TIRTA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('506',NULL,'WHIDITAMA','WAYANG MAKET',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('507',NULL,'WIFA','PT. WHIDITAMA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('508',NULL,'WiIBOWO','PT. WIFACANATA UTAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('509',NULL,'WILLCON','WIBOWO GUNAWAN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('510',NULL,'WILLY GUFRON','PT. WILLCONPRIMA PANELNUSA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('511',NULL,'WINDU','WILLY GUFRON',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('512',NULL,'WIRAGUNA','PT. WINDU PANCA KARYA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('513',NULL,'YOFA BANGUN','PT.WIRAGUNA JAYA MANDIRI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('514',NULL,'YONI ','PT. YOFA BANGUN ABADI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('515',NULL,'YUCCA','YONI',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('516',NULL,'YUSRI','PT. YUCCA WIRATAMA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('517',NULL,'ZAINIL','YUSRI RAUF',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('518',NULL,'ZEPPELIN','IR. ZAINIL ZEIN',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('519',NULL,'ZICO','CV. ZEPPELIN INDONESIA',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('520',NULL,'ZULPAKAR','ZICO DANIEL SARAGIH',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('521',NULL,'ZYSCO ','ZULPAKAR',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('522',NULL,'XXX','PT. ZYSCO INTERNASIONAL',NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `rekanan_rekenings` VALUES ('1','1','1','dummy','1000000001','auto created','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `rekanans` VALUES ('1','1',NULL,NULL,'jakarta',NULL,NULL,NULL,'021 - 548 2021','021 - 536 66723','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7265277','021-7265277','Risadi Bramantyo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 8189 7074','','ADBU SOMAD BUDIONO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-8623 9301','','ABI KUSMAWAN',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5',NULL,NULL,'jakarta',NULL,NULL,NULL,'081556602222','','MUCHAMAD MUNANDAR',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6',NULL,NULL,'jakarta',NULL,NULL,NULL,'0896 0182 1190','','ADE SUNARYA',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8346909','0251-8347686','H. Lianto Sutrisno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-72800245','021-7237349','Tantias Wiliyanti',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-29670560','021-29 339 188','Mochamad Ridwan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8886131','021-8847198','Umar Ali',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-733 0683, 335 58878, 0818 184588','','Ir. Hermanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-22870120','021-22870120','Edwin Agung Pratomo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13',NULL,NULL,'jakarta',NULL,NULL,NULL,'8002952 / 80888595 / 80880422','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14',NULL,NULL,'jakarta',NULL,NULL,NULL,'0852 8677 8691','','AGUS SETIAWAN',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Setia Bakty',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8091762','021-8000139','Juanda Awalsya',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17',NULL,NULL,'jakarta',NULL,NULL,NULL,'08121821610','','Yudi Harysuwandi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-861 0474/0637','021-866 06447/3582','ISMAIL, Y. SINAGA',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8657279','021-8657279','Edwin Fransiskus. S',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-84974134','021-84974135','Elvin Thaha',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-30171959 / 736 2639 Ext 309','021-7362583','Ruslam Rachmadi Pakki',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6614934,6690128','021-6626864','Ferry',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-837 06091 / 837 05334','021-837 01757','Ir. Budi Sumaatmadja',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-54350434','021-54350534','Parno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7500697','021-7500697','Anisa',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-93057500','','Anton Sudarsono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-290 21446','021-290 21443','Ir.Sentot Setiabudi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8329871','0251-8329871','Rina Tetha Toengkagi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-68149699','021-53157308','Ir. Sutarno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5316 2146','021-5316 2142','Apip',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-820 6232','021-820 6360','IR. Leonard H. Utama',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7486 8346','021-7486 8346','Iwan Herawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7796060','022-7270825','Diaz Dinillah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34',NULL,NULL,'jakarta',NULL,NULL,NULL,'0817 9453544','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35',NULL,NULL,'jakarta',NULL,NULL,NULL,'0274-798639','0274-798639','Rameadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36',NULL,NULL,'jakarta',NULL,NULL,NULL,'022-420 5705','022-420 5350','Ir. Robert Hadi K.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8355705 / 8295128','021-8295128','Ir. Hafid Mulyawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 2906 7180','021- 2906 7181','Ir.M. Subandi. IQSI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-68783562','021-68783562','Asep Sujiandi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7076 3627','021-544 1987','Hashim Taslim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-58906447','021-58906447/33880898','Ir. Harijadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7007 8272 / 0812 8880 8005','','ASIM SUPRIATNA',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43',NULL,NULL,'jakarta',NULL,NULL,NULL,'','021-','SARDI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('44','44',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 8388 5567','','MUHAMAD AZHAR',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('45','45',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-781 7507','021-781 7507','Ir.Zainil Zein',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('46','46',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-82428750 / 98295410','021-82428750','Boy Agus Surahman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('47','47',NULL,NULL,'jakarta',NULL,NULL,NULL,'0877 75524042','','Bambang Suryana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('48','48',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 1140 8892','','Bambang Purwono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('49','49',NULL,NULL,'jakarta',NULL,NULL,NULL,'0815 1398 5051','','BAMBANG ROSANTO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('50','50',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-87911007-87901434-8751711','021-87911006','H Jaya',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('51','51',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-84308819','021-84308819','Purwoko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('52','52',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-32358695 / 71006773','021-5462801','Ir. Budi Suharyo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('53','53',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-10686493','0812-10686493','Umar O. Bambuta, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('54','54',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-29017985 /0812 9026 9800','','BENNY HONG SIE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('55','55',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5310310','021-5310577','Andy Prasetyo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('56','56',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7097 4556','021-8798 5238','Ir. Tarsiban',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('57','57',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5401296 / 68385825','021-5401296','Allan Hioe',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('58','58',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-79198360','021-79196809','Eko Yudi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:53','2018-08-19 01:57:53',NULL,'1',NULL,NULL,NULL,NULL),  ('59','59',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 837 91186','021- 837 03954','Fanhera Hebson',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('60','60',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5867855/5857385','021-5495041','Danny',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('61','61',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-82480706','021-82492158','Dedy Rustam Effendy',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('62','62',NULL,NULL,'jakarta',NULL,NULL,NULL,'024-6583023','024-6583027','Sutiyarso BCS',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('63','63',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-538 3528','021-538 3528','Hj.Enning Tijastuty',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('64','64',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-23656319/23656320','021-62310479','Herman Yosef',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('65','65',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-877 83883','021-877 83883','Ir.Khoiri Aziz,MM,MRE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('66','66',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70738304 / 84977888','021-84977888','Bono Mulyono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('67','67',NULL,NULL,'jakarta',NULL,NULL,NULL,'0361-424471','','I. Putu Ari Purnawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('68','68',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7291118/7291119','021-7291121','Agus Hakim Asyahir',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('69','69',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4205076/4255545','021-4255549','Pudjianto Widjaya',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('70','70',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-18819814','0251-8222040','Dadang Zubaedi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('71','71',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70701619','021-7376705','Lioe Djit Boei',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('72','72',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-536 90111','021-53690222','Yuniar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('73','73',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-80875050','021-80885001','Robertus Yulianto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('74','74',NULL,NULL,'jakarta',NULL,NULL,NULL,'031-7341484/ 7343362','031-7328363 / 021-8795 1420','Ir. Hudijono Tjondrokoesoemo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('75','75',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-30177878','0813-30177878','Candra Kartanegara',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('76','76',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53163883','021-53163884','Cristina Suwardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('77','77',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-566 3130','021-566 1255','Mintarso Salim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('78','78',NULL,NULL,'jakarta',NULL,NULL,NULL,'081398701786','081398701786','Cepi Mulyana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('79','79',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4585 1031 / 9127 9678','021-4585 1082','Reni',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('80','80',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-87783883','021-87783883','Ir. Khoiri Aziz,MM,MRE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('81','81',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8493 3691','021-8493 3730','Rindy Firdiansyah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('82','82',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53163883','021-53163884','Cristina Suwardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('83','83',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-28946190','','Hery Unggul SB, ST',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('84','84',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 9828 8291','021- 8499 4870','Misran',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('85','85',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-844 5263','021-8459 6918','Beny Ardianto / Andreas Defi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('86','86',NULL,NULL,'jakarta',NULL,NULL,NULL,'5596 3655','5595 8211','Anwar Susanto, MT',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('87','87',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-83701042','','Rudiyanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('88','88',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5688188','','Hendra Yap',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('89','89',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7802778','021-7891405','Zuhri Latifudin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('90','90',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-33036967','021-5493377','Imron',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('91','91',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-82481991','82481992','Antonius Ari Nugroho',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('92','92',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 66671482 - 83','021-66671482','Sakli Oeyono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('93','93',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5442454/5444041','021-5442454','Ir. Gervasius Franky',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('94','94',NULL,NULL,'jakarta',NULL,NULL,NULL,'021 - 650 2819','021 - 6530 6665','Sulung Darmoko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('95','95',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-56969569','021-5666082','Arvin Nathaniel',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('96','96',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-84303325/84593210','021-84599494','Djemakun',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('97','97',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-580 3043','021-580 4855','Maya M.Chandradewi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('98','98',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5663130','021-5661255','Agus Salim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('99','99',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5577 4542','021-5577 4543','Ir. Halim Harjono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('100','100',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 865 0007 ','021- 8690 2019','CHANTAS WIGATY',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('101','101',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5803334,5635973','021-5803332,5802957','Ir. Ratna',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('102','102',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70831323','021-70831323','Dodi Budi Purwanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('103','103',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6009087','021-6018992','Yodho',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('104','104',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-74868386','021-74868386','Ir. Deddy Noya',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('105','105',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7788 6739','021-98636089','Darmono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('106','106',NULL,NULL,'jakarta',NULL,NULL,NULL,'081398279616','081398279616','DARNO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('107','107',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-570 2841','021-570 5274','Ivo Aristono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('108','108',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8825251 / 88374597','021-88374596','Indiyarti',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('109','109',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7278 6905','021-7278 6905','Ir. Margijanto Djumhari',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('110','110',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-819 5876','021-851 8275/84935822','Leo Hindarto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('111','111',NULL,NULL,'jakarta',NULL,NULL,NULL,'085-772276577','085-772276577','Dedah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('112','112',NULL,NULL,'jakarta',NULL,NULL,NULL,'081382655123','','Dedi Hidayat',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('113','113',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-99660226','','Dedy Lasta',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('114','114',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-666 91080','021-666 91070','Dodik ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('115','115',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 8430 7557 , 86614414, 84307430','021-8430 7461 , 86614415','Ir. Patar Tampubolon.SH',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('116','116',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 826 55123','','Tugiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('117','117',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8614375','021-8614375','Sugiyono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('118','118',NULL,NULL,'jakarta',NULL,NULL,NULL,'021 - 739 6404 / 739 7107','021 - 7205484','Iwan Santoso',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('119','119',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-26722525 / 79197343','021-45589897','Satya Pribadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('120','120',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812 9452437','','Deni Soburany R',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('121','121',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-861 4309','','Didy Hermawan, ST',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('122','122',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 4682 6490','021 - 4680 2295','Ir. Ridwan Sagala',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('123','123',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-30042081','021-30042081','Ir. Ismuntoro',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('124','124',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-73882420','','Inggar M. Basrewan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('125','125',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-73882420','','Inggar M. Basrewan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('126','126',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Didy Hermawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('127','127',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-3859576','021-3859590','Ir. Hermanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('128','128',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-36506299','021-62320092','Nico',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('129','129',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4618516, 4618386','021-4618515','Himawan Kembaren',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('130','130',NULL,NULL,'jakarta',NULL,NULL,NULL,'021 - 845 5417','021 - 8771-7439','Ir. Edison Sinaga/Romula',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('131','131',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5470725','021-5465406','Rudi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('132','132',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8487033/8450456','021-8469679','Tanti Sriantini',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('133','133',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6590804/6290461/6290484','021-6392804','Agus Hendro Cahyono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('134','134',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8604595','021-86613138','Drs. Inova Setijadi, Ssn',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('135','135',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5439 3886','','Haryanto / Chandra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('136','136',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-290 22266','021-290 22268','Handayani Nugroho',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('137','137',NULL,NULL,'jakarta',NULL,NULL,NULL,'0896 660 404 939','','Eddy Susilo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('138','138',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-9860448','','Eddy Susilo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('139','139',NULL,NULL,'jakarta',NULL,NULL,NULL,'081807897418','','Edi Junaedi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('140','140',NULL,NULL,'jakarta',NULL,NULL,NULL,'8249 3636','8249 2628','Dadang/Kha Cung',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('141','141',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('142','142',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-91894529','0813-10957027','Eman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('143','143',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8636253','0811 117093','C. Endang Sri Redjeki',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('144','144',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-14528256','0813-14528256','ENDANG KUSNADI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('145','145',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8489614 , 92906060','021-8489614','Suwardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('146','146',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-84937312','021-84937312','Surya Erwin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('147','147',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-45851728','021-45851729','ERAWATI GUNAWAN',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('148','148',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-630 435','0251-8630435','Pendi B Asim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('149','149',NULL,NULL,'jakarta',NULL,NULL,NULL,'087872293292','','FAJAR WIDIANTO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:54','2018-08-19 01:57:54',NULL,'1',NULL,NULL,NULL,NULL),  ('150','150',NULL,NULL,'jakarta',NULL,NULL,NULL,'0817-0000198','0817-0000198','Felix Tjahyadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('151','151',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-32 900 616/0815 1107 2748','021-32 900 616/0815 1107 2748','Fery Firmansyah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('152','152',NULL,NULL,'jakarta',NULL,NULL,NULL,'081294882886','','F.L AFIF YOSHIOKA',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('153','153',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-93679487','','Pujo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('154','154',NULL,NULL,'jakarta',NULL,NULL,NULL,'0816-1966603','021-73446324','Fridawati',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('155','155',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5940 5014','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('156','156',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8017164 / 84301077','021-8017164 / 84301077','Herry Suhartono, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('157','157',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 888 66606','021- 888 66609','Dodi Budi Purwanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('158','158',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-75873817','021-75873817','Teti Herawati',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('159','159',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7053 0753','021-564 2237','Bernard Tjahjadi, ST',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('160','160',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-567 3988','021-566 5874','B. Hendriyanto. T',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('161','161',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-57951342','021-5737534','Tomy Catur SE./ Ir. Dadang SH.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('162','162',NULL,NULL,'jakarta',NULL,NULL,NULL,'0815 86131474 / 0878 7355 0079','021-879 22231','Widya Karyaningtyas',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('163','163',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8230551,82495350','021-8230551','Sumihar Sitorus',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('164','164',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-769 2344','021-769 1322','Ir.Ami Utami',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('165','165',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8345 1929','021-8345 6419','Budi Susilo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('166','166',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 750 3667','021- 750 3669','Richard Nixon',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('167','167',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5382643/021-93031267','021-5382643','Weinarto Hoesin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('168','168',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Eliezer Widagdo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('169','169',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-56960155','021-56959305','Setiady Halim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('170','170',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-77212124','021-9216048','Sutriyono, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('171','171',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7872858','021-7869943','Arya Aji Pratignjo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('172','172',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 754 0760','021-754 0655','Noer Prabadhi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('173','173',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7078 0098','','Fajar Sodik',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('174','174',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 87743265 / 0812 191 3035  ','','H. UJANG SURYADI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('175','175',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5403392','','V Hadi Soetjiadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('176','176',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-66255075','021-6625076','Adrias Tanubrata',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('177','177',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-9827 4311 / 727 0036','021-7863 532','Ir. Handi Sudardja, M Eng',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('178','178',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70966909','021-73450648','Handoyo Jo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('179','179',NULL,NULL,'jakarta',NULL,NULL,NULL,'821.9526','021-821.9526','Hubertus Haba',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('180','180',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 82051365','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('181','181',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70780381','021-85905173','Hary Adenan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('182','182',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-45858967','021-45851064','Bp. Carla',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('183','183',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-844 4208','021-8451513','Bp. Carla P',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('184','184',NULL,NULL,'jakarta',NULL,NULL,NULL,'082136073904','','HERI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('185','185',NULL,NULL,'jakarta',NULL,NULL,NULL,'0856 7197141 / 0822 17814066','','HERMAN PELANI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('186','186',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-45865560','021-4586551','Raymond Hadianto H',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('187','187',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-640 4222, 9093 - 5','021-640 4221','Yendra Jong',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('188','188',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Sudarmin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('189','189',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-538 4920 - 21','021-538 4913','Robert Chia',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('190','190',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5384920-21','021-5384913','Robert Chia',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('191','191',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70832472 / 0818988663','021-7183406','Ridhwan Arief',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('192','192',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-86600931/8612328','021-86600931/86601979','Bernard. S, MT',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('193','193',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7986077','021-7986078','E. Kurniawan, S.SI.,MT',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('194','194',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5852667','021-5852667','Dedi Bunjamin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('195','195',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-94477941','','INDRA JUANLI RITONGA',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('196','196',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 7310 9045','','Sudarmin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('197','197',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70831323','021-70831323','Dodi Budi Purwanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('198','198',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('199','199',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812 940 1419','','Irwan Sukirno , S. AP. MM',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('200','200',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8456365','021-8456365','Jordi Tamba',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('201','201',NULL,NULL,'jakarta',NULL,NULL,NULL,'0856 828 7593','','Iwan Ridwan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('202','202',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-88321301','0818-486659','Iyan Asmana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('203','203',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-860 4176','','Jahja Noer Jusuf',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('204','204',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 18234668','','Jajang Rosyid',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('205','205',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 1823 4668','','Jajang Rosyid',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('206','206',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-788 40225','021-781 2546','Ir. Roswita Mulyaningsih, MS',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('207','207',NULL,NULL,'jakarta',NULL,NULL,NULL,'(021) 820 9117','0813 17476816','Jariman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('208','208',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Januri',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('209','209',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5553201, 5553212, 5553204','021-5553212','SAMUEL',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('210','210',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Hamid',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('211','211',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-44515000 / 44782247','021-8246386','Pirman Suharjo. ST',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('212','212',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-390 8501','021-390 8510','Ir. Yohannes Gunawan Halim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('213','213',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8636289','0251-8636289','Beny',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('214','214',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7562866/7564224','021-75870329','Bibit',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('215','215',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-81269977','0812-81269977','Jayadi Saputra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('216','216',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-86900108-9','021-86904411','Jessi Martino T',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('217','217',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-8479403','','M Arif Sujito',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('218','218',NULL,NULL,'jakarta',NULL,NULL,NULL,'081388279992','021-8604176','Jordi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('219','219',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5961131','021-59402624','Retno Damayanti',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('220','220',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5537978','021-5537943','Christine',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('221','221',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5324771','021-53447791/5359095','Tatang Hardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('222','222',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8190666/8506729','021-8506728','Ir. Gerry Arthur',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('223','223',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-441 6080','0812 9321833','Sutaryono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('224','224',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5926566','021-5580783','Rabay',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('225','225',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-84975352/84599132','021-84594606','Wawun Abdul Majid',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('226','226',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8458432','021-8448367','Christian Budiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('227','227',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-461-0521 / 7534788','461-0523 / 753 2330','Soemardi Tjandra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('228','228',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-3800052','021-3446386','Ir. Paul Retika, MSc',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('229','229',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-33965559','021-80877165','Ahmad T',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('230','230',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6570 3990','021-80877165','Mohamad Riyad',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('231','231',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8517174','021-80877165','Sumargono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('232','232',NULL,NULL,'jakarta',NULL,NULL,NULL,'08111460168',' ','Relan Masato',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('233','233',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-310 2317, 421 1138','021-65703950','Djoni',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('234','234',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-71579000','021-8572090','Paul L Iskandar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('235','235',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70907808 / 91691733','08111460168','Sukuanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('236','236',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-73452051','021-315 3720','Fendy Cristianto, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('237','237',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-55751132','021-54353212','Suparso',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('238','238',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878-83716969','021-5559531','LADIYO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('239','239',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53664162','021-73452051','Tambunan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('240','240',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8250365-8','021-55751132','Antonius Afandi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('241','241',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8531 60342','','David Lunardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('242','242',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-45851728','021-53663503','Erawati Gunawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('243','243',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 1121 5907','021-825 0369','IR. Lilik Sugijono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('244','244',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4584 1233/77','021- 531 61339','Liana Sulaeman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:55','2018-08-19 01:57:55',NULL,'1',NULL,NULL,NULL,NULL),  ('245','245',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7654978','021-45851729','Dipl. Ing. Sugiarto Sulaiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('246','246',NULL,NULL,'jakarta',NULL,NULL,NULL,'021 – 8591 0801/021-99001784','08158724417','Setyawati N',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('247','247',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 8867542 - 43','021-45850357','Irfan ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('248','248',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8430 7888','021-7654979','Wahyudi Utomo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('249','249',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-726 1526','','Romli',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('250','250',NULL,NULL,'jakarta',NULL,NULL,NULL,'082112014378 / 0895337659585','021-8841172','M. Lukman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('251','251',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4222161-2','021-844 3217','Andi N. Bandy',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('252','252',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-531 52624','021-726 5484','Slamet Santoso',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('253','253',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70923442,7402691','','Ibu Lala',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('254','254',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-44271274 / 44271275','021-4222352','Anwar Sulaiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('255','255',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-9031 6101','021-5315 2780, 5315 2624','Edi Subana Endra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('256','256',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5531 007','021-7402691','Hermanto Santoso SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('257','257',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-866 04383','021-44271275','Tumpal Naibaho, SE.MM',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('258','258',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-87742209','','Roni Nugroho',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('259','259',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8329871','021-5531 007','Walis Surka\'in',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('260','260',NULL,NULL,'jakarta',NULL,NULL,NULL,'087877539586/082260519686','','Maryanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('261','261',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7984537-8','021-87742209','Iman N.S',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('262','262',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-86058815','0251-8329871','Anton Sudarsono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `rekanans` VALUES ('263','263',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8778 3883','021-80885486','Ir. H. Khoiri Aziz, MM,MRE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('264','264',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8590 5173','021-7994252','Hary Adenan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('265','265',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5858309','','Ir.Silvia Unsulangi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('266','266',NULL,NULL,'jakarta',NULL,NULL,NULL,'081288808005','021-8778 3883','Asim Supriatna',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('267','267',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 319 91 193','','Denise Tjokrosaputro',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('268','268',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53152776','021-5858348','Slamet Santoso',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('269','269',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-737 7456 / 737 2330','021-70078272','I Made Dwi Payana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('270','270',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 653 06071, 658 33611, 689 15159','021-319 91 178','Nelcy Elvyanti',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('271','271',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-54350448 / 56945452','021-5315 2780','Lily Tan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('272','272',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-55958930/40','021-737 7456 / 737 2330','Riyan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('273','273',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5648020','021-653 06072','KA Tjin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('274','274',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4585 7638','021-54350449 / 56945452','Arifman Gulo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('275','275',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-861 5403','021-55958930','Deni Soburany R',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('276','276',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5902365-70','021-5648019','Bambang Hermanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('277','277',NULL,NULL,'jakarta',NULL,NULL,NULL,'0761-571568','021-4585 7639','Sufian Surdien',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('278','278',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-582 6178','021-8615403','Tjandra Budiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('279','279',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4683691 / 46836292','021-5902364,67/5924178','Sabam Gr',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('280','280',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-29081197,29081198','0761-571122','Hadi Suratin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('281','281',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-46837260 / 91264040','021- 582 3168','Bp.Dody Budi P',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('282','282',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-9306 5957','021-46836296','Wisnu Wardhana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('283','283',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-66671549','021-29081198','Eddy Kartolo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('284','284',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5256235','021-46837260','Mona Lembong',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('285','285',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-719 63155','021-8499 1289','Kamim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('286','286',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-45876453, 70050157','021-66671547','Ir. Sanjaya Suteja',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('287','287',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70301056','021-5256235','Muchamad Munandar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('288','288',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-870 6264','','Ir. Agustono E.P',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('289','289',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8810983','021-4584 0957','Ricky Harianto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('290','290',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-538 3961','021-71619747','Mitro Sujarno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('291','291',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-461 5314','021-870 6264','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('292','292',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8626359','021-8801103','Muhhamad Afandi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('293','293',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-769 7047','021-538 3961','Dpl. Ing Hadi Wiradarma ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('294','294',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5331601','021-4682 2992','Moenir Pamuncak',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('295','295',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7292844','','Mulyadi Aria Putra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('296','296',NULL,NULL,'jakarta',NULL,NULL,NULL,'082225672222','021-75909646','Muchamad Munandar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('297','297',NULL,NULL,'jakarta',NULL,NULL,NULL,'0818 0719 7258','','Muhamad Ikhsanudin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('298','298',NULL,NULL,'jakarta',NULL,NULL,NULL,'4800-839','021-7260809','Sikun',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('299','299',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-293 63768','087887107008','Andry Panata',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('300','300',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5490011/5347282','0818 0719 7258','Isparmo, ST',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('301','301',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-864 9219 / 0812 8820 3088','021-4800-838','Bambang Suprayitno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('302','302',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-71579000','021-293 63769','Paul L Iskandar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('303','303',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-86600902/86600912','021-5324322','Iman Mulyono, BBA',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('304','304',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53650036','021-864 9219','Harijanto Djojopranoto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('305','305',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6530 6799','021-5435212','Sulung Darmoko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('306','306',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5985847','021-8660913','Hormen Ngadiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('307','307',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53650036/53650050','021-53650037','Diana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('308','308',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-87922231','021-6471 6668','Widya Karyaningtyas',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('309','309',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 826 55123','021-5982572','Mulyono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('310','310',NULL,NULL,'jakarta',NULL,NULL,NULL,'0818 069 62100','021-53650037','Munasir',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('311','311',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-722 6640/1465','021-87922231','H. Endang Surachman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('312','312',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7691005','','Bpk. Rasiman ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('313','313',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-16536813','','Namid Yadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('314','314',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4216688','021-7279 6097','Ir. Budi Rusaldi S',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('315','315',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7011 0607 / 021-92761554','021-7691005','Petra Hartanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('316','316',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8430 1290 / 8430 1415','','Nopriyadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('317','317',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7531466 / 021-922 62199','021-4200077','Hari',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('318','318',NULL,NULL,'jakarta',NULL,NULL,NULL,'0821-432 41435','021-596 9227','Dimas Ari Wicaksana ST',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('319','319',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70301125','021-84590638','Nuryadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('320','320',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8193582/8193526/8199257','021-7531466','Hadi Winarto Ch.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('321','321',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812 1903 1912','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('322','322',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6592167 / 629',' ','Winny Aditya Lesmana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('323','323',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6592167','021-8193544','Winny',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('324','324',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-385 7653/345 9078','','Dicky Ossa Soeryadi / Ibnu',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('325','325',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-92697042','021-62305037','Haris Abdillah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('326','326',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 1867 6873 / 021 3368 1189','021-6235037','Paini',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:56','2018-08-19 01:57:56',NULL,'1',NULL,NULL,NULL,NULL),  ('327','327',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 5436 9723','021-386 2200/3483 5225','Timotius',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('328','328',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6252779 / 6252871','021-53152673','Alfon',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('329','329',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-68345888','0813 1867 6873 / 021 3368 1189','Indra Sugiarto, Mech. Eng',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('330','330',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813 9837 3755','021-5439 9535','Darmanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('331','331',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5801874','021-6296827','Yanuar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('332','332',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70755747','','Jumadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('333','333',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-72793982 /72795821','','Indri Widiyanti',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('334','334',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70199910','021-5801875','Paulus Sudjaeno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('335','335',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-319 34074','021-5397129','Ir. Sarfin Alfredo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('336','336',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-8211840','021-72793982','Petrus Loekito',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('337','337',NULL,NULL,'jakarta',NULL,NULL,NULL,'0816 88 8875 / Stefanus Erik','021-5380684','Ir. Hardi Vincent',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('338','338',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6583 4033','021-315 0786','Dennis Carl Tahitu',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('339','339',NULL,NULL,'jakarta',NULL,NULL,NULL,'0251-630 435','0251-8211761','Pendi B. Asim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('340','340',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6583 3838','','Budiono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('341','341',NULL,NULL,'jakarta',NULL,NULL,NULL,'','021-6471 1242','BENY K',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('342','342',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-88978783/88978776','','Masturi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('343','343',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4223038-43','021-640 0505','Hermain',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('344','344',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-775 8816','','Ir. Jansariden',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('345','345',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-58904290','021-88978776','H Antonius Rudy K',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('346','346',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-827 1576','021-4225613','Dodi Effendi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('347','347',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-94644488','021-775 1145','Irfan Syahputra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('348','348',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8453553/8455355','021-58904289','Deddy',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('349','349',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-22967521','021-827 1576','Kahlil Firdaus',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('350','350',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Ari Tri Budi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('351','351',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-567 5888/567 7387/567 6553','021-8455354','Agnes R / Dian',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('352','352',NULL,NULL,'jakarta',NULL,NULL,NULL,'0853-10034354','081332627250 (Andrias)','Pramundari',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('353','353',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 8778 3613','021-63862984','Rodhy Septiadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('354','354',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-567 8894','021- 567 7229','A. Imron',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('355','355',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-77886739','','Darmono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('356','356',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5439 4064 ','021- 8778 3612','Ir. Paulus Chandra',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('357','357',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8448621/98261137/93460030','021-567 8612','Ibu Zaqiyah Nur',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('358','358',NULL,NULL,'jakarta',NULL,NULL,NULL,'022-2536666','021-77886739','Ir. Andi Kartawiria,MT',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('359','359',NULL,NULL,'jakarta',NULL,NULL,NULL,'08158830122 / 081281466517','5437 2168/54377042','Pujo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('360','360',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5452489','021-8448621','Polly Tanudjaya',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('361','361',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53663235/53663206','022-2512333','Yadi Hidayat',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('362','362',NULL,NULL,'jakarta',NULL,NULL,NULL,'08174814728','','Purwoko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('363','363',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-3857653','021-5405734','Dicky Ossa Soeryadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('364','364',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53163470-71','021-53663206','Andrianto Hermawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('365','365',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5806645/58356674/68221789','','Ronald Gardjito IR.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('366','366',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6319077 / 6340111','021-386220/345835225','Donald M Satriobudi, BSc.Eng',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('367','367',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 86792323','021-5386607','RABAY',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('368','368',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8317118','021-58356674','Juliana Tan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('369','369',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5664110','021-6327488','Suryawati',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('370','370',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Benny Hong',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('371','371',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-3983 7544','021-8303059','Windu Priyo Wibowo, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('372','372',NULL,NULL,'jakarta',NULL,NULL,NULL,'081399309133','021-5663857','Rasam Bin Kaman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('373','373',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('374','374',NULL,NULL,'jakarta',NULL,NULL,NULL,'','021-3983 7317','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('375','375',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8778 0808','','Sutoto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('376','376',NULL,NULL,'jakarta',NULL,NULL,NULL,'0815 6461 2327','','REMIN BIN ATMO SUKIJO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('377','377',NULL,NULL,'jakarta',NULL,NULL,NULL,'765 7881','','Ir. Bambang S, Widodo/Suryo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('378','378',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8430 8023','021-8778 0909','Eko Tarko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('379','379',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7972593 / 7976350','','Sudrajat',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('380','380',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7972593/7976350/7972531','021-765 7863','Sudrajat',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('381','381',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-29283784','','Tri Hardiyanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('382','382',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5853748/5866029','021-7972625','KASDI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('383','383',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-8348 9436','021-7972625','RIYANTO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('384','384',NULL,NULL,'jakarta',NULL,NULL,NULL,'0231-636 161','021-29283785','Mujiono, SE/Ir. Raffles',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('385','385',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-93675339','021-5866030','Ronggonoto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('386','386',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 8581 5177','','RUDI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('387','387',NULL,NULL,'jakarta',NULL,NULL,NULL,'0815 14018188','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('388','388',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8249 4257','','RUSTAMAJI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('389','389',NULL,NULL,'jakarta',NULL,NULL,NULL,'0857 17160577','','Siti Arifah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('390','390',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7919 4131 ','','Teguh',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('391','391',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 86677826','021-7078 0864','SADI EMAD',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('392','392',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878-8678 1973/0821-1022 9973','','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('393','393',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-46826293,46826190','021-84305071','Asnawi Bangun',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('394','394',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-452 7475','','Thomas',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('395','395',NULL,NULL,'jakarta',NULL,NULL,NULL,'','','Yudi Ali',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('396','396',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-95479040','021-46826493','SANDI GUNAWAN',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('397','397',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-86607587','021-453 0856','Mery Yovita. H/Abdul Wahab',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('398','398',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-1117 4579','',' ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('399','399',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-8084 8270','','SANIRAN',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('400','400',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-9163332/081315013490','021-86607587','SANTOSO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('401','401',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70301155','','Simbolon',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('402','402',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5491095, 5851891','','Ir. Agus Susanto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('403','403',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-9993 6925','021-89835825','Monica',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('404','404',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-765 4984 / 75816232','021-82616134','Alamsyah Thhia, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('405','405',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8772 1956','021-5851891','M. Witia Sakti A.S, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('406','406',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-537 1655','021-5574 9425','Yudhi Prasetio',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('407','407',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-85911495','021-7654984','Sunarto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('408','408',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-420 2686 / 96','021-8772 1956','Daud Suryamansyah',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('409','409',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 553 7943 / 7996','021-537 3421','Eko Dharma',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('410','410',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6619358','021-8520670','Kareen Nathani',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('411','411',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-60592187','021- 4606273','Ir. Taufik Rahardja',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('412','412',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-64703214','021-553 7943','Masrul Chaniago, S.Sos',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('413','413',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8430 4870','021-6694181','Fuad Firdaus',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('414','414',NULL,NULL,'jakarta',NULL,NULL,NULL,'081380318500','021-84992187','Kota Gabriel Sembiring',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('415','415',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7751145','','Purwoko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('416','416',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-390 8501','021-8430 4875','Setyawati',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:57','2018-08-19 01:57:57',NULL,'1',NULL,NULL,NULL,NULL),  ('417','417',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8414814','0818743365','Marcel Rusli',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('418','418',NULL,NULL,'jakarta',NULL,NULL,NULL,'841 4814','','Sihono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('419','419',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-56958461/62, 021-5337943/96','021-390 8510','Sihono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('420','420',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8360 3233, 941 00865','0818753066','Shiou Chang',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('421','421',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-14296683','','Ir. Lingga Dana, MM',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('422','422',NULL,NULL,'jakarta',NULL,NULL,NULL,' ','021-5337943/ 021-56958463','Suwardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('423','423',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-51279565 / 082111192811','021-865 1381',' ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('424','424',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 8491 6386','021-84308059','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('425','425',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-73886717/73886630',' ','Dodi Budi P.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('426','426',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7807630','','Raymond Sarwono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('427','427',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-29029064,29029054','','Ir. Hairul',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('428','428',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-93704639','021-73886630','Ir. Jacob Liusri',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('429','429',NULL,NULL,'jakarta',NULL,NULL,NULL,'08129185928','021-7807633','S. Siswanto, SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('430','430',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-88356778 / 23867757','021-29029054','Slamet Supriyadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('431','431',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5330307-08','','Fatmawati',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('432','432',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-88856510','','Oswin Skani Hardiman',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('433','433',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-4682 6589','','SOMAD',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('434','434',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-54205209','021-5330309','Sudjono Warsito',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('435','435',NULL,NULL,'jakarta',NULL,NULL,NULL,'0816888875','','T. Mutiana Fan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('436','436',NULL,NULL,'jakarta',NULL,NULL,NULL,'081318885585','021-4609679','Ir. Stefanus Erik Pratama, IPM',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('437','437',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 7310 9045','021-54205204','Subandi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('438','438',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5694 0102','0816888875','Sudarmin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('439','439',NULL,NULL,'jakarta',NULL,NULL,NULL,'0815-10660774 / 0812-8368880','081318885585','Nathan Setiawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('440','440',NULL,NULL,'jakarta',NULL,NULL,NULL,'0817-666 1345','','Nathan Setiawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('441','441',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8453350/98500400/98500600','021-5696 4894','SULHADI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('442','442',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6502819/65306799','021-569 64894','Hillarius J. Basuki, SH',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('443','443',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8673428','','Sulung Darmoko',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('444','444',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-75907164','021-8453351','Karina Agustin',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('445','445',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 70514198, 53121239','021-64716668','Sugeng Kartadiwirja',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('446','446',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 839 29200','021-8673428','Anton',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('447','447',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-163229990','021-75917664','Komar',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('448','448',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-631 84445','021-53121239','Supardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('449','449',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-10261541 / 021-977 22755 ','021- 866 02557 / 866 15372','Sugiono Nursalim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('450','450',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70138047','0812-163229990','SUPRIYONO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('451','451',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7388 3688','021-632 6288','Bpk. Suraju',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('452','452',NULL,NULL,'jakarta',NULL,NULL,NULL,'08122880213','','Teguh Wasis P',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('453','453',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812 8836 3232','','Sutrisno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('454','454',NULL,NULL,'jakarta',NULL,NULL,NULL,'','021-7394 994','SUWARDI',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('455','455',NULL,NULL,'jakarta',NULL,NULL,NULL,'0878 82712426','','SUWARTO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('456','456',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-874 1273','','Suyanto Supriatna',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('457','457',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6231 3729','','SUYATNO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('458','458',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-82600366/867/383','','Ir.  Nurhaeni Setiawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('459','459',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8459 1889','021-8741273','Ir. Marihat Haloho',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('460','460',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5321547,5308689-90','021-6231 1409','Soekirno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('461','461',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-580 6090','021-82601327/82602308','Ir. Sudioto Susilo, MSCE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('462','462',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6319975','021-845 4368','Ir. Yahya Permana',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('463','463',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5863847','021-5481413','Ir. Justan Luhut Pardede',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('464','464',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-878 8332','021-580 6089','Achmad Kasrumi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('465','465',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-420 3324','021-6319975','Ratyanus Rombe',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('466','466',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-79181743','021-5863847','Andi N Bandi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('467','467',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7813747','','Hairull Hasan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('468','468',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5719578','021- 42804399','Fajar Sodik',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('469','469',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-58902053-4','021-79181243','Jahnny Natawidjaya',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('470','470',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-754 4082','021-78838572','Paulus P Raharjo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('471','471',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-450 2854 / 0812 9141 727','021-5734830','Ir. Indra Budihardjo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('472','472',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-845 6305','021-58902053-4','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('473','473',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-790 0232','021-753 3577','Ir. Roswita Mulyaningsih, MS',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('474','474',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-560 4683','','Rudy Santosa',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('475','475',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5680034, 5680035','021. 840 8184','MARTHA WIDHYANTO',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('476','476',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-39837470','021-790 0230','Ricard',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('477','477',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8430 7733','','Johannes Hendrik Spies (Mr.)',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('478','478',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-87783883','021-5680068','',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('479','479',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-98568969/8202130','021-39837471','Deskawati D',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('480','480',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-53127725/70623351/98254581','021-8430 7733','Jumarin Hadisaputro',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('481','481',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8611574','021-87783883','Ir. Suseno',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('482','482',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8611574','021-82605372','Muhammad Rifki S.Mn.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('483','483',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-2940 8077-78','021-53127725','Muhammad Rifki, S.Mn.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('484','484',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5315 1886','021-8611574','Ir. Hadi Vincent',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('485','485',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5372915, 37177400','021-8611574','Dendhy',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('486','486',NULL,NULL,'jakarta',NULL,NULL,NULL,' ','021-2940 8079','Diana R. Mewengkang',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('487','487',NULL,NULL,'jakarta',NULL,NULL,NULL,'350-2362 / 63','',' ',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('488','488',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-87743265 / 0812 191 3035','021-5372915','Rudi Chandra SE',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('489','489',NULL,NULL,'jakarta',NULL,NULL,NULL,'0813-19226342',' ','H. Ujang Suryadi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('490','490',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-98521972/92850148','021-3483-4106','Umar O. Bambuta, SE.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('491','491',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-75877700','','Mariana Setjokusumo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:58','2018-08-19 01:57:58',NULL,'1',NULL,NULL,NULL,NULL),  ('492','492',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-600 6481','','Vivien Indriyani',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('493','493',NULL,NULL,'jakarta',NULL,NULL,NULL,'','021-47867802','Swandaniel AT Wibowo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('494','494',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-230 0800, 390 2020','021-75877771 / 2','Erfan Hikmatullah, SH, Msi.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('495','495',NULL,NULL,'jakarta',NULL,NULL,NULL,'021- 8249 4257','021- 601 9902','DRS. H Mudjadi H. MA/Sudibyo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('496','496',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-6319975','','Bp.Somad',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('497','497',NULL,NULL,'jakarta',NULL,NULL,NULL,'','021-230 2752','F. Fendy Utomo',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('498','498',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7663743','021- 7078 0864','Valentine Triredjeki',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('499','499',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-887 5425 ','021-6319975/021-63864219','Lidia Ramersan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('500','500',NULL,NULL,'jakarta',NULL,NULL,NULL,'0263.515.045','','Syafrial',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('501','501',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7057 9869','021-7663446','Wim Soewarno/Edi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('502','502',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-735 4644','021-8887 7726','Sugeng Wahono',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('503','503',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-7717572','','Suwardi',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('504','504',NULL,NULL,'jakarta',NULL,NULL,NULL,' ','021-8249 5220/84302448','Ir. Ahmad Arief',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('505','505',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-453 1835','0263.515.045','Walis Surka\'in',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('506','506',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-739 4443','021-7717572','Ichwan S.B. Dipl. Ing',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('507','507',NULL,NULL,'jakarta',NULL,NULL,NULL,'024-8314561','0251-8329871','Ir. Budi Sutjahjo, MT, IPM',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('508','508',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-770 9632/7884 4262','021-450 1475','Ir.Ribka L.Harini D',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('509','509',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-70789871','021-739 4434','Ir. Victor, H. Manurung',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('510','510',NULL,NULL,'jakarta',NULL,NULL,NULL,'031-5312641','024-8412475','Wahyu Yudha P.',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('511','511',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-628 6068/1886-7','021-778 34857/780 6005','Ir. Wibowo Gunawan, MSP',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('512','512',NULL,NULL,'jakarta',NULL,NULL,NULL,'08179303090','021-82442299','Puji Adam/Sudarto',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('513','513',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-58907440','031-5346731','Willy Gufron',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('514','514',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-834 22816 / 855 84859','021-628 1951','Yongki Widjaja',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('515','515',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-750 4009','08179303090','Windu Muchrim',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('516','516',NULL,NULL,'jakarta',NULL,NULL,NULL,'08170168626','021-5870572','Yohanes Fransisco',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('517','517',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-5374569','','Yoni',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('518','518',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-801 5445','021-750 4009','C. Endang Sri Redjeki',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('519','519',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-781 7507','','Yusri Rauf',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('520','520',NULL,NULL,'jakarta',NULL,NULL,NULL,'021-8261 6451','021-5374809/0251-8636253','Zainil Zein',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('521','521',NULL,NULL,'jakarta',NULL,NULL,NULL,'0812-8218225','0813 18078100','Tony Irawan',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('522','522',NULL,NULL,'jakarta',NULL,NULL,NULL,'0852 8013 4250','021-7817507','Zico Daniel Saragih',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `rooms` VALUES ('1','9','38','Room Meeting1','2018-08-31 09:02:53','2018-08-31 09:02:53',NULL,'1',NULL,NULL,NULL,NULL),  ('2','9','38','Room Meeting 2','2018-08-31 09:03:13','2018-08-31 09:03:13',NULL,'1',NULL,NULL,NULL,NULL),  ('3','9','38','Room Meeting 3','2018-08-31 09:03:25','2018-08-31 09:03:25',NULL,'1',NULL,NULL,NULL,NULL),  ('4','9','38','Room Meeting 4','2018-09-24 15:32:12','2018-09-24 15:32:12',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `spk_details` VALUES ('1','1','1','App\\ProjectKawasan',NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3','9','App\\Project',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4','9','App\\Project',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5','9','App\\Project',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10','9','App\\Project',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11','9','App\\Project',NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14','9','App\\Project',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22','9','App\\Project',NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30','9','App\\Project',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35','9','App\\Project',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38','9','App\\Project',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39','9','App\\Project',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41','1','App\\ProjectKawasan',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42','9','App\\Project',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43','9','App\\Project',NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `spk_types` VALUES ('1','normal','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `spks` VALUES ('1','9','1',NULL,NULL,NULL,'039/SBM/1/1.12.5/II/15','2015-02-23','Pembuatan Konsol Grille Tanaman di Area Taman MO Perumahan Citra Gran Cibubur','2015-02-23','2015-02-23',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','9','1',NULL,NULL,NULL,'044/SBM/1/1.4.4/III/15','2015-03-02','Bongkar Aspal Depan MO Baru Perumahan Citra Gran Cibubur','2015-03-02','2015-03-02',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','9','1',NULL,NULL,NULL,'057/SBM/1/1.27.3/III/15','2015-03-23','Kaca Marketing Office Perumahan Citra Gran Cibubur','2015-03-23','2015-03-23',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','9','1',NULL,NULL,NULL,'113/SBM/1/1.11.4/VI/15','2015-06-12','Pot Pedestal Patung Balet Perumahan Citra Gran Cibubur','2015-06-12','2015-06-12',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','9','1',NULL,NULL,NULL,'122/SBM/1/1.2.4/VI/15','2015-06-26','Striping Lahan Citragran Utara di Perumahan Citragran Cibubur','2015-06-26','2015-06-26',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','9','1',NULL,NULL,NULL,'129/SBM/1/1.4.4/VII/15','2015-07-09','Pasang Plint GRC Rangka Hollow di JPO Mall Citra Gran Cibubur','2015-07-09','2015-07-09',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','9','1',NULL,NULL,NULL,'140/SBM/1/41.3.4/VIII/15','2015-08-11','Bongkar Pagar Arkon di Blok RC Ext. Perumahan Citra Gran Cibubur','2015-08-11','2015-08-11',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','9','1',NULL,NULL,NULL,'146/SBM/1/41.4.4/VIII/15','2015-08-19','Cut Fill, Jalan dan Saluran Blok RC Ext. Perumahan Citra Gran Cibubur','2015-08-19','2015-08-19',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9','1',NULL,NULL,NULL,'154/SBM/1/41.3.4/VIII/15','2015-08-31','Pembuatan Rangka Pagar (Baja Ringan) Cluster RC Extention Perumahan Citra Gran Cibubur','2015-08-31','2015-08-31',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','9','1',NULL,NULL,NULL,'156/SBM/1/1.13.4/IX/15','2015-09-01','Pembuatan Pos Jaga Besi (Moveable) di Lahan Citra Gran Utara Perumahan Citra Gran Cibubur','2015-09-01','2015-09-01',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','9','1',NULL,NULL,NULL,'164/SBM/1/1.1.7/IX/15','2015-09-14','Soil Test di Area Citra Gran Utara','2015-09-14','2015-09-14',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','9','1',NULL,NULL,NULL,'170/SBM/1/1.6.6/IX/15','2015-09-22','Pemasangan SR Air Bersih dan Pengadaan Meter Air 86 Unit Perumahan Citra Gran Cibubur','2015-09-22','2015-09-22',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','9','1',NULL,NULL,NULL,'189/SBM/1/1.12.5/X/15','2015-10-23','Tanam Rumput Gajah Mini di Rumah-rumah yang akan ST Perumahan Citra Gran Cibubur','2015-10-23','2015-10-23',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','9','1',NULL,NULL,NULL,'203/SBM/1/2.2.4/XI/15','2015-11-06','Cut Fill Lahan Blok E18 No. 37 Perumahan Citra Gran Cibubur','2015-11-06','2015-11-06',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','9','1',NULL,NULL,NULL,'229/SBM/1/1.3.4/XII/15','2015-12-15','Pagar Pembatas Gardu PLN Perumahan Citra Gran Cibubur','2015-12-15','2015-12-15',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','9','1',NULL,NULL,NULL,'234/SBM/1/41.6.6/XII/15','2015-12-17','Jaringan Air Bersih di Blok RC Ext Perumahan Citra Gran Cibubur','2015-12-17','2015-12-17',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','9','1',NULL,NULL,NULL,'231/SBM/1/41.6.6/XII/15','2015-12-18','Jaringan Sprinkler di Blok RC Ext Perumahan Citra Gran Cibubur ','2015-12-18','2015-12-18',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','9','1',NULL,NULL,NULL,'232/SBM/1/1.6.6/XII/15','2015-12-18','Jaringan Air Bersih Gereja POUK Perumahan Citra Gran Cibubur ','2015-12-18','2015-12-18',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','9','1',NULL,NULL,NULL,'233/SBM/1/41.5.6/XII/15','2015-12-18','Jaringan Sparing M/E di Blok RC Ext Perumahan Citra Gran Cibubur ','2015-12-18','2015-12-18',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','9','1',NULL,NULL,NULL,'235/SBM/1/41.5.6/XII/15','2015-12-18','Jaringan Listrik di Blok RC Ext Perumahan Citra Gran Cibubur ','2015-12-18','2015-12-18',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','9','1',NULL,NULL,NULL,'237/SBM/1/1.3.4/XII/15','2015-12-22','Pemagaran Beton Panel di Batas Tanah JATIRANGGA Tahap 3 ( Panjang 180 m\' ) Perumahan Citra Gran Cibubur','2015-12-22','2015-12-22',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','9','1',NULL,NULL,NULL,'017/SBM/1/1.27.3/I/16','2016-01-27','Paket Layanan Hygiene Service ( Pengharum Spray ) Marketing Office Periode 29 Januari 2016 - 29 Januari 2017 Perumahan Citra Gran Cibubur','2016-01-27','2016-01-27',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','9','1',NULL,NULL,NULL,'023/SBM/1/41.12.5/II/16','2016-02-04','Penanaman Rumput Gajah Blok E-18 Perumahan Citra Gran Cibubur','2016-02-04','2016-02-04',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','9','1',NULL,NULL,NULL,'055/SBM/1/41.6.6/III/16','2016-03-31','Jaringan Air Bersih Blok E-18 Perumahan Citra Gran Cibubur','2016-03-31','2016-03-31',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','9','1',NULL,NULL,NULL,'056/SBM/1/41.5.6/III/16','2016-03-31','Jaringan Listrik Blok E-18 Perumahan Citra Gran Cibubur','2016-03-31','2016-03-31',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','9','1',NULL,NULL,NULL,'070/SBM/1/41.7.6/IV/16','2016-04-14','Pasang Jaringan Telp ( SR ) Blok RC Extention Perumahan Citra Gran Cibubur','2016-04-14','2016-04-14',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','9','1',NULL,NULL,NULL,'096/SBM/1/1.6.6/V/16','2016-05-30','Pemasangan SR Air Bersih dan Pengadaan Meter Air 55 Unit Perumahan Citra Gran Cibubur','2016-05-30','2016-05-30',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','9','1',NULL,NULL,NULL,'133/SBM/1/41.12.5/VIII/16','2016-08-05','Taman Lingkungan Blok RC Perumahan Citra Gran Cibubur','2016-08-05','2016-08-05',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','9','1',NULL,NULL,NULL,'151/SBM/1/41.5.6/IX/16','2016-09-06','Pasang Kwh Meter PLN Blok RC Ext Perumahan Citra Gran Cibubur','2016-09-06','2016-09-06',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','9','1',NULL,NULL,NULL,'159/SBM/1/1.27.3/IX/16','2016-09-09','Perbaikan Marketing Office Perumahan Citra Gran Cibubur','2016-09-09','2016-09-09',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','9','1',NULL,NULL,NULL,'206/SBM/1/41.3.4/XI/16','2016-11-18','Pembuatan Pagar Keliling Blok RC Perumahan Citra Gran Cibubur','2016-11-18','2016-11-18',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','9','1',NULL,NULL,NULL,'201/SBM/1/41.4.4/XI/16','2016-11-25','Pasang Paving Abu-abu T=8 Cm di Blok RC 01 No. 16 Perumahan Citra Gran Cibubur','2016-11-25','2016-11-25',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','9','1',NULL,NULL,NULL,'217/SBM/1/41.12.5/XII/16','2016-12-16','Taman Blok RC Perumahan Citra Gran Cibubur','2016-12-16','2016-12-16',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34','9','1',NULL,NULL,NULL,'221/SBM/1/41.4.4/XII/16','2016-12-27','ACWC t = 3 cm di Blok RC Ext Perumahan Citra Gran Cibubur','2016-12-27','2016-12-27',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','9','1',NULL,NULL,NULL,'049/SBM/1/1.16.3/IV/17','2017-04-16','Renovasi Musholla At-Taubah, Masjid Al-Ittihadiyah, Musholla Misbahussholihin Rawa Buaya Jakarta Barat','2017-04-16','2017-04-16',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','9','1',NULL,NULL,NULL,'064/SBM/1/1.6.6/V/17','2017-05-17','Pemasangan SR Air Bersih dan Pengadaan Meter Air 91 Unit Perumahan Citra Gran Cibubur','2017-05-17','2017-05-17',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','9','1',NULL,NULL,NULL,'072/SBM/1/1.5.6/VI/17','2017-06-07','Pemasangan Penangkal Petir di Kantor MO Citra Gran Cibubur','2017-06-07','2017-06-07',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','9','1',NULL,NULL,NULL,'093/SBM/1/1.1.8/VII/17','2017-07-24','Pembuatan Gambar Design Gerbang Utama Perumahan CitraGran','2017-07-24','2017-07-24',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','9','1',NULL,NULL,NULL,'094/SBM/1/34.1.8/VII/17','2017-07-24','Pembuatan Gambar Kerja Rumah Type Lebar 5m, 2 lt, 2 Kmr Tidur dan 3 Kmr Tidur ','2017-07-24','2017-07-24',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','9','1',NULL,NULL,NULL,'089/SBM/1/41.7.6/VII/17','2017-07-26','Pasang CCTV Fasilitas Umum Blok RC Ext.ke Pos Security.','2017-07-26','2017-07-26',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','9','1',NULL,NULL,NULL,'101/SBM/1/41.7.6/VIII/17','2017-08-04','Pasang Perangkat Panic Button dan Penambahan Kabel UTP, di Blok RC Ext.','2017-08-04','2017-08-04',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','9','1',NULL,NULL,NULL,'131/SBM/1/1.13.4/IX/17','2017-09-25','Kanopi parkir motor di depan kantor Security','2017-09-25','2017-09-25',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','9','1',NULL,NULL,NULL,'165/SBM/1/1.27.3/XI/17','2017-10-06','Bongkar Pasang Rangka Kaca Ruang Meeting Lantai 2 Kantor CitraGran','2017-10-06','2017-10-06',NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `spkvo_units` VALUES ('1','1','1','App\\Spk',NULL,'1','2061856.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2','2','App\\Spk',NULL,'2','4637500.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3','3','App\\Spk',NULL,'3','62757000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4','4','App\\Spk',NULL,'4','4600000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5','5','App\\Spk',NULL,'5','180000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6','6','App\\Spk',NULL,'6','8400000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7','7','App\\Spk',NULL,'7','24860000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8','8','App\\Spk',NULL,'8','511854545.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9','9','App\\Spk',NULL,'9','29000000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10','10','App\\Spk',NULL,'10','18556701.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11','11','App\\Spk',NULL,'11','35000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12','12','App\\Spk',NULL,'12','54180000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13','13','App\\Spk',NULL,'13','11440769.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14','14','App\\Spk',NULL,'14','64524545.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15','15','App\\Spk',NULL,'15','27500000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16','16','App\\Spk',NULL,'16','142500000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17','17','App\\Spk',NULL,'17','75000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18','18','App\\Spk',NULL,'18','19000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19','19','App\\Spk',NULL,'19','106000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20','20','App\\Spk',NULL,'20','218000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21','21','App\\Spk',NULL,'21','57600000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22','22','App\\Spk',NULL,'22','3960000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23','23','App\\Spk',NULL,'23','5600280.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24','24','App\\Spk',NULL,'24','22500000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25','25','App\\Spk',NULL,'25','25000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26','26','App\\Spk',NULL,'26','20000000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27','27','App\\Spk',NULL,'27','34650000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28','28','App\\Spk',NULL,'28','64000000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29','29','App\\Spk',NULL,'29','51691000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30','30','App\\Spk',NULL,'30','30024329.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31','31','App\\Spk',NULL,'31','95340550.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32','32','App\\Spk',NULL,'32','7500553.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33','33','App\\Spk',NULL,'33','46145455.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34','34','App\\Spk',NULL,'34','90415000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35','35','App\\Spk',NULL,'35','71428571.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36','36','App\\Spk',NULL,'36','57330000.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37','37','App\\Spk',NULL,'37','17272727.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38','38','App\\Spk',NULL,'38','36363636.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39','39','App\\Spk',NULL,'39','10400000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40','40','App\\Spk',NULL,'40','15686458.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41','41','App\\Spk',NULL,'41','18867500.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42','42','App\\Spk',NULL,'42','24320000.00',NULL,'1.00',NULL,'0.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43','43','App\\Spk',NULL,'43','15487070.00',NULL,'1.00',NULL,'0.10','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `status_permintaans` VALUES ('1','Assets','2018-08-20 15:05:24','2018-09-25 09:39:50','2018-09-25 09:39:50',NULL,'1','1',NULL,NULL),  ('2','Pinjam','2018-08-20 15:05:27','2018-08-20 15:05:35',NULL,NULL,NULL,NULL,NULL,NULL),  ('3','Pakai Habis kali','2018-08-20 15:05:30','2018-09-25 09:38:04',NULL,NULL,'1',NULL,NULL,NULL);
INSERT INTO `templatepekerjaans` VALUES ('1','RL','0','Rumah Lama','0.00','0.00','0','Template untuk rumah lama hasil migrasi data.','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('2','FK','0','Fasilitas Kota','0.00','0.00','0','Untuk pembangunan fasilitas kota.','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `unit_arahs` VALUES ('1','utara',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('2','selatan',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('3','barat',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('4','timur',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `unit_progresses` VALUES ('1',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'2061856.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'4637500.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'62757000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'4600000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'180000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'8400000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'24860000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'511854545.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'29000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'18556701.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'35000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('12',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'54180000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'11440769.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'64524545.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'27500000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'142500000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'75000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'19000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'106000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'218000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'57600000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'3960000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'5600280.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'22500000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'25000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'20000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'34650000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'64000000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'51691000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'30024329.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'95340550.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'7500553.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'46145455.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('34',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'90415000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'71428571.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'57330000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'17272727.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'36363636.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'10400000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'15686458.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41',NULL,'1','App\\ProjectKawasan',NULL,NULL,NULL,NULL,NULL,'18867500.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'24320000.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43',NULL,'9','App\\Project',NULL,NULL,NULL,NULL,NULL,'15487070.00','1',NULL,NULL,'0','1','3.00','3.00',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `unit_types` VALUES ('1','Calinda',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('2','Amanda',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL),  ('3','Smith',NULL,'2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `user_details` VALUES ('1','1','1','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','1','2','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('3','1','3','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','4','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('5','1','5','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('6','1','6','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','7','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('8','1','8','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('9','1','9','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('10','1','10','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('11','1','11','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('12','1','12','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('13','1','13','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('14','1','14','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('15','1','15','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('16','1','16','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('17','1','17','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('18','1','18','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('19','1','19','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('20','1','20','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('21','1','21','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('22','1','22','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('23','1','23','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('24','1','24','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('25','1','25','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('26','1','26','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('27','1','27','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('28','1','28','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('29','1','29','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('30','1','30','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('31','1','31','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('32','1','32','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('33','1','33','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('34','1','34','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('35','1','35','1','1','1','dummy','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('36','1','36','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('37','1','37','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('38','1','38','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('39','1','39','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('40','1','40','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('41','1','41','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('42','1','42','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('43','1','43','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('44','1','44','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('45','1','45','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('46','1','46','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('47','1','47','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('48','1','48','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('49','1','49','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('50','1','50','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('51','1','51','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('52','1','52','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('53','1','53','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('54','1','54','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('55','1','55','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('56','1','56','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('57','1','57','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('58','1','58','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('59','1','59','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('60','1','60','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('61','1','61','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('62','1','62','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('63','1','63','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('64','1','64','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('65','1','65','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('66','1','66','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('67','1','67','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('68','1','68','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('69','1','69','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('70','1','70','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('71','1','71','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('72','1','72','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('73','1','73','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('74','1','74','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('75','1','75','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('76','1','76','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('77','1','77','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('78','1','78','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('79','1','79','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('80','1','80','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('81','1','81','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('82','1','82','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('83','1','83','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('84','1','84','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('85','1','85','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('86','1','86','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('87','1','87','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('88','1','88','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('89','1','89','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('90','1','90','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('91','1','91','1','1','1','dummy','2018-08-19 01:58:05','2018-08-19 01:58:05',NULL,'1',NULL,NULL,NULL,NULL),  ('92','1','92','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('93','1','93','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('94','1','94','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('95','1','95','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('96','1','96','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('97','1','97','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('98','1','98','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('99','1','99','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('100','1','100','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('101','1','101','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('102','1','102','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('103','1','103','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('104','1','104','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('105','1','105','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('106','1','106','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('107','1','107','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('108','1','108','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('109','1','109','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('110','1','110','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('111','1','111','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('112','1','112','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('113','1','113','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('114','1','114','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('115','1','115','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('116','1','116','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('117','1','117','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('118','1','118','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('119','1','119','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('120','1','120','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('121','1','121','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('122','1','122','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('123','1','123','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('124','1','124','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('125','1','125','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('126','1','126','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('127','1','127','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('128','1','128','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('129','1','129','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('130','1','130','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('131','1','131','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('132','1','132','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('133','1','133','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('134','1','134','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('135','1','135','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('136','1','136','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('137','1','137','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('138','1','138','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('139','1','139','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('140','1','140','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('141','1','141','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('142','1','142','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('143','1','143','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('144','1','144','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('145','1','145','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('146','1','146','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('147','1','147','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('148','1','148','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('149','1','149','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('150','1','150','1','1','1','dummy','2018-08-19 01:58:06','2018-08-19 01:58:06',NULL,'1',NULL,NULL,NULL,NULL),  ('151','1','151','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('152','1','152','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('153','1','153','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('154','1','154','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('155','1','155','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('156','1','156','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('157','1','157','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('158','1','158','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('159','1','159','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('160','1','160','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('161','1','161','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('162','1','162','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('163','1','163','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('164','1','164','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('165','1','165','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('166','1','166','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('167','1','167','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('168','1','168','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('169','1','169','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('170','1','170','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('171','1','171','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('172','1','172','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('173','1','173','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('174','1','174','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('175','1','175','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('176','1','176','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('177','1','177','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('178','1','178','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('179','1','179','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('180','1','180','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('181','1','181','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('182','1','182','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('183','1','183','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('184','1','184','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('185','1','185','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('186','1','186','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('187','1','187','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('188','1','188','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('189','1','189','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('190','1','190','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('191','1','191','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('192','1','192','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('193','1','193','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('194','1','194','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('195','1','195','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('196','1','196','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('197','1','197','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('198','1','198','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('199','1','199','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('200','1','200','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('201','1','201','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('202','1','202','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('203','1','203','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('204','1','204','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('205','1','205','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('206','1','206','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('207','1','207','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('208','1','208','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('209','1','209','1','1','1','dummy','2018-08-19 01:58:07','2018-08-19 01:58:07',NULL,'1',NULL,NULL,NULL,NULL),  ('210','1','210','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('211','1','211','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('212','1','212','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('213','1','213','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('214','1','214','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('215','1','215','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('216','1','216','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('217','1','217','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('218','1','218','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('219','1','219','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('220','1','220','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('221','1','221','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('222','1','222','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('223','1','223','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('224','1','224','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('225','1','225','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('226','1','226','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('227','1','227','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('228','1','228','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('229','1','229','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('230','1','230','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('231','1','231','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('232','1','232','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('233','1','233','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('234','1','234','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('235','1','235','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('236','1','236','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('237','1','237','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('238','1','238','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('239','1','239','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('240','1','240','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('241','1','241','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('242','1','242','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('243','1','243','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('244','1','244','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('245','1','245','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('246','1','246','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('247','1','247','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('248','1','248','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('249','1','249','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('250','1','250','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('251','1','251','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('252','1','252','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('253','1','253','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('254','1','254','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('255','1','255','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('256','1','256','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('257','1','257','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('258','1','258','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('259','1','259','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('260','1','260','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('261','1','261','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('262','1','262','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('263','1','263','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('264','1','264','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('265','1','265','1','1','1','dummy','2018-08-19 01:58:08','2018-08-19 01:58:08',NULL,'1',NULL,NULL,NULL,NULL),  ('266','1','266','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('267','1','267','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('268','1','268','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('269','1','269','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('270','1','270','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('271','1','271','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('272','1','272','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('273','1','273','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('274','1','274','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('275','1','275','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('276','1','276','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('277','1','277','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('278','1','278','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('279','1','279','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('280','1','280','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('281','1','281','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('282','1','282','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('283','1','283','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('284','1','284','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('285','1','285','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('286','1','286','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('287','1','287','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('288','1','288','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('289','1','289','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('290','1','290','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('291','1','291','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('292','1','292','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('293','1','293','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('294','1','294','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('295','1','295','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('296','1','296','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('297','1','297','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('298','1','298','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('299','1','299','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('300','1','300','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('301','1','301','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('302','1','302','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('303','1','303','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('304','1','304','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('305','1','305','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('306','1','306','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('307','1','307','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('308','1','308','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('309','1','309','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('310','1','310','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('311','1','311','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('312','1','312','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('313','1','313','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('314','1','314','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('315','1','315','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('316','1','316','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('317','1','317','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('318','1','318','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('319','1','319','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('320','1','320','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('321','1','321','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('322','1','322','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('323','1','323','1','1','1','dummy','2018-08-19 01:58:09','2018-08-19 01:58:09',NULL,'1',NULL,NULL,NULL,NULL),  ('324','1','324','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('325','1','325','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('326','1','326','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('327','1','327','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('328','1','328','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('329','1','329','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('330','1','330','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('331','1','331','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('332','1','332','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('333','1','333','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('334','1','334','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('335','1','335','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('336','1','336','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('337','1','337','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('338','1','338','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('339','1','339','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('340','1','340','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('341','1','341','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('342','1','342','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('343','1','343','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('344','1','344','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('345','1','345','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('346','1','346','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('347','1','347','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('348','1','348','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('349','1','349','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('350','1','350','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('351','1','351','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('352','1','352','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('353','1','353','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('354','1','354','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('355','1','355','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('356','1','356','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('357','1','357','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('358','1','358','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('359','1','359','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('360','1','360','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('361','1','361','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('362','1','362','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('363','1','363','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('364','1','364','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('365','1','365','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('366','1','366','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('367','1','367','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('368','1','368','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('369','1','369','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('370','1','370','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('371','1','371','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('372','1','372','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('373','1','373','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('374','1','374','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('375','1','375','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('376','1','376','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('377','1','377','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('378','1','378','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('379','1','379','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('380','1','380','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('381','1','381','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('382','1','382','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('383','1','383','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('384','1','384','1','1','1','dummy','2018-08-19 01:58:10','2018-08-19 01:58:10',NULL,'1',NULL,NULL,NULL,NULL),  ('385','1','385','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('386','1','386','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('387','1','387','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('388','1','388','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('389','1','389','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('390','1','390','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('391','1','391','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('392','1','392','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('393','1','393','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('394','1','394','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('395','1','395','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('396','1','396','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('397','1','397','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('398','1','398','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('399','1','399','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('400','1','400','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('401','1','401','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('402','1','402','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('403','1','403','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('404','1','404','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('405','1','405','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('406','1','406','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('407','1','407','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('408','1','408','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('409','1','409','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('410','1','410','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('411','1','411','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('412','1','412','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('413','1','413','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('414','1','414','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('415','1','415','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('416','1','416','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('417','1','417','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('418','1','418','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('419','1','419','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('420','1','420','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('421','1','421','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('422','1','422','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('423','1','423','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('424','1','424','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('425','1','425','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('426','1','426','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('427','1','427','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('428','1','428','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('429','1','429','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('430','1','430','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('431','1','431','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('432','1','432','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('433','1','433','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('434','1','434','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('435','1','435','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('436','1','436','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('437','1','437','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('438','1','438','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('439','1','439','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('440','1','440','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('441','1','441','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('442','1','442','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('443','1','443','1','1','1','dummy','2018-08-19 01:58:11','2018-08-19 01:58:11',NULL,'1',NULL,NULL,NULL,NULL),  ('444','1','444','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('445','1','445','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('446','1','446','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('447','1','447','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('448','1','448','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('449','1','449','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('450','1','450','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('451','1','451','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('452','1','452','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('453','1','453','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('454','1','454','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('455','1','455','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('456','1','456','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('457','1','457','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('458','1','458','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('459','1','459','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('460','1','460','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('461','1','461','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('462','1','462','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('463','1','463','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('464','1','464','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('465','1','465','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('466','1','466','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('467','1','467','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('468','1','468','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('469','1','469','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('470','1','470','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('471','1','471','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('472','1','472','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('473','1','473','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('474','1','474','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('475','1','475','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('476','1','476','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('477','1','477','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('478','1','478','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('479','1','479','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('480','1','480','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('481','1','481','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('482','1','482','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('483','1','483','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('484','1','484','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('485','1','485','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('486','1','486','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('487','1','487','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('488','1','488','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('489','1','489','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('490','1','490','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('491','1','491','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('492','1','492','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('493','1','493','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('494','1','494','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('495','1','495','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('496','1','496','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('497','1','497','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('498','1','498','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('499','1','499','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('500','1','500','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('501','1','501','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('502','1','502','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('503','1','503','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('504','1','504','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('505','1','505','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('506','1','506','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('507','1','507','1','1','1','dummy','2018-08-19 01:58:12','2018-08-19 01:58:12',NULL,'1',NULL,NULL,NULL,NULL),  ('508','1','508','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('509','1','509','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('510','1','510','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('511','1','511','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('512','1','512','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('513','1','513','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('514','1','514','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('515','1','515','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('516','1','516','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('517','1','517','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('518','1','518','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('519','1','519','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('520','1','520','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('521','1','521','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('522','1','522','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('523','1','523','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('524','1','524','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('525','1','525','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('526','1','526','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('527','1','527','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('528','1','528','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('529','1','529','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('530','1','530','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('531','1','531','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('532','1','532','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('533','1','533','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('534','1','534','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('535','1','535','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('536','1','536','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('537','1','537','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('538','1','538','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('539','1','539','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('540','1','540','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('541','1','541','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('542','1','542','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('543','1','543','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('544','1','544','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('545','1','545','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('546','1','546','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('547','1','547','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('548','1','548','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('549','1','549','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('550','1','550','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('551','1','551','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('552','1','552','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('553','1','553','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('554','1','554','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('555','1','555','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('556','1','556','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('557','1','557','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('558','1','558','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('559','1','559','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('560','1','560','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('561','1','561','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('562','1','562','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('563','1','563','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('564','1','564','1','1','1','dummy','2018-08-19 01:58:13','2018-08-19 01:58:13',NULL,'1',NULL,NULL,NULL,NULL),  ('565','1','565','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('566','1','566','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('567','1','567','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('568','1','568','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('569','1','569','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('570','1','570','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('571','1','571','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('572','1','572','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('573','1','573','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('574','1','574','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('575','1','575','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('576','1','576','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('577','1','577','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('578','1','578','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('579','1','579','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('580','1','580','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('581','1','581','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('582','1','582','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `user_details` VALUES ('583','1','583','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('584','1','584','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('585','1','585','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('586','1','586','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('587','1','587','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('588','1','588','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('589','1','589','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('590','1','590','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('591','1','591','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('592','1','592','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('593','1','593','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('594','1','594','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('595','1','595','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('596','1','596','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('597','1','597','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('598','1','598','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('599','1','599','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('600','1','600','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('601','1','601','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('602','1','602','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('603','1','603','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('604','1','604','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('605','1','605','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('606','1','606','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('607','1','607','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('608','1','608','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('609','1','609','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('610','1','610','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('611','1','611','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('612','1','612','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('613','1','613','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('614','1','614','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('615','1','615','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('616','1','616','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('617','1','617','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('618','1','618','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('619','1','619','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('620','1','620','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('621','1','621','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('622','1','622','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('623','1','623','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('624','1','624','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('625','1','625','1','1','1','dummy','2018-08-19 01:58:14','2018-08-19 01:58:14',NULL,'1',NULL,NULL,NULL,NULL),  ('626','1','626','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('627','1','627','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('628','1','628','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('629','1','629','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('630','1','630','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('631','1','631','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('632','1','632','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('633','1','633','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('634','1','634','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('635','1','635','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('636','1','636','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('637','1','637','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('638','1','638','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('639','1','639','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('640','1','640','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('641','1','641','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('642','1','642','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('643','1','643','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('644','1','644','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('645','1','645','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('646','1','646','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('647','1','647','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('648','1','648','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('649','1','649','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('650','1','650','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('651','1','651','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('652','1','652','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('653','1','653','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('654','1','654','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('655','1','655','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('656','1','656','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('657','1','657','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('658','1','658','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('659','1','659','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('660','1','660','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('661','1','661','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('662','1','662','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('663','1','663','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('664','1','664','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('665','1','665','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('666','1','666','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('667','1','667','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('668','1','668','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('669','1','669','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('670','1','670','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('671','1','671','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('672','1','672','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('673','1','673','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('674','1','674','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('675','1','675','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('676','1','676','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('677','1','677','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('678','1','678','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('679','1','679','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('680','1','680','1','1','1','dummy','2018-08-19 01:58:15','2018-08-19 01:58:15',NULL,'1',NULL,NULL,NULL,NULL),  ('681','1','681','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('682','1','682','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('683','1','683','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('684','1','684','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('685','1','685','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('686','1','686','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('687','1','687','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('688','1','688','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('689','1','689','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('690','1','690','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('691','1','691','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('692','1','692','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('693','1','693','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('694','1','694','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('695','1','695','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('696','1','696','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('697','1','697','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('698','1','698','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('699','1','699','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('700','1','700','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('701','1','701','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('702','1','702','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('703','1','703','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('704','1','704','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('705','1','705','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('706','1','706','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('707','1','707','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('708','1','708','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('709','1','709','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('710','1','710','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('711','1','711','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('712','1','712','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('713','1','713','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('714','1','714','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('715','1','715','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('716','1','716','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('717','1','717','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('718','1','718','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('719','1','719','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('720','1','720','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('721','1','721','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('722','1','722','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('723','1','723','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('724','1','724','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('725','1','725','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('726','1','726','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('727','1','727','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('728','1','728','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('729','1','729','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('730','1','730','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('731','1','731','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('732','1','732','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('733','1','733','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('734','1','734','1','1','1','dummy','2018-08-19 01:58:16','2018-08-19 01:58:16',NULL,'1',NULL,NULL,NULL,NULL),  ('735','1','735','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('736','1','736','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('737','1','737','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('738','1','738','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('739','1','739','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('740','1','740','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('741','1','741','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('742','1','742','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('743','1','743','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('744','1','744','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('745','1','745','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('746','1','746','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('747','1','747','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('748','1','748','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('749','1','749','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('750','1','750','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('751','1','751','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('752','1','752','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('753','1','753','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('754','1','754','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('755','1','755','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('756','1','756','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('757','1','757','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('758','1','758','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('759','1','759','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('760','1','760','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('761','1','761','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('762','1','762','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('763','1','763','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('764','1','764','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('765','1','765','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('766','1','766','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('767','1','767','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('768','1','768','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('769','1','769','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('770','1','770','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('771','1','771','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('772','1','772','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('773','1','773','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('774','1','774','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('775','1','775','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('776','1','776','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('777','1','777','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('778','1','778','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('779','1','779','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('780','1','780','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('781','1','781','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('782','1','782','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('783','1','783','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('784','1','784','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('785','1','785','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('786','1','786','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('787','1','787','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('788','1','788','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('789','1','789','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('790','1','790','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('791','1','791','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('792','1','792','1','1','1','dummy','2018-08-19 01:58:17','2018-08-19 01:58:17',NULL,'1',NULL,NULL,NULL,NULL),  ('793','1','793','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('794','1','794','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('795','1','795','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('796','1','796','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('797','1','797','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('798','1','798','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('799','1','799','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('800','1','800','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('801','1','801','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('802','1','802','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('803','1','803','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('804','1','804','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('805','1','805','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('806','1','806','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('807','1','807','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('808','1','808','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('809','1','809','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('810','1','810','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('811','1','811','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('812','1','812','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('813','1','813','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('814','1','814','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('815','1','815','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('816','1','816','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('817','1','817','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('818','1','818','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('819','1','819','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('820','1','820','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('821','1','821','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('822','1','822','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('823','1','823','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('824','1','824','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('825','1','825','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('826','1','826','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('827','1','827','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('828','1','828','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('829','1','829','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('830','1','830','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('831','1','831','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('832','1','832','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('833','1','833','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('834','1','834','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('835','1','835','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('836','1','836','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('837','1','837','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('838','1','838','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('839','1','839','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('840','1','840','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('841','1','841','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('842','1','842','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('843','1','843','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('844','1','844','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('845','1','845','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('846','1','846','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('847','1','847','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('848','1','848','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('849','1','849','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('850','1','850','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('851','1','851','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL),  ('852','1','852','1','1','1','dummy','2018-08-19 01:58:18','2018-08-19 01:58:18',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `user_group_details` VALUES ('1','1','1','First administrator','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2','2','Restricted user','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `user_groups` VALUES ('1','administrator','0','Group untuk app administrator','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL),  ('2','restricted','0','Group untuk user tanpa akses apa-apa','2018-08-19 01:58:04','2018-08-19 01:58:04',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `user_jabatans` VALUES ('1','ADM','admin',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('2','SPV','supervisor',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('3','MGR','manager',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('4','DIR','direktur',NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('5','aa','aa','aaa','2018-09-26 10:50:23','2018-09-26 10:50:23',NULL,'1',NULL,NULL,NULL,NULL),  ('6','123aa','adf','sdfasdfasdf','2018-09-26 10:50:44','2018-09-26 10:50:44',NULL,'1',NULL,NULL,NULL,NULL),  ('7','KG','KEPALA GUDANG','Kepalada gudang','2018-09-26 10:53:45','2018-09-26 10:53:45',NULL,'1',NULL,NULL,NULL,NULL),  ('8','adfa','sdfasdf','asdfsadf','2018-09-26 10:57:45','2018-09-26 10:57:45',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `user_warehouse` VALUES ('2','1','2018-08-20 04:27:35','2018-08-20 04:27:35',NULL,'1',NULL,NULL,NULL,NULL),  ('7','1','2018-08-20 04:42:09','2018-08-20 04:42:09',NULL,'1',NULL,NULL,NULL,NULL),  ('4','7','2018-09-24 14:44:56','2018-09-24 14:44:56',NULL,'1',NULL,NULL,NULL,NULL),  ('4','1','2018-09-25 03:33:40','2018-09-25 03:33:40',NULL,'1',NULL,NULL,NULL,NULL),  ('4','2','2018-09-25 03:33:40','2018-09-25 03:33:40',NULL,'1',NULL,NULL,NULL,NULL),  ('4','3','2018-09-25 03:33:40','2018-09-25 03:33:40',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4','2018-09-25 03:33:41','2018-09-25 03:33:41',NULL,'1',NULL,NULL,NULL,NULL),  ('4','5','2018-09-25 03:33:41','2018-09-25 03:33:41',NULL,'1',NULL,NULL,NULL,NULL),  ('4','6','2018-09-25 03:33:41','2018-09-25 03:33:41',NULL,'1',NULL,NULL,NULL,NULL),  ('4','7','2018-09-25 03:33:41','2018-09-25 03:33:41',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `users` VALUES ('1','admin','Admin','0','admin@ciputra.com','0',NULL,NULL,'$2y$10$6qeitzlveisGc0zPSHTGVeuhNslWypDuXf5o1vqxKXmMSNXNbpGk.',NULL,'4LIbgNtwsRNPfZog5rcGSI71iVr6FctOblFfn79Tu688w6mXhUB7cKwsIhke','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1','1',NULL,NULL,NULL),  ('2','administrator','UserC&D','0','administrator@ciputra.com','0',NULL,NULL,'$2y$10$qMPJtvDIyd6KlSBatVr8BuiVvIEtTF6L2qcSYzQzZ0grtaouXd6La',NULL,'GIpeL0JYZKo2mTbGMrUivGyY9vQygq60UKvOER19zBVj3t8afMGXKyQQyGg0','2018-08-19 01:57:45','2018-08-19 01:57:45',NULL,'1','2',NULL,NULL,NULL),  ('3','direktur','userESTATE','0','direktur@ciputra.com','0',NULL,NULL,'$2y$10$paYONP.x2j9htJag/4cpuOYQKmkEOAVvzM/VCY5.aBV0K5E1jREva',NULL,NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('4','manager','adminGUDANG','0','manager@ciputra.com','0',NULL,NULL,'$2y$10$lnhCo68TekJ7ZbenslfBtOXtmlMm/4BuFsVduTBa0Ox54iBFOjc36',NULL,NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('5','rekanan','userPRM','0','rekanan@ciputra.com','0',NULL,NULL,'$2y$10$rua3GKDrEtDy0y5on6Q4N.2N8bwDm5FMywa90lxCv3xjCCdLnsExi',NULL,NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('6','partner','userKEU','0','partner@ciputra.com','0',NULL,NULL,'$2y$10$9AhT8JYZnNFc5.bmwUiJcOay0feR02vNkoUxwbt89N5FMl8ie1e8q',NULL,NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('7','restricted','userMALL','0','restricted@ciputra.com','0',NULL,NULL,'$2y$10$ylt9Wks9lad/jX9M307BpeHF/lllaXbPXS00o.jDPA/7vYfSw3Nfy',NULL,NULL,'2018-08-19 01:57:46','2018-08-19 01:57:46',NULL,'1',NULL,NULL,NULL,NULL),  ('10','basri','userHRD','0','basri@gmail.com',NULL,NULL,NULL,'$2y$10$I3Jv8U5qmZoit0aTWUtuLuRfjNlGwzRs3SBnz.czUMfsKJWmKTI2i',NULL,NULL,'2018-08-19 14:34:50','2018-08-19 14:34:50',NULL,'1',NULL,NULL,NULL,NULL),  ('11','muhammad basri','basri12','0','basri12@gmail.com','0856783',NULL,NULL,'$2y$10$mC1x6iDpU4NBpywAJ9AtMekj6ibLgkgxCc9ta/GYylv2hGG36gF9e','user basri',NULL,'2018-09-26 10:25:59','2018-09-26 10:25:59',NULL,'1',NULL,NULL,NULL,NULL),  ('12','maulana','maul','0','maul@yahoo.com','098234',NULL,NULL,'$2y$10$m3fz58j.Uox7U4LNMgBQDee1e82q.oFhZ0m.MQjwUovivHc5ZlQNi','test',NULL,'2018-09-26 10:27:25','2018-09-26 10:27:25',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `voucher_details` VALUES ('1','1',NULL,'1','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2',NULL,'2','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3',NULL,'3','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4',NULL,'4','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5',NULL,'5','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6',NULL,'6','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7',NULL,'7','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8',NULL,'8','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9',NULL,'9','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10',NULL,'10','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11',NULL,'11','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12',NULL,'12','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13',NULL,'13','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14',NULL,'14','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15',NULL,'15','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16',NULL,'16','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17',NULL,'17','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18',NULL,'18','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19',NULL,'19','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20',NULL,'20','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21',NULL,'21','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22',NULL,'22','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23',NULL,'23','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24',NULL,'24','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25',NULL,'25','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26',NULL,'26','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27',NULL,'27','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28',NULL,'28','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29',NULL,'29','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30',NULL,'30','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31',NULL,'31','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32',NULL,'32','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33',NULL,'33','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34',NULL,'34','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35',NULL,'35','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36',NULL,'36','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37',NULL,'37','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38',NULL,'38','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39',NULL,'39','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40',NULL,'40','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41',NULL,'41','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42',NULL,'42','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43',NULL,'43','App\\BapDetail','5.00','dpp','idr','1.00','2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `vouchers` VALUES ('1','1','App\\Bap','1',NULL,'3',NULL,'2015-02-23','039/SBM/1/1.12.5/II/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:57:59','2018-08-19 01:57:59',NULL,'1',NULL,NULL,NULL,NULL),  ('2','2','App\\Bap','1',NULL,'3',NULL,'2015-03-02','044/SBM/1/1.4.4/III/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','3','App\\Bap','1',NULL,'3',NULL,'2015-03-23','057/SBM/1/1.27.3/III/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('4','4','App\\Bap','1',NULL,'3',NULL,'2015-06-12','113/SBM/1/1.11.4/VI/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('5','5','App\\Bap','1',NULL,'3',NULL,'2015-06-26','122/SBM/1/1.2.4/VI/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('6','6','App\\Bap','1',NULL,'3',NULL,'2015-07-09','129/SBM/1/1.4.4/VII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('7','7','App\\Bap','1',NULL,'3',NULL,'2015-08-11','140/SBM/1/41.3.4/VIII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('8','8','App\\Bap','1',NULL,'3',NULL,'2015-08-19','146/SBM/1/41.4.4/VIII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('9','9','App\\Bap','1',NULL,'3',NULL,'2015-08-31','154/SBM/1/41.3.4/VIII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('10','10','App\\Bap','1',NULL,'3',NULL,'2015-09-01','156/SBM/1/1.13.4/IX/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:00','2018-08-19 01:58:00',NULL,'1',NULL,NULL,NULL,NULL),  ('11','11','App\\Bap','1',NULL,'3',NULL,'2015-09-14','164/SBM/1/1.1.7/IX/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('12','12','App\\Bap','1',NULL,'3',NULL,'2015-09-22','170/SBM/1/1.6.6/IX/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('13','13','App\\Bap','1',NULL,'3',NULL,'2015-10-23','189/SBM/1/1.12.5/X/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('14','14','App\\Bap','1',NULL,'3',NULL,'2015-11-06','203/SBM/1/2.2.4/XI/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('15','15','App\\Bap','1',NULL,'3',NULL,'2015-12-15','229/SBM/1/1.3.4/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('16','16','App\\Bap','1',NULL,'3',NULL,'2015-12-17','234/SBM/1/41.6.6/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('17','17','App\\Bap','1',NULL,'3',NULL,'2015-12-18','231/SBM/1/41.6.6/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('18','18','App\\Bap','1',NULL,'3',NULL,'2015-12-18','232/SBM/1/1.6.6/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('19','19','App\\Bap','1',NULL,'3',NULL,'2015-12-18','233/SBM/1/41.5.6/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('20','20','App\\Bap','1',NULL,'3',NULL,'2015-12-18','235/SBM/1/41.5.6/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('21','21','App\\Bap','1',NULL,'3',NULL,'2015-12-22','237/SBM/1/1.3.4/XII/15/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('22','22','App\\Bap','1',NULL,'3',NULL,'2016-01-27','017/SBM/1/1.27.3/I/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:01','2018-08-19 01:58:01',NULL,'1',NULL,NULL,NULL,NULL),  ('23','23','App\\Bap','1',NULL,'3',NULL,'2016-02-04','023/SBM/1/41.12.5/II/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('24','24','App\\Bap','1',NULL,'3',NULL,'2016-03-31','055/SBM/1/41.6.6/III/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('25','25','App\\Bap','1',NULL,'3',NULL,'2016-03-31','056/SBM/1/41.5.6/III/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('26','26','App\\Bap','1',NULL,'3',NULL,'2016-04-14','070/SBM/1/41.7.6/IV/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('27','27','App\\Bap','1',NULL,'3',NULL,'2016-05-30','096/SBM/1/1.6.6/V/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('28','28','App\\Bap','1',NULL,'3',NULL,'2016-08-05','133/SBM/1/41.12.5/VIII/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('29','29','App\\Bap','1',NULL,'3',NULL,'2016-09-06','151/SBM/1/41.5.6/IX/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('30','30','App\\Bap','1',NULL,'3',NULL,'2016-09-09','159/SBM/1/1.27.3/IX/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('31','31','App\\Bap','1',NULL,'3',NULL,'2016-11-18','206/SBM/1/41.3.4/XI/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('32','32','App\\Bap','1',NULL,'3',NULL,'2016-11-25','201/SBM/1/41.4.4/XI/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:02','2018-08-19 01:58:02',NULL,'1',NULL,NULL,NULL,NULL),  ('33','33','App\\Bap','1',NULL,'3',NULL,'2016-12-16','217/SBM/1/41.12.5/XII/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('34','34','App\\Bap','1',NULL,'3',NULL,'2016-12-27','221/SBM/1/41.4.4/XII/16/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('35','35','App\\Bap','1',NULL,'3',NULL,'2017-04-16','049/SBM/1/1.16.3/IV/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('36','36','App\\Bap','1',NULL,'3',NULL,'2017-05-17','064/SBM/1/1.6.6/V/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('37','37','App\\Bap','1',NULL,'3',NULL,'2017-06-07','072/SBM/1/1.5.6/VI/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('38','38','App\\Bap','1',NULL,'3',NULL,'2017-07-24','093/SBM/1/1.1.8/VII/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('39','39','App\\Bap','1',NULL,'3',NULL,'2017-07-24','094/SBM/1/34.1.8/VII/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('40','40','App\\Bap','1',NULL,'3',NULL,'2017-07-26','089/SBM/1/41.7.6/VII/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('41','41','App\\Bap','1',NULL,'3',NULL,'2017-08-04','101/SBM/1/41.7.6/VIII/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('42','42','App\\Bap','1',NULL,'3',NULL,'2017-09-25','131/SBM/1/1.13.4/IX/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL),  ('43','43','App\\Bap','1',NULL,'3',NULL,'2017-10-06','165/SBM/1/1.27.3/XI/17/VCR/01',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2018-08-19 01:58:03','2018-08-19 01:58:03',NULL,'1',NULL,NULL,NULL,NULL);
INSERT INTO `warehouses` VALUES ('1','GGA','9','1','0','App\\UserWarehouse','1','GUDANG HRD 2','JALAN PROF. DR. SATRIO KAV 7',NULL,'2018-08-20 03:45:08','2018-08-20 04:40:14',NULL,'1','1',NULL,NULL,NULL),  ('2','GTH1','9','3','0','App\\UserWarehouse','1','GUDANG TEKNIK 1','JALAN SUDIRMAN NO 34',NULL,'2018-08-20 03:51:00','2018-08-20 03:51:00',NULL,'1',NULL,NULL,NULL,NULL),  ('3','GMAL','9','4','0','App\\UserWarehouse','2','GUDANG MAL','JALAN DAAN MOGOT NO 12.',NULL,'2018-08-20 03:51:37','2018-08-20 03:51:37',NULL,'1',NULL,NULL,NULL,NULL),  ('4','GGH','9','9','0','App\\UserWarehouse','1','GUDANG HRD 1','JALA. DR. SATRIO NO 67',NULL,'2018-08-20 06:40:52','2018-08-20 06:40:52',NULL,'1',NULL,NULL,NULL,NULL),  ('5','GGT','9','3','0','App\\UserWarehouse','2','GUDANG TEKNIK 6','JALAN KL. YOS SUDARSO',NULL,'2018-09-24 14:42:19','2018-09-24 14:42:19',NULL,'1',NULL,NULL,NULL,NULL),  ('6','GGT','9','3','0','App\\UserWarehouse','2','GUDANG TEKNIK 6','JALAN KL. YOS SUDARSO',NULL,'2018-09-24 14:42:20','2018-09-24 14:42:20',NULL,'1',NULL,NULL,NULL,NULL),  ('7','GK1','9','2','0','App\\UserWarehouse','3','gudang keuangan','rrrrrr',NULL,'2018-09-24 14:44:35','2018-09-24 14:44:35',NULL,'1',NULL,NULL,NULL,NULL),  ('8',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-04 10:48:53','2018-10-04 10:48:53',NULL,'1',NULL,NULL,NULL,NULL),  ('9',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-04 10:49:14','2018-10-04 10:49:14',NULL,'1',NULL,NULL,NULL,NULL),  ('10',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-04 10:49:55','2018-10-04 10:49:55',NULL,'1',NULL,NULL,NULL,NULL),  ('11',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-05 02:23:19','2018-10-05 02:23:19',NULL,'1',NULL,NULL,NULL,NULL),  ('12',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-05 02:23:20','2018-10-05 02:23:20',NULL,'1',NULL,NULL,NULL,NULL),  ('13',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-05 02:25:58','2018-10-05 02:25:58',NULL,'1',NULL,NULL,NULL,NULL),  ('14',NULL,NULL,NULL,'0','App\\UserWarehouse',NULL,NULL,NULL,NULL,'2018-10-05 02:29:16','2018-10-05 02:29:16',NULL,'1',NULL,NULL,NULL,NULL);
