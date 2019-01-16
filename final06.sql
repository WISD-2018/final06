-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1,	0,	1,	'Index',	'fa-bar-chart',	'/',	NULL,	NULL,	NULL),
(2,	0,	2,	'Admin',	'fa-tasks',	'',	NULL,	NULL,	NULL),
(3,	2,	3,	'Users',	'fa-users',	'auth/users',	NULL,	NULL,	NULL),
(4,	2,	4,	'Roles',	'fa-user',	'auth/roles',	NULL,	NULL,	NULL),
(5,	2,	5,	'Permission',	'fa-ban',	'auth/permissions',	NULL,	NULL,	NULL),
(6,	2,	6,	'Menu',	'fa-bars',	'auth/menu',	NULL,	NULL,	NULL),
(7,	2,	7,	'Operation log',	'fa-history',	'auth/logs',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-04 09:40:37',	'2019-01-04 09:40:37'),
(2,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-04 09:49:13',	'2019-01-04 09:49:13'),
(3,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-05 08:40:01',	'2019-01-05 08:40:01'),
(4,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-05 08:43:34',	'2019-01-05 08:43:34'),
(5,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-05 08:44:21',	'2019-01-05 08:44:21'),
(6,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:02:28',	'2019-01-05 09:02:28'),
(7,	1,	'admin/products',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:02:34',	'2019-01-05 09:02:34'),
(8,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:12:28',	'2019-01-05 09:12:28'),
(9,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:29:34',	'2019-01-05 09:29:34'),
(10,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:29:41',	'2019-01-05 09:29:41'),
(11,	1,	'admin/products/create',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:29:46',	'2019-01-05 09:29:46'),
(12,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:30:33',	'2019-01-05 09:30:33'),
(13,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:30:51',	'2019-01-05 09:30:51'),
(14,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:30:54',	'2019-01-05 09:30:54'),
(15,	1,	'admin/products/create',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:30:59',	'2019-01-05 09:30:59'),
(16,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:31:08',	'2019-01-05 09:31:08'),
(17,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:36:29',	'2019-01-05 09:36:29'),
(18,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:36:51',	'2019-01-05 09:36:51'),
(19,	1,	'admin/products/create',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:36:54',	'2019-01-05 09:36:54'),
(20,	1,	'admin/products',	'POST',	'::1',	'{\"title\":\"apple\",\"description\":\"<p>a apple<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"apples\",\"description\":\"a apple la\",\"price\":\"100\",\"stock\":\"10\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":null,\"description\":null,\"price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"1\"}},\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-05 09:37:50',	'2019-01-05 09:37:50'),
(21,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:37:51',	'2019-01-05 09:37:51'),
(22,	1,	'admin/products',	'POST',	'::1',	'{\"title\":\"apple\",\"description\":\"<p>a apple<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"apple\",\"description\":\"<p>a apple<\\/p>\",\"price\":\"100\",\"stock\":\"10\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\"}',	'2019-01-05 09:37:56',	'2019-01-05 09:37:56'),
(23,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:37:57',	'2019-01-05 09:37:57'),
(24,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:38:08',	'2019-01-05 09:38:08'),
(25,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:38:11',	'2019-01-05 09:38:11'),
(26,	1,	'admin/products/create',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:38:13',	'2019-01-05 09:38:13'),
(27,	1,	'admin/products',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:38:18',	'2019-01-05 09:38:18'),
(28,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:38:23',	'2019-01-05 09:38:23'),
(29,	1,	'admin/products',	'POST',	'::1',	'{\"title\":\"apple\",\"description\":\"<p>a apple&nbsp;<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"new_1\":{\"title\":\"apple\",\"description\":\"a apple\",\"price\":\"100\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-05 09:38:53',	'2019-01-05 09:38:53'),
(30,	1,	'admin/products/create',	'GET',	'::1',	'[]',	'2019-01-05 09:38:53',	'2019-01-05 09:38:53'),
(31,	1,	'admin/products',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:38:58',	'2019-01-05 09:38:58'),
(32,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:39:07',	'2019-01-05 09:39:07'),
(33,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:39:11',	'2019-01-05 09:39:11'),
(34,	1,	'admin/products/1',	'PUT',	'::1',	'{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_method\":\"PUT\"}',	'2019-01-05 09:39:18',	'2019-01-05 09:39:18'),
(35,	1,	'admin/products/1',	'PUT',	'::1',	'{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_method\":\"PUT\"}',	'2019-01-05 09:39:32',	'2019-01-05 09:39:32'),
(36,	1,	'admin/products/1',	'PUT',	'::1',	'{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_method\":\"PUT\"}',	'2019-01-05 09:39:33',	'2019-01-05 09:39:33'),
(37,	1,	'admin/products/1',	'PUT',	'::1',	'{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_method\":\"PUT\"}',	'2019-01-05 09:39:33',	'2019-01-05 09:39:33'),
(38,	1,	'admin/products/1',	'PUT',	'::1',	'{\"title\":\"apple\",\"description\":\"<p>a apple&nbsp;<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"apple\",\"description\":\"a apple\",\"price\":\"100.00\",\"stock\":\"20\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-05 09:39:57',	'2019-01-05 09:39:57'),
(39,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:39:57',	'2019-01-05 09:39:57'),
(40,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 09:40:00',	'2019-01-05 09:40:00'),
(41,	1,	'admin/products/1',	'PUT',	'::1',	'{\"title\":\"apple\",\"description\":\"<p>a apple&nbsp;<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"apple\",\"description\":\"a apple\",\"price\":\"100.00\",\"stock\":\"20\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"BwZvFdKjbDYVbLvoMpcsUNWY53Ga3lQZIZ16vpkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-05 09:40:13',	'2019-01-05 09:40:13'),
(42,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 09:40:13',	'2019-01-05 09:40:13'),
(43,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-05 10:07:00',	'2019-01-05 10:07:00'),
(44,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 10:07:07',	'2019-01-05 10:07:07'),
(45,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 10:07:10',	'2019-01-05 10:07:10'),
(46,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 10:07:52',	'2019-01-05 10:07:52'),
(47,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-05 12:51:15',	'2019-01-05 12:51:15'),
(48,	1,	'admin',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:51:23',	'2019-01-05 12:51:23'),
(49,	1,	'admin/auth/users',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:51:29',	'2019-01-05 12:51:29'),
(50,	1,	'admin/auth/roles',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:51:32',	'2019-01-05 12:51:32'),
(51,	1,	'admin/auth/permissions',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:51:40',	'2019-01-05 12:51:40'),
(52,	1,	'admin/auth/menu',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:51:43',	'2019-01-05 12:51:43'),
(53,	1,	'admin',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:51:59',	'2019-01-05 12:51:59'),
(54,	1,	'admin/auth/users',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:52:01',	'2019-01-05 12:52:01'),
(55,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 12:52:11',	'2019-01-05 12:52:11'),
(56,	1,	'admin/products/3/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:52:23',	'2019-01-05 12:52:23'),
(57,	1,	'admin/products/3/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:52:25',	'2019-01-05 12:52:25'),
(58,	1,	'admin/products/3/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:52:26',	'2019-01-05 12:52:26'),
(59,	1,	'admin/products/3',	'PUT',	'::1',	'{\"title\":\"laborum\",\"description\":\"<p>Tempora natus laboriosam soluta repudiandae distinctio hic.<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"5\":{\"title\":\"quaerat\",\"description\":\"Ullam nobis et tenetur itaque.\",\"price\":\"1120.00\",\"stock\":\"68455\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"title\":\"nobis\",\"description\":\"Possimus quia occaecati omnis enim.\",\"price\":\"278.00\",\"stock\":\"8850\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"title\":\"doloremque\",\"description\":\"Aut blanditiis quis ipsa vitae est.\",\"price\":\"544.00\",\"stock\":\"9216\",\"id\":\"7\",\"_remove_\":\"0\"}},\"_token\":\"ir9ELSuyOkTSNDQtk1n1i7zhiw11QMT1DwThxwEQ\",\"_method\":\"PUT\"}',	'2019-01-05 12:52:39',	'2019-01-05 12:52:39'),
(60,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-05 12:52:42',	'2019-01-05 12:52:42'),
(61,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:52:45',	'2019-01-05 12:52:45'),
(62,	1,	'admin/products',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-05 12:53:05',	'2019-01-05 12:53:05'),
(63,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-06 11:16:55',	'2019-01-06 11:16:55'),
(64,	1,	'admin/auth/users',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-06 11:17:03',	'2019-01-06 11:17:03'),
(65,	1,	'admin/auth/roles',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-06 11:17:10',	'2019-01-06 11:17:10'),
(66,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-07 17:45:18',	'2019-01-07 17:45:18'),
(67,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-07 17:45:32',	'2019-01-07 17:45:32'),
(68,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-07 17:45:44',	'2019-01-07 17:45:44'),
(69,	1,	'admin/products/create',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-07 17:45:51',	'2019-01-07 17:45:51'),
(70,	1,	'admin',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-07 17:46:46',	'2019-01-07 17:46:46'),
(71,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-07 19:20:18',	'2019-01-07 19:20:18'),
(72,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-07 19:20:22',	'2019-01-07 19:20:22'),
(73,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-07 19:20:30',	'2019-01-07 19:20:30'),
(74,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-07 19:20:38',	'2019-01-07 19:20:38'),
(75,	1,	'admin/products/create',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-07 19:21:05',	'2019-01-07 19:21:05'),
(76,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-08 17:20:57',	'2019-01-08 17:20:57'),
(77,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-08 17:21:03',	'2019-01-08 17:21:03'),
(78,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:21:10',	'2019-01-08 17:21:10'),
(79,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:21:18',	'2019-01-08 17:21:18'),
(80,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-08 17:24:34',	'2019-01-08 17:24:34'),
(81,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:24:39',	'2019-01-08 17:24:39'),
(82,	1,	'admin/products/2/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:24:46',	'2019-01-08 17:24:46'),
(83,	1,	'admin/products/2',	'PUT',	'::1',	'{\"title\":\"\\u97f3\\u97ff\",\"description\":\"Aut non eligendi molestiae.\",\"on_sale\":\"1\",\"skus\":{\"2\":{\"title\":\"\\u97f3\\u97ff1\",\"description\":\"\\u97f3\\u97ff1\",\"price\":\"6432.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"title\":\"\\u97f3\\u97ff2\",\"description\":\"\\u97f3\\u97ff2\",\"price\":\"2822.00\",\"stock\":\"100\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"title\":\"\\u97f3\\u97ff3\",\"description\":\"\\u97f3\\u97ff3\",\"price\":\"7947.00\",\"stock\":\"34167\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"gRIygL3dY8XXxBuvt2idGlOxWJASnImReZjtlc7C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-08 17:25:30',	'2019-01-08 17:25:30'),
(84,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:25:31',	'2019-01-08 17:25:31'),
(85,	1,	'admin/products/3/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:25:35',	'2019-01-08 17:25:35'),
(86,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:26:18',	'2019-01-08 17:26:18'),
(87,	1,	'admin/products/13/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:26:46',	'2019-01-08 17:26:46'),
(88,	1,	'admin/products/13',	'PUT',	'::1',	'{\"title\":\"\\u624b\\u6a5f\\u67b6\",\"description\":\"Quaerat numquam alias optio atque.\",\"on_sale\":\"1\",\"skus\":{\"35\":{\"title\":\"\\u624b\\u6a5f\\u67b61\",\"description\":\"\\u624b\\u6a5f\\u67b61\",\"price\":\"8833.00\",\"stock\":\"58707\",\"id\":\"35\",\"_remove_\":\"0\"},\"36\":{\"title\":\"\\u624b\\u6a5f\\u67b62\",\"description\":\"\\u624b\\u6a5f\\u67b62\",\"price\":\"9722.00\",\"stock\":\"54944\",\"id\":\"36\",\"_remove_\":\"0\"},\"37\":{\"title\":\"\\u624b\\u6a5f\\u67b63\",\"description\":\"\\u624b\\u6a5f\\u67b63\",\"price\":\"775.00\",\"stock\":\"68779\",\"id\":\"37\",\"_remove_\":\"0\"}},\"_token\":\"gRIygL3dY8XXxBuvt2idGlOxWJASnImReZjtlc7C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-08 17:27:15',	'2019-01-08 17:27:15'),
(89,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:27:18',	'2019-01-08 17:27:18'),
(90,	1,	'admin/products/3/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:27:28',	'2019-01-08 17:27:28'),
(91,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:27:40',	'2019-01-08 17:27:40'),
(92,	1,	'admin/products',	'GET',	'::1',	'{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:27:48',	'2019-01-08 17:27:48'),
(93,	1,	'admin/products/31/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:27:51',	'2019-01-08 17:27:51'),
(94,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:28:03',	'2019-01-08 17:28:03'),
(95,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:28:07',	'2019-01-08 17:28:07'),
(96,	1,	'admin/products/1/edit',	'GET',	'::1',	'[]',	'2019-01-08 17:28:13',	'2019-01-08 17:28:13'),
(97,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:28:19',	'2019-01-08 17:28:19'),
(98,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:28:57',	'2019-01-08 17:28:57'),
(99,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:29:04',	'2019-01-08 17:29:04'),
(100,	1,	'admin/auth/users',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:29:48',	'2019-01-08 17:29:48'),
(101,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-08 17:30:01',	'2019-01-08 17:30:01'),
(102,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-08 17:30:03',	'2019-01-08 17:30:03'),
(103,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:30:07',	'2019-01-08 17:30:07'),
(104,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:30:13',	'2019-01-08 17:30:13'),
(105,	1,	'admin/products/1',	'PUT',	'::1',	'{\"title\":\"apple\",\"description\":\"<p>a apple\\u00a0<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"apple\",\"description\":\"a apple\",\"price\":\"100.00\",\"stock\":\"20\",\"id\":\"1\",\"_remove_\":\"1\"}},\"_token\":\"gRIygL3dY8XXxBuvt2idGlOxWJASnImReZjtlc7C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}',	'2019-01-08 17:30:25',	'2019-01-08 17:30:25'),
(106,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:30:26',	'2019-01-08 17:30:26'),
(107,	1,	'admin/products/1/edit',	'GET',	'::1',	'{\"_pjax\":\"#pjax-container\"}',	'2019-01-08 17:30:29',	'2019-01-08 17:30:29'),
(108,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-08 17:56:08',	'2019-01-08 17:56:08'),
(109,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-08 17:56:16',	'2019-01-08 17:56:16'),
(110,	1,	'admin/products',	'GET',	'::1',	'[]',	'2019-01-08 17:56:52',	'2019-01-08 17:56:52'),
(111,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-08 17:57:36',	'2019-01-08 17:57:36'),
(112,	1,	'admin',	'GET',	'::1',	'[]',	'2019-01-15 17:42:55',	'2019-01-15 17:42:55'),
(113,	1,	'admin/users',	'GET',	'::1',	'[]',	'2019-01-15 17:43:04',	'2019-01-15 17:43:04');

DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1,	'All permission',	'*',	'',	'*',	NULL,	NULL),
(2,	'Dashboard',	'dashboard',	'GET',	'/',	NULL,	NULL),
(3,	'Login',	'auth.login',	'',	'/auth/login\r\n/auth/logout',	NULL,	NULL),
(4,	'User setting',	'auth.setting',	'GET,PUT',	'/auth/setting',	NULL,	NULL),
(5,	'Auth management',	'auth.management',	'',	'/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',	NULL,	NULL);

DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1,	'Administrator',	'administrator',	'2019-01-04 09:40:19',	'2019-01-04 09:40:19');

DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1,	2,	NULL,	NULL);

DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'$2y$10$BMyJzoEbNq5aOkOHexHtaOI4stMvh3s9N1dhVpXAWpqBt5cxZf7HO',	'Administrator',	NULL,	NULL,	'2019-01-04 09:40:19',	'2019-01-04 09:40:19');

DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_01_04_173148_create_admin_tables',	1),
(4,	'2019_01_04_123725_users_add_email_verified',	1),
(5,	'2019_01_04_175606_create_user_addresses_table',	2),
(6,	'2019_01_05_165726_create_products_table',	3),
(7,	'2019_01_05_165857_create_product_skus_table',	3),
(8,	'2019_01_05_185336_create_user_favorite_products_table',	4),
(9,	'2019_01_06_212534_create_cart_items_table',	5),
(10,	'2019_01_06_223112_create_orders_table',	6),
(11,	'2019_01_06_223217_create_order_items_table',	6);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `title`, `description`, `image`, `on_sale`, `rating`, `sold_count`, `review_count`, `price`, `created_at`, `updated_at`) VALUES
(1,	'apple',	'<p>a apple </p>',	'images/568217928.697601.jpg',	0,	5.00,	0,	0,	100.00,	'2019-01-05 09:38:53',	'2019-01-08 17:30:25'),
(2,	'音響',	'Aut non eligendi molestiae.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',	1,	2.00,	0,	0,	2822.00,	'2019-01-05 10:07:46',	'2019-01-08 17:25:30'),
(3,	'laborum',	'<p>Tempora natus laboriosam soluta repudiandae distinctio hic.</p>',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',	1,	3.00,	0,	0,	278.00,	'2019-01-05 10:07:46',	'2019-01-05 12:52:42'),
(4,	'voluptatem',	'Sapiente nihil necessitatibus dolor modi fuga commodi.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',	1,	5.00,	0,	0,	4164.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(5,	'aut',	'In ab et possimus itaque cum impedit numquam.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',	1,	5.00,	0,	0,	2152.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(6,	'animi',	'Sit incidunt nam hic accusantium architecto harum.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',	1,	4.00,	0,	0,	4432.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(7,	'aut',	'Illum deserunt sed nemo id.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',	1,	3.00,	0,	0,	5632.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(8,	'omnis',	'Id aut quod in sed.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',	1,	0.00,	0,	0,	3323.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(9,	'nesciunt',	'Qui sequi unde exercitationem ducimus velit et beatae.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg',	1,	2.00,	0,	0,	2390.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(10,	'voluptatibus',	'Minus voluptatibus voluptate saepe nulla ad.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',	1,	1.00,	0,	0,	212.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(11,	'fugit',	'Autem mollitia sed rerum et.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',	1,	0.00,	0,	0,	974.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(12,	'dolore',	'Ut maxime magni sit.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',	1,	4.00,	0,	0,	1301.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(13,	'手機架',	'Quaerat numquam alias optio atque.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',	1,	4.00,	0,	0,	775.00,	'2019-01-05 10:07:46',	'2019-01-08 17:27:17'),
(14,	'nemo',	'Molestiae et quis non.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',	1,	3.00,	0,	0,	1747.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(15,	'aut',	'Quia et recusandae et nemo inventore distinctio cumque est.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',	1,	5.00,	0,	0,	1872.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(16,	'ea',	'Totam sed sint saepe soluta ipsum amet.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',	1,	1.00,	0,	0,	2919.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(17,	'ipsum',	'Repellendus aliquam distinctio quia consequatur.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',	1,	3.00,	0,	0,	2050.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(18,	'reprehenderit',	'Tenetur voluptas voluptas excepturi excepturi repellat.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',	1,	4.00,	0,	0,	2416.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(19,	'sunt',	'Nihil quam fuga iusto similique eum.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',	1,	3.00,	0,	0,	544.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(20,	'minus',	'Quidem repellendus et consectetur accusamus et quas tempore.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',	1,	3.00,	0,	0,	4015.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(21,	'est',	'Quia natus in et quo modi vel.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',	1,	5.00,	0,	0,	600.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(22,	'vel',	'Id placeat nisi itaque ipsam est voluptatum.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',	1,	0.00,	0,	0,	3112.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(23,	'dolor',	'Rerum odio delectus iure.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',	1,	3.00,	0,	0,	5021.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(24,	'eaque',	'Aperiam voluptas mollitia explicabo qui.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',	1,	5.00,	0,	0,	8704.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(25,	'maiores',	'Ex maiores optio in rerum quo.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',	1,	5.00,	0,	0,	1277.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(26,	'modi',	'A error quaerat fugit ipsa deserunt sed.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',	1,	1.00,	0,	0,	1779.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(27,	'adipisci',	'Totam impedit quia maxime saepe.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',	1,	2.00,	0,	0,	464.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(28,	'non',	'Nobis non impedit voluptas.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',	1,	4.00,	0,	0,	8796.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(29,	'est',	'Occaecati voluptatibus molestiae sit.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',	1,	5.00,	0,	0,	2916.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(30,	'dolores',	'A cumque facere cupiditate commodi consequuntur.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',	1,	2.00,	0,	0,	6147.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(31,	'enim',	'Et facilis qui voluptatum quibusdam.',	'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',	1,	3.00,	0,	0,	2378.00,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46');

DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_skus` (`id`, `title`, `description`, `price`, `stock`, `product_id`, `created_at`, `updated_at`) VALUES
(2,	'音響1',	'音響1',	6432.00,	100,	2,	'2019-01-05 10:07:46',	'2019-01-08 17:55:17'),
(3,	'音響2',	'音響2',	2822.00,	100,	2,	'2019-01-05 10:07:46',	'2019-01-08 17:25:30'),
(4,	'音響3',	'音響3',	7947.00,	34167,	2,	'2019-01-05 10:07:46',	'2019-01-08 17:25:30'),
(5,	'quaerat',	'Ullam nobis et tenetur itaque.',	1120.00,	68455,	3,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(6,	'nobis',	'Possimus quia occaecati omnis enim.',	278.00,	8850,	3,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(7,	'doloremque',	'Aut blanditiis quis ipsa vitae est.',	544.00,	9216,	3,	'2019-01-05 10:07:46',	'2019-01-07 19:20:05'),
(8,	'enim',	'Doloremque consequatur debitis sit est rerum.',	7928.00,	29514,	4,	'2019-01-05 10:07:46',	'2019-01-07 11:39:51'),
(9,	'porro',	'Accusamus est possimus ut et est quia.',	5855.00,	77126,	4,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(10,	'maiores',	'Et vitae repellat et ut.',	4164.00,	50559,	4,	'2019-01-05 10:07:46',	'2019-01-07 17:37:32'),
(11,	'magnam',	'Vel quasi aliquid impedit praesentium veritatis quisquam.',	2152.00,	38203,	5,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(12,	'facilis',	'Et quod ut cumque ea consectetur.',	3337.00,	14241,	5,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(13,	'nemo',	'Ut minima porro cupiditate eveniet magni vero eos eos.',	4494.00,	67932,	5,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(14,	'architecto',	'Odit atque ad non vero.',	4466.00,	93044,	6,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(15,	'nam',	'Corporis odio qui minima et.',	4645.00,	34438,	6,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(16,	'eos',	'Suscipit ex aliquid rem natus vitae enim et.',	4432.00,	21792,	6,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(17,	'laborum',	'Dolorem et qui ullam ex.',	9347.00,	29186,	7,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(18,	'adipisci',	'Libero impedit sed officia nobis.',	5632.00,	10859,	7,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(19,	'explicabo',	'Quisquam odio magni voluptatem ipsum qui.',	6421.00,	92108,	7,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(20,	'est',	'Deleniti similique dolorem error maiores laborum dolorum eligendi est.',	7492.00,	50798,	8,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(21,	'molestiae',	'Provident debitis quae voluptatum et quas iusto.',	3645.00,	40452,	8,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(22,	'eum',	'Corporis a aut officiis sint corporis.',	3323.00,	47963,	8,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(23,	'est',	'Explicabo quas eaque qui qui quis facere non aperiam.',	2390.00,	52655,	9,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(24,	'repellat',	'Soluta commodi quasi laboriosam in iure.',	5524.00,	83380,	9,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(25,	'repellendus',	'Hic consectetur repellendus excepturi impedit fuga dolores aliquam vero.',	5588.00,	87828,	9,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(26,	'et',	'Perspiciatis autem aperiam quibusdam.',	892.00,	51180,	10,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(27,	'quis',	'At excepturi molestiae repudiandae.',	212.00,	11342,	10,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(28,	'porro',	'Voluptatem tempora enim qui ab.',	2049.00,	67700,	10,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(29,	'voluptas',	'Quam similique aut provident necessitatibus et qui nihil.',	974.00,	49806,	11,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(30,	'fugit',	'Nobis est delectus explicabo accusantium illum quidem enim.',	9605.00,	98243,	11,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(31,	'at',	'Ut et et sapiente reiciendis est rem optio.',	4841.00,	11397,	11,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(32,	'fugiat',	'Aut aut sunt et.',	5466.00,	83015,	12,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(33,	'qui',	'Libero pariatur ut eveniet inventore ratione.',	4203.00,	27058,	12,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(34,	'doloribus',	'Dolor modi molestias ut minima blanditiis totam dolor.',	1301.00,	85267,	12,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(35,	'手機架1',	'手機架1',	8833.00,	58707,	13,	'2019-01-05 10:07:46',	'2019-01-08 17:27:17'),
(36,	'手機架2',	'手機架2',	9722.00,	54944,	13,	'2019-01-05 10:07:46',	'2019-01-08 17:27:17'),
(37,	'手機架3',	'手機架3',	775.00,	68779,	13,	'2019-01-05 10:07:46',	'2019-01-08 17:27:17'),
(38,	'quis',	'Velit et perferendis omnis voluptas dolores sed quia.',	7519.00,	33749,	14,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(39,	'dolorem',	'Nihil iste nesciunt itaque fugit omnis quisquam.',	1747.00,	47064,	14,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(40,	'maxime',	'Vel rerum quisquam facere eveniet ratione.',	3415.00,	30845,	14,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(41,	'quam',	'Incidunt et amet ad pariatur alias corrupti.',	5789.00,	49538,	15,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(42,	'qui',	'Aut tenetur cum ipsam quam.',	1872.00,	53302,	15,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(43,	'sapiente',	'Fuga voluptatum dignissimos eligendi perspiciatis sed est soluta.',	8523.00,	65598,	15,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(44,	'labore',	'Voluptas cupiditate aperiam similique sunt.',	3805.00,	42415,	16,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(45,	'facilis',	'Enim et cum quisquam ipsa accusamus consequatur vel quod.',	2919.00,	99497,	16,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(46,	'aut',	'Ab molestiae sunt molestiae aut enim laboriosam.',	9930.00,	48781,	16,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(47,	'cumque',	'Velit qui minus nihil inventore dolorem.',	3398.00,	53996,	17,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(48,	'sequi',	'Laudantium architecto natus et impedit voluptatem corporis repellendus.',	7369.00,	47753,	17,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(49,	'omnis',	'Voluptatibus enim dolor voluptatem id sunt sint inventore.',	2050.00,	45987,	17,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(50,	'error',	'Itaque dignissimos consequatur blanditiis cupiditate facere architecto.',	3123.00,	92631,	18,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(51,	'veniam',	'Ut nesciunt quia quis exercitationem nobis.',	2416.00,	90273,	18,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(52,	'quia',	'Iusto iure minus at recusandae aut quo sit.',	3302.00,	74966,	18,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(53,	'perferendis',	'Et maxime exercitationem fugiat ea ut assumenda eum.',	4077.00,	91065,	19,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(54,	'nihil',	'Dolor commodi voluptatum sed.',	2418.00,	36207,	19,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(55,	'omnis',	'Eaque et quia et.',	544.00,	94624,	19,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(56,	'earum',	'Impedit at est deleniti alias amet.',	5080.00,	50055,	20,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(57,	'velit',	'Consequatur consequatur voluptatem illo voluptates.',	4015.00,	97517,	20,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(58,	'voluptas',	'Non quis dolorum dolorem reprehenderit et sed explicabo.',	6608.00,	38727,	20,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(59,	'quod',	'Facere velit qui accusamus quo necessitatibus molestiae qui quas.',	600.00,	44671,	21,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(60,	'ipsa',	'Laboriosam officia inventore maxime explicabo aperiam odit.',	8446.00,	89910,	21,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(61,	'neque',	'Blanditiis consectetur sed sit sed doloremque.',	720.00,	710,	21,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(62,	'sint',	'Fugiat exercitationem exercitationem expedita assumenda voluptatibus.',	5056.00,	30453,	22,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(63,	'sit',	'Aut quo optio eum porro sit minus.',	6941.00,	21996,	22,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(64,	'qui',	'Ea in est explicabo sed quos et excepturi.',	3112.00,	68370,	22,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(65,	'ad',	'Tempore quae sed sed.',	5868.00,	73362,	23,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(66,	'quibusdam',	'Non dolores odio et nesciunt.',	5021.00,	17176,	23,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(67,	'tempora',	'Quo et dolore aut sequi et sit.',	6410.00,	98157,	23,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(68,	'ducimus',	'Tenetur harum amet mollitia non aut.',	8704.00,	44795,	24,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(69,	'velit',	'Rerum consequatur officia et voluptatem iste unde voluptatem.',	9079.00,	30493,	24,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(70,	'omnis',	'Corporis ad quaerat unde.',	8754.00,	93009,	24,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(71,	'nihil',	'Non rerum blanditiis quia magnam sequi et omnis.',	8023.00,	24773,	25,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(72,	'dolorum',	'Facere tempora aperiam commodi iusto atque magni non.',	1277.00,	31070,	25,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(73,	'sit',	'Ad explicabo est modi incidunt non adipisci est.',	8195.00,	42171,	25,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(74,	'est',	'Illum alias dolorum libero sit omnis.',	6749.00,	86639,	26,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(75,	'voluptates',	'Qui consectetur aliquam eveniet non deserunt laborum.',	9443.00,	48573,	26,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(76,	'eum',	'Eaque placeat dolorem ut aperiam itaque error et.',	1779.00,	89771,	26,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(77,	'ipsam',	'Non saepe minima ipsum velit beatae rerum sed.',	464.00,	81262,	27,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(78,	'dolorum',	'Voluptatum autem inventore dolor ex et.',	6889.00,	16568,	27,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(79,	'natus',	'Autem accusantium repellat totam doloremque dolores non.',	9792.00,	84775,	27,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(80,	'numquam',	'Reiciendis qui repudiandae ab ipsa ab occaecati.',	8796.00,	17488,	28,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(81,	'molestias',	'Quia voluptatem esse ex et illum sit.',	9912.00,	86585,	28,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(82,	'et',	'Libero omnis ut omnis repellat dolores vitae nihil.',	9027.00,	2519,	28,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(83,	'repellendus',	'Eaque non vel sequi non dolor necessitatibus exercitationem eius.',	4880.00,	82146,	29,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(84,	'delectus',	'Ut aut rerum sit sint.',	5415.00,	52099,	29,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(85,	'autem',	'Et natus dicta est et adipisci.',	2916.00,	66680,	29,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(86,	'doloremque',	'Et magni ut molestias ullam quae neque.',	6890.00,	57241,	30,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(87,	'aut',	'Excepturi distinctio quasi eum ipsam id.',	8564.00,	28909,	30,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(88,	'in',	'Illum natus ea ea in architecto rem ea.',	6147.00,	77759,	30,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(89,	'natus',	'Voluptatem iste quia laborum rerum doloremque sed eos.',	2378.00,	95555,	31,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(90,	'voluptate',	'Excepturi quia provident est omnis.',	7721.00,	10862,	31,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46'),
(91,	'inventore',	'Suscipit repellat est nulla perspiciatis consectetur sunt quae.',	3999.00,	19599,	31,	'2019-01-05 10:07:46',	'2019-01-05 10:07:46');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `email_verified`, `created_at`, `updated_at`) VALUES
(4,	'user',	'3A417029@ncut.edu.tw',	NULL,	'$2y$10$cwNcDClnCJcrBvpZW7tD9eCZI9QRmnkPZQcs6BAw/VsR4OWS8R452',	'bc0jkw2D9wNTLtYviCRlvHOrzR0ql2TNQEN4a03YZBZImsMbKCN6nKe3VfB7',	0,	'2019-01-15 17:44:46',	'2019-01-15 17:44:46');

DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2019-01-16 02:03:12
