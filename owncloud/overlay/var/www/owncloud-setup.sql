-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 07, 2012 at 08:32 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `oc_appconfig`
--

CREATE TABLE IF NOT EXISTS `oc_appconfig` (
  `appid` varchar(255) NOT NULL DEFAULT '',
  `configkey` varchar(255) NOT NULL DEFAULT '',
  `configvalue` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_appconfig`
--

INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES
('gallery', 'installed_version', '0.3'),
('gallery', 'enabled', 'yes'),
('user_ldap', 'installed_version', '0.1'),
('user_ldap', 'enabled', 'no'),
('media', 'installed_version', '0.2'),
('media', 'enabled', 'yes'),
('files_texteditor', 'installed_version', '0.3'),
('files_texteditor', 'enabled', 'yes'),
('files_pdfviewer', 'installed_version', '0.1'),
('files_pdfviewer', 'enabled', 'yes'),
('external', 'installed_version', '1.0'),
('external', 'enabled', 'no'),
('files_sharing', 'installed_version', '0.1'),
('files_sharing', 'enabled', 'yes'),
('bookmarks', 'installed_version', '0.1'),
('bookmarks', 'enabled', 'no'),
('admin_export', 'installed_version', '0.1'),
('admin_export', 'enabled', 'yes'),
('user_openid', 'installed_version', '0.1'),
('user_openid', 'enabled', 'no'),
('contacts', 'installed_version', '0.1'),
('contacts', 'enabled', 'yes'),
('calendar', 'installed_version', '0.2'),
('calendar', 'enabled', 'yes'),
('user_webfinger', 'installed_version', '0.1'),
('user_webfinger', 'enabled', 'no'),
('admin_dependencies_chk', 'installed_version', '0.01'),
('admin_dependencies_chk', 'enabled', 'yes'),
('remoteStorage', 'installed_version', '0.2'),
('remoteStorage', 'enabled', 'no'),
('files_imageviewer', 'installed_version', '1.0'),
('files_imageviewer', 'enabled', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `oc_authtoken`
--

CREATE TABLE IF NOT EXISTS `oc_authtoken` (
  `token` varchar(40) NOT NULL DEFAULT '',
  `appUrl` varchar(128) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(64) NOT NULL DEFAULT '',
  UNIQUE KEY `a_app_remotestorage_user` (`user`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_authtoken`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_bookmarks`
--

CREATE TABLE IF NOT EXISTS `oc_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(4096) NOT NULL DEFAULT '',
  `title` varchar(140) NOT NULL DEFAULT '',
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `public` tinyint(4) DEFAULT '0',
  `added` int(10) unsigned DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `clickcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_bookmarks`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_bookmarks_tags`
--

CREATE TABLE IF NOT EXISTS `oc_bookmarks_tags` (
  `bookmark_id` bigint(20) DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `bookmark_tag` (`bookmark_id`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_bookmarks_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_calendar_calendars`
--

CREATE TABLE IF NOT EXISTS `oc_calendar_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `ctag` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(10) DEFAULT NULL,
  `timezone` longtext,
  `components` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_calendar_calendars`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_calendar_objects`
--

CREATE TABLE IF NOT EXISTS `oc_calendar_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` int(10) unsigned NOT NULL DEFAULT '0',
  `objecttype` varchar(40) NOT NULL DEFAULT '',
  `startdate` datetime DEFAULT '0000-00-00 00:00:00',
  `enddate` datetime DEFAULT '0000-00-00 00:00:00',
  `repeating` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `calendardata` longtext,
  `uri` varchar(100) DEFAULT NULL,
  `lastmodified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_calendar_objects`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_contacts_addressbooks`
--

CREATE TABLE IF NOT EXISTS `oc_contacts_addressbooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) NOT NULL DEFAULT '',
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `description` longtext,
  `ctag` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_contacts_addressbooks`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_contacts_cards`
--

CREATE TABLE IF NOT EXISTS `oc_contacts_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` int(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `carddata` longtext,
  `uri` varchar(100) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_contacts_cards`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_foldersize`
--

CREATE TABLE IF NOT EXISTS `oc_foldersize` (
  `path` varchar(512) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT '0',
  KEY `path_index` (`path`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_foldersize`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_gallery_albums`
--

CREATE TABLE IF NOT EXISTS `oc_gallery_albums` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `album_name` varchar(100) NOT NULL DEFAULT '',
  `album_path` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_gallery_albums`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_gallery_photos`
--

CREATE TABLE IF NOT EXISTS `oc_gallery_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL DEFAULT '0',
  `file_path` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_gallery_photos`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_group_user`
--

CREATE TABLE IF NOT EXISTS `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_group_user`
--

INSERT INTO `oc_group_user` (`gid`, `uid`, `id`) VALUES
('admin', 'not-set', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_groups`
--

CREATE TABLE IF NOT EXISTS `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_groups`
--

INSERT INTO `oc_groups` (`gid`) VALUES
('admin');

-- --------------------------------------------------------

--
-- Table structure for table `oc_locks`
--

CREATE TABLE IF NOT EXISTS `oc_locks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(200) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `timeout` int(10) unsigned DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `scope` tinyint(4) DEFAULT NULL,
  `depth` tinyint(4) DEFAULT NULL,
  `uri` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_locks`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_log`
--

CREATE TABLE IF NOT EXISTS `oc_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moment` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `appid` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `info` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_media_albums`
--

CREATE TABLE IF NOT EXISTS `oc_media_albums` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(200) NOT NULL DEFAULT '',
  `album_artist` int(11) NOT NULL DEFAULT '0',
  `album_art` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_media_albums`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_media_artists`
--

CREATE TABLE IF NOT EXISTS `oc_media_artists` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`artist_id`),
  UNIQUE KEY `artist_name` (`artist_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_media_artists`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_media_sessions`
--

CREATE TABLE IF NOT EXISTS `oc_media_sessions` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL DEFAULT '',
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `start` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_media_sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_media_songs`
--

CREATE TABLE IF NOT EXISTS `oc_media_songs` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(200) NOT NULL DEFAULT '',
  `song_artist` int(11) NOT NULL DEFAULT '0',
  `song_album` int(11) NOT NULL DEFAULT '0',
  `song_path` varchar(200) NOT NULL DEFAULT '',
  `song_user` varchar(64) NOT NULL DEFAULT '0',
  `song_length` int(11) NOT NULL DEFAULT '0',
  `song_track` int(11) NOT NULL DEFAULT '0',
  `song_size` int(11) NOT NULL DEFAULT '0',
  `song_playcount` int(11) NOT NULL DEFAULT '0',
  `song_lastplayed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`song_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_media_songs`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_media_users`
--

CREATE TABLE IF NOT EXISTS `oc_media_users` (
  `user_id` varchar(64) NOT NULL DEFAULT '0',
  `user_password_sha256` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_media_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_preferences`
--

CREATE TABLE IF NOT EXISTS `oc_preferences` (
  `userid` varchar(255) NOT NULL DEFAULT '',
  `appid` varchar(255) NOT NULL DEFAULT '',
  `configkey` varchar(255) NOT NULL DEFAULT '',
  `configvalue` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_preferences`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_principalgroups`
--

CREATE TABLE IF NOT EXISTS `oc_principalgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `principal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `principals_members_index` (`principal_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oc_principalgroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_principals`
--

CREATE TABLE IF NOT EXISTS `oc_principals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_principals`
--

INSERT INTO `oc_principals` (`id`, `uri`, `displayname`) VALUES
(1, 'principals/first-user', 'first-user'),
(2, 'principals/first-user/calendar-proxy-read', NULL),
(3, 'principals/first-user/calendar-proxy-write', NULL),
(4, 'principals/first-user/addressbook-proxy-read', NULL),
(5, 'principals/first-user/addressbook-proxy-write', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_properties`
--

CREATE TABLE IF NOT EXISTS `oc_properties` (
  `userid` varchar(200) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_properties`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_sharing`
--

CREATE TABLE IF NOT EXISTS `oc_sharing` (
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_shared_with` varchar(64) NOT NULL DEFAULT '',
  `source` varchar(128) NOT NULL DEFAULT '',
  `target` varchar(128) NOT NULL DEFAULT '',
  `permissions` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_sharing`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_users`
--

CREATE TABLE IF NOT EXISTS `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_users`
--

INSERT INTO `oc_users` (`uid`, `password`, `id`) VALUES
('not-set', 'not-set', 1);
