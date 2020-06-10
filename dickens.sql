-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2020 at 10:31 AM
-- Server version: 8.0.20
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dickens`
--

-- --------------------------------------------------------

--
-- Table structure for table `ages`
--

CREATE TABLE `ages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ages`
--

INSERT INTO `ages` (`id`, `title`) VALUES
(1, 'Children'),
(2, 'Adolescent'),
(3, 'Adults');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `municipality_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `address`, `created_at`, `updated_at`, `municipality_id`) VALUES
(1, 'Melpomeni', '2020-06-02 05:54:21', '2020-06-02 05:54:21', 1),
(2, 'Sophocles', '2020-06-02 05:54:21', '2020-06-02 05:54:21', 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_type_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `active`, `created_at`, `updated_at`, `course_type_id`) VALUES
(1, 'Zertifikat I', 1, '2020-06-06 04:52:23', '2020-06-06 04:52:23', 2),
(2, 'Μαθηματικά Γ Θετικης', 1, '2020-06-06 05:14:03', '2020-06-06 05:14:03', 1),
(3, 'Lower', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(4, 'Proficiency', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(5, 'Delf I', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(6, 'Delf II', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(7, 'Dalf I', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(8, 'Dalf II', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(9, 'Mittelstuffe', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(10, 'Groses Deutsches Srpachdiplom', 1, '2020-06-07 05:18:08', '2020-06-07 05:18:08', 2),
(11, 'Sorbonne', 1, '2020-06-07 05:19:38', '2020-06-07 05:19:38', 2),
(12, 'Λατινικά Β Λυκειου', 1, '2020-06-07 14:27:40', '2020-06-07 14:27:40', 1),
(13, 'Hey do', 1, '2020-06-07 15:02:12', '2020-06-07 15:02:12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses_fees_history`
--

CREATE TABLE `courses_fees_history` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses_wages_history`
--

CREATE TABLE `courses_wages_history` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_fees`
--

CREATE TABLE `course_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_fees`
--

INSERT INTO `course_fees` (`id`, `amount`, `created_at`, `updated_at`, `course_id`) VALUES
(1, '15.00', '2020-06-05 17:42:27', '2020-06-05 17:42:27', 1),
(2, '22.00', '2020-06-07 15:05:00', '2020-06-07 15:05:00', 13);

-- --------------------------------------------------------

--
-- Table structure for table `course_type`
--

CREATE TABLE `course_type` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_type`
--

INSERT INTO `course_type` (`id`, `title`) VALUES
(1, 'Λύκειο'),
(2, 'Ξένη Γλώσσα');

-- --------------------------------------------------------

--
-- Table structure for table `course_wages`
--

CREATE TABLE `course_wages` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_wages`
--

INSERT INTO `course_wages` (`id`, `amount`, `created_at`, `updated_at`, `course_id`) VALUES
(1, '5.20', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 1),
(2, '7.20', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 13);

-- --------------------------------------------------------

--
-- Table structure for table `diplomas`
--

CREATE TABLE `diplomas` (
  `id` bigint UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `institut_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diplomas`
--

INSERT INTO `diplomas` (`id`, `active`, `created_at`, `updated_at`, `level`, `language_id`, `course_id`, `institut_id`) VALUES
(1, 1, '2020-06-01 14:22:22', '2020-06-01 14:22:22', '', 1, 1, 1),
(2, 1, '2020-06-02 14:27:40', '2020-06-02 14:27:40', '', 2, 1, 1),
(3, 1, '2020-05-28 14:48:19', '2020-06-01 15:05:26', 'C2', 1, 1, 1),
(4, 1, '2020-06-07 05:19:54', '2020-06-07 05:19:54', 'C1', 4, 5, 5),
(5, 1, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 'B1', 7, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `diploma_grades`
--

CREATE TABLE `diploma_grades` (
  `id` bigint UNSIGNED NOT NULL,
  `grade_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diploma_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diploma_grades`
--

INSERT INTO `diploma_grades` (`id`, `grade_title`, `diploma_id`) VALUES
(1, 'Sehr Gut', 2),
(2, 'Gut', 2);

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disciplines`
--

INSERT INTO `disciplines` (`id`, `name`) VALUES
(1, 'Γενική'),
(2, 'Θεωρητική'),
(3, 'Θετική'),
(4, 'Τεχνολογική');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `discount_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_model`
--

CREATE TABLE `discount_model` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grading_sys`
--

CREATE TABLE `grading_sys` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grading_sys`
--

INSERT INTO `grading_sys` (`id`, `title`) VALUES
(1, 'Numeric'),
(2, 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `groupakia`
--

CREATE TABLE `groupakia` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `speed_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `age_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `fee_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `wage_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groupakia`
--

INSERT INTO `groupakia` (`id`, `title`, `active`, `created_at`, `updated_at`, `teacher_id`, `speed_id`, `age_id`, `fee_id`, `wage_id`, `course_id`) VALUES
(1, 'Latin', 1, '2019-09-03 13:48:24', '2019-09-03 13:48:24', 1, 1, 2, 1, 1, 12),
(2, 'Svenska Anfanger', 1, '2019-08-20 07:00:00', '2019-08-20 07:00:00', 2, 2, 3, 2, 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `group_students`
--

CREATE TABLE `group_students` (
  `id` bigint UNSIGNED NOT NULL,
  `joined` datetime NOT NULL,
  `dropped` datetime NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_students`
--

INSERT INTO `group_students` (`id`, `joined`, `dropped`, `group_id`, `student_id`) VALUES
(1, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 1),
(2, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 2),
(3, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 3),
(4, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 4),
(5, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 5),
(6, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 6),
(7, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 7),
(8, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 8),
(9, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 9),
(10, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 11),
(11, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 12),
(12, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 13),
(13, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 14),
(14, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` bigint UNSIGNED NOT NULL,
  `wage` decimal(8,2) NOT NULL,
  `fee` decimal(8,2) NOT NULL,
  `vat` decimal(8,2) NOT NULL,
  `started` datetime NOT NULL,
  `ended` datetime NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `hour_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `duration` double NOT NULL COMMENT 'in hours'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `wage`, `fee`, `vat`, `started`, `ended`, `group_id`, `room_id`, `hour_id`, `duration`) VALUES
(1, '12.00', '3.00', '3.00', '2019-09-01 10:00:00', '2019-09-01 11:30:00', 1, 1, 4, 1.5),
(2, '12.00', '3.00', '3.00', '2019-09-06 10:00:00', '2019-09-06 11:30:00', 1, 1, 4, 1.5),
(3, '12.00', '3.00', '3.00', '2019-09-12 17:00:00', '2019-09-12 18:30:00', 1, 2, 18, 1.5),
(4, '12.00', '3.00', '3.00', '2019-09-18 17:00:00', '2019-09-12 18:30:00', 1, 2, 18, 1.5),
(5, '12.00', '3.00', '3.00', '2019-09-24 18:00:00', '2019-09-24 19:30:00', 1, 2, 18, 1.5),
(6, '12.00', '3.00', '3.00', '2019-09-30 18:30:00', '2019-09-30 20:00:00', 1, 2, 21, 1.5),
(7, '12.00', '3.00', '3.00', '2019-10-03 18:30:00', '2019-10-03 20:00:00', 1, 2, 21, 1.5),
(8, '12.00', '3.00', '3.00', '2019-08-21 12:00:00', '2019-08-21 14:00:00', 2, 4, 8, 2),
(9, '12.00', '3.00', '3.00', '2019-08-24 12:00:00', '2019-08-24 14:00:00', 2, 4, 8, 2),
(10, '12.00', '3.00', '3.00', '2019-08-29 19:00:00', '2019-08-29 21:00:00', 2, 4, 22, 2),
(11, '12.00', '3.00', '3.00', '2019-09-02 19:00:00', '2019-09-02 21:00:00', 2, 4, 22, 2),
(12, '12.00', '3.00', '3.00', '2019-09-05 19:30:00', '2019-09-05 21:30:00', 2, 4, 22, 2),
(13, '12.00', '3.00', '3.00', '2019-09-09 19:30:00', '2019-09-09 21:30:00', 2, 4, 22, 2),
(14, '12.00', '3.00', '3.00', '2019-09-12 19:00:00', '2019-09-12 21:00:00', 2, 4, 22, 2),
(15, '12.00', '3.00', '3.00', '2019-09-17 19:00:00', '2019-09-17 20:30:00', 2, 4, 22, 1.5),
(16, '12.00', '3.00', '3.00', '2019-09-21 19:00:00', '2019-09-21 21:00:00', 2, 5, 22, 1.5),
(17, '12.00', '3.00', '3.00', '2019-09-27 19:00:00', '2019-09-27 20:30:00', 2, 5, 22, 1.5),
(18, '12.00', '3.00', '3.00', '2019-10-04 19:00:00', '2019-10-04 21:00:00', 2, 5, 22, 1.5);

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`id`, `title`) VALUES
(1, '0830'),
(2, '0900'),
(3, '0930'),
(4, '1000'),
(5, '1030'),
(6, '1100'),
(7, '1130'),
(8, '1200'),
(9, '1230'),
(10, '1300'),
(11, '1330'),
(12, '1400'),
(13, '1430'),
(14, '1500'),
(15, '1530'),
(16, '1600'),
(17, '1630'),
(18, '1700'),
(19, '1730'),
(20, '1800'),
(21, '1830'),
(22, '1900'),
(23, '1930'),
(24, '2000'),
(25, '2030'),
(26, '2100'),
(27, '2130'),
(28, '2200'),
(29, '2230');

-- --------------------------------------------------------

--
-- Table structure for table `instituts`
--

CREATE TABLE `instituts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instituts`
--

INSERT INTO `instituts` (`id`, `title`, `active`) VALUES
(1, 'Goethe', 1),
(2, 'Cambridge', 1),
(3, 'Michigan', 1),
(4, 'Sorbonne', 1),
(5, 'Institut Française', 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Αγγλικά', 1, '2020-06-01 14:22:01', '2020-06-01 14:22:01'),
(2, 'Γερμανικά', 1, '2020-06-01 14:27:26', '2020-06-01 14:27:26'),
(3, 'Ρωσικά', 1, '2020-06-04 13:46:37', '2020-06-04 13:46:37'),
(4, 'Γαλλικά', 1, '2020-06-07 05:00:13', '2020-06-07 05:00:13'),
(5, 'Ισπανικά', 1, '2020-06-07 05:00:13', '2020-05-22 07:19:20'),
(6, 'Ιταλικά', 1, '2020-06-07 05:00:13', '2020-05-22 07:19:20'),
(7, 'Σουηδικά', 1, '2020-06-07 05:00:13', '2020-05-22 07:19:20'),
(8, 'Αραβικά', 1, '2020-06-07 05:00:13', '2020-05-22 07:19:20'),
(9, 'Κινεζικά', 1, '2020-06-07 05:00:13', '2020-05-22 07:19:20'),
(10, 'Ιαπωνικά', 1, '2020-06-07 05:00:13', '2020-05-22 07:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `email`, `phone`, `name`, `surname`, `created_at`, `updated_at`) VALUES
(1, '', '', 'Anna', 'Karamzov', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(2, '', '', 'Selma', 'Lagerlof', '2020-06-07 05:17:26', '2020-06-07 05:17:26'),
(3, '', '', 'Alexander', 'Pushkin', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(4, '', '', 'Σταυρίνα', 'Δήμα', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(5, '', '', 'Διονύσης', 'Ανδριόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(6, '', '', 'Αναστασία', 'Μιχαλακόπουλου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(7, '', '', 'Ορέστης', 'Παγώνας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(8, '', '', 'Λίτσα', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(9, '', '', 'Ιωσηφ', 'Δέλτας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(10, '', '', 'Ξερξης', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(11, '', '', 'Τάσος', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(12, '', '', 'Βαγγέλης', 'Κοντολέων', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(13, '', '', 'Ήρκος', 'Πυργιωτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(14, '', '', 'Θεόφραστος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(15, '', '', 'Αντώνης', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(16, '', '', 'Θεοδωσης', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(17, '', '', 'Σοφία', 'Μήλιας=', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(18, '', '', 'Θεοδωρος', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(19, '', '', 'Μιχάλης', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(20, '', '', 'Νεστωρ', 'Κατράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(21, '', '', 'Χριστίνα', 'Καραβία', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(22, '', '', 'Peter', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(23, '', '', 'Γεράσιμος', 'Βογιατζής', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(24, '', '', 'Αναστασία', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(25, '', '', 'Σοφία', 'Αντωνακόπουλου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(26, '', '', 'Αγνή', 'Σκαρμούτσος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(27, '', '', 'Derek', 'ΜιχαλόπουλοςΑνδριανόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(28, '', '', 'Βάσια', 'Διαμαντόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(29, '', '', 'Βάσια', 'ΜιχαλόπουλοςΑνδριανόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(30, '', '', 'Γεράσιμος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(31, '', '', 'Μαριάννα', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(32, '', '', 'Διονύσης', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(33, '', '', 'Θεοδωρος', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(34, '', '', 'Νικολέττα', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(35, '', '', 'Τάσος', 'Ηλιάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(36, '', '', 'Νίκος', 'Ζερβός', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(37, '', '', 'Ζήσης', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(38, '', '', 'Κοσμάς', 'Melberg', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(39, '', '', 'Ντίνα', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(40, '', '', 'Νίκος', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(41, '', '', 'Camilla', 'Κουρτίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(42, '', '', 'Mike', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(43, '', '', 'Ηρακλής', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(44, '', '', 'Ορέστης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(45, '', '', 'Βασίλης', 'Χαλκιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(46, '', '', 'Χρύσα', 'Βλαντής', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(47, '', '', 'Γιάννης', 'Μαζαράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(48, '', '', 'Helene', 'Καππάτος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(49, '', '', 'Σταυρίνα', 'Τρύπης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(50, '', '', 'Francois', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(51, '', '', 'Παυλίνα', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(52, '', '', 'Διονύσης', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(53, '', '', 'Πόπη', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(54, '', '', 'Θεοδωσης', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(55, '', '', 'Δημήτρης', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(56, '', '', 'Θεοδωσης', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(57, '', '', 'Marlene', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(58, '', '', 'John', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(59, '', '', 'Γιώργος', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(60, '', '', 'Ιωσηφ', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(61, '', '', 'Θεμης', 'Κυριακίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(62, '', '', 'Χρύσα', 'Διαμαντόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(63, '', '', 'Βούλα', 'Καππάτος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(64, '', '', 'Θεοδωρος', 'Γκιόκα', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(65, '', '', 'Μαριάννα', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(66, '', '', 'Νεστωρ', 'Δασκαλάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(67, '', '', 'Σταμάτης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(68, '', '', 'Βαγγέλης', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(69, '', '', 'Jorg', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(70, '', '', 'Hans', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(71, '', '', 'Ιωάννα', 'Melberg', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(72, '', '', 'Χριστίνα', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(73, '', '', 'Ξερξης', 'Ανδριόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(74, '', '', 'Ιωσηφ', 'Μελάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(75, '', '', 'Μιχάλης', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(76, '', '', 'Βούλα', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(77, '', '', 'Μιχάλης', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(78, '', '', 'Βούλα', 'Μήλιας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(79, '', '', 'Mike', 'Βούρος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(80, '', '', 'Σταμάτης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(81, '', '', 'Mike', 'Βέγγος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(82, '', '', 'Βαγγέλης', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(83, '', '', 'Κασσιανή', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(84, '', '', 'Άγγελος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(85, '', '', 'Κοσμάς', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(86, '', '', 'Peter', 'Καραβίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(87, '', '', 'Σοφία', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(88, '', '', 'Θεμης', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(89, '', '', 'Πάρις', 'Παπανδρέου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(90, '', '', 'Μιχάλης', 'Κατράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(91, '', '', 'Θεόφραστος', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(92, '', '', 'Αλέκα', 'Σουρουπίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(93, '', '', 'Χρίστος', 'Μαζαράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(94, '', '', 'Βάσια', 'Παπαδόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(95, '', '', 'Νεστωρ', 'Κούρτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(96, '', '', 'Γιώργος', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(97, '', '', 'Σοφία', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(98, '', '', 'Πόπη', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(99, '', '', 'Μαριάννα', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(100, '', '', 'Φάνης', 'Βούρος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(101, '', '', 'Νικολέττα', 'Σκαρμούτσος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(102, '', '', 'Παυλος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(103, '', '', 'Marlene', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(104, '', '', 'Χρίστος', 'Ηλιάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(105, '', '', 'Χάρης', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(106, '', '', 'Ξερξης', 'Βασιλαντωνόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(107, '', '', 'Παυλίνα', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(108, '', '', 'Jorg', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(109, '', '', 'Κοσμάς', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(110, '', '', 'Άννα', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(111, '', '', 'Άγγελος', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(112, '', '', 'Βαγγέλης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(113, '', '', 'Βάσια', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(114, '', '', 'Helene', 'Βασιλαντωνόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(115, '', '', 'Hans', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(116, '', '', 'Ιωσηφ', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(117, '', '', 'Χριστίνα', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(118, '', '', 'Μιχάλης', 'Μήλιας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(119, '', '', 'Derek', 'Ελευθεριάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(120, '', '', 'Γιάννης', 'Σπύρου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(121, '', '', 'Αλεξανδρος', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(122, '', '', 'Δημήτρης', 'Χαλικιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(123, '', '', 'Φάνης', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(124, '', '', 'Σταυρίνα', 'Χαλικιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(125, '', '', 'Θεοδωσης', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(126, '', '', 'Αλέκα', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(127, '', '', 'Άννα', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(128, '', '', 'Δημήτρης', 'Αντωνακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(129, '', '', 'Σταύρος', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(130, '', '', 'Αναστασία', 'Κούρτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(131, '', '', 'Ήρκος', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(132, '', '', 'Παυλίνα', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(133, '', '', 'Σταύρος', 'Καραβίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(134, '', '', 'Jorg', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(135, '', '', 'Άγγελος', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(136, '', '', 'Άννα', 'Τρύπης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(137, '', '', 'Francois', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(138, '', '', 'Αντώνης', 'Χαλκιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(139, '', '', 'Hans', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(140, '', '', 'Ηρακλής', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(141, '', '', 'Αλέκα', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(142, '', '', 'Χρύσα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(143, '', '', 'Κατερίνα', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(144, '', '', 'Σταμάτης', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(145, '', '', 'Μαριάννα', 'Δασκαλάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(146, '', '', 'Γεράσιμος', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(147, '', '', 'Ζήσης', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(148, '', '', 'Ντίνα', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(149, '', '', 'Φάνης', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(150, '', '', 'Hans', 'Σουρουπίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(151, '', '', 'Χρύσα', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(152, '', '', 'Άγγελος', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(153, '', '', 'Σταυρίνα', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(154, '', '', 'Φάνης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(155, '', '', 'Jorg', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(156, '', '', 'Βαγγέλης', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(157, '', '', 'Χάρης', 'Βλαντής', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(158, '', '', 'Αγνή', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(159, '', '', 'Αντώνης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(160, '', '', 'Peter', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(161, '', '', 'Ιωάννα', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(162, '', '', 'Ελένη', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(163, '', '', 'Παυλος', 'Κυριακίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(164, '', '', 'Φάνης', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(165, '', '', 'Σοφία', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(166, '', '', 'Χρύσα', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(167, '', '', 'Θεμης', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(168, '', '', 'Άννα', 'Παπανδρέου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(169, '', '', 'Κατερίνα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(170, '', '', 'Δημήτρης', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(171, '', '', 'Βούλα', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(172, '', '', 'Francois', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(173, '', '', 'Αγνή', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(174, '', '', 'Νικολέττα', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(175, '', '', 'Σταυρίνα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(176, '', '', 'Διονύσης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(177, '', '', 'Σταύρος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(178, '', '', 'Σταμάτης', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(179, '', '', 'Ντίνα', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(180, '', '', 'Κοσμάς', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(181, '', '', 'Νίκος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(182, '', '', 'Helene', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(183, '', '', 'Φάνης', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18'),
(184, '', '', 'Peter', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_06_01_134455_create_users_table', 1),
(2, '2020_06_01_134601_create_languages_table', 2),
(3, '2020_06_01_134711_create_diplomas_table', 3),
(4, '2020_06_01_134739_create_members_table', 4),
(5, '2020_06_01_134853_create_teachers_table', 5),
(6, '2020_06_01_135013_create_groups_table', 6),
(7, '2020_06_01_135125_create_group_members_table', 7),
(8, '2020_06_01_135431_create_history_table', 8),
(9, '2020_06_01_135623_create_rooms_table', 9),
(10, '2020_06_01_135631_create_buildings_table', 9),
(11, '2020_06_01_135851_create_roles_table', 10),
(12, '2020_06_01_141829_add_level_to_diplomas_table', 11),
(13, '2020_06_01_142023_add_language_to_diplomas_tables', 12),
(14, '2020_06_01_142251_create_teaches_table', 13),
(15, '2020_06_01_142332_add_teachers_diplomas_to_teaches_tables', 14),
(16, '2020_06_01_142601_add_members_to_teachers', 15),
(19, '2020_06_04_134414_add_teacher_to_groups', 16),
(20, '2020_06_04_134548_add_diploma_to_groups', 17),
(21, '2020_06_04_134946_add_group_to_history', 18),
(22, '2020_06_05_052844_create_ages_table', 19),
(23, '2020_06_05_052906_create_speeds_table', 19),
(24, '2020_06_05_053030_add_speedandage_to_groups', 20),
(25, '2020_06_05_054148_add_age_to_groups', 21),
(26, '2020_06_05_055000_create_towns_table', 22),
(27, '2020_06_05_055047_create_municipality_table', 22),
(28, '2020_06_05_055142_add_town_to_municipality', 23),
(29, '2020_06_05_055239_add_municipality_to_buildings', 24),
(30, '2020_06_05_164451_create_periods_table', 25),
(31, '2020_06_05_164642_create_real_exams_table', 26),
(36, '2020_06_05_164739_add_diploma_period_to_exams', 27),
(37, '2020_06_05_164856_create_mock_exams_table', 27),
(38, '2020_06_05_164916_add_diploma_period_to_mock_exams', 27),
(39, '2020_06_05_165016_add_group_to_real_exams', 27),
(40, '2020_06_05_165741_create_mock_exams_results_table', 28),
(41, '2020_06_05_165748_create_real_exams_results_table', 28),
(42, '2020_06_05_165835_create_students_table', 29),
(43, '2020_06_05_165836_add_exam_to_real_exams_results_table', 29),
(44, '2020_06_05_165848_add_exam_to_mock_exams_results_table', 29),
(45, '2020_06_05_170413_add_member_to_students', 30),
(46, '2020_06_05_170913_create_grading_sys_table', 31),
(47, '2020_06_05_171011_add_grading_sys_to_mock_exams', 32),
(48, '2020_06_05_171016_add_grading_sys_to_real_exams', 32),
(49, '2020_06_05_171134_add_grades_to_real_exams_results', 33),
(50, '2020_06_05_171344_create_diploma_grades_table', 34),
(51, '2020_06_05_171423_add_diplomas_to_diploma_grades', 35),
(52, '2020_06_05_171540_add_diploma_grades_to_real_exams_results', 36),
(53, '2020_06_05_171633_add_diploma_grades_to_mock_exams_results', 37),
(54, '2020_06_05_171813_create_months_table', 38),
(55, '2020_06_05_171956_create_student_debts', 39),
(56, '2020_06_05_172039_add_student_group_to_student_debts', 40),
(57, '2020_06_05_172336_create_student_payed', 41),
(58, '2020_06_05_172413_add_student_group_to_student_payed', 42),
(59, '2020_06_05_172517_create_teacher_debts', 43),
(60, '2020_06_05_172538_add_economics_to_teacher_debts', 44),
(61, '2020_06_05_172702_create_teacher_payments', 45),
(62, '2020_06_05_172713_add_economics_to_teacher_payments', 46),
(63, '2020_06_05_172949_create_parents_table', 47),
(64, '2020_06_05_173102_create_parents_children_table', 48),
(65, '2020_06_05_173227_create_progress_book_table', 49),
(66, '2020_06_05_173353_create_student_progress_book_table', 50),
(67, '2020_06_05_174204_create_diploma_fees', 51),
(68, '2020_06_05_174242_create_diploma_wages', 52),
(69, '2020_06_05_174311_add_fee_wage_models_to_groups', 53),
(71, '2020_06_05_174455_create_discount_model_table', 54),
(72, '2020_06_05_174725_create_discounts_table', 55),
(73, '2020_06_05_175031_create_hours_table', 56),
(74, '2020_06_05_175159_create_instituts_table', 57),
(75, '2020_06_06_043928_create_disciplines_table', 58),
(76, '2020_06_06_043941_create_courses_table', 58),
(77, '2020_06_06_043950_create_school_classes_table', 58),
(78, '2020_06_06_045030_create_course_type_table', 59),
(79, '2020_06_06_045112_add_course_type_to_courses', 60),
(80, '2020_06_06_045256_add_course_type_to_diplomas', 61),
(81, '2020_06_06_045727_drop_diploma', 62),
(82, '2020_06_06_045959_add_courses_to_course_fees', 63),
(84, '2020_06_06_050026_add_courses_to_course_wages', 64),
(85, '2020_06_06_050401_add_courses_types_to_teaches', 65),
(86, '2020_06_06_050929_remove_diploma_from_teaches', 66),
(87, '2020_06_06_051223_create_school_courses_table', 67),
(88, '2020_06_06_051540_add_buildings_to_rooms', 68),
(89, '2020_06_06_051702_add_room_hours_to_history', 69),
(90, '2020_06_06_051815_add_institut_to_diplomas', 70),
(91, '2020_06_06_051932_add_courses_to_groups', 71),
(92, '2020_06_07_143430_create_courses_wages_history', 72),
(93, '2020_06_07_143826_create_courses_fees_history', 73),
(94, '2020_06_07_143944_add_group_to_group_members', 74),
(95, '2020_06_07_144034_add_student_to_group_members', 75),
(96, '2020_06_07_144520_add_duration_to_history', 76),
(97, '2020_06_07_153015_rename_col_to_history', 77),
(98, '2020_06_08_101141_rename_table_group_members', 78),
(99, '2020_06_10_102047_rename_group_to_groupakia', 79);

-- --------------------------------------------------------

--
-- Table structure for table `mock_exams`
--

CREATE TABLE `mock_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `period_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grad_sys_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mock_exams_results`
--

CREATE TABLE `mock_exams_results` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grade` decimal(8,2) UNSIGNED NOT NULL,
  `text_grade_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `title`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `municipality`
--

CREATE TABLE `municipality` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `municipality`
--

INSERT INTO `municipality` (`id`, `title`, `town_id`) VALUES
(1, 'Καλλιθεα', 1),
(2, 'Χολαργός', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parents_children`
--

CREATE TABLE `parents_children` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `child_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` bigint UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `level`, `created_at`) VALUES
(1, '2021 ', '2021-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `progress_book`
--

CREATE TABLE `progress_book` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `real_exams`
--

CREATE TABLE `real_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `period_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grad_sys_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `real_exams`
--

INSERT INTO `real_exams` (`id`, `created_at`, `updated_at`, `period_id`, `group_id`, `grad_sys_id`) VALUES
(1, '2020-06-05 16:51:24', '2020-06-05 16:51:24', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `real_exams_results`
--

CREATE TABLE `real_exams_results` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grade` decimal(8,2) UNSIGNED NOT NULL,
  `text_grade_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `building_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `title`, `created_at`, `updated_at`, `building_id`) VALUES
(1, 'Φαέθων', '2020-06-06 05:16:08', '2020-06-06 05:16:08', 1),
(2, 'Ικαρος', '2020-06-07 14:54:58', '2020-06-07 14:54:58', 1),
(3, 'Ευρώπη', '2020-06-07 14:56:42', '2020-06-07 14:56:42', 1),
(4, 'Strindberg', '2020-06-07 15:09:49', '2020-06-07 15:09:49', 2),
(5, 'Ibsen', '2020-06-07 15:33:51', '2020-06-07 15:33:51', 2);

-- --------------------------------------------------------

--
-- Table structure for table `school_classes`
--

CREATE TABLE `school_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_classes`
--

INSERT INTO `school_classes` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Α\' λυκειου', '2020-06-06 04:41:53', '2020-06-06 04:41:53'),
(2, 'Β\' λυκείου', '2020-06-06 04:41:53', '2020-06-06 04:41:53'),
(3, 'Γ\' λυκείου', '2020-06-06 04:42:16', '2020-06-06 04:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `school_courses`
--

CREATE TABLE `school_courses` (
  `id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `school_class_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `discipline_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_courses`
--

INSERT INTO `school_courses` (`id`, `course_id`, `school_class_id`, `discipline_id`) VALUES
(1, 2, 3, 3),
(2, 12, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `speeds`
--

CREATE TABLE `speeds` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `speeds`
--

INSERT INTO `speeds` (`id`, `title`) VALUES
(1, 'Normal'),
(2, 'Fast');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `member_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `created_at`, `updated_at`, `member_id`) VALUES
(1, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 4),
(2, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 5),
(3, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 6),
(4, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 7),
(5, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 8),
(6, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 9),
(7, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 10),
(8, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 11),
(9, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 12),
(10, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 13),
(11, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 150),
(12, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 149),
(13, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 148),
(14, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 146),
(15, '2020-06-07 14:31:58', '2020-06-07 14:31:58', 145);

-- --------------------------------------------------------

--
-- Table structure for table `student_debts`
--

CREATE TABLE `student_debts` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `month_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `lesson_year` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_debts`
--

INSERT INTO `student_debts` (`id`, `created_at`, `updated_at`, `student_id`, `amount`, `group_id`, `month_id`, `lesson_year`) VALUES
(1, '2020-06-03 05:21:22', '2020-06-03 05:21:22', 1, '140.00', 1, 1, 2019),
(2, '2020-06-03 05:21:22', '2020-06-03 05:21:22', 2, '100.00', 1, 1, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `student_payed`
--

CREATE TABLE `student_payed` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` date NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `month_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `lesson_year` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_payed`
--

INSERT INTO `student_payed` (`id`, `created_at`, `student_id`, `amount`, `group_id`, `month_id`, `lesson_year`) VALUES
(1, '2020-05-28', 1, '50.00', 1, 10, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `student_progress_book`
--

CREATE TABLE `student_progress_book` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `amka` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `afm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `member_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `amka`, `afm`, `created_at`, `updated_at`, `member_id`) VALUES
(1, '', '', '2020-06-04 13:47:45', '2020-06-04 13:47:45', 1),
(2, '', '', '2020-06-07 15:04:04', '2020-06-07 15:04:04', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_debts`
--

CREATE TABLE `teacher_debts` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `month_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `lesson_year` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_debts`
--

INSERT INTO `teacher_debts` (`id`, `created_at`, `updated_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`) VALUES
(1, '2020-05-28 14:48:19', '2020-05-28 14:48:19', 1, '120.00', 1, 10, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_payments`
--

CREATE TABLE `teacher_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `month_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `lesson_year` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_payments`
--

INSERT INTO `teacher_payments` (`id`, `created_at`, `updated_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`) VALUES
(1, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 1, '200.00', 1, 10, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`id`, `created_at`, `updated_at`, `teacher_id`, `course_id`) VALUES
(1, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 1, 1),
(2, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`id`, `title`) VALUES
(1, 'Athens');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ages`
--
ALTER TABLE `ages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buildings_municipality_id_foreign` (`municipality_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_course_type_id_foreign` (`course_type_id`);

--
-- Indexes for table `courses_fees_history`
--
ALTER TABLE `courses_fees_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_fees_history_course_id_foreign` (`course_id`);

--
-- Indexes for table `courses_wages_history`
--
ALTER TABLE `courses_wages_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_wages_history_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_fees`
--
ALTER TABLE `course_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_fees_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_type`
--
ALTER TABLE `course_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_wages`
--
ALTER TABLE `course_wages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_wages_course_id_foreign` (`course_id`);

--
-- Indexes for table `diplomas`
--
ALTER TABLE `diplomas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diplomas_language_id_foreign` (`language_id`),
  ADD KEY `diplomas_course_id_foreign` (`course_id`),
  ADD KEY `diplomas_institut_id_foreign` (`institut_id`);

--
-- Indexes for table `diploma_grades`
--
ALTER TABLE `diploma_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diploma_grades_diploma_id_foreign` (`diploma_id`);

--
-- Indexes for table `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_student_id_foreign` (`student_id`),
  ADD KEY `discounts_discount_id_foreign` (`discount_id`),
  ADD KEY `discounts_group_id_foreign` (`group_id`);

--
-- Indexes for table `discount_model`
--
ALTER TABLE `discount_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grading_sys`
--
ALTER TABLE `grading_sys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupakia`
--
ALTER TABLE `groupakia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_teacher_id_foreign` (`teacher_id`),
  ADD KEY `groups_speed_id_foreign` (`speed_id`),
  ADD KEY `groups_age_id_foreign` (`age_id`),
  ADD KEY `groups_fee_id_foreign` (`fee_id`),
  ADD KEY `groups_wage_id_foreign` (`wage_id`),
  ADD KEY `groups_course_id_foreign` (`course_id`);

--
-- Indexes for table `group_students`
--
ALTER TABLE `group_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_members_group_id_foreign` (`group_id`),
  ADD KEY `group_members_student_id_foreign` (`student_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_group_id_foreign` (`group_id`),
  ADD KEY `history_room_id_foreign` (`room_id`),
  ADD KEY `history_hour_id_foreign` (`hour_id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instituts`
--
ALTER TABLE `instituts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mock_exams`
--
ALTER TABLE `mock_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mock_exams_period_id_foreign` (`period_id`),
  ADD KEY `mock_exams_group_id_foreign` (`group_id`),
  ADD KEY `mock_exams_grad_sys_id_foreign` (`grad_sys_id`);

--
-- Indexes for table `mock_exams_results`
--
ALTER TABLE `mock_exams_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mock_exams_results_exam_id_foreign` (`exam_id`),
  ADD KEY `mock_exams_results_student_id_foreign` (`student_id`),
  ADD KEY `mock_exams_results_text_grade_id_foreign` (`text_grade_id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `municipality`
--
ALTER TABLE `municipality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipality_town_id_foreign` (`town_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents_children`
--
ALTER TABLE `parents_children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parents_children_parent_id_foreign` (`parent_id`),
  ADD KEY `parents_children_child_id_foreign` (`child_id`);

--
-- Indexes for table `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progress_book`
--
ALTER TABLE `progress_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `progress_book_group_id_foreign` (`group_id`);

--
-- Indexes for table `real_exams`
--
ALTER TABLE `real_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `real_exams_period_id_foreign` (`period_id`),
  ADD KEY `real_exams_group_id_foreign` (`group_id`),
  ADD KEY `real_exams_grad_sys_id_foreign` (`grad_sys_id`);

--
-- Indexes for table `real_exams_results`
--
ALTER TABLE `real_exams_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `real_exams_results_exam_id_foreign` (`exam_id`),
  ADD KEY `real_exams_results_student_id_foreign` (`student_id`),
  ADD KEY `real_exams_results_text_grade_id_foreign` (`text_grade_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_building_id_foreign` (`building_id`);

--
-- Indexes for table `school_classes`
--
ALTER TABLE `school_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_courses`
--
ALTER TABLE `school_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_courses_course_id_foreign` (`course_id`),
  ADD KEY `school_courses_school_class_id_foreign` (`school_class_id`),
  ADD KEY `school_courses_discipline_id_foreign` (`discipline_id`);

--
-- Indexes for table `speeds`
--
ALTER TABLE `speeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_member_id_foreign` (`member_id`);

--
-- Indexes for table `student_debts`
--
ALTER TABLE `student_debts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_debts_student_id_foreign` (`student_id`),
  ADD KEY `student_debts_group_id_foreign` (`group_id`),
  ADD KEY `student_debts_month_id_foreign` (`month_id`);

--
-- Indexes for table `student_payed`
--
ALTER TABLE `student_payed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_payed_student_id_foreign` (`student_id`),
  ADD KEY `student_payed_group_id_foreign` (`group_id`),
  ADD KEY `student_payed_month_id_foreign` (`month_id`);

--
-- Indexes for table `student_progress_book`
--
ALTER TABLE `student_progress_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_progress_book_group_id_foreign` (`group_id`),
  ADD KEY `student_progress_book_student_id_foreign` (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_member_id_foreign` (`member_id`);

--
-- Indexes for table `teacher_debts`
--
ALTER TABLE `teacher_debts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_debts_teacher_id_foreign` (`teacher_id`),
  ADD KEY `teacher_debts_group_id_foreign` (`group_id`),
  ADD KEY `teacher_debts_month_id_foreign` (`month_id`);

--
-- Indexes for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_payments_teacher_id_foreign` (`teacher_id`),
  ADD KEY `teacher_payments_group_id_foreign` (`group_id`),
  ADD KEY `teacher_payments_month_id_foreign` (`month_id`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaches_teacher_id_foreign` (`teacher_id`),
  ADD KEY `teaches_course_id_foreign` (`course_id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ages`
--
ALTER TABLE `ages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `courses_fees_history`
--
ALTER TABLE `courses_fees_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses_wages_history`
--
ALTER TABLE `courses_wages_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_fees`
--
ALTER TABLE `course_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_type`
--
ALTER TABLE `course_type`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_wages`
--
ALTER TABLE `course_wages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diplomas`
--
ALTER TABLE `diplomas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `diploma_grades`
--
ALTER TABLE `diploma_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_model`
--
ALTER TABLE `discount_model`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grading_sys`
--
ALTER TABLE `grading_sys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `groupakia`
--
ALTER TABLE `groupakia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_students`
--
ALTER TABLE `group_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `instituts`
--
ALTER TABLE `instituts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `mock_exams`
--
ALTER TABLE `mock_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mock_exams_results`
--
ALTER TABLE `mock_exams_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `municipality`
--
ALTER TABLE `municipality`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parents_children`
--
ALTER TABLE `parents_children`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `periods`
--
ALTER TABLE `periods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `progress_book`
--
ALTER TABLE `progress_book`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real_exams`
--
ALTER TABLE `real_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `real_exams_results`
--
ALTER TABLE `real_exams_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `school_classes`
--
ALTER TABLE `school_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_courses`
--
ALTER TABLE `school_courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `speeds`
--
ALTER TABLE `speeds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `student_debts`
--
ALTER TABLE `student_debts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_payed`
--
ALTER TABLE `student_payed`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_progress_book`
--
ALTER TABLE `student_progress_book`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teacher_debts`
--
ALTER TABLE `teacher_debts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teaches`
--
ALTER TABLE `teaches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_municipality_id_foreign` FOREIGN KEY (`municipality_id`) REFERENCES `municipality` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_course_type_id_foreign` FOREIGN KEY (`course_type_id`) REFERENCES `course_type` (`id`);

--
-- Constraints for table `courses_fees_history`
--
ALTER TABLE `courses_fees_history`
  ADD CONSTRAINT `courses_fees_history_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `courses_wages_history`
--
ALTER TABLE `courses_wages_history`
  ADD CONSTRAINT `courses_wages_history_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_fees`
--
ALTER TABLE `course_fees`
  ADD CONSTRAINT `course_fees_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_wages`
--
ALTER TABLE `course_wages`
  ADD CONSTRAINT `course_wages_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `diplomas`
--
ALTER TABLE `diplomas`
  ADD CONSTRAINT `diplomas_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `diplomas_institut_id_foreign` FOREIGN KEY (`institut_id`) REFERENCES `instituts` (`id`),
  ADD CONSTRAINT `diplomas_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `diploma_grades`
--
ALTER TABLE `diploma_grades`
  ADD CONSTRAINT `diploma_grades_diploma_id_foreign` FOREIGN KEY (`diploma_id`) REFERENCES `diplomas` (`id`);

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discount_model` (`id`),
  ADD CONSTRAINT `discounts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `discounts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `groupakia`
--
ALTER TABLE `groupakia`
  ADD CONSTRAINT `groups_age_id_foreign` FOREIGN KEY (`age_id`) REFERENCES `ages` (`id`),
  ADD CONSTRAINT `groups_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `groups_fee_id_foreign` FOREIGN KEY (`fee_id`) REFERENCES `course_fees` (`id`),
  ADD CONSTRAINT `groups_speed_id_foreign` FOREIGN KEY (`speed_id`) REFERENCES `speeds` (`id`),
  ADD CONSTRAINT `groups_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `groups_wage_id_foreign` FOREIGN KEY (`wage_id`) REFERENCES `course_wages` (`id`);

--
-- Constraints for table `group_students`
--
ALTER TABLE `group_students`
  ADD CONSTRAINT `group_members_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `group_members_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `history_hour_id_foreign` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `history_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `mock_exams`
--
ALTER TABLE `mock_exams`
  ADD CONSTRAINT `mock_exams_grad_sys_id_foreign` FOREIGN KEY (`grad_sys_id`) REFERENCES `grading_sys` (`id`),
  ADD CONSTRAINT `mock_exams_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `mock_exams_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`);

--
-- Constraints for table `mock_exams_results`
--
ALTER TABLE `mock_exams_results`
  ADD CONSTRAINT `mock_exams_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `mock_exams` (`id`),
  ADD CONSTRAINT `mock_exams_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `mock_exams_results_text_grade_id_foreign` FOREIGN KEY (`text_grade_id`) REFERENCES `diploma_grades` (`id`);

--
-- Constraints for table `municipality`
--
ALTER TABLE `municipality`
  ADD CONSTRAINT `municipality_town_id_foreign` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);

--
-- Constraints for table `parents_children`
--
ALTER TABLE `parents_children`
  ADD CONSTRAINT `parents_children_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `parents_children_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`);

--
-- Constraints for table `progress_book`
--
ALTER TABLE `progress_book`
  ADD CONSTRAINT `progress_book_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`);

--
-- Constraints for table `real_exams`
--
ALTER TABLE `real_exams`
  ADD CONSTRAINT `real_exams_grad_sys_id_foreign` FOREIGN KEY (`grad_sys_id`) REFERENCES `grading_sys` (`id`),
  ADD CONSTRAINT `real_exams_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `real_exams_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`);

--
-- Constraints for table `real_exams_results`
--
ALTER TABLE `real_exams_results`
  ADD CONSTRAINT `real_exams_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `real_exams` (`id`),
  ADD CONSTRAINT `real_exams_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `real_exams_results_text_grade_id_foreign` FOREIGN KEY (`text_grade_id`) REFERENCES `diploma_grades` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `school_courses`
--
ALTER TABLE `school_courses`
  ADD CONSTRAINT `school_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `school_courses_discipline_id_foreign` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`),
  ADD CONSTRAINT `school_courses_school_class_id_foreign` FOREIGN KEY (`school_class_id`) REFERENCES `school_classes` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`);

--
-- Constraints for table `student_debts`
--
ALTER TABLE `student_debts`
  ADD CONSTRAINT `student_debts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `student_debts_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `student_debts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_payed`
--
ALTER TABLE `student_payed`
  ADD CONSTRAINT `student_payed_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `student_payed_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `student_payed_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_progress_book`
--
ALTER TABLE `student_progress_book`
  ADD CONSTRAINT `student_progress_book_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `student_progress_book_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`);

--
-- Constraints for table `teacher_debts`
--
ALTER TABLE `teacher_debts`
  ADD CONSTRAINT `teacher_debts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `teacher_debts_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `teacher_debts_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  ADD CONSTRAINT `teacher_payments_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `teacher_payments_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `teacher_payments_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `teaches_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
