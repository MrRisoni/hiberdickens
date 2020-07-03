-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 03, 2020 at 09:03 AM
-- Server version: 8.0.20
-- PHP Version: 7.4.7

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
-- Table structure for table `absencies`
--

CREATE TABLE `absencies` (
  `id` bigint UNSIGNED NOT NULL,
  `history_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `justified` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ages`
--

CREATE TABLE `ages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `suburb_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `address`, `suburb_id`) VALUES
(1, 'Melpomeni', 1),
(2, 'Sophocles', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `course_type_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `active`, `course_type_id`) VALUES
(1, 'Zertifikat I', 1, 2),
(2, 'Μαθηματικά Γ Θετικης', 1, 1),
(3, 'Lower', 1, 2),
(4, 'Proficiency', 1, 2),
(5, 'Delf I', 1, 2),
(6, 'Delf II', 1, 2),
(7, 'Dalf I', 1, 2),
(8, 'Dalf II', 1, 2),
(9, 'Mittelstuffe', 1, 2),
(10, 'Groses Deutsches Srpachdiplom', 1, 2),
(11, 'Sorbonne', 1, 2),
(12, 'Λατινικά Β Λυκειου', 1, 1),
(13, 'Hey do', 1, 2),
(14, 'Πάλσο', 1, 2),
(15, 'Αρχαια Ελληνικά', 1, 1),
(16, 'Τρομπόνι', 1, 4),
(17, 'Σεμινάρια', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `courses_fees_history`
--

CREATE TABLE `courses_fees_history` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courses_wages_history`
--

CREATE TABLE `courses_wages_history` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_fees`
--

INSERT INTO `course_fees` (`id`, `amount`, `created_at`, `updated_at`, `course_id`) VALUES
(1, '15.00', '2020-06-05 17:42:27', '2020-06-05 17:42:27', 1),
(2, '22.00', '2020-06-07 15:05:00', '2020-06-07 15:05:00', 13);

-- --------------------------------------------------------

--
-- Table structure for table `course_grades`
--

CREATE TABLE `course_grades` (
  `id` bigint UNSIGNED NOT NULL,
  `grade_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_grades`
--

INSERT INTO `course_grades` (`id`, `grade_title`, `course_id`) VALUES
(1, 'Sehr Gut', 2),
(2, 'Gut', 2);

-- --------------------------------------------------------

--
-- Table structure for table `course_ranks`
--

CREATE TABLE `course_ranks` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` tinyint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_ranks`
--

INSERT INTO `course_ranks` (`id`, `title`, `rank`, `course_id`) VALUES
(2, 'Α Κατωτέρα', 2, 3),
(1, 'Προκαταρκτική Α', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `course_type`
--

CREATE TABLE `course_type` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_type`
--

INSERT INTO `course_type` (`id`, `title`) VALUES
(1, 'Λύκειο'),
(2, 'Ξένη Γλώσσα'),
(3, 'Τριτοβάθμια εκπαίδευση'),
(4, 'Μουσική'),
(5, 'Σεμινάρια');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `institut_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diplomas`
--

INSERT INTO `diplomas` (`id`, `active`, `created_at`, `level`, `language_id`, `course_id`, `institut_id`) VALUES
(1, 1, '2020-06-01 14:22:22', '', 1, 3, 1),
(2, 1, '2020-06-02 14:27:40', '', 2, 9, 1),
(4, 1, '2020-06-07 05:19:54', 'C1', 4, 5, 5),
(5, 1, '2020-05-28 14:48:19', 'B1', 7, 13, 1),
(6, 0, '2020-06-01 09:44:09', 'Α2', 1, 14, 2),
(7, 1, '2020-06-01 14:22:22', '', 2, 1, 1),
(8, 1, '2020-06-01 09:56:29', 'C2', 1, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `discount_model`
--

CREATE TABLE `discount_model` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grading_sys`
--

CREATE TABLE `grading_sys` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `speed_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `age_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `fee_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `wage_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `max_seats` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `remaining_seats` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `num_students` tinyint UNSIGNED NOT NULL DEFAULT '8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupakia`
--

INSERT INTO `groupakia` (`id`, `title`, `active`, `created_at`, `updated_at`, `teacher_id`, `speed_id`, `age_id`, `fee_id`, `wage_id`, `course_id`, `max_seats`, `remaining_seats`, `num_students`) VALUES
(1, 'Latin', 1, '2019-09-03 13:48:24', '2019-09-03 13:48:24', 1, 1, 2, 1, 1, 12, 10, 2, 8),
(2, 'Svenska Anfanger', 1, '2019-08-20 07:00:00', '2019-08-20 07:00:00', 2, 2, 3, 2, 2, 13, 10, 2, 8),
(3, 'Greek Ancient', 1, '2020-05-28 14:48:19', '2020-05-28 14:48:19', 1, 1, 2, 1, 1, 15, 10, 2, 8),
(4, 'Java Hibernate full time', 1, '2020-06-10 05:07:49', '2020-06-10 05:07:49', 2, 1, 3, 1, 1, 17, 10, 2, 8),
(5, 'React State Management', 1, '2020-06-04 05:10:26', '2020-06-04 05:10:26', 2, 1, 3, 1, 1, 17, 10, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `groups_extra_teachers`
--

CREATE TABLE `groups_extra_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_students`
--

CREATE TABLE `group_students` (
  `id` bigint UNSIGNED NOT NULL,
  `joined` datetime NOT NULL,
  `dropped` datetime NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `studentsList_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_students`
--

INSERT INTO `group_students` (`id`, `joined`, `dropped`, `group_id`, `student_id`, `studentsList_id`) VALUES
(1, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 1, 0),
(2, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 2, 0),
(3, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 3, 0),
(4, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 4, 0),
(5, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 5, 0),
(6, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 6, 0),
(7, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 7, 0),
(8, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 8, 0),
(9, '2019-09-01 10:00:00', '2020-07-07 17:41:09', 1, 9, 0),
(10, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 11, 0),
(11, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 12, 0),
(12, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 13, 0),
(13, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 14, 0),
(14, '2019-08-28 10:00:00', '2020-06-15 10:00:00', 2, 15, 0),
(15, '2019-09-01 10:00:00', '2020-06-15 10:00:00', 3, 1, 0),
(16, '2020-06-02 08:08:27', '2020-06-24 08:08:27', 4, 15, 0),
(17, '2020-06-01 08:11:19', '2020-06-01 08:11:19', 5, 13, 0);

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
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `room_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `hour_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `duration` double NOT NULL COMMENT 'in hours',
  `cancelled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `wage`, `fee`, `vat`, `started`, `ended`, `group_id`, `teacher_id`, `room_id`, `hour_id`, `duration`, `cancelled`) VALUES
(1, '12.00', '3.00', '3.00', '2019-09-01 10:00:00', '2019-09-01 11:30:00', 1, 1, 1, 4, 1.5, 0),
(2, '12.00', '3.00', '3.00', '2019-09-06 10:00:00', '2019-09-06 11:30:00', 1, 1, 1, 4, 1.5, 0),
(3, '12.00', '3.00', '3.00', '2019-09-12 17:00:00', '2019-09-12 18:30:00', 1, 1, 2, 18, 1.5, 0),
(4, '12.00', '3.00', '3.00', '2019-09-21 10:00:00', '2019-09-21 11:30:00', 1, 1, 6, 4, 1.5, 0),
(5, '12.00', '3.00', '3.00', '2019-09-24 18:00:00', '2019-09-24 19:30:00', 1, 1, 2, 18, 1.5, 0),
(6, '12.00', '3.00', '3.00', '2019-09-30 18:30:00', '2019-09-30 20:00:00', 1, 1, 2, 21, 1.5, 0),
(7, '12.00', '3.00', '3.00', '2019-10-03 18:30:00', '2019-10-03 20:00:00', 1, 1, 2, 21, 1.5, 0),
(8, '12.00', '3.00', '3.00', '2019-08-21 12:00:00', '2019-08-21 14:00:00', 2, 2, 4, 8, 2, 0),
(9, '12.00', '3.00', '3.00', '2019-08-24 12:00:00', '2019-08-24 14:00:00', 2, 2, 4, 8, 2, 0),
(10, '12.00', '3.00', '3.00', '2019-08-29 19:00:00', '2019-08-29 21:00:00', 2, 2, 4, 22, 2, 0),
(11, '12.00', '3.00', '3.00', '2019-09-02 19:00:00', '2019-09-02 21:00:00', 2, 2, 4, 22, 2, 0),
(12, '12.00', '3.00', '3.00', '2019-09-05 19:30:00', '2019-09-05 21:30:00', 2, 2, 4, 22, 2, 0),
(13, '12.00', '3.00', '3.00', '2019-09-09 19:30:00', '2019-09-09 21:30:00', 2, 2, 4, 22, 2, 0),
(14, '12.00', '3.00', '3.00', '2019-09-12 19:00:00', '2019-09-12 21:00:00', 2, 2, 4, 22, 2, 0),
(15, '12.00', '3.00', '3.00', '2019-09-17 19:00:00', '2019-09-17 20:30:00', 2, 2, 4, 22, 1.5, 0),
(16, '12.00', '3.00', '3.00', '2019-09-21 09:30:00', '2019-09-21 11:00:00', 2, 2, 5, 3, 1.5, 0),
(17, '12.00', '3.00', '3.00', '2019-09-27 19:00:00', '2019-09-27 20:30:00', 2, 2, 5, 22, 1.5, 0),
(18, '12.00', '3.00', '3.00', '2019-10-04 19:00:00', '2019-10-04 21:00:00', 2, 2, 5, 22, 1.5, 0),
(19, '12.00', '3.00', '3.00', '2019-09-24 19:00:00', '2019-09-24 21:00:00', 5, 2, 7, 22, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `per_days` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instituts`
--

CREATE TABLE `instituts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `interviews_grading`
--

CREATE TABLE `interviews_grading` (
  `id` bigint UNSIGNED NOT NULL,
  `stage_id` bigint UNSIGNED NOT NULL,
  `application_id` bigint UNSIGNED NOT NULL,
  `grade` decimal(5,2) NOT NULL,
  `passed` tinyint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interview_stages`
--

CREATE TABLE `interview_stages` (
  `id` bigint UNSIGNED NOT NULL,
  `opening_id` bigint UNSIGNED NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint UNSIGNED NOT NULL,
  `shown_order` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `opening_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(22) NOT NULL,
  `email` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dob` date NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_application_courses`
--

CREATE TABLE `job_application_courses` (
  `id` bigint UNSIGNED NOT NULL,
  `application_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_openings`
--

CREATE TABLE `job_openings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_opening_courses`
--

CREATE TABLE `job_opening_courses` (
  `id` bigint UNSIGNED NOT NULL,
  `opening_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_opening_studies`
--

CREATE TABLE `job_opening_studies` (
  `id` bigint UNSIGNED NOT NULL,
  `application_id` bigint UNSIGNED NOT NULL,
  `school_title` varchar(120) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` float UNSIGNED NOT NULL,
  `joined` date NOT NULL,
  `graduated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_opening_work`
--

CREATE TABLE `job_opening_work` (
  `id` bigint UNSIGNED NOT NULL,
  `application_id` bigint UNSIGNED NOT NULL,
  `job_title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `joined` date NOT NULL,
  `left_on` date DEFAULT NULL,
  `still_work_there` tinyint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `active`) VALUES
(1, 'Αγγλικά', 1),
(2, 'Γερμανικά', 1),
(3, 'Ρωσικά', 1),
(4, 'Γαλλικά', 1),
(5, 'Ισπανικά', 1),
(6, 'Ιταλικά', 1),
(7, 'Σουηδικά', 1),
(8, 'Αραβικά', 1),
(9, 'Κινεζικά', 1),
(10, 'Ιαπωνικά', 1);

-- --------------------------------------------------------

--
-- Table structure for table `logbook`
--

CREATE TABLE `logbook` (
  `id` bigint UNSIGNED NOT NULL,
  `history_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `notes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='βιβλίο ύλης';

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `suburb_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `town_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `perfecture_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `email`, `phone`, `name`, `surname`, `created_at`, `updated_at`, `address`, `post_code`, `suburb_id`, `town_id`, `perfecture_id`) VALUES
(1, '', '', 'Anna', 'Karamzov', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(2, '', '', 'Selma', 'Lagerlof', '2020-06-07 05:17:26', '2020-06-07 05:17:26', '', '', 1, 1, 1),
(3, '', '', 'Alexander', 'Pushkin', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(4, '', '', 'Σταυρίνα', 'Δήμα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(5, '', '', 'Διονύσης', 'Ανδριόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(6, '', '', 'Αναστασία', 'Μιχαλακόπουλου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(7, '', '', 'Ορέστης', 'Παγώνας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(8, '', '', 'Λίτσα', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(9, '', '', 'Ιωσηφ', 'Δέλτας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(10, '', '', 'Ξερξης', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(11, '', '', 'Τάσος', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(12, '', '', 'Βαγγέλης', 'Κοντολέων', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(13, '', '', 'Ήρκος', 'Πυργιωτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(14, '', '', 'Θεόφραστος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(15, '', '', 'Αντώνης', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(16, '', '', 'Θεοδωσης', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(17, '', '', 'Σοφία', 'Μήλιας=', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(18, '', '', 'Θεοδωρος', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(19, '', '', 'Μιχάλης', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(20, '', '', 'Νεστωρ', 'Κατράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(21, '', '', 'Χριστίνα', 'Καραβία', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(22, '', '', 'Peter', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(23, '', '', 'Γεράσιμος', 'Βογιατζής', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(24, '', '', 'Αναστασία', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(25, '', '', 'Σοφία', 'Αντωνακόπουλου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(26, '', '', 'Αγνή', 'Σκαρμούτσος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(27, '', '', 'Derek', 'ΜιχαλόπουλοςΑνδριανόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(28, '', '', 'Βάσια', 'Διαμαντόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(29, '', '', 'Βάσια', 'ΜιχαλόπουλοςΑνδριανόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(30, '', '', 'Γεράσιμος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(31, '', '', 'Μαριάννα', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(32, '', '', 'Διονύσης', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(33, '', '', 'Θεοδωρος', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(34, '', '', 'Νικολέττα', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(35, '', '', 'Τάσος', 'Ηλιάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(36, '', '', 'Νίκος', 'Ζερβός', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(37, '', '', 'Ζήσης', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(38, '', '', 'Κοσμάς', 'Melberg', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(39, '', '', 'Ντίνα', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(40, '', '', 'Νίκος', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(41, '', '', 'Camilla', 'Κουρτίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(42, '', '', 'Mike', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(43, '', '', 'Ηρακλής', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(44, '', '', 'Ορέστης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(45, '', '', 'Βασίλης', 'Χαλκιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(46, '', '', 'Χρύσα', 'Βλαντής', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(47, '', '', 'Γιάννης', 'Μαζαράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(48, '', '', 'Helene', 'Καππάτος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(49, '', '', 'Σταυρίνα', 'Τρύπης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(50, '', '', 'Francois', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(51, '', '', 'Παυλίνα', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(52, '', '', 'Διονύσης', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(53, '', '', 'Πόπη', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(54, '', '', 'Θεοδωσης', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(55, '', '', 'Δημήτρης', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(56, '', '', 'Θεοδωσης', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(57, '', '', 'Marlene', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(58, '', '', 'John', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(59, '', '', 'Γιώργος', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(60, '', '', 'Ιωσηφ', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(61, '', '', 'Θεμης', 'Κυριακίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(62, '', '', 'Χρύσα', 'Διαμαντόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(63, '', '', 'Βούλα', 'Καππάτος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(64, '', '', 'Θεοδωρος', 'Γκιόκα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(65, '', '', 'Μαριάννα', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(66, '', '', 'Νεστωρ', 'Δασκαλάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(67, '', '', 'Σταμάτης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(68, '', '', 'Βαγγέλης', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(69, '', '', 'Jorg', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(70, '', '', 'Hans', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(71, '', '', 'Ιωάννα', 'Melberg', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(72, '', '', 'Χριστίνα', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(73, '', '', 'Ξερξης', 'Ανδριόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(74, '', '', 'Ιωσηφ', 'Μελάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(75, '', '', 'Μιχάλης', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(76, '', '', 'Βούλα', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(77, '', '', 'Μιχάλης', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(78, '', '', 'Βούλα', 'Μήλιας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(79, '', '', 'Mike', 'Βούρος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(80, '', '', 'Σταμάτης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(81, '', '', 'Mike', 'Βέγγος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(82, '', '', 'Βαγγέλης', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(83, '', '', 'Κασσιανή', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(84, '', '', 'Άγγελος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(85, '', '', 'Κοσμάς', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(86, '', '', 'Peter', 'Καραβίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(87, '', '', 'Σοφία', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(88, '', '', 'Θεμης', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(89, '', '', 'Πάρις', 'Παπανδρέου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(90, '', '', 'Μιχάλης', 'Κατράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(91, '', '', 'Θεόφραστος', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(92, '', '', 'Αλέκα', 'Σουρουπίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(93, '', '', 'Χρίστος', 'Μαζαράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(94, '', '', 'Βάσια', 'Παπαδόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(95, '', '', 'Νεστωρ', 'Κούρτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(96, '', '', 'Γιώργος', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(97, '', '', 'Σοφία', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(98, '', '', 'Πόπη', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(99, '', '', 'Μαριάννα', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(100, '', '', 'Φάνης', 'Βούρος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(101, '', '', 'Νικολέττα', 'Σκαρμούτσος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(102, '', '', 'Παυλος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(103, '', '', 'Marlene', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(104, '', '', 'Χρίστος', 'Ηλιάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(105, '', '', 'Χάρης', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(106, '', '', 'Ξερξης', 'Βασιλαντωνόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(107, '', '', 'Παυλίνα', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(108, '', '', 'Jorg', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(109, '', '', 'Κοσμάς', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(110, '', '', 'Άννα', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(111, '', '', 'Άγγελος', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(112, '', '', 'Βαγγέλης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(113, '', '', 'Βάσια', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(114, '', '', 'Helene', 'Βασιλαντωνόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(115, '', '', 'Hans', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(116, '', '', 'Ιωσηφ', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(117, '', '', 'Χριστίνα', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(118, '', '', 'Μιχάλης', 'Μήλιας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(119, '', '', 'Derek', 'Ελευθεριάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(120, '', '', 'Γιάννης', 'Σπύρου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(121, '', '', 'Αλεξανδρος', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(122, '', '', 'Δημήτρης', 'Χαλικιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(123, '', '', 'Φάνης', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(124, '', '', 'Σταυρίνα', 'Χαλικιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(125, '', '', 'Θεοδωσης', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(126, '', '', 'Αλέκα', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(127, '', '', 'Άννα', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(128, '', '', 'Δημήτρης', 'Αντωνακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(129, '', '', 'Σταύρος', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(130, '', '', 'Αναστασία', 'Κούρτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(131, '', '', 'Ήρκος', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(132, '', '', 'Παυλίνα', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(133, '', '', 'Σταύρος', 'Καραβίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(134, '', '', 'Jorg', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(135, '', '', 'Άγγελος', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(136, '', '', 'Άννα', 'Τρύπης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(137, '', '', 'Francois', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(138, '', '', 'Αντώνης', 'Χαλκιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(139, '', '', 'Hans', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(140, '', '', 'Ηρακλής', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(141, '', '', 'Αλέκα', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(142, '', '', 'Χρύσα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(143, '', '', 'Κατερίνα', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(144, '', '', 'Σταμάτης', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(145, '', '', 'Μαριάννα', 'Δασκαλάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(146, '', '', 'Γεράσιμος', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(147, '', '', 'Ζήσης', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(148, '', '', 'Ντίνα', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(149, '', '', 'Φάνης', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(150, '', '', 'Hans', 'Σουρουπίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(151, '', '', 'Χρύσα', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(152, '', '', 'Άγγελος', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(153, '', '', 'Σταυρίνα', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(154, '', '', 'Φάνης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(155, '', '', 'Jorg', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(156, '', '', 'Βαγγέλης', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(157, '', '', 'Χάρης', 'Βλαντής', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(158, '', '', 'Αγνή', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(159, '', '', 'Αντώνης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(160, '', '', 'Peter', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(161, '', '', 'Ιωάννα', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(162, '', '', 'Ελένη', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(163, '', '', 'Παυλος', 'Κυριακίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(164, '', '', 'Φάνης', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(165, '', '', 'Σοφία', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(166, '', '', 'Χρύσα', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(167, '', '', 'Θεμης', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(168, '', '', 'Άννα', 'Παπανδρέου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(169, '', '', 'Κατερίνα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(170, '', '', 'Δημήτρης', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(171, '', '', 'Βούλα', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(172, '', '', 'Francois', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(173, '', '', 'Αγνή', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(174, '', '', 'Νικολέττα', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(175, '', '', 'Σταυρίνα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(176, '', '', 'Διονύσης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(177, '', '', 'Σταύρος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(178, '', '', 'Σταμάτης', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(179, '', '', 'Ντίνα', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(180, '', '', 'Κοσμάς', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(181, '', '', 'Νίκος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(182, '', '', 'Helene', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(183, '', '', 'Φάνης', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1),
(184, '', '', 'Peter', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1, 1, 1);

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
(99, '2020_06_10_102047_rename_group_to_groupakia', 79),
(100, '2020_06_15_180945_add_exam_year_to_mock_exams_table', 80),
(101, '2020_06_15_181341_add_exam_year_to_real_exams_table', 81),
(102, '2020_06_15_182021_rename_level_to_title', 82),
(103, '2020_06_19_063619_add_expires_at_to_discount_model', 83),
(104, '2020_06_22_090233_add_cancelled_to_history', 84),
(105, '2020_06_22_090424_create_table_absency', 85),
(106, '2020_06_22_140538_create_table_instrument_type', 86),
(107, '2020_06_22_140842_create_musical_instruments', 87),
(108, '2020_06_22_140948_create_university_type', 88),
(109, '2020_06_22_141105_create_university', 89),
(110, '2020_06_22_141225_create_university_department', 90),
(111, '2020_06_22_141352_create_perfectures', 91),
(112, '2020_06_22_141454_add_perfecture_to_town', 92),
(113, '2020_06_22_141546_create_suburbs', 93),
(114, '2020_06_22_141712_add_suburbs_to_buildings', 94),
(115, '2020_06_22_141825_purge_municipality', 95),
(116, '2020_06_22_142052_drop_municipalities', 96),
(117, '2020_06_22_142309_add_addresss_to_members', 97),
(118, '2020_06_22_142641_create_registration_fees', 98),
(119, '2020_06_22_142847_create_student_requests', 99),
(120, '2020_06_22_143143_create_teacher_leave_days', 100),
(121, '2020_06_22_143242_create_class_ranks', 101),
(122, '2020_06_22_143840_add_instrument_to_musical_instruments', 102),
(123, '2020_06_22_144040_create_installments', 103),
(124, '2020_06_22_144736_create_payroll', 104),
(125, '2020_06_22_150010_create_payroll_analysis', 105),
(126, '2020_06_23_174320_create_seminars', 106),
(127, '2020_06_23_174547_create_seminar_categories', 107),
(128, '2020_06_23_174702_bind_seminars_and_categories', 108),
(129, '2020_06_23_174825_create_seminar_modules', 109),
(130, '2020_06_23_175034_create_seminar_groups', 110),
(131, '2020_06_23_175200_create_seminar_teachers', 111),
(132, '2020_06_23_175342_create_seminar_chapters', 112),
(133, '2020_06_23_175507_create_seminar_modules_curriculum', 113),
(135, '2020_06_23_175552_create_seminar_certificates', 114),
(136, '2020_06_23_175843_create_seminar_certificate_modules', 115),
(137, '2020_06_23_180026_create_seminar_certificate_teachers', 116),
(138, '2020_06_24_050319_add_seats_hours_to_seminar_modules', 117),
(139, '2020_06_24_052719_add_num_students_to_groupakia', 118);

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
  `grad_sys_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_year` date NOT NULL DEFAULT '1907-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mock_exams`
--

INSERT INTO `mock_exams` (`id`, `created_at`, `updated_at`, `period_id`, `group_id`, `grad_sys_id`, `title`, `exam_year`) VALUES
(1, '2020-06-01 11:21:41', '2020-06-01 11:21:41', 1, 1, 1, NULL, '1987-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `mock_exams_results_numeric`
--

CREATE TABLE `mock_exams_results_numeric` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grade` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mock_exams_results_numeric`
--

INSERT INTO `mock_exams_results_numeric` (`id`, `created_at`, `updated_at`, `exam_id`, `student_id`, `grade`) VALUES
(1, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 1, 1, '12.00'),
(2, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 1, 2, '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `mock_exams_results_text`
--

CREATE TABLE `mock_exams_results_text` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `text_grade_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mock_exams_results_text`
--

INSERT INTO `mock_exams_results_text` (`id`, `created_at`, `updated_at`, `exam_id`, `student_id`, `text_grade_id`) VALUES
(1, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 1, 1, 1),
(2, '2020-05-28 14:48:19', '2020-05-23 07:13:31', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `musical_instruments`
--

CREATE TABLE `musical_instruments` (
  `id` bigint UNSIGNED NOT NULL,
  `type_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `musical_instruments`
--

INSERT INTO `musical_instruments` (`id`, `type_id`, `created_at`, `updated_at`, `course_id`) VALUES
(1, 1, '2020-06-22 14:39:27', '2020-06-22 14:39:27', 16);

-- --------------------------------------------------------

--
-- Table structure for table `musical_instrument_type`
--

CREATE TABLE `musical_instrument_type` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `musical_instrument_type`
--

INSERT INTO `musical_instrument_type` (`id`, `title`) VALUES
(1, 'Πνευστά'),
(2, 'Έγχορδα');

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
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `gross` decimal(10,2) UNSIGNED NOT NULL,
  `insurances` decimal(10,2) UNSIGNED NOT NULL,
  `total_hours` decimal(10,2) UNSIGNED NOT NULL,
  `net` decimal(10,2) UNSIGNED NOT NULL,
  `month_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `fiscal_year` year NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_analysis`
--

CREATE TABLE `payroll_analysis` (
  `id` bigint UNSIGNED NOT NULL,
  `payroll_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perfectures`
--

CREATE TABLE `perfectures` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perfectures`
--

INSERT INTO `perfectures` (`id`, `title`) VALUES
(1, 'Αττική'),
(2, 'Αχαϊας');

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `title`, `created_at`) VALUES
(1, 'June', '2021-05-05');

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
  `grad_sys_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `exam_year` date NOT NULL DEFAULT '1907-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `real_exams`
--

INSERT INTO `real_exams` (`id`, `created_at`, `updated_at`, `period_id`, `group_id`, `grad_sys_id`, `exam_year`) VALUES
(1, '2020-06-05 16:51:24', '2020-06-05 16:51:24', 1, 1, 1, '1907-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `real_exams_results_numeric`
--

CREATE TABLE `real_exams_results_numeric` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grade` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `real_exams_results_text`
--

CREATE TABLE `real_exams_results_text` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `text_grade_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_fees`
--

CREATE TABLE `registration_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire`
--

CREATE TABLE `review_questionnaire` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `created_at` date NOT NULL,
  `avg_grade` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire_chapters`
--

CREATE TABLE `review_questionnaire_chapters` (
  `id` bigint UNSIGNED NOT NULL,
  `questionnaire_id` bigint UNSIGNED NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `show_order` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire_questions`
--

CREATE TABLE `review_questionnaire_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `questionnaire_id` bigint UNSIGNED NOT NULL,
  `chapter_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='discrete answers 1 to 10';

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire_submission`
--

CREATE TABLE `review_questionnaire_submission` (
  `id` bigint UNSIGNED NOT NULL,
  `questionnaire_id` bigint UNSIGNED NOT NULL,
  `pseudonym` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `avg_grade` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pseudonym is used instead of student_id for anonymity';

-- --------------------------------------------------------

--
-- Table structure for table `review_questions`
--

CREATE TABLE `review_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_submission_answers`
--

CREATE TABLE `review_submission_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `grade` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(5, 'Ibsen', '2020-06-07 15:33:51', '2020-06-07 15:33:51', 2),
(6, 'Δίας', '2020-06-11 08:37:19', '2020-06-11 08:37:19', 2),
(7, 'Ωκεανός', '2020-06-03 05:12:02', '2020-06-03 05:12:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_history`
--

CREATE TABLE `salary_history` (
  `sal_id` int UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `school_classes`
--

CREATE TABLE `school_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_order` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_classes`
--

INSERT INTO `school_classes` (`id`, `title`, `show_order`) VALUES
(1, 'Α\' Λυκείου', 4),
(2, 'Β\' Λυκείου', 5),
(3, 'Γ\' Λυκείου', 6),
(4, 'Α\' Γυμνασίου', 1),
(5, 'Β\' Γυμνασίου', 2),
(6, 'Γ\' Γυμνασίου', 3);

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
-- Table structure for table `seminars`
--

CREATE TABLE `seminars` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seninar_category_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminars`
--

INSERT INTO `seminars` (`id`, `title`, `seninar_category_id`) VALUES
(1, 'Java', 1),
(2, 'React.js', 2);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_categories`
--

CREATE TABLE `seminar_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_categories`
--

INSERT INTO `seminar_categories` (`id`, `title`, `active`) VALUES
(1, 'Databases', 1),
(2, 'Front-end', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_certificates`
--

CREATE TABLE `seminar_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `successful` tinyint(1) NOT NULL DEFAULT '1',
  `valid_untlil` datetime NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grade` decimal(5,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_certificate_modules`
--

CREATE TABLE `seminar_certificate_modules` (
  `id` bigint UNSIGNED NOT NULL,
  `certificate_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `module_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `grade` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_certificate_teachers`
--

CREATE TABLE `seminar_certificate_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `certificate_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `singed_teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_chapters`
--

CREATE TABLE `seminar_chapters` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `show_order` tinyint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_groups`
--

CREATE TABLE `seminar_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_groups`
--

INSERT INTO `seminar_groups` (`id`, `module_id`, `group_id`) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_modules`
--

CREATE TABLE `seminar_modules` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `part_time` tinyint(1) NOT NULL DEFAULT '1',
  `on_site` tinyint(1) NOT NULL DEFAULT '1',
  `cost` decimal(10,2) UNSIGNED NOT NULL,
  `starts` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `seninar_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `max_seats` tinyint UNSIGNED NOT NULL DEFAULT '15',
  `total_hours` smallint UNSIGNED NOT NULL DEFAULT '50',
  `cost_per_hour` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_modules`
--

INSERT INTO `seminar_modules` (`id`, `title`, `active`, `part_time`, `on_site`, `cost`, `starts`, `ends`, `seninar_id`, `max_seats`, `total_hours`, `cost_per_hour`) VALUES
(1, 'Hibernate', 1, 0, 1, '1500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 1, 15, 50, '0.00'),
(2, 'Redux', 1, 0, 1, '1100.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 2, 15, 50, '0.00'),
(3, 'Flux', 1, 0, 1, '500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 2, 15, 50, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_modules_curriculum`
--

CREATE TABLE `seminar_modules_curriculum` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `show_order` tinyint UNSIGNED NOT NULL,
  `chapter_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_teachers`
--

CREATE TABLE `seminar_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2020-06-03 05:21:22', '2020-06-03 05:21:22', 2, '90.00', 1, 1, 2019),
(3, '2020-05-28 14:48:19', '2020-05-22 07:19:53', 1, '90.00', 3, 1, 2019);

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
(1, '2020-05-28', 1, '50.00', 1, 10, 2019),
(2, '2020-07-28', 1, '20.00', 1, 10, 2019),
(3, '2020-07-28', 2, '20.00', 1, 10, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `student_progress_book`
--

CREATE TABLE `student_progress_book` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_requests`
--

CREATE TABLE `student_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `fulfilled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suburbs`
--

CREATE TABLE `suburbs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `town_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suburbs`
--

INSERT INTO `suburbs` (`id`, `title`, `town_id`) VALUES
(1, 'Χολαργός', 1),
(2, 'Καλλιθέα', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_absency`
--

CREATE TABLE `table_absency` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `history_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `justified` tinyint(1) NOT NULL DEFAULT '0',
  `comments` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `amka` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `afm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_salary` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `member_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `amka`, `afm`, `current_salary`, `created_at`, `updated_at`, `member_id`) VALUES
(1, '', '', '0.00', '2020-06-04 13:47:45', '2020-06-04 13:47:45', 1),
(2, '', '', '0.00', '2020-06-07 15:04:04', '2020-06-07 15:04:04', 2);

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
  `lesson_year` year NOT NULL,
  `year` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher_debts`
--

INSERT INTO `teacher_debts` (`id`, `created_at`, `updated_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`, `year`) VALUES
(1, '2020-05-28 14:48:19', '2020-05-28 14:48:19', 1, '120.00', 1, 10, 2019, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_leave_days`
--

CREATE TABLE `teacher_leave_days` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `starting` datetime NOT NULL,
  `ending` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_payments`
--

CREATE TABLE `teacher_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `month_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `lesson_year` year NOT NULL,
  `year` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher_payments`
--

INSERT INTO `teacher_payments` (`id`, `created_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`, `year`) VALUES
(1, '2020-05-28 14:48:19', 1, '210.00', 1, 10, 2019, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `perfecture_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`id`, `title`, `perfecture_id`) VALUES
(1, 'Athens', 1);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`id`, `title`, `type_id`) VALUES
(1, 'Πατρών', 1),
(2, 'Αιγαίου', 1);

-- --------------------------------------------------------

--
-- Table structure for table `university_department`
--

CREATE TABLE `university_department` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `univ_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `university_department`
--

INSERT INTO `university_department` (`id`, `title`, `univ_id`, `active`) VALUES
(1, 'HMTY', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `university_type`
--

CREATE TABLE `university_type` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `university_type`
--

INSERT INTO `university_type` (`id`, `title`) VALUES
(1, 'AEI'),
(2, 'TEI');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absencies`
--
ALTER TABLE `absencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_id` (`history_id`),
  ADD KEY `student_id` (`student_id`);

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
  ADD KEY `buildings_suburb_id_foreign` (`suburb_id`);

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
-- Indexes for table `course_grades`
--
ALTER TABLE `course_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diploma_grades_diploma_id_foreign` (`course_id`);

--
-- Indexes for table `course_ranks`
--
ALTER TABLE `course_ranks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rank_combo` (`title`,`rank`,`course_id`),
  ADD KEY `course_ranks_course_id_foreign` (`course_id`);

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
  ADD KEY `groups_age_id_foreign` (`age_id`),
  ADD KEY `groups_fee_id_foreign` (`fee_id`),
  ADD KEY `groups_wage_id_foreign` (`wage_id`),
  ADD KEY `groups_course_id_foreign` (`course_id`),
  ADD KEY `FKat205al2gpkgh81q73blgn0r5` (`speed_id`);

--
-- Indexes for table `groups_extra_teachers`
--
ALTER TABLE `groups_extra_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_2` (`group_id`,`teacher_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `teacher_id` (`teacher_id`);

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
  ADD KEY `history_hour_id_foreign` (`hour_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `installments_student_id_foreign` (`student_id`);

--
-- Indexes for table `instituts`
--
ALTER TABLE `instituts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interviews_grading`
--
ALTER TABLE `interviews_grading`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stage_id` (`stage_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `interview_stages`
--
ALTER TABLE `interview_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opening_id` (`opening_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opening_id` (`opening_id`);

--
-- Indexes for table `job_application_courses`
--
ALTER TABLE `job_application_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `job_openings`
--
ALTER TABLE `job_openings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_opening_courses`
--
ALTER TABLE `job_opening_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opening_id` (`opening_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `job_opening_studies`
--
ALTER TABLE `job_opening_studies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `job_opening_work`
--
ALTER TABLE `job_opening_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_id` (`history_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_suburb_id_foreign` (`suburb_id`),
  ADD KEY `members_town_id_foreign` (`town_id`),
  ADD KEY `members_perfecture_id_foreign` (`perfecture_id`);

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
-- Indexes for table `mock_exams_results_numeric`
--
ALTER TABLE `mock_exams_results_numeric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mock_exams_results_student_id_foreign` (`student_id`),
  ADD KEY `FK5tdvp8dhxiqcvg9pua2j3rb03` (`exam_id`);

--
-- Indexes for table `mock_exams_results_text`
--
ALTER TABLE `mock_exams_results_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mock_exams_results_student_id_foreign` (`student_id`),
  ADD KEY `mock_exams_results_text_grade_id_foreign` (`text_grade_id`),
  ADD KEY `FK5tdvp8dhxiqcvg9pua2j3rb03` (`exam_id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `musical_instruments`
--
ALTER TABLE `musical_instruments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musical_instruments_type_id_foreign` (`type_id`),
  ADD KEY `musical_instruments_course_id_foreign` (`course_id`);

--
-- Indexes for table `musical_instrument_type`
--
ALTER TABLE `musical_instrument_type`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_teacher_id_foreign` (`teacher_id`),
  ADD KEY `payroll_month_id_foreign` (`month_id`);

--
-- Indexes for table `payroll_analysis`
--
ALTER TABLE `payroll_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_analysis_payroll_id_foreign` (`payroll_id`),
  ADD KEY `payroll_analysis_group_id_foreign` (`group_id`);

--
-- Indexes for table `perfectures`
--
ALTER TABLE `perfectures`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `real_exams_results_numeric`
--
ALTER TABLE `real_exams_results_numeric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `real_exams_results_exam_id_foreign` (`exam_id`),
  ADD KEY `real_exams_results_student_id_foreign` (`student_id`);

--
-- Indexes for table `real_exams_results_text`
--
ALTER TABLE `real_exams_results_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `real_exams_results_exam_id_foreign` (`exam_id`),
  ADD KEY `real_exams_results_student_id_foreign` (`student_id`),
  ADD KEY `real_exams_results_text_grade_id_foreign` (`text_grade_id`);

--
-- Indexes for table `registration_fees`
--
ALTER TABLE `registration_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_fees_group_id_foreign` (`group_id`),
  ADD KEY `registration_fees_student_id_foreign` (`student_id`);

--
-- Indexes for table `review_questionnaire`
--
ALTER TABLE `review_questionnaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `review_questionnaire_chapters`
--
ALTER TABLE `review_questionnaire_chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionnaire_id` (`questionnaire_id`);

--
-- Indexes for table `review_questionnaire_questions`
--
ALTER TABLE `review_questionnaire_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionnaire_id` (`questionnaire_id`),
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `review_questionnaire_submission`
--
ALTER TABLE `review_questionnaire_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionnaire_id` (`questionnaire_id`);

--
-- Indexes for table `review_questions`
--
ALTER TABLE `review_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_submission_answers`
--
ALTER TABLE `review_submission_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `submission_id_2` (`submission_id`,`question_id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `question_id_2` (`question_id`);

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
-- Indexes for table `salary_history`
--
ALTER TABLE `salary_history`
  ADD PRIMARY KEY (`sal_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `school_classes`
--
ALTER TABLE `school_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `show_order` (`show_order`);

--
-- Indexes for table `school_courses`
--
ALTER TABLE `school_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_courses_course_id_foreign` (`course_id`),
  ADD KEY `school_courses_school_class_id_foreign` (`school_class_id`),
  ADD KEY `school_courses_discipline_id_foreign` (`discipline_id`);

--
-- Indexes for table `seminars`
--
ALTER TABLE `seminars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminars_seninar_category_id_foreign` (`seninar_category_id`);

--
-- Indexes for table `seminar_categories`
--
ALTER TABLE `seminar_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seminar_certificates`
--
ALTER TABLE `seminar_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_certificates_student_id_foreign` (`student_id`);

--
-- Indexes for table `seminar_certificate_modules`
--
ALTER TABLE `seminar_certificate_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_certificate_modules_certificate_id_foreign` (`certificate_id`),
  ADD KEY `seminar_certificate_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `seminar_certificate_teachers`
--
ALTER TABLE `seminar_certificate_teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_certificate_teachers_certificate_id_foreign` (`certificate_id`),
  ADD KEY `seminar_certificate_teachers_singed_teacher_id_foreign` (`singed_teacher_id`);

--
-- Indexes for table `seminar_chapters`
--
ALTER TABLE `seminar_chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_chapters_module_id_foreign` (`module_id`);

--
-- Indexes for table `seminar_groups`
--
ALTER TABLE `seminar_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_groups_module_id_foreign` (`module_id`),
  ADD KEY `seminar_groups_group_id_foreign` (`group_id`);

--
-- Indexes for table `seminar_modules`
--
ALTER TABLE `seminar_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_modules_seninar_id_foreign` (`seninar_id`);

--
-- Indexes for table `seminar_modules_curriculum`
--
ALTER TABLE `seminar_modules_curriculum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_modules_curriculum_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `seminar_teachers`
--
ALTER TABLE `seminar_teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_teachers_module_id_foreign` (`module_id`),
  ADD KEY `seminar_teachers_teacher_id_foreign` (`teacher_id`);

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
-- Indexes for table `student_requests`
--
ALTER TABLE `student_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_requests_course_id_foreign` (`course_id`),
  ADD KEY `student_requests_student_id_foreign` (`student_id`);

--
-- Indexes for table `suburbs`
--
ALTER TABLE `suburbs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suburbs_town_id_foreign` (`town_id`);

--
-- Indexes for table `table_absency`
--
ALTER TABLE `table_absency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_absency_student_id_foreign` (`student_id`),
  ADD KEY `table_absency_history_id_foreign` (`history_id`);

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
-- Indexes for table `teacher_leave_days`
--
ALTER TABLE `teacher_leave_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_leave_days_teacher_id_foreign` (`teacher_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `towns_perfecture_id_foreign` (`perfecture_id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`),
  ADD KEY `university_type_id_foreign` (`type_id`);

--
-- Indexes for table `university_department`
--
ALTER TABLE `university_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `university_department_univ_id_foreign` (`univ_id`);

--
-- Indexes for table `university_type`
--
ALTER TABLE `university_type`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
-- AUTO_INCREMENT for table `course_grades`
--
ALTER TABLE `course_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_ranks`
--
ALTER TABLE `course_ranks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_type`
--
ALTER TABLE `course_type`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_wages`
--
ALTER TABLE `course_wages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diplomas`
--
ALTER TABLE `diplomas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups_extra_teachers`
--
ALTER TABLE `groups_extra_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_students`
--
ALTER TABLE `group_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instituts`
--
ALTER TABLE `instituts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interviews_grading`
--
ALTER TABLE `interviews_grading`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_stages`
--
ALTER TABLE `interview_stages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_application_courses`
--
ALTER TABLE `job_application_courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_openings`
--
ALTER TABLE `job_openings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_opening_courses`
--
ALTER TABLE `job_opening_courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_opening_studies`
--
ALTER TABLE `job_opening_studies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_opening_work`
--
ALTER TABLE `job_opening_work`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `logbook`
--
ALTER TABLE `logbook`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `mock_exams`
--
ALTER TABLE `mock_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mock_exams_results_numeric`
--
ALTER TABLE `mock_exams_results_numeric`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mock_exams_results_text`
--
ALTER TABLE `mock_exams_results_text`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `musical_instruments`
--
ALTER TABLE `musical_instruments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `musical_instrument_type`
--
ALTER TABLE `musical_instrument_type`
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
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_analysis`
--
ALTER TABLE `payroll_analysis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perfectures`
--
ALTER TABLE `perfectures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `real_exams_results_numeric`
--
ALTER TABLE `real_exams_results_numeric`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real_exams_results_text`
--
ALTER TABLE `real_exams_results_text`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration_fees`
--
ALTER TABLE `registration_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_questionnaire`
--
ALTER TABLE `review_questionnaire`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_questionnaire_chapters`
--
ALTER TABLE `review_questionnaire_chapters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_questionnaire_questions`
--
ALTER TABLE `review_questionnaire_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_questionnaire_submission`
--
ALTER TABLE `review_questionnaire_submission`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_questions`
--
ALTER TABLE `review_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_submission_answers`
--
ALTER TABLE `review_submission_answers`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salary_history`
--
ALTER TABLE `salary_history`
  MODIFY `sal_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_classes`
--
ALTER TABLE `school_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `school_courses`
--
ALTER TABLE `school_courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminars`
--
ALTER TABLE `seminars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminar_categories`
--
ALTER TABLE `seminar_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminar_certificates`
--
ALTER TABLE `seminar_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_certificate_modules`
--
ALTER TABLE `seminar_certificate_modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_certificate_teachers`
--
ALTER TABLE `seminar_certificate_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_chapters`
--
ALTER TABLE `seminar_chapters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_groups`
--
ALTER TABLE `seminar_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seminar_modules`
--
ALTER TABLE `seminar_modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seminar_modules_curriculum`
--
ALTER TABLE `seminar_modules_curriculum`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_teachers`
--
ALTER TABLE `seminar_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_payed`
--
ALTER TABLE `student_payed`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_progress_book`
--
ALTER TABLE `student_progress_book`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_requests`
--
ALTER TABLE `student_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suburbs`
--
ALTER TABLE `suburbs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_absency`
--
ALTER TABLE `table_absency`
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
-- AUTO_INCREMENT for table `teacher_leave_days`
--
ALTER TABLE `teacher_leave_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `university_department`
--
ALTER TABLE `university_department`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `university_type`
--
ALTER TABLE `university_type`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absencies`
--
ALTER TABLE `absencies`
  ADD CONSTRAINT `absencies_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `absencies_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_suburb_id_foreign` FOREIGN KEY (`suburb_id`) REFERENCES `suburbs` (`id`);

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
-- Constraints for table `course_grades`
--
ALTER TABLE `course_grades`
  ADD CONSTRAINT `diploma_grades_diploma_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `course_ranks`
--
ALTER TABLE `course_ranks`
  ADD CONSTRAINT `course_ranks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

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
  ADD CONSTRAINT `FKat205al2gpkgh81q73blgn0r5` FOREIGN KEY (`speed_id`) REFERENCES `school_classes` (`id`),
  ADD CONSTRAINT `groups_age_id_foreign` FOREIGN KEY (`age_id`) REFERENCES `ages` (`id`),
  ADD CONSTRAINT `groups_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `groups_fee_id_foreign` FOREIGN KEY (`fee_id`) REFERENCES `course_fees` (`id`),
  ADD CONSTRAINT `groups_speed_id_foreign` FOREIGN KEY (`speed_id`) REFERENCES `speeds` (`id`),
  ADD CONSTRAINT `groups_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `groups_wage_id_foreign` FOREIGN KEY (`wage_id`) REFERENCES `course_wages` (`id`);

--
-- Constraints for table `groups_extra_teachers`
--
ALTER TABLE `groups_extra_teachers`
  ADD CONSTRAINT `groups_extra_teachers_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `groups_extra_teachers_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `history_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `interviews_grading`
--
ALTER TABLE `interviews_grading`
  ADD CONSTRAINT `interviews_grading_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `interviews_grading_ibfk_2` FOREIGN KEY (`stage_id`) REFERENCES `interview_stages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `interview_stages`
--
ALTER TABLE `interview_stages`
  ADD CONSTRAINT `interview_stages_ibfk_1` FOREIGN KEY (`opening_id`) REFERENCES `job_openings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `job_application_courses`
--
ALTER TABLE `job_application_courses`
  ADD CONSTRAINT `job_application_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `job_application_courses_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `job_opening_courses`
--
ALTER TABLE `job_opening_courses`
  ADD CONSTRAINT `job_opening_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `job_opening_courses_ibfk_2` FOREIGN KEY (`opening_id`) REFERENCES `job_openings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `job_opening_studies`
--
ALTER TABLE `job_opening_studies`
  ADD CONSTRAINT `job_opening_studies_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `logbook`
--
ALTER TABLE `logbook`
  ADD CONSTRAINT `logbook_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `logbook_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_perfecture_id_foreign` FOREIGN KEY (`perfecture_id`) REFERENCES `perfectures` (`id`),
  ADD CONSTRAINT `members_suburb_id_foreign` FOREIGN KEY (`suburb_id`) REFERENCES `suburbs` (`id`),
  ADD CONSTRAINT `members_town_id_foreign` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);

--
-- Constraints for table `mock_exams`
--
ALTER TABLE `mock_exams`
  ADD CONSTRAINT `mock_exams_grad_sys_id_foreign` FOREIGN KEY (`grad_sys_id`) REFERENCES `grading_sys` (`id`),
  ADD CONSTRAINT `mock_exams_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `mock_exams_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`);

--
-- Constraints for table `mock_exams_results_numeric`
--
ALTER TABLE `mock_exams_results_numeric`
  ADD CONSTRAINT `FK5tdvp8dhxiqcvg9pua2j3rb03` FOREIGN KEY (`exam_id`) REFERENCES `real_exams` (`id`),
  ADD CONSTRAINT `mock_exams_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `mock_exams` (`id`),
  ADD CONSTRAINT `mock_exams_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `musical_instruments`
--
ALTER TABLE `musical_instruments`
  ADD CONSTRAINT `musical_instruments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `musical_instruments_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `musical_instrument_type` (`id`);

--
-- Constraints for table `parents_children`
--
ALTER TABLE `parents_children`
  ADD CONSTRAINT `parents_children_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `parents_children_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `payroll_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `payroll_analysis`
--
ALTER TABLE `payroll_analysis`
  ADD CONSTRAINT `payroll_analysis_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `payroll_analysis_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`id`);

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
-- Constraints for table `real_exams_results_numeric`
--
ALTER TABLE `real_exams_results_numeric`
  ADD CONSTRAINT `real_exams_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `real_exams` (`id`),
  ADD CONSTRAINT `real_exams_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `registration_fees`
--
ALTER TABLE `registration_fees`
  ADD CONSTRAINT `registration_fees_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `registration_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `review_questionnaire`
--
ALTER TABLE `review_questionnaire`
  ADD CONSTRAINT `review_questionnaire_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `review_questionnaire_chapters`
--
ALTER TABLE `review_questionnaire_chapters`
  ADD CONSTRAINT `review_questionnaire_chapters_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `review_questionnaire` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `review_questionnaire_questions`
--
ALTER TABLE `review_questionnaire_questions`
  ADD CONSTRAINT `review_questionnaire_questions_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `review_questionnaire_chapters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_questionnaire_questions_ibfk_2` FOREIGN KEY (`questionnaire_id`) REFERENCES `review_questionnaire` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_questionnaire_questions_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `review_questionnaire_questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `review_questionnaire_submission`
--
ALTER TABLE `review_questionnaire_submission`
  ADD CONSTRAINT `review_questionnaire_submission_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `review_questionnaire` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `review_submission_answers`
--
ALTER TABLE `review_submission_answers`
  ADD CONSTRAINT `review_submission_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `review_questionnaire_questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_submission_answers_ibfk_2` FOREIGN KEY (`submission_id`) REFERENCES `review_questionnaire_submission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `salary_history`
--
ALTER TABLE `salary_history`
  ADD CONSTRAINT `salary_history_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teaches` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `school_courses`
--
ALTER TABLE `school_courses`
  ADD CONSTRAINT `school_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `school_courses_discipline_id_foreign` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`),
  ADD CONSTRAINT `school_courses_school_class_id_foreign` FOREIGN KEY (`school_class_id`) REFERENCES `school_classes` (`id`);

--
-- Constraints for table `seminars`
--
ALTER TABLE `seminars`
  ADD CONSTRAINT `seminars_seninar_category_id_foreign` FOREIGN KEY (`seninar_category_id`) REFERENCES `seminar_categories` (`id`);

--
-- Constraints for table `seminar_certificates`
--
ALTER TABLE `seminar_certificates`
  ADD CONSTRAINT `seminar_certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `seminar_certificate_modules`
--
ALTER TABLE `seminar_certificate_modules`
  ADD CONSTRAINT `seminar_certificate_modules_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `seminar_certificates` (`id`),
  ADD CONSTRAINT `seminar_certificate_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `seminar_modules` (`id`);

--
-- Constraints for table `seminar_certificate_teachers`
--
ALTER TABLE `seminar_certificate_teachers`
  ADD CONSTRAINT `seminar_certificate_teachers_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `seminar_certificates` (`id`),
  ADD CONSTRAINT `seminar_certificate_teachers_singed_teacher_id_foreign` FOREIGN KEY (`singed_teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `seminar_chapters`
--
ALTER TABLE `seminar_chapters`
  ADD CONSTRAINT `seminar_chapters_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `seminar_modules` (`id`);

--
-- Constraints for table `seminar_groups`
--
ALTER TABLE `seminar_groups`
  ADD CONSTRAINT `seminar_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `seminar_groups_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `seminar_modules` (`id`);

--
-- Constraints for table `seminar_modules`
--
ALTER TABLE `seminar_modules`
  ADD CONSTRAINT `seminar_modules_seninar_id_foreign` FOREIGN KEY (`seninar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_modules_curriculum`
--
ALTER TABLE `seminar_modules_curriculum`
  ADD CONSTRAINT `seminar_modules_curriculum_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `seminar_chapters` (`id`);

--
-- Constraints for table `seminar_teachers`
--
ALTER TABLE `seminar_teachers`
  ADD CONSTRAINT `seminar_teachers_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `seminar_modules` (`id`),
  ADD CONSTRAINT `seminar_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

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
-- Constraints for table `student_requests`
--
ALTER TABLE `student_requests`
  ADD CONSTRAINT `student_requests_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `student_requests_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `suburbs`
--
ALTER TABLE `suburbs`
  ADD CONSTRAINT `suburbs_town_id_foreign` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);

--
-- Constraints for table `table_absency`
--
ALTER TABLE `table_absency`
  ADD CONSTRAINT `table_absency_history_id_foreign` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`),
  ADD CONSTRAINT `table_absency_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

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
-- Constraints for table `teacher_leave_days`
--
ALTER TABLE `teacher_leave_days`
  ADD CONSTRAINT `teacher_leave_days_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

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

--
-- Constraints for table `towns`
--
ALTER TABLE `towns`
  ADD CONSTRAINT `towns_perfecture_id_foreign` FOREIGN KEY (`perfecture_id`) REFERENCES `perfectures` (`id`);

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `university_type` (`id`);

--
-- Constraints for table `university_department`
--
ALTER TABLE `university_department`
  ADD CONSTRAINT `university_department_univ_id_foreign` FOREIGN KEY (`univ_id`) REFERENCES `university` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
