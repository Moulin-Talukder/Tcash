-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2024 at 05:51 AM
-- Server version: 10.6.18-MariaDB-cll-lve
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mouloseu_tcash`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'erikrubio923@gmail.com', 'admin', NULL, '62f26c94d11ed1660054676.png', '$2y$10$CzIt1cSzim8F7ZPQrxuqHePowSUd6Na5Q3gPX7kGpdZ2r1il0B9mW', '4Olw0HxKpN8ancrhjAY915ovdhbsPiPVsGycKDkYgqdGeRlWGBtQpBJAQh9h', NULL, '2022-08-09 12:47:56');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `user_type`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'USER', 'New member registered', 0, '/admin/users/detail/1', '2023-05-28 20:41:30', '2023-05-28 20:41:30'),
(2, 2, 'USER', 'New member registered', 0, '/admin/users/detail/2', '2023-05-28 20:56:41', '2023-05-28 20:56:41'),
(3, 1, 'MERCHANT', 'New merchant registered', 0, '/admin/merchants/detail/1', '2023-05-28 21:43:52', '2023-05-28 21:43:52'),
(4, 1, 'AGENT', 'New agent registered', 0, '/admin/agents/detail/1', '2023-05-28 21:49:05', '2023-05-28 21:49:05'),
(5, 3, 'USER', 'New member registered', 0, '/admin/users/detail/3', '2023-05-29 09:23:26', '2023-05-29 09:23:26'),
(6, 4, 'USER', 'New member registered', 0, '/admin/users/detail/4', '2023-05-30 07:34:52', '2023-05-30 07:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `kyc_data` text DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `password`, `image`, `address`, `status`, `kv`, `kyc_data`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Erik', 'Rubio', 'erikrubio923', 'Erikxepxep@gmail.com', 'ES', '34661115260', 0, 0.00000000, '$2y$10$C613wF/YBradqD0pApeDIeRtz2BuK2b29EtJDWBn10AoIKRKeGCza', NULL, '{\"address\":\"Avinguda de Castelldefels, 133 escalera a 1-1\",\"city\":\"Castelldefels\",\"state\":\"Barcelona\",\"zip\":\"08860\",\"country\":\"Spain\"}', 1, 1, NULL, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-05-28 21:49:05', '2023-05-30 10:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `agent_password_resets`
--

CREATE TABLE `agent_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_payments`
--

CREATE TABLE `api_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `trx` varchar(40) NOT NULL,
  `merchant_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `payer_id` int(10) UNSIGNED DEFAULT 0,
  `identifier` varchar(255) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL,
  `details` varchar(255) NOT NULL,
  `ipn_url` varchar(255) NOT NULL,
  `cancel_url` varchar(255) NOT NULL,
  `success_url` varchar(255) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `checkout_theme` varchar(40) DEFAULT NULL,
  `customer_name` varchar(40) NOT NULL,
  `customer_email` varchar(40) NOT NULL,
  `ver_code` int(11) DEFAULT NULL,
  `ver_code_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_logs`
--

CREATE TABLE `charge_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(40) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `currency_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `trx` varchar(40) NOT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(40) NOT NULL,
  `currency_fullname` varchar(255) NOT NULL,
  `currency_type` tinyint(1) UNSIGNED NOT NULL COMMENT '1=>Fiat, 2=>Crypto',
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `currency_symbol`, `currency_fullname`, `currency_type`, `rate`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'United States Dollar', 1, 1.00000000, 1, 1, '2022-11-05 10:18:53', '2023-05-29 22:48:54'),
(101, 'USDT', 'USDT', 'Tether USDT', 2, 1.00000000, 0, 1, '2023-05-28 20:07:55', '2023-05-29 22:48:54'),
(102, 'TRX', 'TRX', 'TRX', 2, 0.07700000, 0, 1, '2023-05-28 20:11:37', '2023-06-01 06:30:37'),
(103, '€URO', '€uro', '€uro', 1, 0.96000000, 0, 0, '2023-05-28 22:47:00', '2023-05-29 23:27:51'),
(104, '₿TC', '₿TC', 'BITCOIN', 2, 27196.00000000, 0, 0, '2023-05-28 22:48:28', '2023-05-29 23:28:05'),
(105, 'ETH', 'ETH', 'ETHERUM', 2, 1843.85000000, 0, 0, '2023-05-28 22:50:27', '2023-05-29 23:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `wallet_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `payment_try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `user_type`, `wallet_id`, `currency_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `payment_try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 2, 'USER', 5, 101, 0, 5.00000000, 'USDT', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'PN4N4VYOSKHJ', 0, 1, 0, NULL, '2023-05-28 20:58:26', '2023-05-28 20:58:26'),
(2, 4, 'USER', 26, 101, 1000, 20.00000000, 'USDT', 1.00000000, 1.00000000, 21.00000000, NULL, '0', '', 'OQ8GRT4GAUGQ', 0, 0, 0, NULL, '2023-05-30 07:36:28', '2023-05-30 07:36:28'),
(3, 2, 'USER', 5, 101, 1000, 5.00000000, 'USDT', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'DBM344M1URUF', 0, 0, 0, NULL, '2023-06-01 06:32:16', '2023-06-01 06:32:16'),
(4, 2, 'USER', 6, 102, 1001, 65.00000000, 'TRX', 0.00000000, 1.00000000, 65.00000000, NULL, '0', '', 'OYRG3S6AWZT7', 0, 0, 0, NULL, '2023-06-01 06:34:06', '2023-06-01 06:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `is_app` tinyint(1) NOT NULL DEFAULT 0,
  `token` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2022-12-31 09:45:17'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-12-21 14:13:08'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-11-20 08:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'manual_deposit', '{\"hash_or_taxid\":{\"name\":\"HASH or TaxID\",\"label\":\"hash_or_taxid\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"screnshot\":{\"name\":\"SCRENSHOT\",\"label\":\"screnshot\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png,pdf,doc,docx,txt,xlx,xlsx,csv\",\"options\":[],\"type\":\"file\"}}', '2023-05-28 20:18:54', '2023-06-01 04:39:48'),
(2, 'withdraw_method', '{\"tron_trc20_wallet\":{\"name\":\"TRON TRC20 WALLET\",\"label\":\"tron_trc20_wallet\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2023-05-28 20:21:53', '2023-06-01 04:44:05'),
(3, 'manual_deposit', '{\"hash_or_taxid\":{\"name\":\"HASH or TaxID\",\"label\":\"hash_or_taxid\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"screnshot\":{\"name\":\"SCRENSHOT\",\"label\":\"screnshot\",\"is_required\":\"optional\",\"extensions\":\"jpeg,png,pdf,doc,docx,txt,xlx,xlsx,csv\",\"options\":[],\"type\":\"file\"}}', '2023-05-29 22:43:30', '2023-06-01 04:38:45'),
(4, 'withdraw_method', '{\"tron_trc20_wallet\":{\"name\":\"TRON TRC20 WALLET\",\"label\":\"tron_trc20_wallet\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-06-01 04:57:36', '2023-06-01 04:57:36'),
(5, 'user_kyc', '{\"full_name\":{\"name\":\"FULL NAME\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"id_number\":{\"name\":\"ID NUMBER\",\"label\":\"id_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"tron_trc_wallet\":{\"name\":\"TRON TRC WALLET\",\"label\":\"tron_trc_wallet\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"name_of_the_person_who_told_you_about_us_\\/_nombre_de_la_persona_que_le_invito\":{\"name\":\"NAME OF THE PERSON WHO TOLD YOU ABOUT US \\/ NOMBRE DE LA PERSONA QUE LE INVITO\",\"label\":\"name_of_the_person_who_told_you_about_us_\\/_nombre_de_la_persona_que_le_invito\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"front_id_photo\":{\"name\":\"FRONT ID PHOTO\",\"label\":\"front_id_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-06-01 21:06:06', '2023-06-01 23:23:23'),
(6, 'agent_kyc', '{\"full_name\":{\"name\":\"FULL NAME\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"id_number\":{\"name\":\"ID NUMBER\",\"label\":\"id_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"tron_trc_wallet\":{\"name\":\"TRON TRC WALLET\",\"label\":\"tron_trc_wallet\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"name_of_the_person_who_told_you_about_us\":{\"name\":\"NAME OF THE PERSON WHO TOLD YOU ABOUT US\",\"label\":\"name_of_the_person_who_told_you_about_us\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"front_id_photo\":{\"name\":\"FRONT ID PHOTO\",\"label\":\"front_id_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"},\"back_id_photo\":{\"name\":\"BACK ID PHOTO\",\"label\":\"back_id_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-06-01 21:18:53', '2023-06-01 21:19:27'),
(7, 'merchant_kyc', '{\"full_name\":{\"name\":\"FULL NAME\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"enterprise_name\":{\"name\":\"ENTERPRISE NAME\",\"label\":\"enterprise_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"enterprie_credentials\":{\"name\":\"ENTERPRIE CREDENTIALS\",\"label\":\"enterprie_credentials\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"your_personal_id_number\":{\"name\":\"YOUR PERSONAL ID NUMBER\",\"label\":\"your_personal_id_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"tron_trc_wallet\":{\"name\":\"TRON TRC WALLET\",\"label\":\"tron_trc_wallet\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"name_of_the_person_who_told_you_about_us\":{\"name\":\"NAME OF THE PERSON WHO TOLD YOU ABOUT US\",\"label\":\"name_of_the_person_who_told_you_about_us\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"front_id_photo\":{\"name\":\"FRONT ID PHOTO\",\"label\":\"front_id_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"},\"back_id_photo\":{\"name\":\"BACK ID PHOTO\",\"label\":\"back_id_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"},\"logo_enterprise\":{\"name\":\"LOGO ENTERPRISE\",\"label\":\"logo_enterprise\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-06-01 21:19:59', '2023-06-01 21:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"wallet\",\"currency\",\"e-wallet\"],\"description\":\"Tcash - Your ultimate tool for hassle-free financial management, simplifying transactions and budgeting effortlessly.\",\"social_title\":\"Introducing Tcash: Streamlining Your Finances Like Never Before!\",\"social_description\":\"Say goodbye to financial stress with Tcash! Manage your money, track expenses, and achieve your financial goals effortlessly. #Tcash #FinancialFreedom\",\"image\":\"662d45d72445e1714243031.jpg\"}', '2020-07-04 23:42:52', '2024-04-28 04:37:11'),
(24, 'about.content', '{\"has_image\":\"1\",\"title\":\"ABOUT US\",\"heading\":\"In EGLOBAL We are experts in this field, circular economy and donations as well as transactions, transfers and payments of various types around the world.\",\"short_details\":\"EGLOBAL is a friendly community of people interested in the world of cryptocurrencies.\\nThis community is based on the gift of friends and the circular economy to obtain joint benefits in a different and safe way.\\nThe Community has a wide range of services to collaborate in the development of our members in the world of cryptocurrencies and for our own development as a Community.\\nAmong them is that we have incorporated some resources such as a wallet so that users can make transactions between them, donations and work on the friend plan to be part of our small circular economy.\\nYou can also use it as a wallet to safely store or transfer to othersn of your projects\\n\\nWhat is xcash? \\n\\n\\\"XCASH\\\" Ultimate Bundle a professional digital wallet app implemented to our giving community. \\nOur wallet offers a range of premium features that we can use for our Circular Project and for journal transactions. \\nThis includes currency conversion, secure QR code scanning, fast and secure money adding and withdrawing systems, smart money transfer and payment systems, competitive currency exchange rates, customizable invoice, and user-to-user money request. coupon creation and redemption systems, real-time push notifications, multi-language and KYC verification support, and multiple layers of security via email, SMS, and 2FA verification\",\"button_name\":\"Know More\",\"button_link\":\"about-us\",\"experience_text\":\"Years of Experience\",\"background_image\":\"62efc7c7b6ef61659881415.jpg\"}', '2020-10-28 00:51:20', '2023-05-30 23:57:21'),
(25, 'blog.content', '{\"title\":\"Our latest Announces\",\"heading\":\"Our Announces and Articles\",\"subheading\":\"All our news and news. Stay informed and the day of any information or news both about updates in the wallet and news from the EGLOBAL community\"}', '2020-10-28 00:51:34', '2023-05-30 00:44:02'),
(27, 'contact_us.content', '{\"title\":\"Contact with us CEO EGLOBAL\",\"heading\":\"Get in touch for any kind of help and informations\",\"email_address\":\"info@eglobalcash.app\",\"address\":\"22 bekar streat, London, England\",\"contact_number\":\"Whatsapp: +1(475)315-8544\"}', '2020-10-28 00:59:19', '2023-05-31 04:14:25'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\"}', '2020-10-28 01:04:02', '2020-10-28 01:04:02'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-square\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2020-11-12 04:07:30', '2022-08-07 10:24:38'),
(33, 'feature.content', '{\"has_image\":\"1\",\"heading\":\"Approve more transactions\",\"subheading\":\"Experience more approvals on every single payment with local and global payment processing, data-driven optimizations, and powerful risk management. All within a fully connected single payments system.\",\"image\":\"62efcd0207ca41659882754.jpg\",\"background_image\":\"62efcd021f8d71659882754.png\"}', '2021-01-03 23:40:54', '2022-08-07 13:02:34'),
(34, 'feature.element', '{\"has_image\":\"1\",\"title\":\"Currencies Accepted\",\"short_details\":\"The main currencies accepted are cryptocurrencies: Tether USDT &amp; TRX\",\"icon\":\"62efcd508165d1659882832.png\"}', '2021-01-03 23:41:02', '2023-05-30 00:54:10'),
(35, 'service.element', '{\"title\":\"Complete Wallet\",\"service_icon\":\"<i class=\\\"las la-wallet\\\"><\\/i>\",\"description\":\"\\\"XCASH\\\" Ultimate Bundle a professional digital wallet app. Our wallet offers a range of premium features including currency conversion, secure QR code scanning, fast and secure adding and withdrawing systems, smart money transfer and payment systems, competitive currency exchange rates, customizable invoice and application of money from user to user. coupon creation and redemption systems, real-time push notifications, multi-language and KYC verification support, and multiple layers of security via email, SMS, and 2FA verification\"}', '2021-03-06 01:12:10', '2023-05-29 23:41:36'),
(36, 'service.content', '{\"has_image\":\"1\",\"heading\":\"What we serve our customer\",\"subheading\":\"Below you can read various amenities available to the wallet\",\"background_image\":\"62efca21621291659882017.png\"}', '2021-03-06 01:27:34', '2023-05-29 23:40:34'),
(39, 'banner.content', '{\"has_image\":\"1\",\"title\":\"We are EGLOBAL\",\"heading\":\"Your Wallet for Friendly Donations, Gifts and Transaction\",\"subheading\":\"Complete solution for mobile money and wallet system. to carry out friendly transactions, I have incorporated it into your work and our community towards the donation system let\'s create a circular and sustained economy\",\"button_name\":\"Get Started\",\"button_link\":\"user\\/login\",\"video_button_name\":\"See How\",\"video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=0Ly5-M1jk_g\",\"background_image\":\"62ef9130b41251659867440.jpg\"}', '2021-05-02 06:09:30', '2023-05-30 22:06:50'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', '2020-07-04 23:42:52', '2022-03-30 11:23:12'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-family:Poppins, sans-serif;\\\"><span style=\\\"font-weight:bolder;color:rgb(0,0,0);\\\"><font size=\\\"3\\\" face=\\\"arial\\\">POLITICA DE PRIVACIDAD<\\/font><\\/span><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font color=\\\"#000000\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\">\\u00daltima actualizaci\\u00f3n: Enero 2023.<\\/span><\\/font><\\/font><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">1.<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">\\u00a0<\\/span><\\/font><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">INFORMACI\\u00d3N AL USUARIO<\\/span><\\/font><\\/span><\\/font><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">EGLOBAL, S.L.<\\/span><\\/font><\\/span>\\u00a0<font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">, como Responsable del Tratamiento, le informa que, seg\\u00fan lo dispuesto en el Reglamento (UE) 2016\\/679, de 27 de abril, (RGPD) y en la L.O. 3\\/2018, de 5 de diciembre, de protecci\\u00f3n de datos y garant\\u00eda de los derechos digitales (LOPDGDD), trataremos su datos tal y como reflejamos en la presente Pol\\u00edtica de Privacidad.<\\/span><\\/font><\\/font><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font color=\\\"#000000\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\">En esta Pol\\u00edtica de Privacidad describimos c\\u00f3mo recogemos sus datos personales y por qu\\u00e9 los recogemos, qu\\u00e9 hacemos con ellos, con qui\\u00e9n los compartimos, c\\u00f3mo los protegemos y sus opciones en cuanto al tratamiento de sus datos personales.<\\/span><\\/font><\\/font><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font color=\\\"#000000\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\">Esta Pol\\u00edtica se aplica al tratamiento de sus datos personales recogidos por la empresa para la prestaci\\u00f3n de sus servicios. Si acepta las medidas de esta Pol\\u00edtica, acepta que tratemos sus datos personales como se define en esta Pol\\u00edtica.<\\/span><\\/font><\\/font><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\">2. CONTACTO<\\/span><\\/font><\\/font><\\/span><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Denominaci\\u00f3n social: ECONOMIA GLOBAL<\\/span><\\/font><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">, S.L.<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/>Nombre comercial: EGLOBAL CASH<\\/span><\\/font><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/>Domicilio:\\u00a0<\\/span><\\/font><\\/font><span style=\\\"background-color:rgb(0,44,96);font-family:\'Maven Pro\', sans-serif;font-size:1.25rem;\\\">22 bekar street, Londres, Inglaterra<\\/span><\\/p><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">3. PRINCIPIOS CLAVE<\\/span><\\/font><\\/span><\\/font><\\/p><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font color=\\\"#000000\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\">Siempre hemos estado comprometidos con prestar nuestros servicios con el m\\u00e1s alto grado de calidad, lo que incluye tratar sus datos con seguridad y transparencia. Nuestros principios son:<\\/span><\\/font><\\/font><\\/p><ul style=\\\"color:rgb(33,37,41);font-family:Poppins, sans-serif;font-size:16px;font-weight:400;\\\"><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Legalidad<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Solo recopilaremos sus Datos personales para fines espec\\u00edficos<\\/span><\\/font><a href=\\\"https:\\/\\/ceporros.com\\/\\\"><font color=\\\"#008be2\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"background:transparent;\\\">,<\\/span><\\/span><\\/font><\\/a><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">\\u00a0expl\\u00edcitos y leg\\u00edtimos.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Minimizaci\\u00f3n de datos<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Limitamos la recogida de datos de car\\u00e1cter personal a lo que es estrictamente relevante y necesario para los fines para los que se han recopilado.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Limitaci\\u00f3n de la Finalidad<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Solo recogeremos sus datos personales para los fines declarados y solo seg\\u00fan sus deseos.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Precisi\\u00f3n<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Mantendremos sus datos personales exactos y actualizados.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Seguridad de los Datos<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Aplicamos las medidas t\\u00e9cnicas y organizativas adecuadas y proporcionales a los riesgos para garantizar que sus datos no sufran da\\u00f1os, tales como divulgaci\\u00f3n o acceso no autorizado, la destrucci\\u00f3n accidental o il\\u00edcita o su p\\u00e9rdida accidental o alteraci\\u00f3n y cualquier otra forma de tratamiento il\\u00edcito.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Acceso y Rectificaci\\u00f3n<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Disponemos de medios para que acceda o rectifique sus datos cuando lo considere oportuno.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Conservaci\\u00f3n<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Conservamos sus datos personales de manera legal y apropiada y solo mientras es necesario para los fines para los que se han recopilado.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Las transferencias internacionales<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: cuando se d\\u00e9 el caso de que sus datos vayan a ser transferidos fuera de la UE\\/EEE se proteger\\u00e1n adecuadamente.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Terceros<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: El acceso y transferencia de datos personales a terceros se llevan a cabo de acuerdo con las leyes y reglamentos aplicables y con las garant\\u00edas contractuales adecuadas.<\\/span><\\/font><\\/font><\\/p><\\/li><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">Marketing Directo y cookies<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">: Cumplimos con la legislaci\\u00f3n aplicable en materia de publicidad y Galletas.<\\/span><\\/font><\\/font><\\/p><\\/li><\\/ul><p style=\\\"margin-bottom:0cm;font-family:Poppins, sans-serif;border:none;padding:0cm;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\"><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\">4. RECOGIDA Y TRATAMIENTO DE SUS DATOS PERSONALES<\\/span><\\/font><\\/span><font color=\\\"#000000\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/>Las tipos de datos que se pueden solicitar y tratar son:<\\/span><\\/font><\\/font><\\/p><ul style=\\\"color:rgb(33,37,41);font-family:Poppins, sans-serif;font-size:16px;font-weight:400;\\\"><li><p style=\\\"margin-bottom:0cm;border:none;padding:0cm;\\\"><font color=\\\"#000000\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;\\\">Datos de car\\u00e1cter identificativo.<\\/span><\\/font><\\/font><\\/p><\\/li><\\/ul><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-family:Poppins, sans-serif;\\\"><font color=\\\"#ffffff\\\" size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"font-weight:bolder;color:rgb(0,0,0);\\\">Tambi\\u00e9n recogemos de forma autom\\u00e1tica datos sobre su visita a nuestro sitio web seg\\u00fan se describe en la pol\\u00edtica de cookies.<\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-family:Poppins, sans-serif;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"color:rgb(0,0,0);\\\">\\u00bfQu\\u00e9 informaci\\u00f3n recopilamos?<\\/span><br \\/><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\"><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><font color=\\\"#000000\\\" size=\\\"3\\\" face=\\\"arial\\\">Recopilamos datos de usted cuando se registra en nuestro sitio, env\\u00eda una solicitud, compra cualquier servicio, reacciona a una descripci\\u00f3n general o completa una estructura. En el momento en que solicite asistencia o se inscriba en nuestro sitio, seg\\u00fan corresponda, es posible que se le solicite que ingrese su: nombre, direcci\\u00f3n de correo electr\\u00f3nico o n\\u00famero de tel\\u00e9fono. Sin embargo, puede visitar nuestro sitio de forma an\\u00f3nima.<\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);font-weight:600;\\\"><font size=\\\"3\\\" face=\\\"arial\\\">\\u00bfC\\u00f3mo protegemos su informaci\\u00f3n?<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);\\\"><font size=\\\"3\\\" face=\\\"arial\\\">Todos los datos delicados\\/crediticios proporcionados se env\\u00edan a trav\\u00e9s de Stripe.<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><font size=\\\"3\\\" face=\\\"arial\\\"><span style=\\\"color:rgb(0,0,0);\\\">Despu\\u00e9s de un intercambio, sus datos privados (tarjetas de cr\\u00e9dito, n\\u00fameros de seguro social, finanzas, etc.) no se guardar\\u00e1n en nuestros trabajadores.<\\/span><span style=\\\"color:rgb(0,0,0);font-weight:600;\\\">\\u00bfDivulgamos alguna informaci\\u00f3n a terceros?<\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);\\\"><font size=\\\"3\\\" face=\\\"arial\\\">No vendemos, intercambiamos ni, en ning\\u00fan caso, nos movemos a reuniones externas por y por datos reconocibles. Esto excluye a personas externas que conf\\u00edan en nosotros y que nos ayudan a trabajar en nuestro sitio, dirigir nuestro negocio o ajustarlo, ya que esas reuniones dan su consentimiento para mantener estos datos privados. Tambi\\u00e9n podemos entregar sus datos cuando aceptemos que la descarga es adecuada para cumplir con la ley, implementar las estrategias de nuestro sitio o garantizar nuestros propios derechos, propiedad o bienestar o los de otros.<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);font-weight:600;\\\"><font size=\\\"3\\\" face=\\\"arial\\\">Cumplimiento de la Ley de Protecci\\u00f3n de la Privacidad en L\\u00ednea de los Ni\\u00f1os<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);\\\"><font size=\\\"3\\\" face=\\\"arial\\\">Somos consistentes con los requisitos previos de COPPA (Ley de Protecci\\u00f3n de la Privacidad en L\\u00ednea de los Ni\\u00f1os), no recopilamos ning\\u00fan dato de nadie menor de 13 a\\u00f1os. Nuestro sitio, art\\u00edculos y administraciones est\\u00e1n completamente coordinados con personas que en cualquier caso tienen 13 a\\u00f1os de edad o m\\u00e1s establecidos.<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);font-weight:600;\\\"><font size=\\\"3\\\" face=\\\"arial\\\">Cambios en nuestra Pol\\u00edtica de Privacidad<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);\\\"><font size=\\\"3\\\" face=\\\"arial\\\">Si decidimos cambiar nuestra pol\\u00edtica de privacidad, publicaremos esos cambios en esta p\\u00e1gina.<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);font-weight:600;\\\"><font size=\\\"3\\\" face=\\\"arial\\\">\\u00bfCu\\u00e1nto tiempo conservamos su informaci\\u00f3n?<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);\\\"><font size=\\\"3\\\" face=\\\"arial\\\">En el momento en que se registra en nuestro sitio, reproducimos y conservamos la informaci\\u00f3n que tenemos sobre usted, siempre y cuando no borre el registro o se retire (sujeto a las leyes y directrices).<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);font-weight:600;\\\"><font size=\\\"3\\\" face=\\\"arial\\\">Qu\\u00e9 no hacemos con tus datos<\\/font><\\/span><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-family:Poppins, sans-serif;\\\"><span style=\\\"color:rgb(52,73,94);font-weight:600;\\\"><font size=\\\"3\\\" face=\\\"arial\\\">No compartimos, revelaremos, venderemos y, en cualquier caso, daremos su informaci\\u00f3n a diferentes organizaciones para la promoci\\u00f3n de sus art\\u00edculos o administraciones.<\\/font><\\/span><\\/p><\\/div>\"}', '2021-06-09 08:50:42', '2023-05-28 20:36:46'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-family:Poppins, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">T\\u00e9rminos y condiciones para los usuarios<\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Reclamamos plena autoridad para desestimar, cancelar o deshabilitar cualquier ayuda con o sin causa a discreci\\u00f3n del administrador. Esta es una facilitaci\\u00f3n independiente completa, en caso de que haga un mal uso de nuestro ticket o Livechat o red de apoyo emocional enviando solicitudes o protestas, da\\u00f1aremos su registro. El momento solitario en el que debe contactarnos sobre la facilitaci\\u00f3n del trabajo es si hay un problema con la plataforma o su desempe\\u00f1o en ella. No tenemos muchas limitaciones de sustancia y todo est\\u00e1 de acuerdo con las leyes y directrices. Por favor, trate de no unirse en caso de que tenga la intenci\\u00f3n de hacer algo contrario a las pautas, verificamos estas cosas y lo sabremos, por favor no queme nuestro y su tiempo uni\\u00e9ndose en caso de que piense que tendr\\u00e1 la opci\\u00f3n de escabullirse m\\u00e1s all\\u00e1 de nosotros y romper los t\\u00e9rminos.<\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Antes de venir a este sitio, usted acepta estar sujeto a estos T\\u00e9rminos y Condiciones de Uso del Sitio, cualquier ley y gu\\u00eda aplicable, y acepta que usted es responsable de la coherencia con cualquier ley material del vecindario. Si no est\\u00e1 de acuerdo con alguno de estos t\\u00e9rminos, se le restringe el uso o acceso a este sitio.<\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Apoyo<\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Siempre que haya descargado nuestro art\\u00edculo, puede contactarnos para obtener ayuda por correo electr\\u00f3nico y haremos un valiente esfuerzo para determinar su problema. Intentaremos responder por correo electr\\u00f3nico para correcciones de errores m\\u00e1s modestas, despu\\u00e9s de lo cual actualizaremos el paquete principal. La ayuda de contenido se ofrece a los clientes confirmados por Tickets, por as\\u00ed decirlo. Demandas de soporte realizadas por correo electr\\u00f3nico y Livechat.<\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Propiedad<\\/span><\\/span><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"line-height:1.3;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">No puede garantizar la posesi\\u00f3n acad\\u00e9mica o selectiva de ninguno de nuestros art\\u00edculos, alterados o inalterados. Todos los art\\u00edculos son propiedad, nosotros los creamos. Nuestros art\\u00edculos se proporcionan \\\"sin garant\\u00edas\\\" sin garant\\u00eda de ning\\u00fan tipo, ya sea comunicada o sugerida. En ninguna ocasi\\u00f3n nuestra persona jur\\u00eddica estar\\u00e1 sujeta a da\\u00f1os y perjuicios, incluidos, entre otros, da\\u00f1os inmediatos, indirectos, extraordinarios, accidentales o significativos o diferentes desgracias derivadas del uso o imposibilidad de uso de nuestros art\\u00edculos.<\\/span><\\/span><\\/font><\\/h3><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-family:Poppins, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Uso no autorizado\\/ilegal<\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">No puede imitar, copiar, duplicar, vender, comerciar o aventurar ninguno de nuestros segmentos, el uso de lo que se ofrece en nuestras cosas o la admisi\\u00f3n a la administraci\\u00f3n sin el consentimiento expreso por escrito de nosotros o del propietario del art\\u00edculo.<\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Nuestros miembros son responsables de toda sustancia publicada en la discusi\\u00f3n, manifestaci\\u00f3n y movimiento que ocurra bajo su registro.<\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Podemos obstaculizar r\\u00e1pidamente su cuenta de participaci\\u00f3n si pensamos en una conducta particularmente inadmisible.<\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\"><br \\/><\\/span><\\/span><\\/font><\\/p><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">Si se registra en nuestro sitio, usted es responsable de mantener la seguridad de su registro, y usted es totalmente responsable de todos los ejercicios que ocurran bajo el registro y ciertas otras actividades realizadas en relaci\\u00f3n con el registro. Debe informarnos de inmediato cualquier empleo no aprobado de su registro o cualquier otro penetrante de seguridad.<\\/span><\\/span><\\/font><\\/p><\\/div><\\/div>\"}', '2021-06-09 08:51:18', '2023-05-28 20:37:40'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-12-11 12:26:29'),
(45, 'brands.content', '{\"heading\":\"Make friendly transfers or send to other platforms or wallets from the security of working with EGLOBAL CASH. Our payment gateway integrate about 50+ platform.\"}', '2022-08-07 08:47:53', '2023-05-29 23:02:27'),
(46, 'brands.element', '{\"has_image\":\"1\",\"image\":\"6474b27d5398d1685369469.png\"}', '2022-08-07 08:48:06', '2023-05-29 23:11:09'),
(47, 'brands.element', '{\"has_image\":\"1\",\"image\":\"6474b2dac7f591685369562.png\"}', '2022-08-07 08:48:11', '2023-05-29 23:12:42'),
(48, 'brands.element', '{\"has_image\":\"1\",\"image\":\"6474b288408931685369480.png\"}', '2022-08-07 08:48:16', '2023-05-29 23:11:20'),
(49, 'brands.element', '{\"has_image\":\"1\",\"image\":\"6474b2ec698af1685369580.png\"}', '2022-08-07 08:48:22', '2023-05-29 23:13:00'),
(50, 'footer.content', '{\"has_image\":\"1\",\"box_heading\":\"Do you want to send money anytime to anywhere?\",\"box_button_name\":\"Get Started\",\"box_button_link\":\"https:\\/\\/eglobalcash.app\\/user\\/dashboard\",\"short_details\":\"The definitive solution for the electronic wallet service between communities and to external parties\\n\\nComplete solution for mobile money and wallet system. It comes with user, transfer and exchange system, you can also get the merchant title with e-commerce API and QR code.\",\"background_image\":\"62efa690cf47d1659872912.png\"}', '2022-08-07 10:18:32', '2023-05-30 23:00:12'),
(51, 'social_icon.element', '{\"title\":\"instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/instagram.com\"}', '2022-08-07 10:24:51', '2023-05-29 23:37:47'),
(52, 'social_icon.element', '{\"title\":\"YOUTUBE\",\"social_icon\":\"<i class=\\\"fab fa-youtube\\\"><\\/i>\",\"url\":\"https:\\/\\/www.youtube.com\\/@EGLOBALCASH\"}', '2022-08-07 10:25:05', '2023-05-30 22:26:27'),
(53, 'social_icon.element', '{\"title\":\"SUPPORT\",\"social_icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\",\"url\":\"https:\\/\\/t.me\\/XCASHSUPPORT\"}', '2022-08-07 10:25:17', '2023-05-30 22:24:09'),
(54, 'policy_pages.element', '{\"title\":\"Security Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2022-08-07 10:36:11', '2022-08-07 10:36:11'),
(55, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"62efad03dcc131659874563.jpg\"}', '2022-08-07 10:46:03', '2022-08-07 10:46:04'),
(56, 'about.element', '{\"has_image\":\"1\",\"award_logo\":\"62efc8822fe8c1659881602.png\"}', '2022-08-07 12:41:32', '2022-08-07 12:43:22'),
(57, 'about.element', '{\"has_image\":\"1\",\"award_logo\":\"62efc81e9ac1d1659881502.png\"}', '2022-08-07 12:41:42', '2022-08-07 12:41:43'),
(58, 'about.element', '{\"has_image\":\"1\",\"award_logo\":\"62efc90faa9941659881743.png\"}', '2022-08-07 12:41:49', '2022-08-07 12:45:44'),
(59, 'service.element', '{\"title\":\"Money Transfer\",\"service_icon\":\"<i class=\\\"las la-directions\\\"><\\/i>\",\"description\":\"intelligent money transfer and between users, with the mail or the user can make a transaction in a matter of seconds\"}', '2022-08-07 12:51:00', '2023-05-29 23:42:47'),
(60, 'service.element', '{\"title\":\"Email Invoicing\",\"service_icon\":\"<i class=\\\"las la-file-invoice\\\"><\\/i>\",\"description\":\"Through the mail you can receive or send balance and you will also be notified of the news\"}', '2022-08-07 12:51:10', '2023-05-29 23:43:36'),
(61, 'service.element', '{\"title\":\"Cash Out\",\"service_icon\":\"<i class=\\\"las la-cloud-download-alt\\\"><\\/i>\",\"description\":\"Through cash out you can make a direct payment to your agent or from the shop directly to EGLOBAL, but the fastest and most recommended is the current transaction between users\"}', '2022-08-07 12:51:19', '2023-05-29 23:52:52'),
(62, 'service.element', '{\"title\":\"Cash in\",\"service_icon\":\"<i class=\\\"las la-cloud-upload-alt\\\"><\\/i>\",\"description\":\"Receive money through shipments from other users or with tickets or donation vouchers\"}', '2022-08-07 12:51:30', '2023-05-29 23:48:18'),
(63, 'service.element', '{\"title\":\"Money\",\"service_icon\":\"<i class=\\\"fas fa-coins\\\"><\\/i>\",\"description\":\"Your funds are protected in a secure account and you can always and without restrictions have them\"}', '2022-08-07 12:51:42', '2023-05-29 23:52:38'),
(64, 'why_choose_us.content', '{\"has_image\":\"1\",\"heading\":\"Why are so many people switching to EGLOBAL?\",\"subheading\":\"We offer an infinite number of services but transparency is our motto\",\"background_image\":\"62efcb7aacf181659882362.png\"}', '2022-08-07 12:56:02', '2023-05-30 00:09:05'),
(65, 'why_choose_us.element', '{\"has_image\":\"1\",\"title\":\"Lowest payment processing fees\",\"short_details\":\"We adapt for a growing community and not wealthy investors (Also accepted)\",\"icon\":\"62efcb8dc85f01659882381.png\"}', '2022-08-07 12:56:21', '2023-05-30 00:11:05'),
(66, 'why_choose_us.element', '{\"has_image\":\"1\",\"title\":\"No locked-in contracts Ever\",\"short_details\":\"Accounts not blocked under security, the user is free and we will not ask for explanations,  commitment is important for us and for the users\",\"icon\":\"62efcb9cbfdc11659882396.png\"}', '2022-08-07 12:56:36', '2023-06-01 21:37:08'),
(67, 'why_choose_us.element', '{\"has_image\":\"1\",\"title\":\"Full transparency Always\",\"short_details\":\"We are completely transparent with users and you can have all the information through the different means available.\",\"icon\":\"62efcba62dca91659882406.png\"}', '2022-08-07 12:56:46', '2023-06-01 21:38:10'),
(68, 'why_choose_us.element', '{\"has_image\":\"1\",\"title\":\"Get your money in less than a day\",\"short_details\":\"Transactions between users are instant but withdrawals may take a few hours, always depending on the quality of network coverage at that time.\",\"icon\":\"62efcbb6008e51659882422.png\"}', '2022-08-07 12:57:01', '2023-05-30 00:14:46'),
(69, 'why_choose_us.element', '{\"has_image\":\"1\",\"title\":\"Payment technology that works\",\"short_details\":\"Perfect to insert it with your work\",\"icon\":\"62efcbbf6c99b1659882431.png\"}', '2022-08-07 12:57:11', '2023-05-30 01:05:07'),
(70, 'why_choose_us.element', '{\"has_image\":\"1\",\"title\":\"A membership plan with wholesale rates\",\"short_details\":\"Take advantage of the exclusivity of being a member of EGLOBAL and using the wallet\",\"icon\":\"62efcbce496501659882446.png\"}', '2022-08-07 12:57:26', '2023-05-30 01:04:25'),
(71, 'feature.element', '{\"has_image\":\"1\",\"title\":\"Payment Types Accepted\",\"short_details\":\"For now the current payment types through the Tron network but updates are expected and add others in the future\",\"icon\":\"62efcd57adab41659882839.png\"}', '2022-08-07 13:02:47', '2023-05-30 00:56:44'),
(72, 'feature.element', '{\"has_image\":\"1\",\"title\":\"User Control Pannel\",\"short_details\":\"From the panel you can enjoy an optimal experience with the characteristics and specific or adequate damage for your purpose\",\"icon\":\"62efcd5e6eecd1659882846.png\"}', '2022-08-07 13:03:11', '2023-05-30 00:58:07');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(73, 'business.content', '{\"title\":\"Our top client\",\"heading\":\"We\'ve build solutions for\",\"subheading\":\"Below you can see some of our most outstanding clients or collaborators\"}', '2022-08-07 13:06:49', '2023-05-30 00:53:01'),
(74, 'business.element', '{\"has_image\":\"1\",\"client_logo\":\"62efce30a70c31659883056.png\"}', '2022-08-07 13:07:36', '2022-08-07 13:07:36'),
(75, 'business.element', '{\"has_image\":\"1\",\"client_logo\":\"62efce3fd48eb1659883071.png\"}', '2022-08-07 13:07:51', '2022-08-07 13:07:51'),
(76, 'business.element', '{\"has_image\":\"1\",\"client_logo\":\"62efce4d10ab91659883085.png\"}', '2022-08-07 13:08:05', '2022-08-07 13:08:05'),
(77, 'business.element', '{\"has_image\":\"1\",\"client_logo\":\"62efce58cc7f81659883096.png\"}', '2022-08-07 13:08:16', '2022-08-07 13:08:16'),
(78, 'business.element', '{\"has_image\":\"1\",\"client_logo\":\"62efce65032f51659883109.png\"}', '2022-08-07 13:08:29', '2022-08-07 13:08:29'),
(79, 'business.element', '{\"has_image\":\"1\",\"client_logo\":\"62efce73ef35f1659883123.png\"}', '2022-08-07 13:08:43', '2022-08-07 13:08:43'),
(80, 'overview.content', '{\"has_image\":\"1\",\"heading\":\"We provide the best support service for transfer between users.\",\"subheading\":\"Every day there are more people who join this great community and the counters are modified regularly so that everyone can see the common progress\",\"video_link\":\"https:\\/\\/www.youtube.com\\/embed\\/6agL8KHQlA0\",\"background_image\":\"62efcf261c26c1659883302.jpg\"}', '2022-08-07 13:11:42', '2023-05-31 00:15:54'),
(81, 'overview.element', '{\"title\":\"Total User\",\"counter_digit\":\"22\"}', '2022-08-07 13:11:52', '2023-05-29 23:14:16'),
(82, 'overview.element', '{\"title\":\"Total Transaction\",\"counter_digit\":\"45\"}', '2022-08-07 13:12:01', '2023-05-29 23:14:28'),
(83, 'overview.element', '{\"title\":\"USER active accounts\",\"counter_digit\":\"19\"}', '2022-08-07 13:12:09', '2023-05-29 23:15:20'),
(84, 'testimonial.content', '{\"title\":\"Our client testimonial\",\"heading\":\"What people say\",\"subheading\":\"We will publish the messages and opinions of the members, give us yours too\"}', '2022-08-07 13:15:52', '2023-05-30 02:08:18'),
(85, 'testimonial.element', '{\"has_image\":\"1\",\"author_name\":\"Taylor Otwell\",\"designation\":\"Laravel Developer\",\"quote\":\"As the manager of the image directive, I can say that the idea is a good one and all my friends want to be part of the community.\",\"author_image\":\"62efd04613fa71659883590.jpg\"}', '2022-08-07 13:16:30', '2023-05-29 23:29:50'),
(86, 'testimonial.element', '{\"has_image\":\"1\",\"author_name\":\"Jeffrey Way\",\"designation\":\"Laravel Developer\",\"quote\":\"The team hopes to help everyone navigate the world of cryptocurrencies. If you need advice, do not hesitate to contact\",\"author_image\":\"62efd05e00d4d1659883614.jpg\"}', '2022-08-07 13:16:53', '2023-05-29 23:31:15'),
(91, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Ease of access\",\"description\":\"<div style=\\\"text-align:justify;\\\"><span><font color=\\\"#666666\\\" face=\\\"arial\\\" size=\\\"3\\\">We want to offer the maximum comfort possible, so we will give all possible facilities\\u00a0<\\/font><\\/span><span><font color=\\\"#666666\\\" face=\\\"arial\\\" size=\\\"3\\\">from connecting to a PC to connecting to a mobile terminal anywhere in the world and at any time of the day<\\/font><\\/span><\\/div>\",\"image\":\"62efd229049d11659884073.jpg\"}', '2022-08-07 13:24:33', '2023-05-30 00:41:50'),
(92, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The transfer and transaction system, wallet, exchange \\\"XCash\\\" is inaugurated\",\"description\":\"<div style=\\\"text-align:justify;\\\"><span><font color=\\\"#666666\\\" face=\\\"arial\\\" size=\\\"3\\\">The new wallet is inaugurated, which in the future we will seek to allocate to communities to facilitate transactions between users<br \\/><\\/font><\\/span><\\/div><div style=\\\"text-align:justify;\\\"><span><font color=\\\"#666666\\\" face=\\\"arial\\\" size=\\\"3\\\">\\\"XCASH\\\" Ultimate Bundle\\u00a0<\\/font><\\/span><span><font color=\\\"#666666\\\" face=\\\"arial\\\" size=\\\"3\\\">a professional digital wallet app. Our wallet offers a range of premium features including currency conversion, secure QR code scanning, fast and secure adding and withdrawing systems, smart money transfer and payment systems, competitive currency exchange rates, customizable invoice and application of money from user to user. coupon creation and redemption systems, real-time push notifications, multi-language and KYC verification support, and multiple layers of security via email, SMS, and 2FA verification<\\/font><\\/span><\\/div>\",\"image\":\"63b006ba531291672480442.jpg\"}', '2022-08-08 08:24:52', '2023-05-30 23:42:26'),
(93, 'login.content', '{\"has_image\":\"1\",\"background_image\":\"62f0f5b2697a11659958706.jpg\"}', '2022-08-08 10:08:26', '2022-08-08 10:08:26'),
(94, 'agent_login.content', '{\"has_image\":\"1\",\"background_image\":\"6374b333463a21668592435.jpg\"}', '2022-11-16 07:23:55', '2022-11-16 07:23:55'),
(95, 'merchant_login.content', '{\"has_image\":\"1\",\"background_image\":\"6378830a675cf1668842250.jpg\"}', '2022-11-19 04:47:30', '2022-11-19 04:47:30'),
(103, 'subscribe.content', '{\"has_image\":\"1\",\"heading\":\"Subscribe to Our Newsletter\",\"subheading\":\"Follow our newsletter to learn more about services and building a community connection. Stay up to date on various workshops and business events from the EGLOBAL community.\",\"image\":\"63aace86cae331672138374.jpg\"}', '2022-12-27 07:23:23', '2023-05-29 23:33:32'),
(104, 'social_icon.element', '{\"title\":\"channel telegram\",\"social_icon\":\"<i class=\\\"far fa-paper-plane\\\"><\\/i>\",\"url\":\"https:\\/\\/t.me\\/eglobalcashc\"}', '2023-05-28 21:10:49', '2023-05-28 21:10:49'),
(105, 'service.element', '{\"title\":\"Deposit Withdrawals\",\"service_icon\":\"<i class=\\\"far fa-credit-card\\\"><\\/i>\",\"description\":\"deposit withdrawals. These can be in more than one currency and within the wallet they can be exchanged for each other according to our conbenience\"}', '2023-05-29 23:56:41', '2023-05-31 00:03:24'),
(106, 'service.element', '{\"title\":\"Our community\",\"service_icon\":\"<i class=\\\"fas fa-user-friends\\\"><\\/i>\",\"description\":\"By joining, you will be part of a caring and hard-working global and multicultural community interested in the world of cryptocurrencies, and that will provide support and guidance to generate extra income.\\nIn addition, you will be able to meet people with your same interests and objectives.\"}', '2023-05-30 00:01:47', '2023-05-30 00:01:47'),
(107, 'social_icon.element', '{\"title\":\"Telegram group\",\"social_icon\":\"<i class=\\\"far fa-paper-plane\\\"><\\/i>\",\"url\":\"https:\\/\\/t.me\\/eglobalcash\"}', '2023-05-30 22:21:38', '2023-05-30 22:21:38'),
(108, 'service.element', '{\"title\":\"Value tools\",\"service_icon\":\"<i class=\\\"fas fa-comments-dollar\\\"><\\/i>\",\"description\":\"We also offer exclusively to active partners the marketing and advertising tools that we use so that they can give visibility to their projects and in particular have exponential growth with us.\"}', '2023-05-31 00:08:25', '2023-05-31 00:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `currency_id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 101, 'Paypal', 'Paypal', 0, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:52:17'),
(2, 0, 0, 102, 'Perfect Money', 'PerfectMoney', 0, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:23'),
(3, 0, 0, 103, 'Stripe Hosted', 'Stripe', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:07'),
(4, 0, 0, 104, 'Skrill', 'Skrill', 0, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:15'),
(5, 0, 0, 105, 'PayTM', 'Paytm', 0, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:44'),
(6, 0, 0, 106, 'Payeer', 'Payeer', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 0, 0, 107, 'PayStack', 'Paystack', 0, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:55'),
(8, 0, 0, 108, 'VoguePay', 'Voguepay', 0, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:50:43'),
(9, 0, 0, 109, 'Flutterwave', 'Flutterwave', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:45:30'),
(10, 0, 0, 110, 'RazorPay', 'Razorpay', 0, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:31'),
(11, 0, 0, 111, 'Stripe Storefront', 'StripeJs', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:51:00'),
(12, 0, 0, 112, 'Instamojo', 'Instamojo', 0, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:45:39'),
(13, 0, 0, 501, 'Blockchain', 'Blockchain', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:44:55'),
(15, 0, 0, 503, 'CoinPayments', 'Coinpayments', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"f79d4ac11a127f3b20bf8f78bbd6bb368408a672bb389129bb0086650cb458e2\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"6efA595f9a7378541Aa67e194322e8769F48D9D01B431FDE775493192d9F4f33\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\n\"BTC\": \"BTC\",\n\"BTC.LN\": \"BTC.LN\",\n\"LTC\": \"LTC\",\n\"CPS\": \"CPS\",\n\"VLX\": \"VLX\",\n\"APL\": \"APL\",\n\"AYA\": \"AYA\",\n\"BAD\": \"BAD\",\n\"BCD\": \"BCD\",\n\"BCH\": \"BCH\",\n\"BCN\": \"BCN\",\n\"BEAM\": \"BEAM\",\n\"BITB\": \"BITB\",\n\"BLK\": \"BLK\",\n\"BSV\": \"BSV\",\n\"BTAD\": \"BTAD\",\n\"BTG\": \"BTG\",\n\"BTT\": \"BTT\",\n\"CLOAK\": \"CLOAK\",\n\"CLUB\": \"CLUB\",\n\"CRW\": \"CRW\",\n\"CRYP\": \"CRYP\",\n\"CRYT\": \"CRYT\",\n\"CURE\": \"CURE\",\n\"DASH\": \"DASH\",\n\"DCR\": \"DCR\",\n\"DEV\": \"DEV\",\n\"DGB\": \"DGB\",\n\"DOGE\": \"DOGE\",\n\"EBST\": \"EBST\",\n\"EOS\": \"EOS\",\n\"ETC\": \"ETC\",\n\"ETH\": \"ETH\",\n\"ETN\": \"ETN\",\n\"EUNO\": \"EUNO\",\n\"EXP\": \"EXP\",\n\"Expanse\": \"Expanse\",\n\"FLASH\": \"FLASH\",\n\"GAME\": \"GAME\",\n\"GLC\": \"GLC\",\n\"GRS\": \"GRS\",\n\"KMD\": \"KMD\",\n\"LOKI\": \"LOKI\",\n\"LSK\": \"LSK\",\n\"MAID\": \"MAID\",\n\"MUE\": \"MUE\",\n\"NAV\": \"NAV\",\n\"NEO\": \"NEO\",\n\"NMC\": \"NMC\",\n\"NVST\": \"NVST\",\n\"NXT\": \"NXT\",\n\"OMNI\": \"OMNI\",\n\"PINK\": \"PINK\",\n\"PIVX\": \"PIVX\",\n\"POT\": \"POT\",\n\"PPC\": \"PPC\",\n\"PROC\": \"PROC\",\n\"PURA\": \"PURA\",\n\"QTUM\": \"QTUM\",\n\"RES\": \"RES\",\n\"RVN\": \"RVN\",\n\"RVR\": \"RVR\",\n\"SBD\": \"SBD\",\n\"SMART\": \"SMART\",\n\"SOXAX\": \"SOXAX\",\n\"STEEM\": \"STEEM\",\n\"STRAT\": \"STRAT\",\n\"SYS\": \"SYS\",\n\"TPAY\": \"TPAY\",\n\"TRIGGERS\": \"TRIGGERS\",\n\"TRX\": \"TRX\",\n\"UBQ\": \"UBQ\",\n\"UNIT\": \"UNIT\",\n\"USDT\": \"USDT\",\n\"USDT.BEP20\": \"USDT.BEP20\",\n\"USDT.ERC20\": \"USDT.ERC20\",\n\"USDT.TRC20\": \"USDT.TRC20\",\n\"VTC\": \"VTC\",\n\"WAVES\": \"WAVES\",\n\"XCP\": \"XCP\",\n\"XEM\": \"XEM\",\n\"XMR\": \"XMR\",\n\"XSN\": \"XSN\",\n\"XSR\": \"XSR\",\n\"XVG\": \"XVG\",\n\"XZC\": \"XZC\",\n\"ZEC\": \"ZEC\",\n\"ZEN\": \"ZEN\"\n}', 1, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:54:21'),
(16, 0, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:45:20'),
(17, 0, 0, 505, 'Coingate', 'Coingate', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:44:25'),
(18, 0, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2023-05-29 22:45:12'),
(24, 0, 0, 113, 'Paypal Express', 'PaypalSdk', 0, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:52:24'),
(25, 0, 0, 114, 'Stripe Checkout', 'StripeV3', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2023-05-29 22:50:51'),
(27, 0, 0, 115, 'Mollie', 'Mollie', 0, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-05-29 22:50:35'),
(30, 0, 0, 116, 'Cashmaal', 'Cashmaal', 0, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2023-05-29 22:45:03'),
(36, 0, 0, 119, 'Mercado Pago', 'MercadoPago', 0, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2023-05-29 22:46:08'),
(50, 0, 0, 120, 'Authorize.net', 'Authorize', 0, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"3Vee5S2F\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2023-05-29 22:44:47'),
(57, 0, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:12:37'),
(62, 101, 1, 1000, 'USDT TRC20', 'usdt_trc20', 1, '[]', '{\"USDT\":\"USDT\"}', 0, NULL, 'SEND TO TRON TRC20 USDT DIRECTION:&nbsp;<span style=\"font-weight: bolder; color: rgb(0, 0, 0);\">THj59UNWB1Pcz7ZJoJRmqQhu39WodrExh9</span>', '2023-05-28 20:18:54', '2023-06-01 23:26:57'),
(63, 102, 3, 1001, 'TRX TRC20', 'trx_trc20', 1, '[]', '{\"TRX\":\"TRX\"}', 0, NULL, '<span style=\"color: rgb(33, 37, 41);\">SEND TO TRON TRC20 USDT DIRECTION:<b>&nbsp;</b></span><span style=\"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\"><b>THj59UNWB1Pcz7ZJoJRmqQhu39WodrExh9</b></span><br>', '2023-05-29 22:43:30', '2023-06-01 23:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(1, 'USDT TRC20', 'USDT', '', 1000, 'usdt_trc20', 1.00000000, 100000.00000000, 0.00, 0.00000000, 0.00000000, NULL, NULL, '2023-05-28 20:18:54', '2023-06-01 23:26:57'),
(2, 'TRX TRC20', 'TRX', '', 1001, 'trx_trc20', 1.00000000, 100000.00000000, 0.00, 0.00000000, 0.00000000, NULL, NULL, '2023-05-29 22:43:30', '2023-06-01 23:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `otp_verification` tinyint(1) NOT NULL DEFAULT 0,
  `otp_expiration` decimal(5,2) NOT NULL DEFAULT 0.00,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `qr_code_template` varchar(255) NOT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `firebase_template` text DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `firebase_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `fiat_currency_api` varchar(255) DEFAULT NULL,
  `crypto_currency_api` varchar(255) DEFAULT NULL,
  `cron_run` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) DEFAULT 0 COMMENT 'push notification, 0 - dont send, 1 - send',
  `detect_activity` tinyint(1) DEFAULT 0,
  `enable_language` tinyint(1) NOT NULL DEFAULT 0,
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `multi_language` tinyint(1) NOT NULL DEFAULT 1,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `system_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `otp_verification`, `otp_expiration`, `cur_text`, `cur_sym`, `email_from`, `qr_code_template`, `email_template`, `sms_body`, `firebase_template`, `sms_from`, `base_color`, `mail_config`, `sms_config`, `firebase_config`, `global_shortcodes`, `fiat_currency_api`, `crypto_currency_api`, `cron_run`, `kv`, `ev`, `en`, `sv`, `sn`, `pn`, `detect_activity`, `enable_language`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `active_template`, `system_info`, `created_at`, `updated_at`) VALUES
(1, 'TCash', 0, 60.00, 'USD', '$', 'info@eglobalcash.app', '63abeedf0c88e1672212191.png', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"><br></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'Hi {{fullname}} ({{username}}), {{message}}', 'hi {{fullname}} ({{username}}), {{message}}', 'EGLOBAL CASH', '7966ff', '{\"name\":\"smtp\",\"host\":\"mail.eglobalcash.app\",\"port\":\"465\",\"enc\":\"ssl\",\"username\":\"info@eglobalcash.app\",\"password\":\"Erik8101$\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\"apiKey\":\"----------\",\"authDomain\":\"-------------\",\"projectId\":\"------------\",\"storageBucket\":\"-----------\",\"messagingSenderId\":\"------------\",\"appId\":\"--------------\",\"measurementId\":\"-------------\",\"serverKey\":\"-----------------\"}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 'q4LkbDsmivxt6K7wyNzscQTUZkS0luqw', 'd83ab1fd-c632-47fb-8fee-c5b5c15c842f', '{\"fiat_cron\":\"2023-05-28T11:01:49.546411Z\",\"crypto_cron\":\"2023-05-28T11:02:04.592329Z\"}', 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 'basic', '[]', NULL, '2024-04-28 04:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) NOT NULL,
  `invoice_num` varchar(40) NOT NULL,
  `invoice_to` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(255) NOT NULL,
  `charge` decimal(28,8) NOT NULL,
  `total_amount` decimal(28,8) NOT NULL,
  `get_amount` decimal(28,8) NOT NULL,
  `pay_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 => Published, 0 => Not published , 2 => Cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_name` varchar(255) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `kyc_data` text DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `public_api_key` varchar(255) DEFAULT NULL,
  `secret_api_key` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `password`, `image`, `address`, `status`, `kv`, `kyc_data`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `public_api_key`, `secret_api_key`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Erik', 'Rubio', 'erikrubio923', 'erikrubio923@gmail.com', 'ES', '34661115260', 0, 0.00000000, '$2y$10$EV85mWCDgIcn.fiRZt9fzugLIskqTqsSoK3OTCAZLrumMcFxJtQx2', NULL, '{\"address\":\"Avinguda de Castelldefels, 133 escalera a 1-1\",\"city\":\"Castelldefels\",\"state\":\"Barcelona\",\"zip\":\"08860\",\"country\":\"Spain\"}', 1, 1, NULL, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '4i1yuhyl38f0hlf3ubyvd8x4dja2y1bf78yyyd57z5sc5rscn5', '4yibnunvsyedzeibx810uvkeg7rr9rubcgumzacbjb2k5c15s6', NULL, '2023-05-28 21:43:52', '2023-05-30 10:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_reset_passwords`
--

CREATE TABLE `merchant_reset_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(40) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `user_type`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USER', 'transfer_money', 1, '2021-06-15 05:45:01', '2022-12-21 09:46:32'),
(2, 'USER', 'request_money', 1, '2021-06-15 05:45:01', '2022-11-24 07:01:42'),
(3, 'USER', 'money_out', 1, '2021-06-15 05:45:01', '2022-11-23 03:35:06'),
(4, 'USER', 'make_payment', 1, '2021-06-15 05:45:01', '2022-12-21 09:46:38'),
(5, 'USER', 'add_money', 1, '2021-06-15 05:45:01', '2022-12-21 09:46:37'),
(6, 'USER', 'withdraw_money', 1, '2021-06-15 05:45:01', '2022-11-24 07:01:45'),
(7, 'USER', 'create_voucher', 1, '2021-06-15 05:45:01', '2022-11-24 07:01:45'),
(8, 'USER', 'create_invoice', 1, '2021-06-15 05:45:01', '2022-11-24 07:01:45'),
(9, 'USER', 'money_exchange', 1, '2021-06-15 05:45:01', '2022-11-24 07:02:13'),
(15, 'AGENT', 'add_money', 1, '2021-06-15 05:45:01', '2022-12-15 14:24:34'),
(16, 'AGENT', 'withdraw_money', 1, '2021-06-15 05:45:01', '2022-11-24 07:01:47'),
(19, 'MERCHANT', 'withdraw_money', 1, '2021-06-15 05:45:01', '2022-11-24 07:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `merchant_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `user_id`, `agent_id`, `merchant_id`, `user_type`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 'USER', 'php', 'do-not-reply@viserlab.com', 'admin@gmail.com', 'Your Account has been Credited', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (inversioncrypto)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div><div style=\"font-family: Montserrat, sans-serif;\">5.00000000 USDT has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : U544CO9RK5ZO</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">5.00000000&nbsp; {{</span><span style=\"color: rgb(33, 37, 41);\">wallet_currency</span><span style=\"font-weight: bolder;\">}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">remark</span></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-28 20:50:20', '2023-05-28 20:50:20'),
(2, 1, 0, 0, 'USER', 'php', 'do-not-reply@viserlab.com', 'admin@gmail.com', 'Your Account has been Credited', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (inversioncrypto)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div><div style=\"font-family: Montserrat, sans-serif;\">5.00000000 USDT has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : 62PDFX9WHT6X</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">10.00000000&nbsp; {{</span><span style=\"color: rgb(33, 37, 41);\">wallet_currency</span><span style=\"font-weight: bolder;\">}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">remark</span></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-28 20:50:25', '2023-05-28 20:50:25'),
(3, 1, 0, 0, 'USER', 'php', 'do-not-reply@viserlab.com', 'admin@gmail.com', 'Your Account has been Debited', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (inversioncrypto)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">5.00000000 USDT has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : FE5K5W4MJ7X8</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">0.00000000&nbsp; {{</span><span style=\"color: rgb(33, 37, 41);\">wallet_currency</span><span style=\"font-weight: bolder;\">}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: prueba</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-28 22:06:51', '2023-05-28 22:06:51'),
(4, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:13 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">777568</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:20', '2023-05-30 01:22:20'),
(5, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:11 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">233738</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:20', '2023-05-30 01:22:20'),
(6, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:20 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">113344</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:25', '2023-05-30 01:22:25');
INSERT INTO `notification_logs` (`id`, `user_id`, `agent_id`, `merchant_id`, `user_type`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(7, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:22 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">555975</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:30', '2023-05-30 01:22:30'),
(8, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:28 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">703536</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:33', '2023-05-30 01:22:33'),
(9, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:30 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">920838</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:35', '2023-05-30 01:22:35'),
(10, 2, 0, 0, 'USER', 'php', 'do-not-reply@ECONOMY-GLOBAL-CASH-app', 'erikrubio923@gmail.com', 'Password Reset', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <br>\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello x x (eglobal)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">2023-05-29 06:22:33 PM .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">31.4.205.197</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">Handheld Browser</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">Android&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">359196</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">EGLOBAL</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-05-30 01:22:38', '2023-05-30 01:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `firebase_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `firebase_status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `firebase_body`, `shortcodes`, `email_status`, `sms_status`, `firebase_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{wallet_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{</span><span style=\"color: rgb(33, 37, 41);\">wallet_currency</span><span style=\"font-weight: bolder;\">}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{wallet_currency}} has been added to your account .\r\n\r\nTransaction Number : {{trx}}\r\n\r\nYour Current Balance is : {{post_balance}}  {{wallet_currency}} \r\n\r\nAdmin note: {{remark}}', '{{amount}} {{wallet_currency}} has been added to your account .\r\n\r\nTransaction Number : {{trx}}\r\n\r\nYour Current Balance is : {{post_balance}}  {{wallet_currency}} \r\n\r\nAdmin note: {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\",\"wallet_currency\":\"Wallet currency\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-12-08 11:18:54'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{wallet_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{</span><span style=\"color: rgb(33, 37, 41);\">wallet_currency</span><span style=\"font-weight: bolder;\">}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\",\"wallet_currency\":\"Wallet currency\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-11-22 12:54:26'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Add money Completed Successfully', '<div><div>Your payment of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{method_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\",\"currency\":\"Converted currency\"}\n\n', 1, 1, 1, '2021-11-03 12:00:00', '2022-11-07 05:00:37'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\"><div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><div><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}<br></div>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\",\"currency\":\"Converted currency\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-11-07 08:08:08'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Add money Request Submitted Successfully', '<div><div>Your Add money request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{method_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"currency\":\"Converted currency\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-11-07 07:33:26'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', NULL, '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', NULL, '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', NULL, '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', NULL, '{\"code\":\"Email verification code\"}', 1, 0, 1, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', NULL, '{\"code\":\"SMS Verification Code\"}', 0, 1, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\",\"currency_code\":\"Currency code\"}\r\n', 1, 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', NULL, '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, NULL, '[]', 1, 1, 1, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', NULL, NULL, NULL, '[]', 1, 1, 1, NULL, NULL),
(18, 'OTP', 'OTP Verification', 'OTP Verification', '<b>{{code}}</b>', '{{code}}', '{{code}}', '{\"code\":\"Verification code\"}', 1, 1, 1, NULL, '2022-12-17 12:39:14'),
(19, 'TRANSFER_MONEY', 'Transfer Money', 'Transfer Money', '<div>Tranfer Money <b>{{amount}} {{currency_code}}</b> to <b>{{to_user}}</b> successful. <br></div><div>Charge <b>{{charge}} {{</b><span style=\"font-weight: bolder; color: rgb(33, 37, 41);\">currency_code</span><b>}}</b>, Remaining Balance <b>{{balance}} {{</b><span style=\"font-weight: bolder; color: rgb(33, 37, 41);\">currency_code</span><b>}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Tranfer Money {{amount}} {{currency_code}} to {{to_user}} successful.\r\nCharge {{charge}} {{currency_code}}, Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Transfer amount\",\"currency_code\":\"Currency code\", \"to_user\":\"User name or mail of receiver\",\"charge\":\"Transfer charge\",\"trx\":\"Transaction id\",\"time\":\"Transfer time and date\",\"balance\":\"Remaining balance\"}', 1, 1, 1, NULL, '2022-11-08 07:44:38'),
(20, 'RECEIVED_MONEY', 'Received Money', 'Received Money', '<div>Received Money <b>{{amount}} {{currency_code}}</b> from <b>{{from_user}}</b> successful. <br></div><div>New Balance <b>{{balance}} {{</b><span style=\"font-weight: bolder; color: rgb(33, 37, 41);\">currency_code</span><b>}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Tranfer Money {{amount}} {{currency_code}} to {{to_user}} successful.\r\nCharge {{charge}} {{curr_code}}, Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Receive amount\",\"currency_code\":\"Currency code\", \"from_user\":\"User name or mail of sender\",\"trx\":\"Transaction id\",\"time\":\"Received time and date\",\"balance\":\"New balance\"}', 1, 1, 1, NULL, '2022-11-08 08:01:59'),
(21, 'REQUEST_MONEY', 'Request Money', 'Request Money', '<div>Money Request <b>{{amount}} {{currency_code}}</b> from <b>{{requestor}}</b>&nbsp; at <b>{{time}}</b>.&nbsp;</div><div><br></div><div><b>Requestor Note</b>: {{note}}<br></div>', 'Money Request {{amount}} {{currency_code}} from {{requestor}}  at {{time}}.', NULL, '{\"amount\":\"Receive amount\",\"currency_code\":\"Currency code\", \"requestor\":\"User name or mail of requestor\",\"time\":\"Request time and date\",\"note\":\"Note from requestor\"}', 1, 1, 1, NULL, '2022-11-08 08:29:27'),
(22, 'ACCEPT_REQUEST_MONEY_REQUESTOR', 'Accept request money mail to requestor', 'Accept Request Money', '<div>Your Money Request <b>{{amount}}&nbsp;</b><font color=\"#212529\"><b>{{currency_code}}</b></font>&nbsp;to<b> {{to_requested}}</b>&nbsp; has been accepted at <b>{{time}}</b>.&nbsp; Charge: <b>{{charge}}</b>&nbsp;<span style=\"text-align: var(--bs-body-text-align);\"><font color=\"#212529\"><b>{{currency_code}}</b></font></span></div><div>Your new balance is : <b>{{balance}}</b>&nbsp;<span style=\"text-align: var(--bs-body-text-align);\"><font color=\"#212529\"><b>{{currency_code}}</b></font></span></div><div>TrxID : <b>{{trx}}</b><br></div>', 'Money Request {{amount}} {{currency_code}} from {{requestor}}  at {{time}}.', NULL, '{\"amount\":\"Request amount\",\"currency_code\":\"Currency code\", \"to_requested\":\"Requeted to whom\",\"time\":\"Request time and date\",\"balance\":\"New balance\",\"trx\":\"Transaction id\",\"charge\":\"Money request charge\"}', 1, 1, 1, NULL, '2022-11-08 09:30:49'),
(23, 'ACCEPT_REQUEST_MONEY', 'Accept request money', 'Accept Request Money', '<div>Your\'ve Accepted Money Request <b>{{amount}}&nbsp;</b><font color=\"#212529\"><b>{{currency_code}}</b></font>&nbsp;from&nbsp;<b> {{requestor}}</b>&nbsp; at <b>{{time}}</b>.&nbsp;</div><div>Your new balance is : <b>{{balance}}</b>&nbsp;<span style=\"text-align: var(--bs-body-text-align);\"><font color=\"#212529\"><b>{{currency_code}}</b></font></span></div><div>TrxID : <b>{{trx}}</b><br></div>', 'Your\'ve Accepted Money Request {{amount}} {{currency_code}} from  {{requestor}}  at {{time}}. \r\nYour new balance is : {{balance}} {{currency_code}}\r\nTrxID : {{trx}}', NULL, '{\"amount\":\"Request amount\",\"currency_code\":\"Currency code\", \"requestor\":\"Requestor\",\"time\":\"Accept time and date\",\"balance\":\"New balance\",\"trx\":\"Transaction id\"}', 1, 1, 1, NULL, '2022-11-08 09:33:37'),
(24, 'EXCHANGE_MONEY', 'Exchange Money', 'Exchange Money', 'Exchanged <b>{{from_wallet_amount}}</b> <b>{{from_wallet_currency}}</b> from wallet ( <b>{{from_wallet_currency}}</b> ) To wallet ( <b>{{to_wallet_currency}}</b> ) successful.<br><div>Exchanged amount : <b>{{to_wallet_amount}}</b> <b>{{to_wallet_curr}}.</b></div><div><br>Remaining balance of&nbsp;<b><b> ( </b><b><b>{{from_wallet_curr}} </b>) </b></b>is :<b> <b>{{from_balance}} </b><b>{{from_wallet_curr}}</b><br></b>New balance of<b><b><b>&nbsp; ( </b><b><b>{{to_wallet_curr}} </b>) </b></b></b>is :<b><b><b> </b></b><b><b>{{to_balance}}</b><b>&nbsp; </b></b><b><b><b><b><b>{{to_wallet_curr}}</b></b></b></b></b></b></div><div><b><b><b><b><b><b><br></b></b></b></b></b></b></div><div>TrxID :<b> {{trx}}</b></div><div>Time :<b>&nbsp; {{time}}<br></b></div>', 'Exchanged {{from_wallet_amount}} {{from_wallet_currency}} from wallet ( {{from_wallet_currency}} ) To wallet ( {{to_wallet_curr}} ) successful.\r\nExchanged amount : {{to_wallet_amount}} {{to_wallet_curr}}.\r\n\r\nRemaining balance of  ( {{from_wallet_currency}} ) is : {{from_balance}} {{from_wallet_currency}}\r\nNew balance of  ( {{to_wallet_curr}} ) is : {{to_balance}}  {{to_wallet_curr}}\r\n\r\nTrxID : {{trx}}\r\nTime :  {{time}}', NULL, '{\"from_wallet_amount\":\"Amount from wallet\",\"from_wallet_currency\":\"From wallet currency\",\"to_wallet_amount\":\"Amount to wallet\",\"to_wallet_currency\":\"To wallet currency\",\"from_balance\":\"From wallet remaining balance\",\"to_balance\":\"To wallet new balance\",\"trx\":\"Transaction id\",\"time\":\"Exchange Time\"}', 1, 1, 1, NULL, '2022-11-10 09:28:42'),
(25, 'GET_INVOICE_PAYMENT', 'Get Invoice Payment', 'Get Invoice Payment', 'Payment <b>{{total_amount}} {{currency_code}}</b>&nbsp; of Invoice <b>#{{invoice_id}} </b>has been received successfully, from <b>{{from_user}}</b> at <b>{{time}}.<br></b><div>You got after charge<b> : {{get_amount}} </b>{{curr_code}} .<br></div><div>Charge : {{charge}} {{curr_code}} .<br>TrxID : {{trx}}.<br><br>Your New Balance is {{post_balance}} {{curr_code}} .<br></div>', 'Payment {{total_amount}} {{curr_code}}  of Invoice #{{invoice_id}} has been received successfully, from {{from_user}} at {{time}}.\r\nYou got after charge : {{get_amount}} {{curr_code}} .\r\nCharge : {{charge}} {{curr_code}} .\r\nTrxID : {{trx}}.\r\n\r\nYour New Balance is {{post_balance}} {{curr_code}} .', NULL, '{\"total_amount\":\"Invoice total amount\",\"get_amount\":\"Get amount after charge\",\"charge\":\"Invoice charge\",\"currency_code\":\"Currency code\",\"invoice_id\":\"Invoice id\",\"time\":\"Payment time and date\",\"from_user\":\"From whom get payment\",\"trx\":\"Transaction id\",\"post_balance\":\"Post balance\"}', 1, 1, 1, NULL, '2022-11-10 12:25:58'),
(26, 'SEND_INVOICE_MAIL', 'Send Invoice to mail', 'Invoice Of your payment', 'You have an invoice to pay. Please follow the URL below to successful payment.<br><b>Invoice URL : <a class=\"btn btn--info\" href=\" {{url}}\">Click</a><br></b><div><br></div>', 'You have an invoice to pay. Please follow the URL below to successful payment.\r\nInvoice URL : Click', NULL, '{\"url\":\"invoice url\"}', 1, 1, 1, NULL, '2022-11-10 12:22:18'),
(27, 'PAY_INVOICE_PAYMENT', 'Pay Invoice Payment', 'Pay Invoice Payment', 'Payment <b>{{total_amount}} {{currency_code}}</b>&nbsp; of Invoice <b>#{{invoice_id}} </b>has been&nbsp; successful, to<b> {{to_user}}</b> at <b>{{time}}.<br></b><div><br></div><div>TrxID : {{trx}}.</div><br>Your New Balance is {{post_balance}} {{curr_code}} .', 'Payment {{total_amount}} {{currency_code}}  of Invoice #{{invoice_id}} has been  successful, to {{to_user}} at {{time}}.\r\n\r\nTrxID : {{trx}}.\r\n\r\nYour New Balance is {{post_balance}} {{curr_code}} .', NULL, '{\"total_amount\":\"Invoice total amount\",\"currency_code\":\"Currency code\",\"invoice_id\":\"Invoice id\",\"time\":\"Payment time and date\",\"to_user\":\"To whom pay the payment\",\"trx\":\"Transaction id\",\"post_balance\":\"Post balance\"}', 1, 1, 1, NULL, '2022-11-10 12:28:11'),
(28, 'MONEY_IN', 'Money In', 'Money In', '<div>Cash In <b>{{amount}} {{currency_code}}</b> from <b>{{agent}}</b> successful. <br></div>Your New Balance <b>{{balance}} {{</b><span style=\"font-weight: bolder; color: rgb(33, 37, 41);\">currency_code</span><b>}}</b>. <div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Cash In  {{amount}} {{currency_code}} from {{agent}} successful.\r\nYour New Balance {{balance}} {{currency_code}}. TrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Cash in amount\",\"currency_code\":\"Currency code\", \"agent\":\"Agent user name or mail\",\"trx\":\"Transaction id\",\"time\":\"Cash in time and date\",\"balance\":\"New balance\"}', 1, 1, 1, NULL, '2022-11-17 11:28:06'),
(29, 'MONEY_IN_AGENT', 'Money In  Agent', 'Money In', '<div>Cash In <b>{{amount}} {{currency_code}}</b> to <b>{{user}}</b> successful.&nbsp; Charge {{charge}} {{curr_code}}<br></div><div>Your Remaining Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Cash In {{amount}} {{currency_code}} to {{user}} successful.  Charge {{charge}} {{curr_code}}\r\nYour Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', 'Cash In {{amount}} {{currency_code}} to {{user}} successful.  Charge {{charge}} {{curr_code}}\r\nYour Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', '{\"amount\":\"Cash in amount\",\"currency_code\":\"Currency code\", \"user\":\"User name or email\",\"trx\":\"Transaction id\",\"time\":\"Cash in time and date\",\"balance\":\"Remaining balance\",\"charge\":\"Cash in charge\"}', 1, 1, 1, NULL, '2022-12-08 10:42:20'),
(30, 'MONEY_IN_COMMISSION_AGENT', 'Money In Commission of Agent', 'Cash In Commission', '<div>Commission of <b>{{amount}} {{currency_code}}</b> Cash in received successfully. <br></div><div>Total Commission : {{commission}} {{curr_Code}}<br></div><div>Your New Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', '<div>Commission of <b>{{amount}} {{curr_code}}</b> cash in received successfully. <br></div><div>Your New Balance <b>{{balance}} {{curr_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', NULL, '{\"amount\":\"Cash in amount\",\"currency_code\":\"Currency code\", \"trx\":\"Transaction id\",\"time\":\"Cash in time and date\",\"balance\":\"New balance\",\"commission\":\"Cash in commission to agent\"}', 1, 1, 1, NULL, '2022-11-17 11:33:39'),
(31, 'MONEY_OUT', 'Money Out', 'Money Out', '<div>Money Out  <b>{{amount}} {{currency_code}}</b> to <b>{{agent}}</b> successful. <br></div><div>Charge <b>{{charge}} {{currency_code}}</b>, Remaining Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Money Out {{amount}} {{currency_code}} to {{agent}} successful.\r\nCharge {{charge}} {{currency_code}}, Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Cash out amount\",\"currency_code\":\"Currency code\", \"agent\":\"Agent user name or mail\",\"charge\":\"Cash out charge\",\"trx\":\"Transaction id\",\"time\":\"Cash out time and date\",\"balance\":\"Remaining balance\"}', 1, 1, 1, NULL, '2022-11-21 03:44:29'),
(32, 'MONEY_OUT_TO_AGENT', 'Money Out To Agent', 'Money Out', '<div>Money Out  <b>{{amount}} {{currency_code}}</b> from <b>{{user}}</b> successful. <br></div><div>Your New Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Money Out {{amount}} {{currency_code}} from {{user}} successful.\r\nYour New Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Cash out amount\",\"currency_code\":\"Currency code\", \"user\":\"User name or email\",\"trx\":\"Transaction id\",\"time\":\"Cash out time and date\",\"balance\":\"Remaining balance\"}', 1, 1, 1, NULL, '2022-11-21 03:45:44'),
(33, 'MONEY_OUT_COMMISSION_AGENT', 'Money Out Commission of Agent', 'Money out Commission', '<div>Commission of <b>{{amount}} {{currency_code}}</b> money out received successfully. <br></div><div>Total Commission : {{commission}} {{currency_code}}</div><div>Your New Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Commission of {{amount}} {{currency_code}} money out received successfully.\r\nTotal Commission : {{commission}} {{currency_code}}\r\nYour New Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Cash out amount\",\"currency_code\":\"Currency code\", \"trx\":\"Transaction id\",\"time\":\"Cash out time and date\",\"balance\":\"Remaining balance\",\"commission\":\"Cash out commission to agent\"}', 1, 1, 1, NULL, '2022-11-21 03:48:04'),
(34, 'MAKE_PAYMENT', 'Make Payment', 'Make Payment', '<div>Payment <b>{{amount}} {{currency_code}}</b> to <b>{{merchant}}</b> successful. <br></div><div>Charge <b>{{charge}} {{currency_code}}</b>, Remaining Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Payment {{amount}} {{currency_code}} to {{merchant}} successful.\r\nCharge {{charge}} {{currency_code}}, Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Payment amount\",\"currency_code\":\"currency code\", \"marchant\":\"Marchant user name or mail\",\"charge\":\"Payment charge\",\"trx\":\"Transaction id\",\"time\":\"Payment time and date\",\"balance\":\"Remaining balance\"}', 1, 1, 1, NULL, '2022-11-21 03:59:19'),
(35, 'MAKE_PAYMENT_MERCHANT', 'Make Payment marchant', 'Make Payment', '<div>Payment <b>{{amount}} {{currency_code}}</b> received from <b>{{user}}</b> successful. <br></div><div>Charge <b>{{charge}} {{currency_code}}</b>, Remaining Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Payment {{amount}} {{currency_code}} received from {{user}} successful.\r\nCharge {{charge}} {{currency_code}}, Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Payment amount\",\"currency_code\":\"Currency code\", \"user\":\"User username or mail\",\"charge\":\"Payment charge\",\"trx\":\"Transaction id\",\"time\":\"Payment time and date\",\"balance\":\"Remaining balance\"}', 1, 1, 1, NULL, '2022-11-21 04:01:20'),
(36, 'MERCHANT_PAYMENT', 'Merchant Payment', 'Payment Successful.', '<div>Payment <b>{{amount}} {{currency_code}}</b> received from&nbsp;<b>{{</b><span style=\"white-space: nowrap;\"><b style=\"\"><font size=\"3\">customer_name</font></b></span><b>}}</b> successful. <br></div><div>Charge <b>{{charge}} {{currency_code}}</b>, Remaining Balance <b>{{balance}} {{currency_code}}</b>. </div><div>TrxID <b>{{trx}}</b> at <b>{{time}}</b>.</div>', 'Payment {{amount}} {{currency_code}} received from {{customer_name}} successful.\r\nCharge {{charge}} {{currency_code}}, Remaining Balance {{balance}} {{currency_code}}.\r\nTrxID {{trx}} at {{time}}.', NULL, '{\"amount\":\"Payment amount\",\"currency_code\":\"currency code\", \"customer_name\":\"Customer name or mail\",\"charge\":\"Payment charge\",\"trx\":\"Transaction id\",\"time\":\"Payment time and date\",\"balance\":\"Remaining balance\"}', 1, 1, 1, NULL, '2022-11-29 08:47:06'),
(37, 'PAYMENT_VER_CODE', 'Payment Verification', 'Payment Verification', '<div>Please use below code to verify your payment.<br></div><div><br></div><div>Your payment verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Please use below code to verify your payment.\r\n\r\nYour payment verification code is: {{code}}', 'Please use below code to verify your payment.\r\n\r\nYour payment verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, 1, NULL, '2022-12-17 10:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 'templates.basic.', '[\"brands\",\"about\",\"service\",\"why_choose_us\",\"feature\",\"business\",\"overview\",\"testimonial\",\"subscribe\",\"blog\"]', 1, '2020-07-11 06:23:58', '2022-12-27 06:36:17'),
(4, 'Blog', 'blogs', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 01:14:53', '2022-08-08 08:00:37'),
(20, 'About', 'about-us', 'templates.basic.', '[\"about\",\"service\",\"testimonial\"]', 0, '2022-08-07 10:23:34', '2022-08-08 07:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('erikrubio923@gmail.com', '359196', '2023-05-30 01:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `version` varchar(40) DEFAULT NULL,
  `purchase_code` varchar(255) DEFAULT NULL,
  `status` double NOT NULL DEFAULT 1,
  `meta_data` text DEFAULT NULL,
  `plugin_for` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) NOT NULL COMMENT '1=> USER, 2=> AGENT, 3=>MERCHANT',
  `unique_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `user_id`, `user_type`, `unique_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'USER', '4ik4q58cyfwrkvt', '2023-05-28 20:42:20', '2023-05-28 20:42:20'),
(2, 1, 'MERCHANT', 'lfejzhwpmx07ftv', '2023-05-28 21:44:55', '2023-05-28 21:44:55'),
(3, 1, 'AGENT', 'n3izxpscfeel2xd', '2023-05-28 21:57:57', '2023-05-28 21:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `request_money`
--

CREATE TABLE `request_money` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wallet_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `request_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `receiver_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `receiver_id` int(10) UNSIGNED DEFAULT NULL,
  `receiver_type` varchar(40) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wallet_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `before_charge` decimal(28,8) DEFAULT 0.00000000,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `charge_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `user_type`, `receiver_id`, `receiver_type`, `currency_id`, `wallet_id`, `before_charge`, `amount`, `charge`, `post_balance`, `trx_type`, `charge_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 1, 'USER', NULL, NULL, 101, 2, 5.00000000, 5.00000000, 0.00000000, 5.00000000, '+', NULL, 'U544CO9RK5ZO', 'remark', 'balance_add', '2023-05-28 20:50:15', '2023-05-28 20:50:15'),
(2, 1, 'USER', NULL, NULL, 101, 2, 5.00000000, 5.00000000, 0.00000000, 10.00000000, '+', NULL, '62PDFX9WHT6X', 'remark', 'balance_add', '2023-05-28 20:50:19', '2023-05-28 20:50:19'),
(3, 1, 'USER', NULL, NULL, 101, 2, 5.00000000, 5.00000000, 0.00000000, 5.00000000, '-', '+', 'MSHUXWQXYCYR', 'Voucher created successfully', 'create_voucher', '2023-05-28 20:51:47', '2023-05-28 20:51:47'),
(4, 2, 'USER', NULL, NULL, 101, 5, 5.00000000, 5.00000000, 0.00000000, 5.00000000, '+', '+', 'PN4N4VYOSKHJ', 'Redeemed Voucher ', 'redeem_voucher', '2023-05-28 20:58:26', '2023-05-28 20:58:26'),
(5, 1, 'USER', NULL, NULL, 101, 2, 5.00000000, 5.00000000, 0.00000000, 0.00000000, '-', NULL, 'FE5K5W4MJ7X8', 'prueba', 'balance_subtract', '2023-05-28 22:06:46', '2023-05-28 22:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_charges`
--

CREATE TABLE `transaction_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(40) NOT NULL,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `min_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `agent_commission_fixed` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `agent_commission_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `merchant_fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `merchant_percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `monthly_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `daily_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `daily_request_accept_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `voucher_limit` int(11) NOT NULL DEFAULT 0,
  `cap` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_charges`
--

INSERT INTO `transaction_charges` (`id`, `slug`, `fixed_charge`, `percent_charge`, `min_limit`, `max_limit`, `agent_commission_fixed`, `agent_commission_percent`, `merchant_fixed_charge`, `merchant_percent_charge`, `monthly_limit`, `daily_limit`, `daily_request_accept_limit`, `voucher_limit`, `cap`, `created_at`, `updated_at`) VALUES
(1, 'money_transfer', 0.10000000, 1.00, 1.00000000, 5000.00000000, 0.00000000, 0.00, 0.00000000, 0.00, 0.00000000, 5000.00000000, 5000.00000000, 0, -1.00000000, '2021-06-11 19:02:22', '2023-06-01 04:18:34'),
(2, 'request_money', 2.00000000, 1.00, 0.00000000, 0.00000000, 0.00000000, 0.00, 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0, 20.00000000, '2021-06-11 19:02:22', '2021-06-11 19:02:22'),
(3, 'invoice_charge', 0.10000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0.00, 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0, -1.00000000, '2021-06-11 19:02:22', '2023-06-01 04:20:47'),
(4, 'exchange_charge', 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0.00, 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0, 0.00000000, '2021-06-11 19:02:22', '2022-12-06 06:50:15'),
(5, 'api_charge', 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0.00, 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 0, -1.00000000, '2021-06-11 19:02:22', '2022-12-04 13:11:04'),
(6, 'voucher_charge', 0.00000000, 0.00, 5.00000000, 1500.00000000, 0.00000000, 0.00, 0.00000000, 0.00, 0.00000000, 0.00000000, 0.00000000, 3, -1.00000000, '2021-06-11 19:02:22', '2023-06-01 06:36:12'),
(7, 'money_out_charge', 0.10000000, 1.00, 1.00000000, 5000.00000000, 0.50000000, 0.10, 0.00000000, 0.00, 200000.00000000, 100.00000000, 0.00000000, 0, 0.00000000, '2021-06-11 19:02:22', '2023-06-01 04:11:02'),
(8, 'money_in_charge', 0.00000000, 0.00, 1.00000000, 5000.00000000, 2.00000000, 2.00, 0.00000000, 0.00, 200000.00000000, 5000.00000000, 0.00000000, 0, 0.00000000, '2021-06-11 19:02:22', '2022-12-07 13:31:45'),
(9, 'make_payment', 0.10000000, 1.00, 0.00000000, 0.00000000, 0.00000000, 0.00, 0.10000000, 1.00, 0.00000000, 0.00000000, 0.00000000, 0, 0.00000000, '2021-06-11 19:02:22', '2022-12-21 12:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_name`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `password`, `image`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'inversioncrypto', 'x', 'x', 'inversioncrypto', 'informacion@inversioncrypto.es', 'ES', '34665388880', 0, 0.00000000, '$2y$10$DJ8mh9jbTptfvy/5YF9aCu9sMDNUGv0rVMrVJsB7IdVnyScabHSrC', NULL, '{\"address\":\"x\",\"city\":\"x\",\"state\":\"x\",\"zip\":\"x\",\"country\":\"Spain\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-05-28 20:41:30', '2023-06-01 21:27:02'),
(2, NULL, 'Erik', 'Rubio', 'eglobal', 'info@eglobalcash.app', 'ES', '34661115260', 0, 0.00000000, '$2y$10$R6Gbs5/d.ayGxHFUofnWf.WZUEXoMALuAmn/mo28jkuytidcbatbG', '64779554e66271685558612.png', '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Spain\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-05-28 20:56:41', '2023-06-01 21:27:55'),
(3, NULL, 'a', 'a', 'daisel', 'daissel511@gmail.com', 'CU', '5352749557', 0, 0.00000000, '$2y$10$BXsKOxsMHApSfzN2siJ/6OvbLu6NPpXogCBsiY6jJ7gNLWjF4NiSS', NULL, '{\"address\":\"a\",\"city\":\"a\",\"state\":\"a\",\"zip\":\"a\",\"country\":\"Cuba\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-05-29 09:23:26', '2023-05-30 09:59:33'),
(4, NULL, 'Frandy', 'Lopez', 'frandy', 'lopezfrandi1@gmail.com', 'DO', '18498293858748', 0, 0.00000000, '$2y$10$Yb2fGODZ.Gf77lPv2XP4SO5KsuQwutVii5FUGuk8G1w9VombJ7FYm', NULL, '{\"address\":\"lopezfrandi1@gmail.com\",\"city\":\"Santo Domingo\",\"state\":\"Los frailes\",\"zip\":\"10001\",\"country\":\"Dominican Republic\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-05-30 07:34:52', '2023-05-30 09:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_actions`
--

CREATE TABLE `user_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `is_api` tinyint(1) NOT NULL DEFAULT 0,
  `is_otp` tinyint(4) NOT NULL DEFAULT 0,
  `otp` int(11) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `act` varchar(40) DEFAULT NULL COMMENT 'Action',
  `details` text NOT NULL,
  `send_at` datetime NOT NULL,
  `used_at` datetime NOT NULL,
  `expired_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_actions`
--

INSERT INTO `user_actions` (`id`, `used`, `is_api`, `is_otp`, `otp`, `user_id`, `user_type`, `type`, `act`, `details`, `send_at`, `used_at`, `expired_at`) VALUES
(1, 0, 0, 0, 162122, 1, 'USER', NULL, 'create_voucher', '{\"wallet_id\":2,\"amount\":\"5\",\"totalAmount\":5,\"totalCharge\":0,\"done_route\":\"https:\\/\\/eglobalcash.app\\/user\\/create\\/voucher-done\"}', '2023-05-28 13:51:47', '0000-00-00 00:00:00', '2023-05-28 13:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `merchant_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `agent_id`, `merchant_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, '77.211.6.226', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Chrome', 'Windows 10', '2023-05-28 20:41:30', '2023-05-28 20:41:30'),
(2, 2, 0, 0, '77.211.6.226', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Chrome', 'Windows 10', '2023-05-28 20:56:41', '2023-05-28 20:56:41'),
(3, 0, 0, 1, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 21:43:52', '2023-05-28 21:43:52'),
(4, 0, 1, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 21:49:05', '2023-05-28 21:49:05'),
(5, 0, 0, 1, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 21:59:28', '2023-05-28 21:59:28'),
(6, 0, 1, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 22:05:49', '2023-05-28 22:05:49'),
(7, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 22:08:45', '2023-05-28 22:08:45'),
(8, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 22:32:13', '2023-05-28 22:32:13'),
(9, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 22:55:59', '2023-05-28 22:55:59'),
(10, 1, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-28 23:02:48', '2023-05-28 23:02:48'),
(11, 3, 0, 0, '152.207.245.16', 'Arroyo Naranjo', 'Cuba', 'CU', '-82.3712', '23.0439', 'Handheld Browser', 'Android', '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(12, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-29 22:40:54', '2023-05-29 22:40:54'),
(13, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-29 23:44:22', '2023-05-29 23:44:22'),
(14, 4, 0, 0, '148.101.103.11', 'Santo Domingo Este', 'Dominican Republic', 'DO', '-69.8965', '18.4615', 'Handheld Browser', 'Android', '2023-05-30 07:34:52', '2023-05-30 07:34:52'),
(15, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-30 16:37:15', '2023-05-30 16:37:15'),
(16, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-05-30 18:21:40', '2023-05-30 18:21:40'),
(17, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-06-01 03:41:23', '2023-06-01 03:41:23'),
(18, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-06-01 04:09:20', '2023-06-01 04:09:20'),
(19, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-06-01 04:19:17', '2023-06-01 04:19:17'),
(20, 1, 0, 0, '31.4.243.204', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Chrome', 'Windows 10', '2023-06-01 04:37:33', '2023-06-01 04:37:33'),
(21, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-06-01 06:31:22', '2023-06-01 06:31:22'),
(22, 1, 0, 0, '31.4.243.204', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Chrome', 'Windows 10', '2023-06-01 21:06:50', '2023-06-01 21:06:50'),
(23, 1, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-06-01 21:12:14', '2023-06-01 21:12:14'),
(24, 2, 0, 0, '31.4.205.197', 'Barcelona', 'Spain', 'ES', '2.1701', '41.387', 'Handheld Browser', 'Android', '2023-06-01 21:25:56', '2023-06-01 21:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `user_withdraw_methods`
--

CREATE TABLE `user_withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `voucher_code` varchar(40) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT 0,
  `redeemer_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `user_id`, `user_type`, `amount`, `currency_id`, `voucher_code`, `is_used`, `redeemer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'USER', 5.00000000, 101, '2212-7541-8864-8177', 1, 2, '2023-05-28 20:51:47', '2023-05-28 20:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency_code` varchar(40) NOT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `user_type`, `currency_id`, `currency_code`, `balance`, `created_at`, `updated_at`) VALUES
(1, 1, 'USER', 1, 'USD', 0.00000000, '2023-05-28 20:41:30', '2023-05-28 20:41:30'),
(2, 1, 'USER', 101, 'USDT', 0.00000000, '2023-05-28 20:41:30', '2023-05-28 22:06:46'),
(3, 1, 'USER', 102, 'TRX', 0.00000000, '2023-05-28 20:41:30', '2023-05-28 20:41:30'),
(4, 2, 'USER', 1, 'USD', 0.00000000, '2023-05-28 20:56:41', '2023-05-28 20:56:41'),
(5, 2, 'USER', 101, 'USDT', 5.00000000, '2023-05-28 20:56:41', '2023-05-28 20:58:26'),
(6, 2, 'USER', 102, 'TRX', 0.00000000, '2023-05-28 20:56:41', '2023-05-28 20:56:41'),
(7, 1, 'MERCHANT', 1, 'USD', 0.00000000, '2023-05-28 21:43:52', '2023-05-28 21:43:52'),
(8, 1, 'MERCHANT', 101, 'USDT', 0.00000000, '2023-05-28 21:43:52', '2023-05-28 21:43:52'),
(9, 1, 'MERCHANT', 102, 'TRX', 0.00000000, '2023-05-28 21:43:52', '2023-05-28 21:43:52'),
(10, 1, 'AGENT', 1, 'USD', 0.00000000, '2023-05-28 21:49:05', '2023-05-28 21:49:05'),
(11, 1, 'AGENT', 101, 'USDT', 0.00000000, '2023-05-28 21:49:05', '2023-05-28 21:49:05'),
(12, 1, 'AGENT', 102, 'TRX', 0.00000000, '2023-05-28 21:49:05', '2023-05-28 21:49:05'),
(13, 2, 'USER', 103, '€URO', 0.00000000, '2023-05-28 22:55:59', '2023-05-28 22:55:59'),
(14, 2, 'USER', 104, '₿TC', 0.00000000, '2023-05-28 22:55:59', '2023-05-28 22:55:59'),
(15, 2, 'USER', 105, 'ETH', 0.00000000, '2023-05-28 22:55:59', '2023-05-28 22:55:59'),
(16, 1, 'USER', 103, '€URO', 0.00000000, '2023-05-28 23:02:48', '2023-05-28 23:02:48'),
(17, 1, 'USER', 104, '₿TC', 0.00000000, '2023-05-28 23:02:48', '2023-05-28 23:02:48'),
(18, 1, 'USER', 105, 'ETH', 0.00000000, '2023-05-28 23:02:48', '2023-05-28 23:02:48'),
(19, 3, 'USER', 1, 'USD', 0.00000000, '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(20, 3, 'USER', 101, 'USDT', 0.00000000, '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(21, 3, 'USER', 102, 'TRX', 0.00000000, '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(22, 3, 'USER', 103, '€URO', 0.00000000, '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(23, 3, 'USER', 104, '₿TC', 0.00000000, '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(24, 3, 'USER', 105, 'ETH', 0.00000000, '2023-05-29 09:23:27', '2023-05-29 09:23:27'),
(25, 4, 'USER', 1, 'USD', 0.00000000, '2023-05-30 07:34:52', '2023-05-30 07:34:52'),
(26, 4, 'USER', 101, 'USDT', 0.00000000, '2023-05-30 07:34:52', '2023-05-30 07:34:52'),
(27, 4, 'USER', 102, 'TRX', 0.00000000, '2023-05-30 07:34:52', '2023-05-30 07:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_type` varchar(40) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency_id` int(10) NOT NULL DEFAULT 0,
  `wallet_id` int(10) NOT NULL DEFAULT 0,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `method_id`, `user_id`, `user_type`, `amount`, `currency_id`, `wallet_id`, `currency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_information`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'USER', 5.00000000, 101, 2, 'USDT', 1.00000000, 0.00000000, '2SSMEQY2GFX6', 5.00000000, 5.00000000, NULL, 1, NULL, '2023-05-28 20:51:47', '2023-05-28 20:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_guards` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `form_id`, `name`, `min_limit`, `max_limit`, `fixed_charge`, `rate`, `percent_charge`, `currency`, `description`, `status`, `user_guards`, `currencies`, `created_at`, `updated_at`) VALUES
(1, 2, 'USDT TRC20', 1.00000000, 10000.00000000, 1.00000000, 0.00000000, 3.00, NULL, 'Follow the instructions and send your address', 1, '[\"1\",\"2\",\"3\"]', '[\"1\",\"101\",\"102\"]', '2023-05-28 20:21:53', '2023-06-01 04:44:05'),
(2, 4, 'TRC20 TRX', 1.00000000, 10000.00000000, 1.00000000, 0.00000000, 3.00, NULL, 'Follow the instructions and send your address<br>', 1, '[\"1\",\"2\",\"3\"]', '[\"102\"]', '2023-06-01 04:57:36', '2023-06-01 04:57:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_password_resets`
--
ALTER TABLE `agent_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_payments`
--
ALTER TABLE `api_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_logs`
--
ALTER TABLE `charge_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_currency_code_index` (`currency_code`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant_reset_passwords`
--
ALTER TABLE `merchant_reset_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_money`
--
ALTER TABLE `request_money`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_charges`
--
ALTER TABLE `transaction_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_charges_slug_index` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_actions`
--
ALTER TABLE `user_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_withdraw_methods`
--
ALTER TABLE `user_withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agent_password_resets`
--
ALTER TABLE `agent_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_payments`
--
ALTER TABLE `api_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_logs`
--
ALTER TABLE `charge_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merchant_reset_passwords`
--
ALTER TABLE `merchant_reset_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request_money`
--
ALTER TABLE `request_money`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction_charges`
--
ALTER TABLE `transaction_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_actions`
--
ALTER TABLE `user_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_withdraw_methods`
--
ALTER TABLE `user_withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
