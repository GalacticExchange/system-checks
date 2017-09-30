-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 12, 2015 at 03:11 AM
-- Server version: 5.6.12
-- PHP Version: 5.5.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_cms_tpl`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_languages`
--

DROP TABLE IF EXISTS `cms_languages`;
CREATE TABLE IF NOT EXISTS `cms_languages` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `charset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'utf8_unicode_ci',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang_html` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `countries` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxLang` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cms_languages`
--

INSERT INTO `cms_languages` (`id`, `title`, `lang`, `enabled`, `charset`, `locale`, `lang_html`, `pos`, `countries`) VALUES
(1, 'English', 'en', 1, 'utf8_unicode_ci', '', 'en', 1, ''),
(2, 'Russian', 'ru', 1, 'utf8_unicode_ci', '', 'ru', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `cms_mediafiles`
--

DROP TABLE IF EXISTS `cms_mediafiles`;
CREATE TABLE IF NOT EXISTS `cms_mediafiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_type` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cms_mediafiles`
--

INSERT INTO `cms_mediafiles` (`id`, `media_type`, `path`, `photo_file_name`, `photo_content_type`, `photo_file_size`, `photo_updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_parts_count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `url_vars_count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parsed_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `view_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_translated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `pos` int(11) NOT NULL DEFAULT '0',
  `redir_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `is_folder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `controller_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `url` (`url`),
  KEY `index_cms_pages_on_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `title`, `name`, `url`, `url_parts_count`, `url_vars_count`, `parsed_url`, `parent_id`, `view_path`, `is_translated`, `status`, `pos`, `redir_url`, `template_id`, `layout_id`, `owner`, `is_folder`, `controller_action`, `created_at`, `updated_at`, `enabled`) VALUES
(12, 'error404', 'error404', 'errors/404', 2, 0, '^errors\\/404', 93, NULL, 0, 0, 15, '', 4, 1, 0, 0, '', '0000-00-00 00:00:00', '2015-05-13 23:36:54', 1),
(13, 'error403', 'error403', 'errors/403', 2, 0, '^errors\\/403', 93, NULL, 0, 0, 14, '', 4, 1, 0, 0, '', '0000-00-00 00:00:00', '2015-05-13 23:37:09', 1),
(24, 'Text pages', 'textpages', '', 0, 0, '', 0, NULL, 0, 0, 12, '', 0, NULL, 0, 1, '', '0000-00-00 00:00:00', '2013-06-26 14:00:52', 1),
(44, 'About', 'about', 'about.html', 1, 0, 'about[.]html', 24, NULL, 1, 0, 0, '', 123, 4, 0, 0, '', '0000-00-00 00:00:00', '2015-05-02 00:13:00', 1),
(74, 'Sitemap', 'sitemap', 'sitemap.html', 1, 0, 'sitemap[.]html', 0, NULL, 0, 0, 10, '', 128, 1, 0, 0, '', '2010-10-25 08:21:47', '2015-05-13 23:33:19', 1),
(93, 'System pages', 'folder-system', 'system/', 1, 0, 'system/', 0, NULL, 0, 0, 7, '', 0, NULL, 0, 1, '', '2013-07-05 21:38:26', '0000-00-00 00:00:00', 1),
(97, 'Home', 'home', '', 0, 0, '^$', 0, NULL, 0, 0, 2, '', 127, 1, 0, 0, '', '2013-07-10 10:10:21', '2015-05-18 23:02:04', 1),
(98, 'Dev debug', 'dev', 'dev/', 1, 0, 'dev/', 93, NULL, 1, 0, 0, '', 16, NULL, 0, 0, '', '2013-07-11 02:21:30', '0000-00-00 00:00:00', 1),
(126, 'Contacts', 'contacts', 'contacts.html', 1, 0, 'contacts[.]html', 24, NULL, 1, 0, 0, '', 4, NULL, 0, 0, '', '2014-03-15 21:27:00', '2015-03-22 01:45:36', 1),
(153, 'error500', 'error500', 'errors/500', 2, 0, '^errors\\/500', 93, NULL, 0, 0, 0, NULL, NULL, 1, NULL, 0, '', '2015-05-13 23:37:26', '2015-05-13 23:37:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages_translation`
--

DROP TABLE IF EXISTS `cms_pages_translation`;
CREATE TABLE IF NOT EXISTS `cms_pages_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) DEFAULT NULL,
  `lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template` (`template_filename`),
  KEY `item_id` (`item_id`),
  KEY `lang` (`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0 AUTO_INCREMENT=348 ;

--
-- Dumping data for table `cms_pages_translation`
--

INSERT INTO `cms_pages_translation` (`id`, `item_id`, `page_id`, `lang`, `meta_title`, `meta_description`, `meta_keywords`, `template_filename`) VALUES
(229, 24, 24, 'en', '', '', '', ''),
(232, 44, 44, 'en', '', '', '', 'main.tpl'),
(249, 74, 74, 'en', '', '', '', 'main.tpl'),
(255, 93, 93, 'en', '', '', '', ''),
(259, 97, 97, 'en', 'HOME', '', '', 'main_home.tpl'),
(260, 98, 98, 'en', '', '', '', 'blank.tpl'),
(288, 126, 126, 'en', '', '', '', 'main.tpl'),
(289, 126, 126, 'ru', '', '', '', 'main.tpl'),
(290, 44, 44, 'ru', '', '', '', 'main.tpl'),
(297, 97, 97, 'ru', '', '', '', 'main_home.tpl'),
(333, 97, NULL, '', 'Demo App | Optima CMS', 'Demo app.', 'cms, demo', NULL),
(334, 74, NULL, '', 'Sitemap', '', '', NULL),
(335, 74, NULL, 'ru', '', '', '', NULL),
(339, 12, NULL, '', '', '', '', NULL),
(340, 12, NULL, 'en', '', '', '', NULL),
(341, 12, NULL, 'ru', '', '', '', NULL),
(342, 13, NULL, '', '', '', '', NULL),
(343, 13, NULL, 'en', '', '', '', NULL),
(344, 13, NULL, 'ru', '', '', '', NULL),
(345, 153, NULL, '', '', '', '', NULL),
(346, 153, NULL, 'en', '', '', '', NULL),
(347, 153, NULL, 'ru', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_templates`
--

DROP TABLE IF EXISTS `cms_templates`;
CREATE TABLE IF NOT EXISTS `cms_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `basepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `basedirpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` tinyint(4) DEFAULT NULL,
  `tpl_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `is_translated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ancestry` (`ancestry`),
  KEY `basepath` (`basepath`),
  KEY `pos` (`pos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0 AUTO_INCREMENT=130 ;

--
-- Dumping data for table `cms_templates`
--

INSERT INTO `cms_templates` (`id`, `title`, `name`, `basename`, `basepath`, `basedirpath`, `type_id`, `tpl_format`, `pos`, `is_translated`, `created_at`, `updated_at`, `is_folder`, `enabled`, `ancestry`) VALUES
(1, 'App layout', 'main', 'application', 'application', 'layouts/', 1, 'haml', 0, 0, '0000-00-00 00:00:00', '2015-05-13 23:11:20', 0, 1, NULL),
(125, 'Text pages', NULL, 'textpages', 'textpages', '', NULL, NULL, NULL, 0, '2015-05-13 23:11:38', '2015-05-13 23:11:38', 1, 1, NULL),
(126, 'Home', NULL, 'home', 'home', '', NULL, NULL, NULL, 0, '2015-05-13 23:12:02', '2015-05-13 23:12:02', 1, 1, NULL),
(127, 'home', NULL, 'index', 'home/index', 'home/', 2, 'haml', NULL, 0, '2015-05-13 23:12:20', '2015-05-13 23:12:20', 0, 1, '126'),
(128, 'Sitemap', NULL, 'sitemap', 'textpages/sitemap', 'textpages/', 2, 'html', NULL, 0, '2015-05-13 23:26:11', '2015-05-13 23:26:11', 0, 1, '125'),
(129, 'test img', NULL, 'test_img', 'textpages/test_img', 'textpages/', 2, 'html', NULL, 0, '2015-05-17 14:19:13', '2015-05-17 14:19:13', 0, 1, '125');

-- --------------------------------------------------------

--
-- Table structure for table `cms_templates_translation`
--

DROP TABLE IF EXISTS `cms_templates_translation`;
CREATE TABLE IF NOT EXISTS `cms_templates_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms_templatetypes`
--

DROP TABLE IF EXISTS `cms_templatetypes`;
CREATE TABLE IF NOT EXISTS `cms_templatetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cms_templatetypes`
--

INSERT INTO `cms_templatetypes` (`id`, `name`, `title`, `pos`) VALUES
(1, 'layout', 'Layout', 1),
(2, 'page', 'Page', 2),
(3, 'partial', 'Partial', 3),
(4, 'block', 'Block Views', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE IF NOT EXISTS `cms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_optimacms_cms_users_on_email` (`email`),
  UNIQUE KEY `index_optimacms_cms_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`) VALUES
(3, 'admin@example.com', '$2a$10$nskdCAF90Qcxd/magQFE2ulpdLSbCr/PvR/laa9Go/.92wEtDrY8i', NULL, NULL, NULL, 5, '2015-05-13 23:27:49', '2015-05-13 22:57:08', '127.0.0.1', '127.0.0.1', '2015-05-13 22:48:20', '2015-05-13 23:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `optimacms_articles`
--

DROP TABLE IF EXISTS `optimacms_articles`;
CREATE TABLE IF NOT EXISTS `optimacms_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `optimacms_cms_users`
--

DROP TABLE IF EXISTS `optimacms_cms_users`;
CREATE TABLE IF NOT EXISTS `optimacms_cms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_optimacms_cms_users_on_email` (`email`),
  UNIQUE KEY `index_optimacms_cms_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20150513194957'),
('20150513224339'),
('20150513224340'),
('20150513224341'),
('20150612011035'),
('20150612011036');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
