-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2020 at 08:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fpt_js`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_keys`
--

CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_settings`
--

CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_types`
--

CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_type_settings`
--

CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `include_in_browse` tinyint(4) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `user_group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `email`, `include_in_browse`, `publication_id`, `submission_id`, `seq`, `user_group_id`) VALUES
(1, 'duongpl@fpt.edu.vn', 1, 1, NULL, 0, 14),
(2, 'tuankqrd@gjdfg.com', 1, 2, NULL, 0, 48);

-- --------------------------------------------------------

--
-- Table structure for table `author_settings`
--

CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author_settings`
--

INSERT INTO `author_settings` (`author_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'country', 'VN', NULL),
(1, 'en_US', 'affiliation', 'dfdfdfdf', NULL),
(1, 'en_US', 'familyName', 'eetgtrtrytry', NULL),
(1, 'en_US', 'givenName', 'quoctuanck99', NULL),
(2, '', 'country', 'VN', NULL),
(2, 'en_US', 'affiliation', 'dsfdsfg', NULL),
(2, 'en_US', 'familyName', '123546', NULL),
(2, 'en_US', 'givenName', 'tuankq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_settings`
--

CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `citation_settings`
--

CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `completed_payments`
--

CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocabs`
--

CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(8, 'interest', 0, 0),
(4, 'mods34-genre-marcgt', 0, 0),
(2, 'mods34-name-role-roleTerms-marcrelator', 0, 0),
(1, 'mods34-name-types', 0, 0),
(5, 'mods34-physicalDescription-form-marcform', 0, 0),
(3, 'mods34-typeOfResource', 0, 0),
(7, 'openurl10-book-genres', 0, 0),
(6, 'openurl10-journal-genres', 0, 0),
(15, 'submissionAgency', 1048588, 1),
(308, 'submissionAgency', 1048588, 2),
(13, 'submissionDiscipline', 1048588, 1),
(306, 'submissionDiscipline', 1048588, 2),
(11, 'submissionKeyword', 1048588, 1),
(304, 'submissionKeyword', 1048588, 2),
(14, 'submissionLanguage', 1048588, 1),
(307, 'submissionLanguage', 1048588, 2),
(12, 'submissionSubject', 1048588, 1),
(305, 'submissionSubject', 1048588, 2);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entries`
--

CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `controlled_vocab_entries`
--

INSERT INTO `controlled_vocab_entries` (`controlled_vocab_entry_id`, `controlled_vocab_id`, `seq`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 2, 5),
(9, 2, 6),
(10, 2, 7),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 4, 1),
(15, 4, 2),
(16, 4, 3),
(17, 4, 4),
(18, 4, 5),
(19, 4, 6),
(20, 4, 7),
(21, 4, 8),
(22, 4, 9),
(23, 4, 10),
(24, 4, 11),
(25, 4, 12),
(26, 5, 1),
(27, 5, 2),
(28, 6, 1),
(29, 6, 2),
(30, 6, 3),
(31, 6, 4),
(32, 6, 5),
(33, 6, 6),
(34, 6, 7),
(35, 7, 1),
(36, 7, 2),
(37, 7, 3),
(38, 7, 4),
(39, 7, 5),
(40, 7, 6),
(41, 7, 7),
(42, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entry_settings`
--

CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

INSERT INTO `controlled_vocab_entry_settings` (`controlled_vocab_entry_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'name', 'personal', 'string'),
(2, '', 'name', 'corporate', 'string'),
(3, '', 'name', 'conference', 'string'),
(4, '', 'description', 'Author', 'string'),
(4, '', 'name', 'aut', 'string'),
(5, '', 'description', 'Contributor', 'string'),
(5, '', 'name', 'ctb', 'string'),
(6, '', 'description', 'Editor', 'string'),
(6, '', 'name', 'edt', 'string'),
(7, '', 'description', 'Illustrator', 'string'),
(7, '', 'name', 'ill', 'string'),
(8, '', 'description', 'Photographer', 'string'),
(8, '', 'name', 'pht', 'string'),
(9, '', 'description', 'Sponsor', 'string'),
(9, '', 'name', 'spn', 'string'),
(10, '', 'description', 'Translator', 'string'),
(10, '', 'name', 'trl', 'string'),
(11, '', 'name', 'multimedia', 'string'),
(12, '', 'name', 'still image', 'string'),
(13, '', 'name', 'text', 'string'),
(14, '', 'name', 'article', 'string'),
(15, '', 'name', 'book', 'string'),
(16, '', 'name', 'conference publication', 'string'),
(17, '', 'name', 'issue', 'string'),
(18, '', 'name', 'journal', 'string'),
(19, '', 'name', 'newspaper', 'string'),
(20, '', 'name', 'picture', 'string'),
(21, '', 'name', 'review', 'string'),
(22, '', 'name', 'periodical', 'string'),
(23, '', 'name', 'series', 'string'),
(24, '', 'name', 'thesis', 'string'),
(25, '', 'name', 'web site', 'string'),
(26, '', 'name', 'electronic', 'string'),
(27, '', 'name', 'print', 'string'),
(28, '', 'name', 'journal', 'string'),
(29, '', 'name', 'issue', 'string'),
(30, '', 'name', 'article', 'string'),
(31, '', 'name', 'proceeding', 'string'),
(32, '', 'name', 'conference', 'string'),
(33, '', 'name', 'preprint', 'string'),
(34, '', 'name', 'unknown', 'string'),
(35, '', 'name', 'book', 'string'),
(36, '', 'name', 'bookitem', 'string'),
(37, '', 'name', 'proceeding', 'string'),
(38, '', 'name', 'conference', 'string'),
(39, '', 'name', 'report', 'string'),
(40, '', 'name', 'document', 'string'),
(41, '', 'name', 'unknown', 'string'),
(42, '', 'interest', 'cs', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `custom_issue_orders`
--

CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_section_orders`
--

CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstones`
--

CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_settings`
--

CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `edit_decisions`
--

CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_log_users`
--

CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL,
  `context_id` bigint(20) DEFAULT 0,
  `enabled` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default`
--

CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT 1,
  `can_edit` tinyint(4) NOT NULL DEFAULT 1,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL),
(2, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL),
(3, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL),
(4, 'PASSWORD_RESET', 0, 1, NULL, NULL),
(5, 'USER_REGISTER', 0, 1, NULL, NULL),
(6, 'USER_VALIDATE', 0, 1, NULL, NULL),
(7, 'REVIEWER_REGISTER', 0, 1, NULL, NULL),
(8, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL),
(9, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL),
(10, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL),
(11, 'SUBMISSION_ACK', 1, 1, NULL, 65536),
(12, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536),
(13, 'EDITOR_ASSIGN', 1, 1, 16, 16),
(14, 'REVIEW_CANCEL', 1, 1, 16, 4096),
(15, 'REVIEW_REINSTATE', 1, 1, 16, 4096),
(16, 'REVIEW_REQUEST', 1, 1, 16, 4096),
(17, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 16, 4096),
(18, 'REVIEW_REQUEST_ONECLICK', 1, 1, 16, 4096),
(19, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 16, 4096),
(20, 'REVIEW_REQUEST_ATTACHED', 0, 1, 16, 4096),
(21, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 16, 4096),
(22, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096),
(23, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(24, 'REVIEW_CONFIRM', 1, 1, 4096, 16),
(25, 'REVIEW_DECLINE', 1, 1, 4096, 16),
(26, 'REVIEW_ACK', 1, 1, 16, 4096),
(27, 'REVIEW_REMIND', 0, 1, 16, 4096),
(28, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096),
(29, 'REVIEW_REMIND_ONECLICK', 0, 1, 16, 4096),
(30, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(31, 'EDITOR_DECISION_ACCEPT', 0, 1, 16, 65536),
(32, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 16, 65536),
(33, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 16, 65536),
(34, 'EDITOR_DECISION_REVISIONS', 0, 1, 16, 65536),
(35, 'EDITOR_DECISION_RESUBMIT', 0, 1, 16, 65536),
(36, 'EDITOR_DECISION_DECLINE', 0, 1, 16, 65536),
(37, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 16, 65536),
(38, 'EDITOR_RECOMMENDATION', 0, 1, 16, 16),
(39, 'COPYEDIT_REQUEST', 1, 1, 16, 4097),
(40, 'LAYOUT_REQUEST', 1, 1, 16, 4097),
(41, 'LAYOUT_COMPLETE', 1, 1, 4097, 16),
(42, 'EMAIL_LINK', 0, 1, 1048576, NULL),
(43, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576),
(44, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576),
(45, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576),
(46, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576),
(47, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576),
(48, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152),
(49, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152),
(50, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152),
(51, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152),
(52, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL),
(53, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 16),
(54, 'STATISTICS_REPORT_NOTIFICATION', 0, 1, 16, 17),
(55, 'ORCID_COLLECT_AUTHOR_ID', 0, 1, NULL, NULL),
(56, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 0, 1, NULL, NULL),
(57, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL),
(58, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default_data`
--

CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('CITATION_EDITOR_AUTHOR_QUERY', 'en_US', 'Citation Editing', '{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'This email allows copyeditors to request additional information about references from authors.'),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}', 'This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission', 'This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission', 'This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),
('EDITOR_DECISION_INITIAL_DECLINE', 'en_US', 'Editor Decision', '\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission', 'This email is sent to the author if the editor declines their submission initially, before the review stage'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review', 'This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required', 'This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_RECOMMENDATION', 'en_US', 'Editor Recommendation', '{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}', 'This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('EMAIL_LINK', 'en_US', 'Article of Possible Interest', 'Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('LAYOUT_COMPLETE', 'en_US', 'Galleys Complete', '{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LOCKSS_EXISTING_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),
('LOCKSS_NEW_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.', 'This email template is used to notify a journal manager contact that a manual payment was requested.'),
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION_CENTER_DEFAULT', 'en_US', 'A message regarding {$contextName}', 'Please enter your message.', 'The default (blank) message used in the Notification Center Message Listbuilder.'),
('OPEN_ACCESS_NOTIFY', 'en_US', 'Issue Now Open Access', 'Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('ORCID_COLLECT_AUTHOR_ID', 'en_US', 'Submission ORCID', 'Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n', 'This email template is used to collect the ORCID id\'s from authors.'),
('ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'en_US', 'Requesting ORCID record access', 'Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n', 'This email template is used to request ORCID record access from authors.'),
('PASSWORD_RESET', 'en_US', 'Password Reset', 'Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PUBLISH_NOTIFY', 'en_US', 'New Issue Published', 'Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$contextName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEW_ACK', 'en_US', 'Article Review Acknowledgement', '{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', 'Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', 'Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_REINSTATE', 'en_US', 'Request for Review Reinstated', '{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REQUEST', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_REMIND_AUTO', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVISED_VERSION_NOTIFY', 'en_US', 'Revised Version Uploaded', 'Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('STATISTICS_REPORT_NOTIFICATION', 'en_US', 'Editorial activity for {$month}, {$year}', '\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}', 'This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK_NOT_USER', 'en_US', 'Submission Acknowledgement', 'Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'en_US', 'Subscription Expired', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en_US', 'Subscription Expired - Final Reminder', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'en_US', 'Notice of Subscription Expiry', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY', 'en_US', 'Subscription Notification', '{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_PURCHASE_INDL', 'en_US', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'en_US', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_RENEW_INDL', 'en_US', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL', 'en_US', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('USER_REGISTER', 'en_US', 'Journal Registration', '{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to validate their email account.');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_settings`
--

CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_log`
--

INSERT INTO `event_log` (`log_id`, `assoc_type`, `assoc_id`, `user_id`, `date_logged`, `event_type`, `message`, `is_translated`) VALUES
(1, 1048585, 1, 2, '2020-03-07 08:41:34', 268435458, 'submission.event.general.metadataUpdated', 0),
(2, 515, 1, 2, '2020-03-07 08:41:43', 1342177281, 'submission.event.fileUploaded', 0),
(3, 1048585, 1, 2, '2020-03-07 08:41:45', 1342177281, 'submission.event.fileUploaded', 0),
(4, 1048585, 1, 2, '2020-03-07 08:42:13', 268435458, 'submission.event.general.metadataUpdated', 0),
(5, 1048585, 1, 2, '2020-03-07 08:42:18', 268435457, 'submission.event.submissionSubmitted', 0),
(6, 1048585, 2, 3, '2020-03-07 08:48:16', 268435458, 'submission.event.general.metadataUpdated', 0),
(7, 515, 2, 3, '2020-03-07 08:48:26', 1342177281, 'submission.event.fileUploaded', 0),
(8, 515, 2, 3, '2020-03-07 08:48:42', 1342177288, 'submission.event.revisionUploaded', 0),
(9, 1048585, 2, 3, '2020-03-07 08:48:44', 1342177288, 'submission.event.fileRevised', 0),
(10, 1048585, 2, 3, '2020-03-07 08:48:56', 268435458, 'submission.event.general.metadataUpdated', 0),
(11, 1048585, 2, 3, '2020-03-07 08:49:01', 268435457, 'submission.event.submissionSubmitted', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_log_settings`
--

CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_log_settings`
--

INSERT INTO `event_log_settings` (`log_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
(2, 'fileId', '1', 'int'),
(2, 'fileRevision', '1', 'int'),
(2, 'fileStage', '2', 'int'),
(2, 'originalFileName', 'coverback.png', 'string'),
(2, 'revisedFileId', NULL, 'string'),
(2, 'submissionId', '1', 'int'),
(2, 'username', 'duongpl', 'string'),
(3, 'fileId', '1', 'int'),
(3, 'fileRevision', '1', 'int'),
(3, 'fileStage', '2', 'int'),
(3, 'name', 'duongpl, coverback.png', 'string'),
(3, 'originalFileName', 'coverback.png', 'string'),
(3, 'submissionId', '1', 'int'),
(3, 'username', 'duongpl', 'string'),
(7, 'fileId', '2', 'int'),
(7, 'fileRevision', '1', 'int'),
(7, 'fileStage', '2', 'int'),
(7, 'originalFileName', 'coverback.png', 'string'),
(7, 'revisedFileId', NULL, 'string'),
(7, 'submissionId', '2', 'int'),
(7, 'username', 'tuankq', 'string'),
(8, 'fileId', '2', 'int'),
(8, 'fileRevision', '2', 'int'),
(8, 'fileStage', '2', 'int'),
(8, 'originalFileName', 'cplexAndGa.docx', 'string'),
(8, 'revisedFileId', '2', 'int'),
(8, 'submissionId', '2', 'int'),
(8, 'username', 'tuankq', 'string'),
(9, 'fileId', '2', 'int'),
(9, 'fileRevision', '2', 'int'),
(9, 'fileStage', '2', 'int'),
(9, 'name', 'tuankq, cplexAndGa.docx', 'string'),
(9, 'originalFileName', 'cplexAndGa.docx', 'string'),
(9, 'submissionId', '2', 'int'),
(9, 'username', 'tuankq', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) Submission', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
(2, 2, 0, 'MODS 3.4', 'lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter', 0, 0, 0),
(3, 3, 0, 'Extract metadata from a(n) Submission', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(4, 4, 0, 'Inject metadata into a(n) Submission', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(5, 5, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.IssueCrossrefXmlFilter', 0, 0, 0),
(6, 6, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter', 0, 0, 0),
(7, 7, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(8, 8, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(9, 9, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(10, 10, 0, 'DOAJ XML export', 'plugins.importexport.doaj.filter.DOAJXmlFilter', 0, 0, 0),
(11, 11, 0, 'DOAJ JSON export', 'plugins.importexport.doaj.filter.DOAJJsonFilter', 0, 0, 0),
(12, 12, 0, 'mEDRA XML issue export', 'plugins.importexport.medra.filter.IssueMedraXmlFilter', 0, 0, 0),
(13, 13, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.ArticleMedraXmlFilter', 0, 0, 0),
(14, 14, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.GalleyMedraXmlFilter', 0, 0, 0),
(15, 15, 0, 'Native XML submission export', 'plugins.importexport.native.filter.ArticleNativeXmlFilter', 0, 0, 0),
(16, 16, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlArticleFilter', 0, 0, 0),
(17, 17, 0, 'Native XML issue export', 'plugins.importexport.native.filter.IssueNativeXmlFilter', 0, 0, 0),
(18, 18, 0, 'Native XML issue import', 'plugins.importexport.native.filter.NativeXmlIssueFilter', 0, 0, 0),
(19, 19, 0, 'Native XML issue galley export', 'plugins.importexport.native.filter.IssueGalleyNativeXmlFilter', 0, 0, 0),
(20, 20, 0, 'Native XML issue galley import', 'plugins.importexport.native.filter.NativeXmlIssueGalleyFilter', 0, 0, 0),
(21, 21, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
(22, 22, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
(23, 26, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArticleFileFilter', 0, 0, 0),
(24, 27, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArtworkFileFilter', 0, 0, 0),
(25, 28, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter', 0, 0, 0),
(26, 23, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
(27, 24, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.ArtworkFileNativeXmlFilter', 0, 0, 0),
(28, 25, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter', 0, 0, 0),
(29, 29, 0, 'Native XML representation export', 'plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter', 0, 0, 0),
(30, 30, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlArticleGalleyFilter', 0, 0, 0),
(31, 31, 0, 'Native XML Publication export', 'plugins.importexport.native.filter.PublicationNativeXmlFilter', 0, 0, 0),
(32, 32, 0, 'Native XML publication import', 'plugins.importexport.native.filter.NativeXmlPublicationFilter', 0, 0, 0),
(33, 33, 0, 'ArticlePubMedXmlFilter', 'plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter', 0, 0, 0),
(34, 34, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
(35, 35, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
(36, 36, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
(37, 37, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_groups`
--

CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.submission.Submission', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(2, 'mods34=>mods34-xml', 'plugins.metadata.mods34.mods34XmlOutput.displayName', 'plugins.metadata.mods34.mods34XmlOutput.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(*)', 'xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),
(3, 'article=>mods34', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'class::classes.submission.Submission', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),
(4, 'mods34=>article', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)', 'class::classes.submission.Submission'),
(5, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(6, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.submission.Submission[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(7, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(8, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.submission.Submission', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(9, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.ArticleGalley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(10, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(11, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission', 'primitive::string'),
(12, 'issue=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.issue.Issue[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(13, 'article=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.submission.Submission[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(14, 'galley=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.ArticleGalley[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(15, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(16, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.submission.Submission[]'),
(17, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(18, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
(19, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(20, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
(21, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(22, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Author[]'),
(23, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(24, 'SubmissionArtworkFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionArtworkFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(25, 'SupplementaryFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SupplementaryFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(26, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
(27, 'native-xml=>SubmissionArtworkFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionArtworkFile'),
(28, 'native-xml=>SupplementaryFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SupplementaryFile'),
(29, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.ArticleGalley', 'xml::schema(plugins/importexport/native/native.xsd)'),
(30, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.ArticleGalley[]'),
(31, 'publication=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.publication.Publication', 'xml::schema(plugins/importexport/native/native.xsd)'),
(32, 'native-xml=>Publication', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.publication.Publication'),
(33, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.submission.Submission[]', 'xml::dtd'),
(34, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(35, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(36, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(37, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');

-- --------------------------------------------------------

--
-- Table structure for table `filter_settings`
--

CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` tinyint(4) NOT NULL DEFAULT 0,
  `supplementary` tinyint(4) DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
(1, 1, 0, 1, 1, 0, 0, 'SUBMISSION'),
(2, 1, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(3, 1, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(4, 1, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(5, 1, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(6, 1, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(7, 1, 6, 1, 3, 0, 1, 'DATASET'),
(8, 1, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(9, 1, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(10, 1, 9, 1, 2, 1, 0, 'IMAGE'),
(11, 1, 10, 1, 1, 1, 0, 'STYLE'),
(12, 1, 11, 1, 3, 0, 1, 'OTHER'),
(13, 2, 0, 1, 1, 0, 0, 'SUBMISSION'),
(14, 2, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(15, 2, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(16, 2, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(17, 2, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(18, 2, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(19, 2, 6, 1, 3, 0, 1, 'DATASET'),
(20, 2, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(21, 2, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(22, 2, 9, 1, 2, 1, 0, 'IMAGE'),
(23, 2, 10, 1, 1, 1, 0, 'STYLE'),
(24, 2, 11, 1, 3, 0, 1, 'OTHER'),
(25, 3, 0, 1, 1, 0, 0, 'SUBMISSION'),
(26, 3, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(27, 3, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(28, 3, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(29, 3, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(30, 3, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(31, 3, 6, 1, 3, 0, 1, 'DATASET'),
(32, 3, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(33, 3, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(34, 3, 9, 1, 2, 1, 0, 'IMAGE'),
(35, 3, 10, 1, 1, 1, 0, 'STYLE'),
(36, 3, 11, 1, 3, 0, 1, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `genre_settings`
--

CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre_settings`
--

INSERT INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Article Text', 'string'),
(2, 'en_US', 'name', 'Research Instrument', 'string'),
(3, 'en_US', 'name', 'Research Materials', 'string'),
(4, 'en_US', 'name', 'Research Results', 'string'),
(5, 'en_US', 'name', 'Transcripts', 'string'),
(6, 'en_US', 'name', 'Data Analysis', 'string'),
(7, 'en_US', 'name', 'Data Set', 'string'),
(8, 'en_US', 'name', 'Source Texts', 'string'),
(9, 'en_US', 'name', 'Multimedia', 'string'),
(10, 'en_US', 'name', 'Image', 'string'),
(11, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(12, 'en_US', 'name', 'Other', 'string'),
(13, 'en_US', 'name', 'Article Text', 'string'),
(14, 'en_US', 'name', 'Research Instrument', 'string'),
(15, 'en_US', 'name', 'Research Materials', 'string'),
(16, 'en_US', 'name', 'Research Results', 'string'),
(17, 'en_US', 'name', 'Transcripts', 'string'),
(18, 'en_US', 'name', 'Data Analysis', 'string'),
(19, 'en_US', 'name', 'Data Set', 'string'),
(20, 'en_US', 'name', 'Source Texts', 'string'),
(21, 'en_US', 'name', 'Multimedia', 'string'),
(22, 'en_US', 'name', 'Image', 'string'),
(23, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(24, 'en_US', 'name', 'Other', 'string'),
(25, 'en_US', 'name', 'Article Text', 'string'),
(26, 'en_US', 'name', 'Research Instrument', 'string'),
(27, 'en_US', 'name', 'Research Materials', 'string'),
(28, 'en_US', 'name', 'Research Results', 'string'),
(29, 'en_US', 'name', 'Transcripts', 'string'),
(30, 'en_US', 'name', 'Data Analysis', 'string'),
(31, 'en_US', 'name', 'Data Set', 'string'),
(32, 'en_US', 'name', 'Source Texts', 'string'),
(33, 'en_US', 'name', 'Multimedia', 'string'),
(34, 'en_US', 'name', 'Image', 'string'),
(35, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(36, 'en_US', 'name', 'Other', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscriptions`
--

CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscription_ip`
--

CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `current` tinyint(4) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT 0,
  `show_number` tinyint(4) NOT NULL DEFAULT 0,
  `show_year` tinyint(4) NOT NULL DEFAULT 0,
  `show_title` tinyint(4) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `issue_files`
--

CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galleys`
--

CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galley_settings`
--

CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `issue_settings`
--

CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_views`
--

CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'test_journal', 5, 'en_US', 1),
(2, 'test_journal_02', 3, 'en_US', 1),
(3, 'test_03', 1, 'en_US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal_settings`
--

CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `journal_settings`
--

INSERT INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'copyrightYearBasis', 'issue', NULL),
(1, '', 'defaultReviewMode', '2', NULL),
(1, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost:8080/journal_system_fpt/index.php/test_journal\">Duong</a>', NULL),
(1, '', 'enableOai', '1', NULL),
(1, '', 'itemsPerPage', '25', NULL),
(1, '', 'keywords', 'request', NULL),
(1, '', 'membershipFee', '0', NULL),
(1, '', 'numPageLinks', '10', NULL),
(1, '', 'numWeeksPerResponse', '4', NULL),
(1, '', 'numWeeksPerReview', '4', NULL),
(1, '', 'publicationFee', '0', NULL),
(1, '', 'purchaseArticleFee', '0', NULL),
(1, '', 'supportedFormLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(1, '', 'supportedLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(1, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(1, '', 'themePluginPath', 'default', NULL),
(1, 'en_US', 'acronym', 'CS', NULL),
(1, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/journal_system_fpt/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(1, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(1, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(1, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(1, 'en_US', 'name', 'Test Journal', NULL),
(1, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(1, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', NULL),
(1, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(1, 'en_US', 'submissionChecklist', 'a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:165:\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:82:\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:99:\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\";}}', NULL),
(2, '', 'copyrightYearBasis', 'issue', NULL),
(2, '', 'defaultReviewMode', '2', NULL),
(2, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost:8080/journal_system_fpt/index.php/test_journal_02\">Test_journal_02</a>', NULL),
(2, '', 'enableOai', '1', NULL),
(2, '', 'itemsPerPage', '25', NULL),
(2, '', 'keywords', 'request', NULL),
(2, '', 'membershipFee', '0', NULL),
(2, '', 'numPageLinks', '10', NULL),
(2, '', 'numWeeksPerResponse', '4', NULL),
(2, '', 'numWeeksPerReview', '4', NULL),
(2, '', 'publicationFee', '0', NULL),
(2, '', 'purchaseArticleFee', '0', NULL),
(2, '', 'supportedFormLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(2, '', 'supportedLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(2, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(2, '', 'themePluginPath', 'default', NULL),
(2, 'en_US', 'acronym', 'sss', NULL),
(2, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal_02/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal_02/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal_02/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/journal_system_fpt/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(2, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(2, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(2, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(2, 'en_US', 'name', 'Test_journal_02', NULL),
(2, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(2, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', NULL),
(2, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal_02/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_journal_02/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(2, 'en_US', 'submissionChecklist', 'a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:165:\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:82:\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:99:\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\";}}', NULL),
(3, '', 'copyrightYearBasis', 'issue', NULL),
(3, '', 'defaultReviewMode', '2', NULL),
(3, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost:8080/journal_system_fpt/index.php/test_03\">TEST_03</a>', NULL),
(3, '', 'enableOai', '1', NULL),
(3, '', 'itemsPerPage', '25', NULL),
(3, '', 'keywords', 'request', NULL),
(3, '', 'membershipFee', '0', NULL),
(3, '', 'numPageLinks', '10', NULL),
(3, '', 'numWeeksPerResponse', '4', NULL),
(3, '', 'numWeeksPerReview', '4', NULL),
(3, '', 'publicationFee', '0', NULL),
(3, '', 'purchaseArticleFee', '0', NULL),
(3, '', 'supportedFormLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(3, '', 'supportedLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(3, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:\"en_US\";}', NULL),
(3, '', 'themePluginPath', 'default', NULL),
(3, 'en_US', 'abbreviation', 'fdgfdgdfg', NULL),
(3, 'en_US', 'acronym', 'abcdef', NULL),
(3, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_03/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_03/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_03/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/journal_system_fpt/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(3, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(3, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(3, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(3, 'en_US', 'name', 'TEST_03', NULL),
(3, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(3, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', NULL),
(3, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_03/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/journal_system_fpt/index.phptest_03/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(3, 'en_US', 'submissionChecklist', 'a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:165:\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:82:\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:99:\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\";}}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `library_files`
--

CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `library_file_settings`
--

CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_descriptions`
--

CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_description_settings`
--

CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menus`
--

CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User Navigation Menu'),
(2, 1, 'user', 'User Navigation Menu'),
(3, 1, 'primary', 'Primary Navigation Menu'),
(4, 2, 'user', 'User Navigation Menu'),
(5, 2, 'primary', 'Primary Navigation Menu'),
(6, 3, 'user', 'User Navigation Menu'),
(7, 3, 'primary', 'Primary Navigation Menu');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_items`
--

CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `url`, `path`, `type`) VALUES
(1, 0, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, NULL, 'NMI_TYPE_CURRENT'),
(16, 1, NULL, NULL, 'NMI_TYPE_ARCHIVES'),
(17, 1, NULL, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(18, 1, NULL, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, NULL, 'NMI_TYPE_ABOUT'),
(20, 1, NULL, NULL, 'NMI_TYPE_SUBMISSIONS'),
(21, 1, NULL, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(22, 1, NULL, NULL, 'NMI_TYPE_PRIVACY'),
(23, 1, NULL, NULL, 'NMI_TYPE_CONTACT'),
(24, 1, NULL, NULL, 'NMI_TYPE_SEARCH'),
(25, 2, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(26, 2, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(27, 2, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(28, 2, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(29, 2, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(30, 2, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(31, 2, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(32, 2, NULL, NULL, 'NMI_TYPE_CURRENT'),
(33, 2, NULL, NULL, 'NMI_TYPE_ARCHIVES'),
(34, 2, NULL, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(35, 2, NULL, NULL, 'NMI_TYPE_ABOUT'),
(36, 2, NULL, NULL, 'NMI_TYPE_ABOUT'),
(37, 2, NULL, NULL, 'NMI_TYPE_SUBMISSIONS'),
(38, 2, NULL, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(39, 2, NULL, NULL, 'NMI_TYPE_PRIVACY'),
(40, 2, NULL, NULL, 'NMI_TYPE_CONTACT'),
(41, 2, NULL, NULL, 'NMI_TYPE_SEARCH'),
(42, 3, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(43, 3, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(44, 3, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(45, 3, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(46, 3, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(47, 3, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(48, 3, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(49, 3, NULL, NULL, 'NMI_TYPE_CURRENT'),
(50, 3, NULL, NULL, 'NMI_TYPE_ARCHIVES'),
(51, 3, NULL, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(52, 3, NULL, NULL, 'NMI_TYPE_ABOUT'),
(53, 3, NULL, NULL, 'NMI_TYPE_ABOUT'),
(54, 3, NULL, NULL, 'NMI_TYPE_SUBMISSIONS'),
(55, 3, NULL, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(56, 3, NULL, NULL, 'NMI_TYPE_PRIVACY'),
(57, 3, NULL, NULL, 'NMI_TYPE_CONTACT'),
(58, 3, NULL, NULL, 'NMI_TYPE_SEARCH');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignments`
--

CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(8, 2, 8, 0, 0),
(9, 2, 9, 0, 1),
(10, 2, 10, 0, 2),
(11, 2, 11, 10, 0),
(12, 2, 12, 10, 1),
(13, 2, 13, 10, 2),
(14, 2, 14, 10, 3),
(15, 3, 15, 0, 0),
(16, 3, 16, 0, 1),
(17, 3, 17, 0, 2),
(18, 3, 18, 0, 3),
(19, 3, 19, 18, 0),
(20, 3, 20, 18, 1),
(21, 3, 21, 18, 2),
(22, 3, 22, 18, 3),
(23, 3, 23, 18, 4),
(24, 4, 25, 0, 0),
(25, 4, 26, 0, 1),
(26, 4, 27, 0, 2),
(27, 4, 28, 27, 0),
(28, 4, 29, 27, 1),
(29, 4, 30, 27, 2),
(30, 4, 31, 27, 3),
(31, 5, 32, 0, 0),
(32, 5, 33, 0, 1),
(33, 5, 34, 0, 2),
(34, 5, 35, 0, 3),
(35, 5, 36, 35, 0),
(36, 5, 37, 35, 1),
(37, 5, 38, 35, 2),
(38, 5, 39, 35, 3),
(39, 5, 40, 35, 4),
(40, 6, 42, 0, 0),
(41, 6, 43, 0, 1),
(42, 6, 44, 0, 2),
(43, 6, 45, 44, 0),
(44, 6, 46, 44, 1),
(45, 6, 47, 44, 2),
(46, 6, 48, 44, 3),
(47, 7, 49, 0, 0),
(48, 7, 50, 0, 1),
(49, 7, 51, 0, 2),
(50, 7, 52, 0, 3),
(51, 7, 53, 52, 0),
(52, 7, 54, 52, 1),
(53, 7, 55, 52, 2),
(54, 7, 56, 52, 3),
(55, 7, 57, 52, 4);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_settings`
--

CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(15, '', 'titleLocaleKey', 'navigation.current', 'string'),
(16, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(17, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(18, '', 'titleLocaleKey', 'navigation.about', 'string'),
(19, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(20, '', 'titleLocaleKey', 'about.submissions', 'string'),
(21, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(22, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(23, '', 'titleLocaleKey', 'about.contact', 'string'),
(24, '', 'titleLocaleKey', 'common.search', 'string'),
(25, '', 'titleLocaleKey', 'navigation.register', 'string'),
(26, '', 'titleLocaleKey', 'navigation.login', 'string'),
(27, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(28, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(29, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(30, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(31, '', 'titleLocaleKey', 'user.logOut', 'string'),
(32, '', 'titleLocaleKey', 'navigation.current', 'string'),
(33, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(34, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(35, '', 'titleLocaleKey', 'navigation.about', 'string'),
(36, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(37, '', 'titleLocaleKey', 'about.submissions', 'string'),
(38, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(39, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(40, '', 'titleLocaleKey', 'about.contact', 'string'),
(41, '', 'titleLocaleKey', 'common.search', 'string'),
(42, '', 'titleLocaleKey', 'navigation.register', 'string'),
(43, '', 'titleLocaleKey', 'navigation.login', 'string'),
(44, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(45, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(46, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(47, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(48, '', 'titleLocaleKey', 'user.logOut', 'string'),
(49, '', 'titleLocaleKey', 'navigation.current', 'string'),
(50, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(51, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(52, '', 'titleLocaleKey', 'navigation.about', 'string'),
(53, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(54, '', 'titleLocaleKey', 'about.submissions', 'string'),
(55, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(56, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(57, '', 'titleLocaleKey', 'about.contact', 'string'),
(58, '', 'titleLocaleKey', 'common.search', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(4, 1, 0, 3, 16777220, '2020-03-07 08:42:16', NULL, 1048585, 1),
(5, 1, 0, 3, 16777222, '2020-03-07 08:42:16', NULL, 1048585, 1),
(6, 1, 0, 3, 16777223, '2020-03-07 08:42:16', NULL, 1048585, 1),
(7, 1, 0, 3, 16777224, '2020-03-07 08:42:16', NULL, 1048585, 1),
(8, 1, 1, 3, 16777247, '2020-03-07 08:42:16', NULL, 1048585, 1),
(10, 1, 0, 2, 16777243, '2020-03-07 08:42:18', NULL, 1048585, 1),
(11, 1, 0, 2, 16777245, '2020-03-07 08:42:18', NULL, 1048585, 1),
(14, 3, 0, 3, 16777220, '2020-03-07 08:48:59', NULL, 1048585, 2),
(15, 3, 0, 3, 16777222, '2020-03-07 08:48:59', NULL, 1048585, 2),
(16, 3, 0, 3, 16777223, '2020-03-07 08:48:59', NULL, 1048585, 2),
(17, 3, 0, 3, 16777224, '2020-03-07 08:48:59', NULL, 1048585, 2),
(18, 3, 1, 3, 16777247, '2020-03-07 08:48:59', NULL, 1048585, 2),
(20, 3, 0, 2, 16777243, '2020-03-07 08:49:01', NULL, 1048585, 2),
(21, 3, 0, 2, 16777245, '2020-03-07 08:49:01', NULL, 1048585, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail_list`
--

CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscription_settings`
--

CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oai_resumption_tokens`
--

CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', 0, 'crontab', 'a:29:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:2;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:3;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:4;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:5;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:6;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:7;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:8;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:9;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:10;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:11;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:12;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:13;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:14;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:15;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:16;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:17;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:18;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:19;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:20;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:21;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:22;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:23;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:24;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:25;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:26;a:3:{s:9:\"className\";s:35:\"lib.pkp.classes.task.ReviewReminder\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:27;a:3:{s:9:\"className\";s:37:\"lib.pkp.classes.task.StatisticsReport\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}i:28;a:3:{s:9:\"className\";s:40:\"classes.tasks.SubscriptionExpiryReminder\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}}', 'object'),
('acronplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'baseColour', '#1E6292', 'string'),
('defaultthemeplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'showDescriptionInJournalIndex', 'true', 'string'),
('defaultthemeplugin', 1, 'typography', 'notoSans_notoSerif', 'string'),
('defaultthemeplugin', 1, 'useHomepageImageAsHeader', 'true', 'string'),
('defaultthemeplugin', 2, 'baseColour', '#D60000', 'string'),
('defaultthemeplugin', 2, 'enabled', '1', 'bool'),
('defaultthemeplugin', 2, 'showDescriptionInJournalIndex', 'true', 'string'),
('defaultthemeplugin', 2, 'typography', 'lora', 'string'),
('defaultthemeplugin', 2, 'useHomepageImageAsHeader', 'true', 'string'),
('defaultthemeplugin', 3, 'enabled', '1', 'bool'),
('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
('developedbyblockplugin', 0, 'seq', '0', 'int'),
('developedbyblockplugin', 1, 'enabled', '0', 'bool'),
('developedbyblockplugin', 1, 'seq', '0', 'int'),
('developedbyblockplugin', 2, 'enabled', '0', 'bool'),
('developedbyblockplugin', 2, 'seq', '0', 'int'),
('developedbyblockplugin', 3, 'enabled', '0', 'bool'),
('developedbyblockplugin', 3, 'seq', '0', 'int'),
('dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
('dublincoremetaplugin', 2, 'enabled', '1', 'bool'),
('dublincoremetaplugin', 3, 'enabled', '1', 'bool'),
('googlescholarplugin', 1, 'enabled', '1', 'bool'),
('googlescholarplugin', 2, 'enabled', '1', 'bool'),
('googlescholarplugin', 3, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 1, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 2, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 3, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'seq', '7', 'int'),
('informationblockplugin', 2, 'enabled', '1', 'bool'),
('informationblockplugin', 2, 'seq', '7', 'int'),
('informationblockplugin', 3, 'enabled', '1', 'bool'),
('informationblockplugin', 3, 'seq', '7', 'int'),
('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'seq', '4', 'int'),
('languagetoggleblockplugin', 2, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 2, 'seq', '4', 'int'),
('languagetoggleblockplugin', 3, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 3, 'seq', '4', 'int'),
('lensgalleyplugin', 1, 'enabled', '1', 'bool'),
('lensgalleyplugin', 2, 'enabled', '1', 'bool'),
('lensgalleyplugin', 3, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 2, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 3, 'enabled', '1', 'bool'),
('resolverplugin', 1, 'enabled', '1', 'bool'),
('resolverplugin', 2, 'enabled', '1', 'bool'),
('resolverplugin', 3, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'seq', '2', 'int'),
('subscriptionblockplugin', 2, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 2, 'seq', '2', 'int'),
('subscriptionblockplugin', 3, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 3, 'seq', '2', 'int'),
('tinymceplugin', 0, 'enabled', '1', 'bool'),
('tinymceplugin', 1, 'enabled', '1', 'bool'),
('tinymceplugin', 2, 'enabled', '1', 'bool'),
('tinymceplugin', 3, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'uniqueSiteId', '5e634ddbb7dce', 'string'),
('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/', 'string'),
('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
('usagestatsplugin', 0, 'enabled', '1', 'bool'),
('usagestatsplugin', 0, 'optionalColumns', 'a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}', 'object'),
('webfeedplugin', 1, 'displayItems', '1', 'bool'),
('webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 1, 'enabled', '1', 'bool'),
('webfeedplugin', 2, 'displayItems', '1', 'bool'),
('webfeedplugin', 2, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 2, 'enabled', '1', 'bool'),
('webfeedplugin', 3, 'displayItems', '1', 'bool'),
('webfeedplugin', 3, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 3, 'enabled', '1', 'bool');

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publications`
--

INSERT INTO `publications` (`publication_id`, `access_status`, `date_published`, `last_modified`, `locale`, `primary_contact_id`, `section_id`, `seq`, `submission_id`, `status`, `url_path`, `version`) VALUES
(1, 0, NULL, '2020-03-07 08:42:13', 'en_US', 1, 1, 0, 1, 1, NULL, 1),
(2, 0, NULL, '2020-03-07 08:48:56', 'en_US', 2, 3, 0, 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `publication_categories`
--

CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publication_galleys`
--

CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publication_galley_settings`
--

CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publication_settings`
--

CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publication_settings`
--

INSERT INTO `publication_settings` (`publication_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, '', 'categoryIds', 'a:0:{}'),
(1, 'en_US', 'abstract', '<p>dgbfdgfhk</p>'),
(1, 'en_US', 'prefix', 'dfgdfg'),
(1, 'en_US', 'subtitle', ''),
(1, 'en_US', 'title', 'fhfghfghfghfghfg'),
(2, '', 'categoryIds', 'a:0:{}'),
(2, 'en_US', 'abstract', '<p>DFGDFGDFG</p>'),
(2, 'en_US', 'prefix', 'DGSDF'),
(2, 'en_US', 'subtitle', ''),
(2, 'en_US', 'title', 'SFSFSDFSDF');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT 1,
  `seq` double NOT NULL DEFAULT 0,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `query_participants`
--

CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `queued_payments`
--

CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_assignments`
--

CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `declined` tinyint(4) NOT NULL DEFAULT 0,
  `cancelled` tinyint(4) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT 1,
  `review_method` tinyint(4) NOT NULL DEFAULT 1,
  `round` tinyint(4) NOT NULL DEFAULT 1,
  `step` tinyint(4) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_files`
--

CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_forms`
--

CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_elements`
--

CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_element_settings`
--

CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_responses`
--

CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_settings`
--

CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_rounds`
--

CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_round_files`
--

CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_tasks`
--

CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('classes.tasks.SubscriptionExpiryReminder', '2020-03-07 08:20:52'),
('lib.pkp.classes.task.ReviewReminder', '2020-03-07 08:20:52'),
('lib.pkp.classes.task.StatisticsReport', '2020-03-07 08:20:52'),
('plugins.generic.usageStats.UsageStatsLoader', '2020-03-07 08:20:52'),
('plugins.importexport.crossref.CrossrefInfoSender', '2020-03-07 08:20:52'),
('plugins.importexport.datacite.DataciteInfoSender', '2020-03-07 08:20:52'),
('plugins.importexport.doaj.DOAJInfoSender', '2020-03-07 08:20:52'),
('plugins.importexport.medra.MedraInfoSender', '2020-03-07 08:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `editor_restricted` tinyint(4) NOT NULL DEFAULT 0,
  `meta_indexed` tinyint(4) NOT NULL DEFAULT 0,
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT 1,
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT 0,
  `hide_title` tinyint(4) NOT NULL DEFAULT 0,
  `hide_author` tinyint(4) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `abstract_word_count`) VALUES
(1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 1, 1, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `section_editors`
--

CREATE TABLE `section_editors` (
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `section_settings`
--

CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section_settings`
--

INSERT INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'abbrev', 'ART', 'string'),
(1, 'en_US', 'policy', 'Section default policy', 'string'),
(1, 'en_US', 'title', 'Articles', 'string'),
(2, 'en_US', 'abbrev', 'ART', 'string'),
(2, 'en_US', 'policy', 'Section default policy', 'string'),
(2, 'en_US', 'title', 'Articles', 'string'),
(3, 'en_US', 'abbrev', 'ART', 'string'),
(3, 'en_US', 'policy', 'Section default policy', 'string'),
(3, 'en_US', 'title', 'Articles', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` tinyint(4) NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('77ijieh22djuvdmkmle2s02ma6', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 1583566057, 1583567547, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1583567545;s:5:\"token\";s:32:\"525dc5441ce596d93f3d6779e487e286\";}username|s:5:\"admin\";userId|s:1:\"1\";', 'localhost'),
('ufdqd3due0onp0jj1e6vrjl7rf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', 1583566183, 1583566393, 0, 'csrf|a:2:{s:9:\"timestamp\";i:1583566393;s:5:\"token\";s:32:\"32e438a58baa2ac1440236f1a55e57a8\";}username|s:7:\"duongpl\";userId|s:1:\"2\";', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0,
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT 6,
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'en_US', 6, 'a:1:{i:0;s:5:\"en_US\";}', 'a:1:{i:0;s:5:\"en_US\";}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`) VALUES
('contactEmail', 'en_US', 'quoctuanck99@outlook.com'),
('contactName', 'en_US', 'Open Journal Systems'),
('themePluginPath', '', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `stage_assignments`
--

CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` tinyint(4) NOT NULL DEFAULT 0,
  `can_change_metadata` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stage_assignments`
--

INSERT INTO `stage_assignments` (`stage_assignment_id`, `submission_id`, `user_group_id`, `user_id`, `date_assigned`, `recommend_only`, `can_change_metadata`) VALUES
(1, 1, 14, 2, '2020-03-07 08:41:34', 0, 0),
(2, 2, 48, 3, '2020-03-07 08:48:16', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `static_page_settings`
--

CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `submission_progress` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`submission_id`, `locale`, `context_id`, `section_id`, `current_publication_id`, `date_last_activity`, `date_submitted`, `last_modified`, `stage_id`, `status`, `submission_progress`) VALUES
(1, NULL, 1, NULL, 1, '2020-03-07 08:42:18', '2020-03-07 08:42:16', '2020-03-07 08:42:16', 1, 1, 0),
(2, NULL, 3, NULL, 2, '2020-03-07 08:49:01', '2020-03-07 08:48:59', '2020-03-07 08:48:59', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `submission_artwork_files`
--

CREATE TABLE `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text DEFAULT NULL,
  `permission_terms` text DEFAULT NULL,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_comments`
--

CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_files`
--

CREATE TABLE `submission_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `submission_files`
--

INSERT INTO `submission_files` (`file_id`, `revision`, `source_file_id`, `source_revision`, `submission_id`, `file_type`, `genre_id`, `file_size`, `original_file_name`, `file_stage`, `direct_sales_price`, `sales_type`, `viewable`, `date_uploaded`, `date_modified`, `uploader_user_id`, `assoc_type`, `assoc_id`) VALUES
(1, 1, NULL, NULL, 1, 'image/png', 1, 1669603, 'coverback.png', 2, NULL, NULL, 1, '2020-03-07 08:41:43', '2020-03-07 08:41:43', 2, NULL, NULL),
(2, 1, NULL, NULL, 2, 'image/png', 25, 1669603, 'coverback.png', 2, NULL, NULL, 1, '2020-03-07 08:48:26', '2020-03-07 08:48:26', 3, NULL, NULL),
(2, 2, NULL, NULL, 2, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 25, 77342, 'cplexAndGa.docx', 2, NULL, NULL, 1, '2020-03-07 08:48:42', '2020-03-07 08:48:42', 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `submission_file_settings`
--

CREATE TABLE `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `submission_file_settings`
--

INSERT INTO `submission_file_settings` (`file_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'duongpl, coverback.png', 'string'),
(2, 'en_US', 'name', 'tuankq, cplexAndGa.docx', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_keyword_list`
--

CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_objects`
--

CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_object_keywords`
--

CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_settings`
--

CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_supplementary_files`
--

CREATE TABLE `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission_tombstones`
--

CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT 0,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT 0,
  `membership` tinyint(4) NOT NULL DEFAULT 0,
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_type_settings`
--

CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_files`
--

CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usage_stats_temporary_records`
--

CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `gossip`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'admin', '$2y$10$N.fsYsYsewy4RlLngm.OLO0tXphZ3we8cgyw.726bns4Rck1MOTf.', 'quoctuanck99@outlook.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2020-03-07 08:20:45', NULL, '2020-03-07 08:50:23', 0, NULL, NULL, 0, NULL, 1),
(2, 'duongpl', '$2y$10$GpN/ISaNWpDikhm5eaPwp.b0JQP00LtY93G8NLgnizydPaOktPzV6', 'duongpl@fpt.edu.vn', NULL, NULL, NULL, NULL, 'VN', '', NULL, NULL, '2020-03-07 08:32:59', NULL, '2020-03-07 08:43:16', 0, NULL, NULL, 0, NULL, 1),
(3, 'tuankq', '$2y$10$mymlRYfTnWLyPmPCozT93udbgVtz67h4HotfNRT4C0YL6olflCR1m', 'tuankqrd@gjdfg.com', NULL, NULL, NULL, NULL, 'VN', '', NULL, NULL, '2020-03-07 08:47:48', NULL, '2020-03-07 08:47:48', 0, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `show_title` tinyint(4) NOT NULL DEFAULT 1,
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT 0,
  `permit_metadata_edit` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`, `permit_metadata_edit`) VALUES
(1, 0, 1, 1, 0, 0, 0),
(2, 1, 16, 1, 0, 0, 1),
(3, 1, 16, 1, 0, 0, 1),
(4, 1, 16, 1, 0, 0, 1),
(5, 1, 17, 1, 0, 0, 1),
(6, 1, 17, 1, 0, 0, 0),
(7, 1, 4097, 1, 0, 0, 0),
(8, 1, 4097, 1, 0, 0, 0),
(9, 1, 4097, 1, 0, 0, 0),
(10, 1, 4097, 1, 0, 0, 0),
(11, 1, 4097, 1, 0, 0, 0),
(12, 1, 4097, 1, 0, 0, 0),
(13, 1, 4097, 1, 0, 0, 0),
(14, 1, 65536, 1, 0, 1, 0),
(15, 1, 65536, 1, 0, 0, 0),
(16, 1, 4096, 1, 0, 1, 0),
(17, 1, 1048576, 1, 0, 1, 0),
(18, 1, 2097152, 1, 0, 0, 0),
(19, 2, 16, 1, 0, 0, 1),
(20, 2, 16, 1, 0, 0, 1),
(21, 2, 16, 1, 0, 0, 1),
(22, 2, 17, 1, 0, 0, 1),
(23, 2, 17, 1, 0, 0, 0),
(24, 2, 4097, 1, 0, 0, 0),
(25, 2, 4097, 1, 0, 0, 0),
(26, 2, 4097, 1, 0, 0, 0),
(27, 2, 4097, 1, 0, 0, 0),
(28, 2, 4097, 1, 0, 0, 0),
(29, 2, 4097, 1, 0, 0, 0),
(30, 2, 4097, 1, 0, 0, 0),
(31, 2, 65536, 1, 0, 1, 0),
(32, 2, 65536, 1, 0, 0, 0),
(33, 2, 4096, 1, 0, 1, 0),
(34, 2, 1048576, 1, 0, 1, 0),
(35, 2, 2097152, 1, 0, 0, 0),
(36, 3, 16, 1, 0, 0, 1),
(37, 3, 16, 1, 0, 0, 1),
(38, 3, 16, 1, 0, 0, 1),
(39, 3, 17, 1, 0, 0, 1),
(40, 3, 17, 1, 0, 0, 0),
(41, 3, 4097, 1, 0, 0, 0),
(42, 3, 4097, 1, 0, 0, 0),
(43, 3, 4097, 1, 0, 0, 0),
(44, 3, 4097, 1, 0, 0, 0),
(45, 3, 4097, 1, 0, 0, 0),
(46, 3, 4097, 1, 0, 0, 0),
(47, 3, 4097, 1, 0, 0, 0),
(48, 3, 65536, 1, 0, 1, 0),
(49, 3, 65536, 1, 0, 0, 0),
(50, 3, 4096, 1, 0, 1, 0),
(51, 3, 1048576, 1, 0, 1, 0),
(52, 3, 2097152, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_settings`
--

CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Site Admin', 'string'),
(2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(2, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(2, 'en_US', 'abbrev', 'JM', 'string'),
(2, 'en_US', 'name', 'Journal manager', 'string'),
(3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(3, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(3, 'en_US', 'abbrev', 'JE', 'string'),
(3, 'en_US', 'name', 'Journal editor', 'string'),
(4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(4, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(4, 'en_US', 'abbrev', 'ProdE', 'string'),
(4, 'en_US', 'name', 'Production editor', 'string'),
(5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(5, 'en_US', 'abbrev', 'SecE', 'string'),
(5, 'en_US', 'name', 'Section editor', 'string'),
(6, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(6, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(6, 'en_US', 'abbrev', 'GE', 'string'),
(6, 'en_US', 'name', 'Guest editor', 'string'),
(7, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(7, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(7, 'en_US', 'abbrev', 'CE', 'string'),
(7, 'en_US', 'name', 'Copyeditor', 'string'),
(8, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(8, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(8, 'en_US', 'abbrev', 'Design', 'string'),
(8, 'en_US', 'name', 'Designer', 'string'),
(9, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(9, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(9, 'en_US', 'abbrev', 'FC', 'string'),
(9, 'en_US', 'name', 'Funding coordinator', 'string'),
(10, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(10, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(10, 'en_US', 'abbrev', 'IND', 'string'),
(10, 'en_US', 'name', 'Indexer', 'string'),
(11, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(11, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(11, 'en_US', 'abbrev', 'LE', 'string'),
(11, 'en_US', 'name', 'Layout Editor', 'string'),
(12, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(12, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(12, 'en_US', 'abbrev', 'MS', 'string'),
(12, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(13, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(13, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(13, 'en_US', 'abbrev', 'PR', 'string'),
(13, 'en_US', 'name', 'Proofreader', 'string'),
(14, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(14, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(14, 'en_US', 'abbrev', 'AU', 'string'),
(14, 'en_US', 'name', 'Author', 'string'),
(15, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(15, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(15, 'en_US', 'abbrev', 'Trans', 'string'),
(15, 'en_US', 'name', 'Translator', 'string'),
(16, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(16, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(16, 'en_US', 'abbrev', 'R', 'string'),
(16, 'en_US', 'name', 'Reviewer', 'string'),
(17, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(17, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(17, 'en_US', 'abbrev', 'Read', 'string'),
(17, 'en_US', 'name', 'Reader', 'string'),
(18, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(18, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(18, 'en_US', 'abbrev', 'SubM', 'string'),
(18, 'en_US', 'name', 'Subscription Manager', 'string'),
(19, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(19, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(19, 'en_US', 'abbrev', 'JM', 'string'),
(19, 'en_US', 'name', 'Journal manager', 'string'),
(20, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(20, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(20, 'en_US', 'abbrev', 'JE', 'string'),
(20, 'en_US', 'name', 'Journal editor', 'string'),
(21, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(21, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(21, 'en_US', 'abbrev', 'ProdE', 'string'),
(21, 'en_US', 'name', 'Production editor', 'string'),
(22, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(22, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(22, 'en_US', 'abbrev', 'SecE', 'string'),
(22, 'en_US', 'name', 'Section editor', 'string'),
(23, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(23, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(23, 'en_US', 'abbrev', 'GE', 'string'),
(23, 'en_US', 'name', 'Guest editor', 'string'),
(24, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(24, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(24, 'en_US', 'abbrev', 'CE', 'string'),
(24, 'en_US', 'name', 'Copyeditor', 'string'),
(25, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(25, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(25, 'en_US', 'abbrev', 'Design', 'string'),
(25, 'en_US', 'name', 'Designer', 'string'),
(26, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(26, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(26, 'en_US', 'abbrev', 'FC', 'string'),
(26, 'en_US', 'name', 'Funding coordinator', 'string'),
(27, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(27, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(27, 'en_US', 'abbrev', 'IND', 'string'),
(27, 'en_US', 'name', 'Indexer', 'string'),
(28, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(28, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(28, 'en_US', 'abbrev', 'LE', 'string'),
(28, 'en_US', 'name', 'Layout Editor', 'string'),
(29, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(29, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(29, 'en_US', 'abbrev', 'MS', 'string'),
(29, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(30, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(30, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(30, 'en_US', 'abbrev', 'PR', 'string'),
(30, 'en_US', 'name', 'Proofreader', 'string'),
(31, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(31, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(31, 'en_US', 'abbrev', 'AU', 'string'),
(31, 'en_US', 'name', 'Author', 'string'),
(32, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(32, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(32, 'en_US', 'abbrev', 'Trans', 'string'),
(32, 'en_US', 'name', 'Translator', 'string'),
(33, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(33, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(33, 'en_US', 'abbrev', 'R', 'string'),
(33, 'en_US', 'name', 'Reviewer', 'string'),
(34, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(34, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(34, 'en_US', 'abbrev', 'Read', 'string'),
(34, 'en_US', 'name', 'Reader', 'string'),
(35, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(35, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(35, 'en_US', 'abbrev', 'SubM', 'string'),
(35, 'en_US', 'name', 'Subscription Manager', 'string'),
(36, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(36, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(36, 'en_US', 'abbrev', 'JM', 'string'),
(36, 'en_US', 'name', 'Journal manager', 'string'),
(37, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(37, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(37, 'en_US', 'abbrev', 'JE', 'string'),
(37, 'en_US', 'name', 'Journal editor', 'string'),
(38, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(38, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(38, 'en_US', 'abbrev', 'ProdE', 'string'),
(38, 'en_US', 'name', 'Production editor', 'string'),
(39, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(39, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(39, 'en_US', 'abbrev', 'SecE', 'string'),
(39, 'en_US', 'name', 'Section editor', 'string'),
(40, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(40, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(40, 'en_US', 'abbrev', 'GE', 'string'),
(40, 'en_US', 'name', 'Guest editor', 'string'),
(41, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(41, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(41, 'en_US', 'abbrev', 'CE', 'string'),
(41, 'en_US', 'name', 'Copyeditor', 'string'),
(42, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(42, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(42, 'en_US', 'abbrev', 'Design', 'string'),
(42, 'en_US', 'name', 'Designer', 'string'),
(43, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(43, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(43, 'en_US', 'abbrev', 'FC', 'string'),
(43, 'en_US', 'name', 'Funding coordinator', 'string'),
(44, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(44, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(44, 'en_US', 'abbrev', 'IND', 'string'),
(44, 'en_US', 'name', 'Indexer', 'string'),
(45, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(45, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(45, 'en_US', 'abbrev', 'LE', 'string'),
(45, 'en_US', 'name', 'Layout Editor', 'string'),
(46, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(46, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(46, 'en_US', 'abbrev', 'MS', 'string'),
(46, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(47, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(47, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(47, 'en_US', 'abbrev', 'PR', 'string'),
(47, 'en_US', 'name', 'Proofreader', 'string'),
(48, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(48, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(48, 'en_US', 'abbrev', 'AU', 'string'),
(48, 'en_US', 'name', 'Author', 'string'),
(49, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(49, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(49, 'en_US', 'abbrev', 'Trans', 'string'),
(49, 'en_US', 'name', 'Translator', 'string'),
(50, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(50, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(50, 'en_US', 'abbrev', 'R', 'string'),
(50, 'en_US', 'name', 'Reviewer', 'string'),
(51, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(51, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(51, 'en_US', 'abbrev', 'Read', 'string'),
(51, 'en_US', 'name', 'Reader', 'string'),
(52, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(52, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(52, 'en_US', 'abbrev', 'SubM', 'string'),
(52, 'en_US', 'name', 'Subscription Manager', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_stage`
--

CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_group_stage`
--

INSERT INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
(1, 3, 1),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 4, 4),
(1, 4, 5),
(1, 5, 1),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 6, 1),
(1, 6, 3),
(1, 6, 4),
(1, 6, 5),
(1, 7, 4),
(1, 8, 5),
(1, 9, 1),
(1, 9, 3),
(1, 10, 5),
(1, 11, 5),
(1, 12, 4),
(1, 13, 5),
(1, 14, 1),
(1, 14, 3),
(1, 14, 4),
(1, 14, 5),
(1, 15, 1),
(1, 15, 3),
(1, 15, 4),
(1, 15, 5),
(1, 16, 3),
(2, 20, 1),
(2, 20, 3),
(2, 20, 4),
(2, 20, 5),
(2, 21, 4),
(2, 21, 5),
(2, 22, 1),
(2, 22, 3),
(2, 22, 4),
(2, 22, 5),
(2, 23, 1),
(2, 23, 3),
(2, 23, 4),
(2, 23, 5),
(2, 24, 4),
(2, 25, 5),
(2, 26, 1),
(2, 26, 3),
(2, 27, 5),
(2, 28, 5),
(2, 29, 4),
(2, 30, 5),
(2, 31, 1),
(2, 31, 3),
(2, 31, 4),
(2, 31, 5),
(2, 32, 1),
(2, 32, 3),
(2, 32, 4),
(2, 32, 5),
(2, 33, 3),
(3, 37, 1),
(3, 37, 3),
(3, 37, 4),
(3, 37, 5),
(3, 38, 4),
(3, 38, 5),
(3, 39, 1),
(3, 39, 3),
(3, 39, 4),
(3, 39, 5),
(3, 40, 1),
(3, 40, 3),
(3, 40, 4),
(3, 40, 5),
(3, 41, 4),
(3, 42, 5),
(3, 43, 1),
(3, 43, 3),
(3, 44, 5),
(3, 45, 5),
(3, 46, 4),
(3, 47, 5),
(3, 48, 1),
(3, 48, 3),
(3, 48, 4),
(3, 48, 5),
(3, 49, 1),
(3, 49, 3),
(3, 49, 4),
(3, 49, 5),
(3, 50, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`user_id`, `controlled_vocab_entry_id`) VALUES
(3, 42);

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT 0,
  `assoc_id` bigint(20) DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`user_id`, `locale`, `setting_name`, `assoc_type`, `assoc_id`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'givenName', 0, 0, 'admin', 'string'),
(1, 'en_US', 'familyName', 0, 0, 'admin', 'string'),
(2, 'en_US', 'affiliation', 0, 0, 'dfdfdfdf', 'string'),
(2, 'en_US', 'givenName', 0, 0, 'quoctuanck99', 'string'),
(2, 'en_US', 'familyName', 0, 0, 'eetgtrtrytry', 'string'),
(3, 'en_US', 'affiliation', 0, 0, 'dsfdsfg', 'string'),
(3, 'en_US', 'givenName', 0, 0, 'tuankq', 'string'),
(3, 'en_US', 'familyName', 0, 0, '123546', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_groups`
--

CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(14, 2),
(16, 2),
(17, 2),
(19, 1),
(33, 3),
(34, 3),
(36, 1),
(48, 3),
(50, 3),
(51, 3);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0,
  `minor` int(11) NOT NULL DEFAULT 0,
  `revision` int(11) NOT NULL DEFAULT 0,
  `build` int(11) NOT NULL DEFAULT 0,
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT 0,
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT 0,
  `sitewide` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.metadata', 'mods34', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.metadata', 'openurl10', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.blocks', 'browse', 'BrowseBlockPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(1, 1, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(1, 2, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(1, 1, 2, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'usageStats', 'UsageStatsPlugin', 0, 1),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 2, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'recommendBySimilarity', 'RecommendBySimilarityPlugin', 1, 1),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
(1, 0, 1, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'announcementFeed', 'AnnouncementFeedPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(1, 2, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(0, 1, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(2, 1, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'crossref', '', 0, 0),
(2, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'datacite', '', 0, 0),
(1, 1, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(2, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'medra', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.importexport', 'users', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.reports', 'articles', '', 0, 0),
(1, 1, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(2, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.reports', 'subscriptions', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.reports', 'views', '', 0, 0),
(1, 0, 0, 0, '2020-03-07 08:20:45', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(3, 2, 0, 0, '2020-03-07 08:20:35', 1, 'core', 'ojs2', '', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`),
  ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- Indexes for table `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `authors_publication_id` (`publication_id`);

--
-- Indexes for table `author_settings`
--
ALTER TABLE `author_settings`
  ADD UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  ADD KEY `author_settings_author_id` (`author_id`);

--
-- Indexes for table `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_path` (`context_id`,`path`),
  ADD KEY `category_context_id` (`context_id`,`parent_id`);

--
-- Indexes for table `category_settings`
--
ALTER TABLE `category_settings`
  ADD UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`);

--
-- Indexes for table `citations`
--
ALTER TABLE `citations`
  ADD PRIMARY KEY (`citation_id`),
  ADD UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  ADD KEY `citations_publication` (`publication_id`);

--
-- Indexes for table `citation_settings`
--
ALTER TABLE `citation_settings`
  ADD UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  ADD KEY `citation_settings_citation_id` (`citation_id`);

--
-- Indexes for table `completed_payments`
--
ALTER TABLE `completed_payments`
  ADD PRIMARY KEY (`completed_payment_id`);

--
-- Indexes for table `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`),
  ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- Indexes for table `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`),
  ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- Indexes for table `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- Indexes for table `custom_issue_orders`
--
ALTER TABLE `custom_issue_orders`
  ADD UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`);

--
-- Indexes for table `custom_section_orders`
--
ALTER TABLE `custom_section_orders`
  ADD UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`);

--
-- Indexes for table `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `data_object_tombstones_data_object_id` (`data_object_id`);

--
-- Indexes for table `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`);

--
-- Indexes for table `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  ADD UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  ADD KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`);

--
-- Indexes for table `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`),
  ADD KEY `edit_decisions_submission_id` (`submission_id`),
  ADD KEY `edit_decisions_editor_id` (`editor_id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `email_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `email_log_users`
--
ALTER TABLE `email_log_users`
  ADD UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`);

--
-- Indexes for table `email_templates_default`
--
ALTER TABLE `email_templates_default`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_templates_default_email_key` (`email_key`);

--
-- Indexes for table `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`);

--
-- Indexes for table `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  ADD UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  ADD KEY `email_settings_email_id` (`email_id`);

--
-- Indexes for table `event_log`
--
ALTER TABLE `event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `event_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `event_log_settings`
--
ALTER TABLE `event_log_settings`
  ADD UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  ADD KEY `event_log_settings_log_id` (`log_id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `filter_groups`
--
ALTER TABLE `filter_groups`
  ADD PRIMARY KEY (`filter_group_id`),
  ADD UNIQUE KEY `filter_groups_symbolic` (`symbolic`);

--
-- Indexes for table `filter_settings`
--
ALTER TABLE `filter_settings`
  ADD UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  ADD KEY `filter_settings_id` (`filter_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `genre_settings`
--
ALTER TABLE `genre_settings`
  ADD UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  ADD KEY `genre_settings_genre_id` (`genre_id`);

--
-- Indexes for table `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  ADD PRIMARY KEY (`institutional_subscription_id`),
  ADD KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscriptions_domain` (`domain`);

--
-- Indexes for table `institutional_subscription_ip`
--
ALTER TABLE `institutional_subscription_ip`
  ADD PRIMARY KEY (`institutional_subscription_ip_id`),
  ADD KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscription_ip_start` (`ip_start`),
  ADD KEY `institutional_subscription_ip_end` (`ip_end`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `issues_journal_id` (`journal_id`),
  ADD KEY `issues_url_path` (`url_path`);

--
-- Indexes for table `issue_files`
--
ALTER TABLE `issue_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `issue_files_issue_id` (`issue_id`);

--
-- Indexes for table `issue_galleys`
--
ALTER TABLE `issue_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `issue_galleys_issue_id` (`issue_id`),
  ADD KEY `issue_galleys_url_path` (`url_path`);

--
-- Indexes for table `issue_galley_settings`
--
ALTER TABLE `issue_galley_settings`
  ADD UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `issue_galley_settings_galley_id` (`galley_id`);

--
-- Indexes for table `issue_settings`
--
ALTER TABLE `issue_settings`
  ADD UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  ADD KEY `issue_settings_issue_id` (`issue_id`),
  ADD KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `item_views`
--
ALTER TABLE `item_views`
  ADD UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`journal_id`),
  ADD UNIQUE KEY `journals_path` (`path`);

--
-- Indexes for table `journal_settings`
--
ALTER TABLE `journal_settings`
  ADD UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  ADD KEY `journal_settings_journal_id` (`journal_id`);

--
-- Indexes for table `library_files`
--
ALTER TABLE `library_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `library_files_submission_id` (`submission_id`);

--
-- Indexes for table `library_file_settings`
--
ALTER TABLE `library_file_settings`
  ADD UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  ADD KEY `library_file_settings_id` (`file_id`);

--
-- Indexes for table `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  ADD PRIMARY KEY (`metadata_description_id`),
  ADD KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `metadata_description_settings`
--
ALTER TABLE `metadata_description_settings`
  ADD UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  ADD KEY `metadata_description_settings_id` (`metadata_description_id`);

--
-- Indexes for table `metrics`
--
ALTER TABLE `metrics`
  ADD KEY `metrics_load_id` (`load_id`),
  ADD KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  ADD KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  ADD KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`);

--
-- Indexes for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`navigation_menu_id`);

--
-- Indexes for table `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  ADD PRIMARY KEY (`navigation_menu_item_id`);

--
-- Indexes for table `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  ADD PRIMARY KEY (`navigation_menu_item_assignment_id`);

--
-- Indexes for table `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  ADD UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  ADD KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`);

--
-- Indexes for table `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  ADD UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  ADD KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `notes_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  ADD KEY `notifications_context_id` (`context_id`,`level`),
  ADD KEY `notifications_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  ADD PRIMARY KEY (`notification_mail_list_id`),
  ADD UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`);

--
-- Indexes for table `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  ADD UNIQUE KEY `oai_resumption_tokens_pkey` (`token`);

--
-- Indexes for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `publications_submission_id` (`submission_id`),
  ADD KEY `publications_section_id` (`section_id`),
  ADD KEY `publications_url_path` (`url_path`);

--
-- Indexes for table `publication_categories`
--
ALTER TABLE `publication_categories`
  ADD UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`);

--
-- Indexes for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `publication_galleys_publication_id` (`publication_id`),
  ADD KEY `publication_galleys_url_path` (`url_path`);

--
-- Indexes for table `publication_galley_settings`
--
ALTER TABLE `publication_galley_settings`
  ADD UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `publication_galley_settings_galley_id` (`galley_id`),
  ADD KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `publication_settings`
--
ALTER TABLE `publication_settings`
  ADD UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  ADD KEY `publication_settings_publication_id` (`publication_id`),
  ADD KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `queries_assoc_id` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `query_participants`
--
ALTER TABLE `query_participants`
  ADD UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`);

--
-- Indexes for table `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- Indexes for table `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_assignments_submission_id` (`submission_id`),
  ADD KEY `review_assignments_reviewer_id` (`reviewer_id`),
  ADD KEY `review_assignments_form_id` (`review_form_id`),
  ADD KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`);

--
-- Indexes for table `review_files`
--
ALTER TABLE `review_files`
  ADD UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  ADD KEY `review_files_review_id` (`review_id`);

--
-- Indexes for table `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- Indexes for table `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`),
  ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- Indexes for table `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- Indexes for table `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`);

--
-- Indexes for table `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- Indexes for table `review_rounds`
--
ALTER TABLE `review_rounds`
  ADD PRIMARY KEY (`review_round_id`),
  ADD UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  ADD KEY `review_rounds_submission_id` (`submission_id`);

--
-- Indexes for table `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  ADD KEY `review_round_files_submission_id` (`submission_id`);

--
-- Indexes for table `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD UNIQUE KEY `scheduled_tasks_pkey` (`class_name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `sections_journal_id` (`journal_id`);

--
-- Indexes for table `section_editors`
--
ALTER TABLE `section_editors`
  ADD UNIQUE KEY `section_editors_pkey` (`context_id`,`section_id`,`user_id`),
  ADD KEY `section_editors_context_id` (`context_id`),
  ADD KEY `section_editors_section_id` (`section_id`),
  ADD KEY `section_editors_user_id` (`user_id`);

--
-- Indexes for table `section_settings`
--
ALTER TABLE `section_settings`
  ADD UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  ADD KEY `section_settings_section_id` (`section_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`),
  ADD KEY `sessions_user_id` (`user_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`);

--
-- Indexes for table `stage_assignments`
--
ALTER TABLE `stage_assignments`
  ADD PRIMARY KEY (`stage_assignment_id`),
  ADD UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  ADD KEY `stage_assignments_submission_id` (`submission_id`),
  ADD KEY `stage_assignments_user_group_id` (`user_group_id`),
  ADD KEY `stage_assignments_user_id` (`user_id`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`);

--
-- Indexes for table `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `submissions_context_id` (`context_id`);

--
-- Indexes for table `submission_artwork_files`
--
ALTER TABLE `submission_artwork_files`
  ADD PRIMARY KEY (`file_id`,`revision`);

--
-- Indexes for table `submission_comments`
--
ALTER TABLE `submission_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `submission_comments_submission_id` (`submission_id`);

--
-- Indexes for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD PRIMARY KEY (`file_id`,`revision`),
  ADD KEY `submission_files_submission_id` (`submission_id`);

--
-- Indexes for table `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  ADD UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  ADD KEY `submission_file_settings_id` (`file_id`);

--
-- Indexes for table `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `submission_search_keyword_text` (`keyword_text`);

--
-- Indexes for table `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  ADD PRIMARY KEY (`object_id`);

--
-- Indexes for table `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  ADD UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  ADD KEY `submission_search_object_keywords_keyword_id` (`keyword_id`);

--
-- Indexes for table `submission_settings`
--
ALTER TABLE `submission_settings`
  ADD UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  ADD KEY `submission_settings_submission_id` (`submission_id`);

--
-- Indexes for table `submission_supplementary_files`
--
ALTER TABLE `submission_supplementary_files`
  ADD PRIMARY KEY (`file_id`,`revision`);

--
-- Indexes for table `submission_tombstones`
--
ALTER TABLE `submission_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `submission_tombstones_journal_id` (`journal_id`),
  ADD KEY `submission_tombstones_submission_id` (`submission_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `subscription_type_settings`
--
ALTER TABLE `subscription_type_settings`
  ADD UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `subscription_type_settings_type_id` (`type_id`);

--
-- Indexes for table `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `temporary_files_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username` (`username`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_groups_context_id` (`context_id`),
  ADD KEY `user_groups_role_id` (`role_id`);

--
-- Indexes for table `user_group_settings`
--
ALTER TABLE `user_group_settings`
  ADD UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`);

--
-- Indexes for table `user_group_stage`
--
ALTER TABLE `user_group_stage`
  ADD UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  ADD KEY `user_group_stage_context_id` (`context_id`),
  ADD KEY `user_group_stage_user_group_id` (`user_group_id`),
  ADD KEY `user_group_stage_stage_id` (`stage_id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  ADD KEY `user_settings_user_id` (`user_id`);

--
-- Indexes for table `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  ADD KEY `user_user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_user_groups_user_id` (`user_id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_keys`
--
ALTER TABLE `access_keys`
  MODIFY `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_types`
--
ALTER TABLE `announcement_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `auth_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `citations`
--
ALTER TABLE `citations`
  MODIFY `citation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `completed_payments`
--
ALTER TABLE `completed_payments`
  MODIFY `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  MODIFY `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=809;

--
-- AUTO_INCREMENT for table `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  MODIFY `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edit_decisions`
--
ALTER TABLE `edit_decisions`
  MODIFY `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates_default`
--
ALTER TABLE `email_templates_default`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `event_log`
--
ALTER TABLE `event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `filter_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `filter_groups`
--
ALTER TABLE `filter_groups`
  MODIFY `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  MODIFY `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutional_subscription_ip`
--
ALTER TABLE `institutional_subscription_ip`
  MODIFY `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `issue_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_files`
--
ALTER TABLE `issue_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_galleys`
--
ALTER TABLE `issue_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `journal_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `library_files`
--
ALTER TABLE `library_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  MODIFY `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  MODIFY `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  MODIFY `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  MODIFY `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `query_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queued_payments`
--
ALTER TABLE `queued_payments`
  MODIFY `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_assignments`
--
ALTER TABLE `review_assignments`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_forms`
--
ALTER TABLE `review_forms`
  MODIFY `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_form_elements`
--
ALTER TABLE `review_form_elements`
  MODIFY `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_rounds`
--
ALTER TABLE `review_rounds`
  MODIFY `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stage_assignments`
--
ALTER TABLE `stage_assignments`
  MODIFY `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submission_comments`
--
ALTER TABLE `submission_comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_files`
--
ALTER TABLE `submission_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_tombstones`
--
ALTER TABLE `submission_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
