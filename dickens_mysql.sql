-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2020 at 03:44 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.12

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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_group_students` (IN `groupId` BIGINT)  BEGIN
SELECT gs.student_id , gs.joined,gs.dropped, m.name,
gs.total_payed AS hasPayed, gs.total_debt AS remainingDebt  
FROM group_students gs  
JOIN students s ON s.id = gs.student_id  
JOIN members m ON m.id = s.member_id  
WHERE gs.group_id = groupId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_timetable` (IN `studentId` BIGINT, IN `fromDate` DATETIME, IN `toDate` DATETIME)  BEGIN
SELECT hs.id AS histId,gr.id AS groupId ,uhr.id AS uhrId, 
crs.title AS courseTitle ,ag.title AS ageTitle ,
spd.title AS speedTitle ,hs.started ,hs.duration, 
rm.title AS roomTitle, hs.cancelled, hs.wage, hs.fee
FROM history hs
JOIN groupakia gr ON gr.id= hs.group_id
JOIN rooms rm ON rm.id = hs.room_id
JOIN hours uhr ON uhr.id =hs.hour_id
JOIN ages ag ON ag.id = gr.age_id
JOIN speeds spd ON spd.id = gr.speed_id
JOIN courses crs ON crs.id = gr.course_id
JOIN group_students grst ON grst.group_id = gr.id
WHERE grst.student_id = studentId
AND hs.started >= fromDate
AND hs.started <= toDate 
ORDER BY hs.started ASC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `absencies`
--

CREATE TABLE `absencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `history_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `justified` tinyint(3) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `absencies`
--

INSERT INTO `absencies` (`id`, `history_id`, `student_id`, `justified`) VALUES
(1, 3, 1, 0),
(2, 8, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ages`
--

CREATE TABLE `ages` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `title`, `active`) VALUES
(1, 'Eurobank', 1),
(2, 'AlphaBank', 1),
(3, 'Πειραιώς', 1),
(4, 'Μετρητά', 1),
(5, 'Paypal', 1),
(6, 'Εθνική', 1);

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `suburb_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `course_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
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
(13, 'Svenska for Anfanger', 1, 2),
(14, 'Πάλσο', 1, 2),
(15, 'Αρχαια Ελληνικά', 1, 1),
(16, 'Τρομπόνι', 1, 4),
(17, 'Σεμινάρια', 1, 5),
(22, 'Sorbonne I', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses_fees_history`
--

CREATE TABLE `courses_fees_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courses_wages_history`
--

CREATE TABLE `courses_wages_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses_wages_history`
--

INSERT INTO `courses_wages_history` (`id`, `amount`, `course_id`, `created_at`) VALUES
(1, '12.00', 1, '2020-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `course_fees`
--

CREATE TABLE `course_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_fees`
--

INSERT INTO `course_fees` (`id`, `amount`, `created_at`, `updated_at`, `course_id`) VALUES
(1, '15.00', '2020-06-05 17:42:27', '2020-06-05 17:42:27', 1),
(2, '22.00', '2020-06-07 15:05:00', '2020-06-07 15:05:00', 13),
(3, '15.00', '2020-06-05 17:42:27', '2020-06-05 17:42:27', 12),
(4, '18.00', '2020-06-05 17:42:27', '2020-06-05 17:42:27', 15),
(5, '15.00', '2020-08-09 09:07:08', '2020-08-09 09:07:08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `course_grades`
--

CREATE TABLE `course_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `rankiing` tinyint(3) UNSIGNED NOT NULL COMMENT 'from bad to worse'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_grades`
--

INSERT INTO `course_grades` (`id`, `grade_title`, `course_id`, `rankiing`) VALUES
(1, 'Sehr Gut', 2, 2),
(2, 'Gut', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_type`
--

CREATE TABLE `course_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_wages`
--

INSERT INTO `course_wages` (`id`, `amount`, `created_at`, `updated_at`, `course_id`) VALUES
(1, '5.20', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 1),
(2, '7.20', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 13),
(3, '7.20', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 12),
(4, '10.00', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 15),
(5, '9.00', '2020-06-05 17:43:46', '2020-06-05 17:43:46', 2);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `name`) VALUES
(6, 'Friday'),
(2, 'Monday'),
(7, 'Saturday'),
(1, 'Sunday'),
(5, 'Thursday'),
(3, 'Tuesday'),
(4, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `diplomas`
--

CREATE TABLE `diplomas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `institut_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diplomas`
--

INSERT INTO `diplomas` (`id`, `active`, `created_at`, `level`, `language_id`, `course_id`, `institut_id`) VALUES
(1, 1, '2020-06-01 14:22:22', 'B1', 1, 3, 1),
(2, 1, '2020-06-02 14:27:40', 'B2', 2, 9, 1),
(4, 1, '2020-06-07 05:19:54', 'C1', 4, 5, 5),
(5, 1, '2020-05-28 14:48:19', 'B1', 7, 13, 1),
(6, 0, '2020-06-01 09:44:09', 'Α2', 1, 14, 2),
(7, 1, '2020-06-01 14:22:22', 'B1', 2, 1, 1),
(8, 1, '2020-06-01 09:56:29', 'C2', 1, 4, 2),
(9, 1, '2020-07-16 06:16:26', 'C1', 1, 22, 4);

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `discount_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `student_id`, `discount_id`, `group_id`, `active`, `created_at`, `updated_at`) VALUES
(1, 178, 1, 7, 1, '2019-07-01 15:10:09', '2019-07-01 15:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `discount_model`
--

CREATE TABLE `discount_model` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount_model`
--

INSERT INTO `discount_model` (`id`, `title`, `percentage`, `active`, `created_at`, `updated_at`, `expires_at`) VALUES
(1, 'Πολύτεκνοι', 14.00, 1, '2019-07-01 15:10:09', '2019-07-01 15:10:09', '2020-09-01 18:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `grading_sys`
--

CREATE TABLE `grading_sys` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ends_at` datetime NOT NULL DEFAULT '2020-09-01 00:00:00',
  `speed_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `age_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `rank_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `fee_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `wage_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `max_seats` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `remaining_seats` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `num_students` tinyint(3) UNSIGNED NOT NULL DEFAULT 8
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupakia`
--

INSERT INTO `groupakia` (`id`, `title`, `active`, `created_at`, `updated_at`, `ends_at`, `speed_id`, `age_id`, `rank_id`, `fee_id`, `wage_id`, `course_id`, `max_seats`, `remaining_seats`, `num_students`) VALUES
(1, 'Latin', 1, '2019-09-03 13:48:24', '2019-09-03 13:48:24', '2020-09-01 00:00:00', 1, 2, 1, 3, 1, 12, 10, 2, 8),
(2, 'Svenska Anfanger', 1, '2019-08-20 07:00:00', '2019-08-20 07:00:00', '2020-09-01 00:00:00', 2, 3, 1, 2, 2, 13, 10, 2, 8),
(3, 'Greek Ancient', 1, '2019-09-03 13:48:24', '2020-05-28 14:48:19', '2020-09-01 00:00:00', 1, 2, 1, 4, 1, 15, 10, 2, 8),
(4, 'Java Hibernate full time', 1, '2020-06-10 05:07:49', '2020-06-10 05:07:49', '2020-09-01 00:00:00', 1, 3, 1, 1, 1, 17, 10, 2, 8),
(5, 'React State Management', 1, '2020-06-04 05:10:26', '2020-06-04 05:10:26', '2020-09-01 00:00:00', 1, 3, 1, 1, 1, 17, 10, 2, 8),
(6, 'Test', 1, '2020-07-15 05:51:17', '2020-07-15 05:51:17', '2020-07-15 08:51:17', 1, 1, 1, 1, 1, 1, 0, 0, 0),
(7, 'Μαθηματικά ΓΛΥΚ', 1, '2019-08-01 09:07:49', '2019-08-01 09:07:49', '2020-09-01 12:07:49', 1, 2, 1, 5, 1, 2, 10, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `groups_teachers`
--

CREATE TABLE `groups_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `wage` decimal(10,2) UNSIGNED NOT NULL DEFAULT 5.67
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups_teachers`
--

INSERT INTO `groups_teachers` (`id`, `group_id`, `teacher_id`, `wage`) VALUES
(1, 1, 1, '5.67'),
(2, 2, 2, '5.67'),
(3, 3, 1, '5.67'),
(4, 4, 2, '5.67'),
(5, 5, 2, '5.67'),
(6, 7, 2, '5.67');

-- --------------------------------------------------------

--
-- Table structure for table `groups_teachers_wages_history`
--

CREATE TABLE `groups_teachers_wages_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `wage` decimal(10,2) UNSIGNED NOT NULL DEFAULT 5.67,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups_teachers_wages_history`
--

INSERT INTO `groups_teachers_wages_history` (`id`, `group_id`, `teacher_id`, `wage`, `created_at`) VALUES
(1, 1, 1, '5.67', '2020-07-15 12:18:11'),
(2, 2, 2, '5.67', '2020-07-15 12:18:11'),
(3, 3, 1, '5.67', '2020-07-15 12:18:11'),
(4, 4, 2, '5.67', '2020-07-15 12:18:11'),
(5, 5, 2, '5.67', '2020-07-15 12:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `group_ranks`
--

CREATE TABLE `group_ranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_ranks`
--

INSERT INTO `group_ranks` (`id`, `title`, `rank`) VALUES
(1, '-', 1),
(2, 'Α Κατωτέρα', 2),
(3, 'Προκαταρκτική Α', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_students`
--

CREATE TABLE `group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `joined` datetime NOT NULL,
  `dropped` datetime NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `total_payed` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `total_debt` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_students`
--

INSERT INTO `group_students` (`id`, `joined`, `dropped`, `group_id`, `student_id`, `total_payed`, `total_debt`) VALUES
(1, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 1, '70.00', '135.00'),
(2, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 2, '20.00', '135.00'),
(3, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 3, '0.00', '135.00'),
(4, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 4, '0.00', '135.00'),
(5, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 5, '0.00', '135.00'),
(6, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 6, '0.00', '135.00'),
(7, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 7, '0.00', '135.00'),
(8, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 8, '0.00', '135.00'),
(9, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 1, 9, '0.00', '135.00'),
(10, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 2, 11, '0.00', '55.50'),
(11, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 2, 12, '0.00', '55.50'),
(12, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 2, 13, '0.00', '55.50'),
(13, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 2, 14, '0.00', '55.50'),
(14, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 2, 15, '0.00', '55.50'),
(15, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 3, 1, '0.00', '162.00'),
(16, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 4, 15, '0.00', '22.50'),
(17, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 5, 13, '0.00', '0.00'),
(18, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 3, 2, '0.00', '162.00'),
(19, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 3, 3, '0.00', '162.00'),
(20, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 3, 4, '0.00', '162.00'),
(21, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 3, 5, '0.00', '162.00'),
(22, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 3, 6, '0.00', '162.00'),
(23, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 4, 24, '0.00', '22.50'),
(24, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 4, 23, '0.00', '22.50'),
(25, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 4, 20, '0.00', '22.50'),
(27, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 4, 14, '0.00', '22.50'),
(28, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 2, 1, '0.00', '55.50'),
(29, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 180, '0.00', '352.50'),
(30, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 178, '0.00', '352.50'),
(31, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 179, '0.00', '352.50'),
(32, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 181, '0.00', '352.50'),
(33, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 182, '0.00', '352.50'),
(34, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 183, '0.00', '352.50'),
(35, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 184, '0.00', '352.50'),
(36, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 185, '0.00', '352.50'),
(37, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 186, '0.00', '352.50'),
(38, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 187, '0.00', '352.50'),
(39, '2019-08-28 10:00:00', '2020-07-07 17:41:09', 7, 188, '0.00', '352.50');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wage` decimal(10,2) UNSIGNED NOT NULL DEFAULT 6.78,
  `fee` decimal(8,2) NOT NULL,
  `vat` decimal(8,2) NOT NULL,
  `started` datetime NOT NULL,
  `ended` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `room_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `hour_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `duration` double NOT NULL COMMENT 'in hours',
  `cancelled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `wage`, `fee`, `vat`, `started`, `ended`, `created_at`, `updated_at`, `group_id`, `teacher_id`, `room_id`, `hour_id`, `duration`, `cancelled`) VALUES
(1, '6.78', '15.00', '3.00', '2019-09-01 10:00:00', '2019-09-01 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 1, 4, 1.5, 0),
(2, '6.78', '15.00', '3.00', '2019-09-06 10:00:00', '2019-09-06 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 1, 4, 1.5, 0),
(3, '6.78', '15.00', '3.00', '2019-09-12 17:00:00', '2019-09-12 18:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 2, 18, 1.5, 0),
(4, '6.78', '15.00', '3.00', '2019-09-21 10:00:00', '2019-09-21 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 6, 4, 1.5, 0),
(5, '6.78', '15.00', '3.00', '2019-09-24 18:00:00', '2019-09-24 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 2, 18, 1.5, 0),
(6, '6.78', '15.00', '3.00', '2019-09-30 18:30:00', '2019-09-30 20:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 2, 21, 1.5, 0),
(7, '6.78', '15.00', '3.00', '2019-10-03 18:30:00', '2019-10-03 20:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 1, 1, 2, 21, 1.5, 0),
(8, '6.78', '3.00', '3.00', '2019-08-21 12:00:00', '2019-08-21 14:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 8, 2, 0),
(9, '6.78', '3.00', '3.00', '2019-08-24 12:00:00', '2019-08-24 14:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 8, 2, 0),
(10, '6.78', '3.00', '3.00', '2019-08-29 19:00:00', '2019-08-29 21:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 22, 2, 0),
(11, '6.78', '3.00', '3.00', '2019-09-02 19:00:00', '2019-09-02 21:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 22, 2, 0),
(12, '6.78', '3.00', '3.00', '2019-09-05 19:30:00', '2019-09-05 21:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 22, 2, 0),
(13, '6.78', '3.00', '3.00', '2019-09-09 19:30:00', '2019-09-09 21:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 22, 2, 0),
(14, '6.78', '3.00', '3.00', '2019-09-12 19:00:00', '2019-09-12 21:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 22, 2, 0),
(15, '6.78', '3.00', '3.00', '2019-09-17 19:00:00', '2019-09-17 20:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 4, 22, 1.5, 0),
(16, '6.78', '3.00', '3.00', '2019-09-21 09:30:00', '2019-09-21 11:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 5, 3, 1.5, 0),
(17, '6.78', '3.00', '3.00', '2019-09-27 19:00:00', '2019-09-27 20:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 5, 22, 1.5, 0),
(18, '6.78', '3.00', '3.00', '2019-10-04 19:00:00', '2019-10-04 21:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 2, 2, 5, 22, 1.5, 0),
(19, '6.78', '3.00', '3.00', '2019-09-24 19:00:00', '2019-09-24 21:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 5, 2, 7, 22, 2, 0),
(20, '6.78', '18.00', '3.00', '2019-09-21 15:00:00', '2019-09-21 16:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 3, 1, 6, 4, 1.5, 0),
(21, '6.78', '18.00', '3.00', '2019-09-22 18:00:00', '2019-09-22 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 3, 1, 2, 18, 1.5, 0),
(22, '6.78', '18.00', '3.00', '2019-09-29 18:30:00', '2019-09-29 20:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 3, 1, 2, 21, 1.5, 0),
(23, '6.78', '18.00', '3.00', '2019-09-02 10:00:00', '2019-09-02 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 3, 1, 1, 4, 1.5, 0),
(24, '6.78', '18.00', '3.00', '2019-09-07 10:00:00', '2019-09-07 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 3, 1, 1, 4, 1.5, 0),
(25, '6.78', '18.00', '3.00', '2019-09-15 17:00:00', '2019-09-15 18:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 3, 1, 2, 18, 1.5, 0),
(26, '6.78', '15.00', '3.00', '2019-09-01 10:00:00', '2019-09-01 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 4, 1, 6, 4, 1.5, 0),
(27, '9.00', '15.00', '3.00', '2019-08-01 10:00:00', '2019-08-01 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(28, '9.00', '15.00', '3.00', '2019-08-03 10:00:00', '2019-08-03 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 1.5, 0),
(29, '9.00', '15.00', '3.00', '2019-08-06 10:00:00', '2019-08-06 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 1.5, 0),
(30, '9.00', '15.00', '3.00', '2019-08-10 10:00:00', '2019-08-10 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(31, '9.00', '15.00', '3.00', '2019-08-12 10:00:00', '2019-08-12 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 1.5, 0),
(32, '9.00', '15.00', '3.00', '2019-08-19 10:00:00', '2019-08-19 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(33, '9.00', '15.00', '3.00', '2019-08-22 10:00:00', '2019-08-22 11:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(34, '9.00', '15.00', '3.00', '2019-08-26 10:00:00', '2019-08-26 12:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 2, 0),
(35, '9.00', '15.00', '3.00', '2019-08-30 10:00:00', '2019-08-30 12:00:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 2, 0),
(36, '9.00', '15.00', '3.00', '2019-09-02 11:00:00', '2019-09-02 12:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 1.5, 0),
(37, '9.00', '15.00', '3.00', '2019-09-07 11:00:00', '2019-09-07 12:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(38, '9.00', '15.00', '3.00', '2019-09-13 18:00:00', '2019-09-13 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 1.5, 0),
(39, '9.00', '15.00', '3.00', '2019-09-17 18:00:00', '2019-09-17 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(40, '9.00', '15.00', '3.00', '2019-09-25 18:00:00', '2019-09-25 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(41, '9.00', '15.00', '3.00', '2019-09-29 18:00:00', '2019-09-29 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(42, '9.00', '15.00', '3.00', '2019-10-01 18:00:00', '2019-10-01 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(43, '9.00', '15.00', '3.00', '2019-10-03 18:00:00', '2019-10-03 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 8, 4, 1.5, 0),
(44, '9.00', '15.00', '3.00', '2019-10-07 18:00:00', '2019-10-07 19:30:00', '2020-07-15 12:12:13', '2020-07-15 12:12:13', 7, 2, 9, 4, 1.5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `per_days` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `installments_per_group`
--

CREATE TABLE `installments_per_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `per_days` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instituts`
--

CREATE TABLE `instituts` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(5, 'Institut Française', 1),
(6, 'Middle East', 1);

-- --------------------------------------------------------

--
-- Table structure for table `interviews_grading`
--

CREATE TABLE `interviews_grading` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stage_id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  `passed` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `evaluated_at` datetime DEFAULT NULL COMMENT 'if null stage not over\r\n',
  `evaluated` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interviews_grading`
--

INSERT INTO `interviews_grading` (`id`, `stage_id`, `application_id`, `grade`, `passed`, `created_at`, `evaluated_at`, `evaluated`, `notes`) VALUES
(1, 1, 1, '0.00', 1, '2020-07-02 12:21:32', NULL, 0, NULL),
(2, 1, 2, '0.00', 0, '2020-07-02 12:21:32', NULL, 0, NULL),
(3, 1, 3, '0.00', 0, '2020-07-02 12:21:32', NULL, 0, NULL),
(4, 1, 4, '0.00', 0, '2020-07-02 12:21:32', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interview_schedule`
--

CREATE TABLE `interview_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `starts_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interview_schedule`
--

INSERT INTO `interview_schedule` (`id`, `application_id`, `starts_at`, `created_at`, `active`, `notes`) VALUES
(1, 4, '2019-09-22 13:00:00', '2019-09-17 18:30:00', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `interview_stages`
--

CREATE TABLE `interview_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `shown_order` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interview_stages`
--

INSERT INTO `interview_stages` (`id`, `opening_id`, `title`, `active`, `shown_order`) VALUES
(1, 1, 'CV Filtering', 1, 1),
(2, 1, 'On-site interview', 1, 3),
(3, 1, 'Tiny  Latin on-line test', 1, 2),
(4, 1, 'Mega latin on-site test', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(55) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `email` varchar(65) NOT NULL,
  `dob` date NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `opening_id`, `full_name`, `phone`, `email`, `dob`, `created_at`) VALUES
(1, 1, 'Julius Papadopulus', '', '', '1985-02-12', '2020-07-01 09:50:01'),
(2, 1, 'Augustus Strindberg', '', '', '1982-02-12', '2020-07-01 09:50:01'),
(3, 1, 'Ovidius Potterus', '', '', '1982-02-12', '2020-07-01 09:50:01'),
(4, 1, 'Bilbο Hobbitus', '', '', '1992-02-12', '2020-07-01 09:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `job_application_courses`
--

CREATE TABLE `job_application_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_application_courses`
--

INSERT INTO `job_application_courses` (`id`, `application_id`, `course_id`) VALUES
(1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `job_application_studies`
--

CREATE TABLE `job_application_studies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `school_title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `grade` float UNSIGNED NOT NULL,
  `joined` date NOT NULL,
  `graduated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_application_work`
--

CREATE TABLE `job_application_work` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `job_title` varchar(120) NOT NULL,
  `company_name` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `joined` date NOT NULL,
  `left_on` date DEFAULT NULL,
  `still_work_there` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_openings`
--

CREATE TABLE `job_openings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_openings`
--

INSERT INTO `job_openings` (`id`, `title`, `description`, `active`, `created_at`, `starts_at`, `ends_at`) VALUES
(1, 'Λατινικά ', '', 1, '2020-07-01 09:49:18', '2020-07-01 09:49:18', '2020-07-23 09:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `job_opening_courses`
--

CREATE TABLE `job_opening_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_opening_courses`
--

INSERT INTO `job_opening_courses` (`id`, `opening_id`, `course_id`) VALUES
(1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(9, 'Κινεζικά', 1),
(10, 'Ιαπωνικά', 1);

-- --------------------------------------------------------

--
-- Table structure for table `logbook`
--

CREATE TABLE `logbook` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `history_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='βιβλίο ύλης';

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suburb_id` bigint(20) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `email`, `phone`, `name`, `surname`, `created_at`, `updated_at`, `address`, `post_code`, `suburb_id`) VALUES
(1, '', '', 'Anna', 'Karamzov', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(2, '', '', 'Selma', 'Lagerlof', '2020-06-07 05:17:26', '2020-06-07 05:17:26', '', '', 1),
(3, '', '', 'Alexander', 'Pushkin', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(4, '', '', 'Σταυρίνα', 'Δήμα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(5, '', '', 'Διονύσης', 'Ανδριόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(6, '', '', 'Αναστασία', 'Μιχαλακόπουλου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(7, '', '', 'Ορέστης', 'Παγώνας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(8, '', '', 'Λίτσα', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(9, '', '', 'Ιωσηφ', 'Δέλτας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(10, '', '', 'Ξερξης', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(11, '', '', 'Τάσος', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(12, '', '', 'Βαγγέλης', 'Κοντολέων', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(13, '', '', 'Ήρκος', 'Πυργιωτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(14, '', '', 'Θεόφραστος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(15, '', '', 'Αντώνης', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(16, '', '', 'Θεοδωσης', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(17, '', '', 'Σοφία', 'Μήλιας=', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(18, '', '', 'Θεοδωρος', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(19, '', '', 'Μιχάλης', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(20, '', '', 'Νεστωρ', 'Κατράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(21, '', '', 'Χριστίνα', 'Καραβία', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(22, '', '', 'Peter', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(23, '', '', 'Γεράσιμος', 'Βογιατζής', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(24, '', '', 'Αναστασία', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(25, '', '', 'Σοφία', 'Αντωνακόπουλου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(26, '', '', 'Αγνή', 'Σκαρμούτσος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(27, '', '', 'Derek', 'ΜιχαλόπουλοςΑνδριανόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(28, '', '', 'Βάσια', 'Διαμαντόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(29, '', '', 'Βάσια', 'ΜιχαλόπουλοςΑνδριανόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(30, '', '', 'Γεράσιμος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(31, '', '', 'Μαριάννα', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(32, '', '', 'Διονύσης', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(33, '', '', 'Θεοδωρος', 'Παγώνα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(34, '', '', 'Νικολέττα', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(35, '', '', 'Τάσος', 'Ηλιάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(36, '', '', 'Νίκος', 'Ζερβός', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(37, '', '', 'Ζήσης', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(38, '', '', 'Κοσμάς', 'Melberg', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(39, '', '', 'Ντίνα', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(40, '', '', 'Νίκος', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(41, '', '', 'Camilla', 'Κουρτίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(42, '', '', 'Mike', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(43, '', '', 'Ηρακλής', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(44, '', '', 'Ορέστης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(45, '', '', 'Βασίλης', 'Χαλκιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(46, '', '', 'Χρύσα', 'Βλαντής', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(47, '', '', 'Γιάννης', 'Μαζαράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(48, '', '', 'Helene', 'Καππάτος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(49, '', '', 'Σταυρίνα', 'Τρύπης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(50, '', '', 'Francois', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(51, '', '', 'Παυλίνα', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(52, '', '', 'Διονύσης', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(53, '', '', 'Πόπη', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(54, '', '', 'Θεοδωσης', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(55, '', '', 'Δημήτρης', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(56, '', '', 'Θεοδωσης', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(57, '', '', 'Marlene', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(58, '', '', 'John', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(59, '', '', 'Γιώργος', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(60, '', '', 'Ιωσηφ', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(61, '', '', 'Θεμης', 'Κυριακίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(62, '', '', 'Χρύσα', 'Διαμαντόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(63, '', '', 'Βούλα', 'Καππάτος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(64, '', '', 'Θεοδωρος', 'Γκιόκα', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(65, '', '', 'Μαριάννα', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(66, '', '', 'Νεστωρ', 'Δασκαλάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(67, '', '', 'Σταμάτης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(68, '', '', 'Βαγγέλης', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(69, '', '', 'Jorg', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(70, '', '', 'Hans', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(71, '', '', 'Ιωάννα', 'Melberg', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(72, '', '', 'Χριστίνα', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(73, '', '', 'Ξερξης', 'Ανδριόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(74, '', '', 'Ιωσηφ', 'Μελάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(75, '', '', 'Μιχάλης', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(76, '', '', 'Βούλα', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(77, '', '', 'Μιχάλης', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(78, '', '', 'Βούλα', 'Μήλιας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(79, '', '', 'Mike', 'Βούρος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(80, '', '', 'Σταμάτης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(81, '', '', 'Mike', 'Βέγγος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(82, '', '', 'Βαγγέλης', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(83, '', '', 'Κασσιανή', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(84, '', '', 'Άγγελος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(85, '', '', 'Κοσμάς', 'Χατζόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(86, '', '', 'Peter', 'Καραβίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(87, '', '', 'Σοφία', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(88, '', '', 'Θεμης', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(89, '', '', 'Πάρις', 'Παπανδρέου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(90, '', '', 'Μιχάλης', 'Κατράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(91, '', '', 'Θεόφραστος', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(92, '', '', 'Αλέκα', 'Σουρουπίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(93, '', '', 'Χρίστος', 'Μαζαράκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(94, '', '', 'Βάσια', 'Παπαδόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(95, '', '', 'Νεστωρ', 'Κούρτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(96, '', '', 'Γιώργος', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(97, '', '', 'Σοφία', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(98, '', '', 'Πόπη', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(99, '', '', 'Μαριάννα', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(100, '', '', 'Φάνης', 'Βούρος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(101, '', '', 'Νικολέττα', 'Σκαρμούτσος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(102, '', '', 'Παυλος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(103, '', '', 'Marlene', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(104, '', '', 'Χρίστος', 'Ηλιάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(105, '', '', 'Χάρης', 'Μιχαλακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(106, '', '', 'Ξερξης', 'Βασιλαντωνόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(107, '', '', 'Παυλίνα', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(108, '', '', 'Jorg', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(109, '', '', 'Κοσμάς', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(110, '', '', 'Άννα', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(111, '', '', 'Άγγελος', 'Γεωργόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(112, '', '', 'Βαγγέλης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(113, '', '', 'Βάσια', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(114, '', '', 'Helene', 'Βασιλαντωνόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(115, '', '', 'Hans', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(116, '', '', 'Ιωσηφ', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(117, '', '', 'Χριστίνα', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(118, '', '', 'Μιχάλης', 'Μήλιας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(119, '', '', 'Derek', 'Ελευθεριάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(120, '', '', 'Γιάννης', 'Σπύρου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(121, '', '', 'Αλεξανδρος', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(122, '', '', 'Δημήτρης', 'Χαλικιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(123, '', '', 'Φάνης', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(124, '', '', 'Σταυρίνα', 'Χαλικιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(125, '', '', 'Θεοδωσης', 'Σαβάλλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(126, '', '', 'Αλέκα', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(127, '', '', 'Άννα', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(128, '', '', 'Δημήτρης', 'Αντωνακόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(129, '', '', 'Σταύρος', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(130, '', '', 'Αναστασία', 'Κούρτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(131, '', '', 'Ήρκος', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(132, '', '', 'Παυλίνα', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(133, '', '', 'Σταύρος', 'Καραβίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(134, '', '', 'Jorg', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(135, '', '', 'Άγγελος', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(136, '', '', 'Άννα', 'Τρύπης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(137, '', '', 'Francois', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(138, '', '', 'Αντώνης', 'Χαλκιάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(139, '', '', 'Hans', 'Τριβιζάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(140, '', '', 'Ηρακλής', 'Πυργιωτη', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(141, '', '', 'Αλέκα', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(142, '', '', 'Χρύσα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(143, '', '', 'Κατερίνα', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(144, '', '', 'Σταμάτης', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(145, '', '', 'Μαριάννα', 'Δασκαλάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(146, '', '', 'Γεράσιμος', 'Καζάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(147, '', '', 'Ζήσης', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(148, '', '', 'Ντίνα', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(149, '', '', 'Φάνης', 'Βεάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(150, '', '', 'Hans', 'Σουρουπίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(151, '', '', 'Χρύσα', 'Παπαδημας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(152, '', '', 'Άγγελος', 'Σούλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(153, '', '', 'Σταυρίνα', 'Αγλαμίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(154, '', '', 'Φάνης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(155, '', '', 'Jorg', 'Γεωργουσόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(156, '', '', 'Βαγγέλης', 'Κορομηλάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(157, '', '', 'Χάρης', 'Βλαντής', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(158, '', '', 'Αγνή', 'Κούσουλας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(159, '', '', 'Αντώνης', 'Τζες', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(160, '', '', 'Peter', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(161, '', '', 'Ιωάννα', 'Αποστολίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(162, '', '', 'Ελένη', 'Θεοδωρίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(163, '', '', 'Παυλος', 'Κυριακίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(164, '', '', 'Φάνης', 'Λιγνάδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(165, '', '', 'Σοφία', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(166, '', '', 'Χρύσα', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(167, '', '', 'Θεμης', 'Δραγούμης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(168, '', '', 'Άννα', 'Παπανδρέου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(169, '', '', 'Κατερίνα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(170, '', '', 'Δημήτρης', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(171, '', '', 'Βούλα', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(172, '', '', 'Francois', 'Καλλιγάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(173, '', '', 'Αγνή', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(174, '', '', 'Νικολέττα', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(175, '', '', 'Σταυρίνα', 'Δήμας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(176, '', '', 'Διονύσης', 'Ευταξίας', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(177, '', '', 'Σταύρος', 'Σωτηρόπουλος', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(178, '', '', 'Σταμάτης', 'Ελευθερίου', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(179, '', '', 'Ντίνα', 'Πατάκης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(180, '', '', 'Κοσμάς', 'Λάζαρης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(181, '', '', 'Νίκος', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(182, '', '', 'Helene', 'Παππάς', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(183, '', '', 'Φάνης', 'Στουραϊτης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(184, '', '', 'Peter', 'Καπουτζίδης', '2020-06-04 13:45:18', '2020-06-04 13:45:18', '', '', 1),
(187, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', NULL, NULL, NULL, NULL, 1),
(188, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', NULL, NULL, NULL, NULL, 1),
(189, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', NULL, NULL, NULL, NULL, 1),
(190, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', NULL, NULL, NULL, NULL, 1),
(191, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', NULL, NULL, NULL, NULL, NULL),
(192, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', NULL, NULL, NULL, NULL, 2),
(193, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', '2020-07-15 04:58:42', '2020-07-15 04:58:42', NULL, NULL, 2),
(197, 'foo@goo.gr', '210123456789', 'Henrik', 'Vokakios', '2020-07-23 06:09:11', '2020-07-23 06:09:11', NULL, NULL, 2),
(198, 'foo@goo.gr', '210123456789', 'August', 'Vokakios', '2020-07-23 06:09:37', '2020-07-23 06:32:55', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `members_aud`
--

CREATE TABLE `members_aud` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rev` bigint(20) UNSIGNED NOT NULL,
  `revtype` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `surname` varchar(55) NOT NULL,
  `phone` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members_aud`
--

INSERT INTO `members_aud` (`id`, `rev`, `revtype`, `name`, `surname`, `phone`) VALUES
(197, 3, 0, 'Henrik', 'Vokakios', '210123456789'),
(198, 4, 0, 'Henrik', 'Vokakios', '210123456789'),
(198, 5, 1, 'August', 'Vokakios', '210123456789');

-- --------------------------------------------------------

--
-- Table structure for table `mock_exams`
--

CREATE TABLE `mock_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `period_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `grad_sys_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `text_grade_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mock_exams_results_text`
--

INSERT INTO `mock_exams_results_text` (`id`, `exam_id`, `student_id`, `text_grade_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `name`, `surname`, `phone`) VALUES
(2, 'Achilles', 'Ovidius', '210123456789'),
(3, 'Achilles', 'Ovidius', '210123456789'),
(4, 'Achilles', 'Ovidius', '210123456789'),
(5, 'Achilles', 'Ovidius', '210123456789'),
(6, 'Achilles', 'Ovidius', '210123456789'),
(7, 'Achilles', 'Ovidius', '210123456789');

-- --------------------------------------------------------

--
-- Table structure for table `parents_children`
--

CREATE TABLE `parents_children` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `child_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parents_children`
--

INSERT INTO `parents_children` (`id`, `parent_id`, `child_id`) VALUES
(1, 2, 19),
(2, 3, 20),
(3, 4, 21),
(4, 5, 22),
(5, 6, 23),
(6, 7, 24),
(7, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments_in_advance`
--

CREATE TABLE `payments_in_advance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `gross` decimal(10,2) UNSIGNED NOT NULL,
  `insurances` decimal(10,2) UNSIGNED NOT NULL,
  `total_hours` decimal(10,2) UNSIGNED NOT NULL,
  `net` decimal(10,2) UNSIGNED NOT NULL,
  `month_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `fiscal_year` year(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `teacher_id`, `gross`, `insurances`, `total_hours`, `net`, `month_id`, `fiscal_year`, `created_at`) VALUES
(1, 1, '420.00', '120.00', '32.00', '300.00', 8, 2019, '2019-08-31 12:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_analysis`
--

CREATE TABLE `payroll_analysis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL,
  `payroll_category_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_analysis`
--

INSERT INTO `payroll_analysis` (`id`, `payroll_id`, `payroll_category_id`, `amount`) VALUES
(1, 1, 2, '120.00'),
(2, 1, 4, '15.00');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_categories`
--

CREATE TABLE `payroll_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_categories`
--

INSERT INTO `payroll_categories` (`id`, `title`) VALUES
(1, 'ΕΦΚΑ'),
(2, 'ΙΚΑ'),
(3, 'ΕΦΚΑ'),
(4, 'bonus');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_groups_analysis`
--

CREATE TABLE `payroll_groups_analysis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `from_day` date NOT NULL,
  `to_day` date NOT NULL,
  `hourly_rate` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_groups_analysis`
--

INSERT INTO `payroll_groups_analysis` (`id`, `payroll_id`, `group_id`, `from_day`, `to_day`, `hourly_rate`, `amount`) VALUES
(1, 1, 1, '2019-08-01', '2019-08-31', '4.78', '280.00');

-- --------------------------------------------------------

--
-- Table structure for table `perfectures`
--

CREATE TABLE `perfectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `title`, `created_at`) VALUES
(1, 'June', '2021-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `pools`
--

CREATE TABLE `pools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pools`
--

INSERT INTO `pools` (`id`, `course_id`, `title`) VALUES
(1, 1, 'Προκαταρτικό τεστ');

-- --------------------------------------------------------

--
-- Table structure for table `pool_chapters`
--

CREATE TABLE `pool_chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pool_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pool_chapters`
--

INSERT INTO `pool_chapters` (`id`, `pool_id`, `title`) VALUES
(1, 1, 'Ουσιαστικά'),
(2, 1, 'Ρήματα');

-- --------------------------------------------------------

--
-- Table structure for table `pool_questions`
--

CREATE TABLE `pool_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pool_questions`
--

INSERT INTO `pool_questions` (`id`, `chapter_id`, `body`) VALUES
(1, 1, '[quote]Ovidius poeta est.[/quote] Τι πτώση είναι το poeta ;'),
(2, 1, '[quote]Romam desiderat et fortunam adversam deplorat. [/quote] Τι πτώση είναι το Romam ;'),
(3, 2, '[quote]essḗmus[/quote]. Τι πρόσωπο, χρόνο, έγκλιση είναι;');

-- --------------------------------------------------------

--
-- Table structure for table `pool_question_answers`
--

CREATE TABLE `pool_question_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `wrong` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pool_question_answers`
--

INSERT INTO `pool_question_answers` (`id`, `question_id`, `body`, `wrong`) VALUES
(1, 1, 'Nominativ', 0),
(2, 1, 'Ablativ', 1),
(3, 1, 'Vocativ', 1),
(4, 2, 'Ablativ', 1),
(5, 2, 'Vocativ', 1),
(6, 3, 'Υποτακτική γ ενικο', 1),
(7, 3, 'Οριστική παρατατικού β πληθυντικό', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pool_review_questions`
--

CREATE TABLE `pool_review_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pool_review_questions`
--

INSERT INTO `pool_review_questions` (`id`, `title`) VALUES
(1, 'Είναι υπομονετικός με τους μαθητές που κάνουν φασαρία στο μάθημα;'),
(2, 'Έχει ευπρεπές ντύσιμο;');

-- --------------------------------------------------------

--
-- Table structure for table `progress_book`
--

CREATE TABLE `progress_book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `real_exams`
--

CREATE TABLE `real_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `period_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `grad_sys_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `exam_year` date NOT NULL DEFAULT '1907-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `grade` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `real_exams_results_text`
--

CREATE TABLE `real_exams_results_text` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `text_grade_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `registration_fees`
--

CREATE TABLE `registration_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profit` decimal(10,2) NOT NULL,
  `gross_income` decimal(10,2) UNSIGNED NOT NULL,
  `net_income` decimal(10,2) UNSIGNED NOT NULL,
  `student_payments` decimal(10,0) UNSIGNED NOT NULL,
  `total_expenses` decimal(10,2) UNSIGNED NOT NULL,
  `taxes` decimal(10,2) UNSIGNED NOT NULL,
  `staff_payments` decimal(10,2) UNSIGNED NOT NULL,
  `staff_insurances` decimal(10,2) UNSIGNED NOT NULL,
  `staff_net_payments` decimal(10,2) UNSIGNED NOT NULL,
  `student_debts` decimal(10,0) UNSIGNED NOT NULL,
  `staff_in_debt` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`id`, `profit`, `gross_income`, `net_income`, `student_payments`, `total_expenses`, `taxes`, `staff_payments`, `staff_insurances`, `staff_net_payments`, `student_debts`, `staff_in_debt`, `created_at`) VALUES
(1, '3759.00', '4806.00', '4305.00', '3874', '1047.00', '501.00', '305.00', '123.00', '182.00', '880', '41.00', '2019-08-02'),
(2, '3829.00', '5054.00', '4463.00', '4587', '1225.00', '591.00', '378.00', '111.00', '267.00', '532', '40.00', '2019-08-03'),
(3, '3151.00', '4329.00', '3707.00', '4184', '1178.00', '622.00', '334.00', '107.00', '227.00', '656', '77.00', '2019-08-04'),
(4, '3727.00', '4832.00', '4380.00', '3827', '1105.00', '452.00', '389.00', '138.00', '251.00', '772', '71.00', '2019-08-05'),
(5, '3537.00', '4646.00', '4101.00', '4465', '1109.00', '545.00', '334.00', '133.00', '201.00', '849', '72.00', '2019-08-06'),
(6, '3907.00', '4957.00', '4569.00', '4175', '1050.00', '388.00', '414.00', '154.00', '260.00', '777', '64.00', '2019-08-07'),
(7, '3561.00', '4628.00', '4135.00', '4230', '1067.00', '493.00', '344.00', '115.00', '229.00', '671', '68.00', '2019-08-08'),
(8, '3703.00', '4977.00', '4330.00', '4654', '1274.00', '647.00', '368.00', '127.00', '241.00', '809', '28.00', '2019-08-09'),
(9, '3143.00', '4339.00', '3740.00', '4724', '1196.00', '599.00', '376.00', '133.00', '243.00', '686', '48.00', '2019-08-10'),
(10, '3070.00', '4108.00', '3710.00', '4390', '1038.00', '398.00', '403.00', '143.00', '260.00', '541', '28.00', '2019-08-11'),
(11, '3948.00', '4936.00', '4481.00', '3914', '988.00', '455.00', '298.00', '106.00', '192.00', '662', '66.00', '2019-08-12'),
(12, '3679.00', '4927.00', '4330.00', '3878', '1248.00', '597.00', '398.00', '158.00', '240.00', '634', '90.00', '2019-08-13'),
(13, '3646.00', '4825.00', '4202.00', '4166', '1179.00', '623.00', '342.00', '160.00', '182.00', '872', '55.00', '2019-08-14'),
(14, '4029.00', '5167.00', '4591.00', '4441', '1138.00', '576.00', '337.00', '120.00', '217.00', '691', '83.00', '2019-08-15'),
(15, '3605.00', '4822.00', '4248.00', '4142', '1217.00', '574.00', '385.00', '121.00', '264.00', '878', '59.00', '2019-08-16'),
(16, '3777.00', '4774.00', '4365.00', '4179', '997.00', '409.00', '361.00', '150.00', '211.00', '787', '82.00', '2019-08-17'),
(17, '2973.00', '4113.00', '3492.00', '4788', '1140.00', '621.00', '301.00', '96.00', '205.00', '719', '37.00', '2019-08-18'),
(18, '3481.00', '4681.00', '4104.00', '4854', '1200.00', '577.00', '431.00', '162.00', '269.00', '752', '40.00', '2019-08-19'),
(19, '3500.00', '4699.00', '4079.00', '3958', '1199.00', '620.00', '372.00', '114.00', '258.00', '748', '68.00', '2019-08-20'),
(20, '3643.00', '4813.00', '4237.00', '4730', '1170.00', '576.00', '343.00', '152.00', '191.00', '745', '34.00', '2019-08-21'),
(21, '3234.00', '4267.00', '3744.00', '3958', '1033.00', '523.00', '314.00', '100.00', '214.00', '638', '52.00', '2019-08-22'),
(22, '3585.00', '4598.00', '4171.00', '3889', '1013.00', '427.00', '384.00', '127.00', '257.00', '584', '28.00', '2019-08-23'),
(23, '3936.00', '5053.00', '4535.00', '4815', '1117.00', '518.00', '337.00', '113.00', '224.00', '522', '68.00', '2019-08-24'),
(24, '2914.00', '4167.00', '3501.00', '4647', '1253.00', '666.00', '349.00', '101.00', '248.00', '686', '29.00', '2019-08-25'),
(25, '3745.00', '4789.00', '4360.00', '4306', '1044.00', '429.00', '347.00', '166.00', '181.00', '796', '31.00', '2019-08-26'),
(26, '3308.00', '4417.00', '3893.00', '4826', '1109.00', '524.00', '318.00', '98.00', '220.00', '533', '21.00', '2019-08-27'),
(27, '3389.00', '4440.00', '3931.00', '4658', '1051.00', '509.00', '318.00', '127.00', '191.00', '560', '57.00', '2019-08-28'),
(28, '3975.00', '5179.00', '4547.00', '4282', '1204.00', '632.00', '327.00', '98.00', '229.00', '738', '71.00', '2019-08-29'),
(29, '3471.00', '4404.00', '3959.00', '4806', '933.00', '445.00', '296.00', '108.00', '188.00', '724', '75.00', '2019-08-30'),
(30, '3590.00', '4618.00', '4167.00', '4200', '1028.00', '451.00', '310.00', '111.00', '199.00', '851', '51.00', '2019-08-31'),
(31, '4160.00', '5147.00', '4741.00', '3801', '987.00', '406.00', '337.00', '132.00', '205.00', '793', '83.00', '2019-09-01'),
(32, '3851.00', '5005.00', '4496.00', '4726', '1154.00', '509.00', '397.00', '136.00', '261.00', '540', '83.00', '2019-09-02'),
(33, '2920.00', '4164.00', '3520.00', '3904', '1244.00', '644.00', '395.00', '128.00', '267.00', '717', '56.00', '2019-09-03'),
(34, '3152.00', '4248.00', '3695.00', '3962', '1096.00', '553.00', '336.00', '103.00', '233.00', '788', '30.00', '2019-09-04'),
(35, '2917.00', '4118.00', '3503.00', '3940', '1201.00', '615.00', '402.00', '140.00', '262.00', '591', '31.00', '2019-09-05'),
(36, '3848.00', '4997.00', '4357.00', '4732', '1149.00', '640.00', '317.00', '114.00', '203.00', '635', '30.00', '2019-09-06'),
(37, '3668.00', '4720.00', '4275.00', '4773', '1052.00', '445.00', '423.00', '163.00', '260.00', '751', '56.00', '2019-09-07'),
(38, '3839.00', '4811.00', '4415.00', '4694', '972.00', '396.00', '317.00', '102.00', '215.00', '698', '25.00', '2019-09-08'),
(39, '3319.00', '4461.00', '3845.00', '4492', '1142.00', '616.00', '344.00', '103.00', '241.00', '856', '62.00', '2019-09-09'),
(40, '3303.00', '4438.00', '3921.00', '3937', '1135.00', '517.00', '367.00', '123.00', '244.00', '733', '75.00', '2019-09-10'),
(41, '3666.00', '4639.00', '4231.00', '4425', '973.00', '408.00', '360.00', '160.00', '200.00', '823', '22.00', '2019-09-11'),
(42, '3070.00', '4154.00', '3609.00', '4037', '1084.00', '545.00', '340.00', '113.00', '227.00', '643', '82.00', '2019-09-12'),
(43, '3875.00', '4885.00', '4413.00', '4347', '1010.00', '472.00', '316.00', '126.00', '190.00', '641', '47.00', '2019-09-13'),
(44, '3012.00', '4110.00', '3568.00', '4745', '1098.00', '542.00', '286.00', '89.00', '197.00', '614', '43.00', '2019-09-14'),
(45, '3898.00', '5127.00', '4509.00', '4088', '1229.00', '618.00', '370.00', '115.00', '255.00', '826', '33.00', '2019-09-15'),
(46, '3406.00', '4489.00', '3965.00', '4595', '1083.00', '524.00', '327.00', '101.00', '226.00', '651', '65.00', '2019-09-16'),
(47, '3537.00', '4731.00', '4112.00', '4548', '1194.00', '619.00', '355.00', '140.00', '215.00', '747', '86.00', '2019-09-17'),
(48, '3447.00', '4600.00', '4064.00', '4725', '1153.00', '536.00', '385.00', '115.00', '270.00', '834', '63.00', '2019-09-18'),
(49, '3685.00', '4790.00', '4219.00', '4889', '1105.00', '571.00', '309.00', '119.00', '190.00', '628', '44.00', '2019-09-19'),
(50, '3807.00', '4836.00', '4396.00', '4419', '1029.00', '440.00', '333.00', '105.00', '228.00', '774', '73.00', '2019-09-20'),
(51, '3440.00', '4482.00', '4085.00', '3850', '1042.00', '397.00', '377.00', '132.00', '245.00', '600', '71.00', '2019-09-21'),
(52, '3856.00', '4958.00', '4445.00', '4374', '1102.00', '513.00', '380.00', '159.00', '221.00', '711', '79.00', '2019-09-22'),
(53, '3610.00', '4754.00', '4153.00', '4153', '1144.00', '601.00', '289.00', '108.00', '181.00', '736', '51.00', '2019-09-23'),
(54, '3846.00', '5024.00', '4391.00', '4335', '1178.00', '633.00', '351.00', '107.00', '244.00', '714', '24.00', '2019-09-24'),
(55, '3104.00', '4196.00', '3754.00', '4582', '1092.00', '442.00', '385.00', '150.00', '235.00', '670', '49.00', '2019-09-25'),
(56, '3812.00', '4942.00', '4409.00', '4845', '1130.00', '533.00', '359.00', '123.00', '236.00', '687', '87.00', '2019-09-26'),
(57, '3575.00', '4555.00', '4083.00', '4622', '980.00', '472.00', '311.00', '104.00', '207.00', '581', '47.00', '2019-09-27'),
(58, '4029.00', '5052.00', '4669.00', '3853', '1023.00', '383.00', '434.00', '168.00', '266.00', '627', '70.00', '2019-09-28'),
(59, '4095.00', '5195.00', '4611.00', '4001', '1100.00', '584.00', '326.00', '119.00', '207.00', '649', '64.00', '2019-09-29'),
(60, '3839.00', '5068.00', '4412.00', '4843', '1229.00', '656.00', '350.00', '125.00', '225.00', '856', '24.00', '2019-09-30'),
(61, '3250.00', '4439.00', '3805.00', '4413', '1189.00', '634.00', '363.00', '102.00', '261.00', '886', '88.00', '2019-10-01'),
(62, '3588.00', '4820.00', '4196.00', '4758', '1232.00', '624.00', '382.00', '156.00', '226.00', '594', '26.00', '2019-10-02'),
(63, '3329.00', '4628.00', '3979.00', '4891', '1299.00', '649.00', '416.00', '168.00', '248.00', '638', '62.00', '2019-10-03'),
(64, '3798.00', '4768.00', '4313.00', '4426', '970.00', '455.00', '279.00', '82.00', '197.00', '644', '89.00', '2019-10-04'),
(65, '3261.00', '4186.00', '3791.00', '4352', '925.00', '395.00', '323.00', '114.00', '209.00', '841', '28.00', '2019-10-05'),
(66, '3440.00', '4626.00', '4066.00', '4018', '1186.00', '560.00', '358.00', '129.00', '229.00', '641', '51.00', '2019-10-06');

-- --------------------------------------------------------

--
-- Table structure for table `revenue_categories`
--

CREATE TABLE `revenue_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire`
--

CREATE TABLE `review_questionnaire` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL,
  `created_at` date NOT NULL,
  `avg_grade` float UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review_questionnaire`
--

INSERT INTO `review_questionnaire` (`id`, `teacher_id`, `title`, `created_at`, `avg_grade`) VALUES
(1, 1, 'Γενική αξιολόγηση', '2020-07-01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire_chapters`
--

CREATE TABLE `review_questionnaire_chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `show_order` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review_questionnaire_chapters`
--

INSERT INTO `review_questionnaire_chapters` (`id`, `title`, `show_order`) VALUES
(1, 'Εμφάνιση', 1),
(2, 'Συμπεριφορά', 2),
(3, 'Επεξήγηση', 3);

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire_questions`
--

CREATE TABLE `review_questionnaire_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `questionnaire_id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='discrete answers 1 to 10';

--
-- Dumping data for table `review_questionnaire_questions`
--

INSERT INTO `review_questionnaire_questions` (`id`, `questionnaire_id`, `chapter_id`, `question_id`) VALUES
(5, 1, 1, 2),
(1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `review_questionnaire_submission`
--

CREATE TABLE `review_questionnaire_submission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `questionnaire_id` bigint(20) UNSIGNED NOT NULL,
  `pseudonym` varchar(55) NOT NULL,
  `created_at` date NOT NULL,
  `avg_grade` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pseudonym is used instead of student_id for anonymity';

-- --------------------------------------------------------

--
-- Table structure for table `review_submission_answers`
--

CREATE TABLE `review_submission_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `grade` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `revinfo`
--

CREATE TABLE `revinfo` (
  `rev` bigint(20) UNSIGNED NOT NULL,
  `revtstmp` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revinfo`
--

INSERT INTO `revinfo` (`rev`, `revtstmp`) VALUES
(3, 1595495351324),
(4, 1595495377752),
(5, 1595496775044);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`) VALUES
(1, 'admin'),
(2, 'secretary');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(7, 'Ωκεανός', '2020-06-03 05:12:02', '2020-06-03 05:12:02', 1),
(8, 'Ευκλείδης', '2020-06-06 05:16:08', '2020-06-06 05:16:08', 2),
(9, 'Πυθαγόρας', '2020-06-06 05:16:08', '2020-06-06 05:16:08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `salary_history`
--

CREATE TABLE `salary_history` (
  `sal_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `school_classes`
--

CREATE TABLE `school_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `school_class_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `discipline_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seninar_category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seminar_categories`
--

INSERT INTO `seminar_categories` (`id`, `title`, `active`) VALUES
(1, 'Back-end', 1),
(2, 'Front-end', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_certificates`
--

CREATE TABLE `seminar_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `successful` tinyint(1) NOT NULL DEFAULT 1,
  `valid_untlil` datetime NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `grade` decimal(5,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_certificate_modules`
--

CREATE TABLE `seminar_certificate_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `certificate_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `module_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `grade` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_certificate_teachers`
--

CREATE TABLE `seminar_certificate_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `certificate_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `singed_teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_chapters`
--

CREATE TABLE `seminar_chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `show_order` tinyint(3) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_groups`
--

CREATE TABLE `seminar_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seminar_groups`
--

INSERT INTO `seminar_groups` (`id`, `module_id`, `group_id`) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 5),
(4, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_modules`
--

CREATE TABLE `seminar_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `part_time` tinyint(1) NOT NULL DEFAULT 1,
  `on_site` tinyint(1) NOT NULL DEFAULT 1,
  `cost` decimal(10,2) UNSIGNED NOT NULL,
  `starts` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `seninar_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `max_seats` tinyint(3) UNSIGNED NOT NULL DEFAULT 15,
  `total_hours` smallint(5) UNSIGNED NOT NULL DEFAULT 50,
  `cost_per_hour` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seminar_modules`
--

INSERT INTO `seminar_modules` (`id`, `title`, `active`, `part_time`, `on_site`, `cost`, `starts`, `ends`, `seninar_id`, `max_seats`, `total_hours`, `cost_per_hour`) VALUES
(1, 'JPA/Hibernate', 1, 0, 1, '1500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 1, 15, 50, '0.00'),
(2, 'Redux', 1, 0, 1, '1100.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 2, 15, 50, '0.00'),
(3, 'Flux', 1, 0, 1, '500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 2, 15, 50, '0.00'),
(4, 'Java Fundamentals', 1, 0, 1, '1500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 1, 15, 50, '0.00'),
(5, 'Spring Boot MVC', 1, 0, 1, '1500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 1, 15, 50, '0.00'),
(6, 'Unit Testing with Java', 1, 0, 1, '1500.00', '2020-06-19 08:00:19', '2020-06-19 08:00:19', 1, 15, 50, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_modules_curriculum`
--

CREATE TABLE `seminar_modules_curriculum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `show_order` tinyint(3) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_teachers`
--

CREATE TABLE `seminar_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seminar_teachers`
--

INSERT INTO `seminar_teachers` (`id`, `module_id`, `teacher_id`) VALUES
(1, 1, 4),
(2, 5, 4),
(3, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `days_id` bigint(20) DEFAULT NULL,
  `starting_hour_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ending_hour_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='secretary shifts';

-- --------------------------------------------------------

--
-- Table structure for table `speeds`
--

CREATE TABLE `speeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `total_debt` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `total_profit` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `calculated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `member_id`, `total_debt`, `total_profit`, `calculated_at`) VALUES
(1, 4, '425.00', '70.00', '2020-08-24 11:35:19'),
(2, 5, '257.00', '20.00', '2020-08-24 11:35:19'),
(3, 6, '135.00', '0.00', '2020-08-24 11:35:19'),
(4, 7, '135.00', '0.00', '2020-08-24 11:35:19'),
(5, 8, '135.00', '0.00', '2020-08-24 11:35:19'),
(6, 9, '135.00', '0.00', '2020-08-24 11:35:19'),
(7, 10, '135.00', '0.00', '2020-08-24 11:35:19'),
(8, 11, '135.00', '0.00', '2020-08-24 11:35:19'),
(9, 12, '135.00', '0.00', '2020-08-24 11:35:19'),
(10, 13, '0.00', '0.00', NULL),
(11, 150, '18.00', '0.00', '2020-08-24 11:35:19'),
(12, 149, '18.00', '0.00', '2020-08-24 11:35:19'),
(13, 148, '37.50', '0.00', '2020-08-24 11:35:19'),
(14, 146, '78.00', '0.00', '2020-08-24 11:35:19'),
(15, 145, '78.00', '0.00', '2020-08-24 11:35:19'),
(18, 187, '0.00', '0.00', NULL),
(19, 188, '0.00', '0.00', NULL),
(20, 189, '22.50', '0.00', '2020-08-24 11:35:19'),
(21, 192, '0.00', '0.00', NULL),
(22, 193, '0.00', '0.00', NULL),
(23, 197, '22.50', '0.00', '2020-08-24 11:35:19'),
(24, 198, '22.50', '0.00', '2020-08-24 11:35:19'),
(34, 2, '0.00', '0.00', NULL),
(35, 3, '0.00', '0.00', NULL),
(36, 14, '0.00', '0.00', NULL),
(37, 15, '0.00', '0.00', NULL),
(38, 16, '0.00', '0.00', NULL),
(39, 17, '0.00', '0.00', NULL),
(40, 18, '0.00', '0.00', NULL),
(41, 19, '0.00', '0.00', NULL),
(42, 20, '0.00', '0.00', NULL),
(43, 21, '0.00', '0.00', NULL),
(44, 22, '0.00', '0.00', NULL),
(45, 23, '0.00', '0.00', NULL),
(46, 24, '0.00', '0.00', NULL),
(47, 25, '0.00', '0.00', NULL),
(48, 26, '0.00', '0.00', NULL),
(49, 27, '0.00', '0.00', NULL),
(50, 28, '0.00', '0.00', NULL),
(51, 29, '0.00', '0.00', NULL),
(52, 30, '0.00', '0.00', NULL),
(53, 31, '0.00', '0.00', NULL),
(54, 32, '0.00', '0.00', NULL),
(55, 33, '0.00', '0.00', NULL),
(56, 34, '0.00', '0.00', NULL),
(57, 35, '0.00', '0.00', NULL),
(58, 36, '0.00', '0.00', NULL),
(59, 37, '0.00', '0.00', NULL),
(60, 38, '0.00', '0.00', NULL),
(61, 39, '0.00', '0.00', NULL),
(62, 40, '0.00', '0.00', NULL),
(63, 41, '0.00', '0.00', NULL),
(64, 42, '0.00', '0.00', NULL),
(65, 43, '0.00', '0.00', NULL),
(66, 44, '0.00', '0.00', NULL),
(67, 45, '0.00', '0.00', NULL),
(68, 46, '0.00', '0.00', NULL),
(69, 47, '0.00', '0.00', NULL),
(70, 48, '0.00', '0.00', NULL),
(71, 49, '0.00', '0.00', NULL),
(72, 50, '0.00', '0.00', NULL),
(73, 51, '0.00', '0.00', NULL),
(74, 52, '0.00', '0.00', NULL),
(75, 53, '0.00', '0.00', NULL),
(76, 54, '0.00', '0.00', NULL),
(77, 55, '0.00', '0.00', NULL),
(78, 56, '0.00', '0.00', NULL),
(79, 57, '0.00', '0.00', NULL),
(80, 58, '0.00', '0.00', NULL),
(81, 59, '0.00', '0.00', NULL),
(82, 60, '0.00', '0.00', NULL),
(83, 61, '0.00', '0.00', NULL),
(84, 62, '0.00', '0.00', NULL),
(85, 63, '0.00', '0.00', NULL),
(86, 64, '0.00', '0.00', NULL),
(87, 65, '0.00', '0.00', NULL),
(88, 66, '0.00', '0.00', NULL),
(89, 67, '0.00', '0.00', NULL),
(90, 68, '0.00', '0.00', NULL),
(91, 69, '0.00', '0.00', NULL),
(92, 70, '0.00', '0.00', NULL),
(93, 71, '0.00', '0.00', NULL),
(94, 72, '0.00', '0.00', NULL),
(95, 73, '0.00', '0.00', NULL),
(96, 74, '0.00', '0.00', NULL),
(97, 75, '0.00', '0.00', NULL),
(98, 76, '0.00', '0.00', NULL),
(99, 77, '0.00', '0.00', NULL),
(100, 78, '0.00', '0.00', NULL),
(101, 79, '0.00', '0.00', NULL),
(102, 80, '0.00', '0.00', NULL),
(103, 81, '0.00', '0.00', NULL),
(104, 82, '0.00', '0.00', NULL),
(105, 83, '0.00', '0.00', NULL),
(106, 84, '0.00', '0.00', NULL),
(107, 85, '0.00', '0.00', NULL),
(108, 86, '0.00', '0.00', NULL),
(109, 87, '0.00', '0.00', NULL),
(110, 88, '0.00', '0.00', NULL),
(111, 89, '0.00', '0.00', NULL),
(112, 90, '0.00', '0.00', NULL),
(113, 91, '0.00', '0.00', NULL),
(114, 92, '0.00', '0.00', NULL),
(115, 93, '0.00', '0.00', NULL),
(116, 94, '0.00', '0.00', NULL),
(117, 95, '0.00', '0.00', NULL),
(118, 96, '0.00', '0.00', NULL),
(119, 97, '0.00', '0.00', NULL),
(120, 98, '0.00', '0.00', NULL),
(121, 99, '0.00', '0.00', NULL),
(122, 100, '0.00', '0.00', NULL),
(123, 101, '0.00', '0.00', NULL),
(124, 102, '0.00', '0.00', NULL),
(125, 103, '0.00', '0.00', NULL),
(126, 104, '0.00', '0.00', NULL),
(127, 105, '0.00', '0.00', NULL),
(128, 106, '0.00', '0.00', NULL),
(129, 107, '0.00', '0.00', NULL),
(130, 108, '0.00', '0.00', NULL),
(131, 109, '0.00', '0.00', NULL),
(132, 110, '0.00', '0.00', NULL),
(133, 111, '0.00', '0.00', NULL),
(134, 112, '0.00', '0.00', NULL),
(135, 113, '0.00', '0.00', NULL),
(136, 114, '0.00', '0.00', NULL),
(137, 115, '0.00', '0.00', NULL),
(138, 116, '0.00', '0.00', NULL),
(139, 117, '0.00', '0.00', NULL),
(140, 118, '0.00', '0.00', NULL),
(141, 119, '0.00', '0.00', NULL),
(142, 120, '0.00', '0.00', NULL),
(143, 121, '0.00', '0.00', NULL),
(144, 122, '0.00', '0.00', NULL),
(145, 123, '0.00', '0.00', NULL),
(146, 124, '0.00', '0.00', NULL),
(147, 125, '0.00', '0.00', NULL),
(148, 126, '0.00', '0.00', NULL),
(149, 127, '0.00', '0.00', NULL),
(150, 128, '0.00', '0.00', NULL),
(151, 129, '0.00', '0.00', NULL),
(152, 130, '0.00', '0.00', NULL),
(153, 131, '0.00', '0.00', NULL),
(154, 132, '0.00', '0.00', NULL),
(155, 133, '0.00', '0.00', NULL),
(156, 134, '0.00', '0.00', NULL),
(157, 135, '0.00', '0.00', NULL),
(158, 136, '0.00', '0.00', NULL),
(159, 137, '0.00', '0.00', NULL),
(160, 138, '0.00', '0.00', NULL),
(161, 139, '0.00', '0.00', NULL),
(162, 140, '0.00', '0.00', NULL),
(163, 141, '0.00', '0.00', NULL),
(164, 142, '0.00', '0.00', NULL),
(165, 143, '0.00', '0.00', NULL),
(166, 144, '0.00', '0.00', NULL),
(167, 147, '0.00', '0.00', NULL),
(168, 151, '0.00', '0.00', NULL),
(169, 152, '0.00', '0.00', NULL),
(170, 153, '0.00', '0.00', NULL),
(171, 154, '0.00', '0.00', NULL),
(172, 155, '0.00', '0.00', NULL),
(173, 156, '0.00', '0.00', NULL),
(174, 157, '0.00', '0.00', NULL),
(175, 158, '0.00', '0.00', NULL),
(176, 159, '0.00', '0.00', NULL),
(177, 160, '0.00', '0.00', NULL),
(178, 161, '217.50', '0.00', '2020-08-24 11:35:19'),
(179, 162, '217.50', '0.00', '2020-08-24 11:35:19'),
(180, 163, '217.50', '0.00', '2020-08-24 11:35:19'),
(181, 164, '217.50', '0.00', '2020-08-24 11:35:19'),
(182, 165, '217.50', '0.00', '2020-08-24 11:35:19'),
(183, 166, '217.50', '0.00', '2020-08-24 11:35:19'),
(184, 167, '217.50', '0.00', '2020-08-24 11:35:19'),
(185, 168, '217.50', '0.00', '2020-08-24 11:35:19'),
(186, 169, '217.50', '0.00', '2020-08-24 11:35:19'),
(187, 170, '217.50', '0.00', '2020-08-24 11:35:19'),
(188, 171, '217.50', '0.00', '2020-08-24 11:35:19'),
(189, 172, '0.00', '0.00', NULL),
(190, 173, '0.00', '0.00', NULL),
(191, 174, '0.00', '0.00', NULL),
(192, 175, '0.00', '0.00', NULL),
(193, 176, '0.00', '0.00', NULL),
(194, 177, '0.00', '0.00', NULL),
(195, 178, '0.00', '0.00', NULL),
(196, 179, '0.00', '0.00', NULL),
(197, 180, '0.00', '0.00', NULL),
(198, 181, '0.00', '0.00', NULL),
(199, 182, '0.00', '0.00', NULL),
(200, 183, '0.00', '0.00', NULL),
(201, 184, '0.00', '0.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_debts`
--

CREATE TABLE `student_debts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `month_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `lesson_year` year(4) NOT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_debts`
--

INSERT INTO `student_debts` (`id`, `created_at`, `updated_at`, `student_id`, `amount`, `group_id`, `month_id`, `lesson_year`, `starts_at`, `ends_at`) VALUES
(1, '2020-07-07 08:24:21', '2020-08-09 09:28:19', 1, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(2, '2020-07-07 08:24:21', '2020-08-09 09:44:00', 11, '18.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(3, '2020-07-07 08:24:21', '2020-08-09 09:28:19', 11, '37.50', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(4, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 2, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(5, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 3, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(6, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 4, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(7, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 5, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(8, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 6, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(9, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 7, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(10, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 8, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(11, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 9, '135.00', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(12, '2020-07-07 08:31:53', '2020-08-09 09:44:00', 12, '18.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(13, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 12, '37.50', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(14, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 13, '37.50', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(15, '2020-07-07 08:31:53', '2020-08-09 09:44:00', 13, '18.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(16, '2020-07-07 08:31:53', '2020-08-09 09:44:00', 14, '18.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(17, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 14, '37.50', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(18, '2020-07-07 08:31:53', '2020-08-09 09:28:19', 15, '37.50', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(19, '2020-07-07 08:31:53', '2020-08-09 09:44:00', 15, '18.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(20, '2020-07-07 15:08:35', '2020-08-09 09:28:19', 1, '162.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(21, '2020-07-07 15:08:35', '2020-08-09 09:28:19', 2, '162.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(22, '2020-07-07 15:08:35', '2020-08-09 09:28:19', 3, '162.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(23, '2020-07-07 15:08:35', '2020-08-09 09:28:19', 4, '162.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(24, '2020-07-07 15:08:35', '2020-08-09 09:28:19', 5, '162.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(25, '2020-07-07 15:08:35', '2020-08-09 09:28:19', 6, '162.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(26, '2020-07-27 18:43:03', '2020-08-09 09:28:19', 14, '22.50', 4, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(27, '2020-07-27 18:43:03', '2020-08-09 09:28:19', 15, '22.50', 4, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(28, '2020-07-27 18:43:03', '2020-08-09 09:28:19', 20, '22.50', 4, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(29, '2020-07-27 18:43:03', '2020-08-09 09:28:19', 23, '22.50', 4, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(30, '2020-07-27 18:43:03', '2020-08-09 09:28:19', 24, '22.50', 4, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(31, '2020-07-28 06:20:29', '2020-08-09 09:44:00', 1, '18.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(32, '2020-07-28 06:20:29', '2020-08-09 09:28:19', 1, '37.50', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(33, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 178, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(34, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 178, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(35, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 179, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(36, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 179, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(37, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 180, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(38, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 180, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(39, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 181, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(40, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 181, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(41, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 182, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(42, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 182, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(43, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 183, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(44, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 183, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(45, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 184, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(46, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 184, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(47, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 185, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(48, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 185, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(49, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 186, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(50, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 186, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(51, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 187, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(52, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 187, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(53, '2020-08-09 09:26:11', '2020-08-09 09:44:00', 188, '217.50', 7, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(54, '2020-08-09 09:26:11', '2020-08-09 09:28:19', 188, '135.00', 7, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `student_payed`
--

CREATE TABLE `student_payed` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `month_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `lesson_year` year(4) NOT NULL,
  `bank_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `bank_transaction_id` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_payed`
--

INSERT INTO `student_payed` (`id`, `created_at`, `student_id`, `amount`, `group_id`, `month_id`, `lesson_year`, `bank_id`, `bank_transaction_id`) VALUES
(1, '2020-05-28', 1, '50.00', 1, 10, 2019, 1, NULL),
(2, '2020-07-28', 1, '20.00', 1, 10, 2019, 1, NULL),
(3, '2020-07-28', 2, '20.00', 1, 10, 2019, 1, NULL),
(4, '2020-07-28', 14, '0.00', 4, 9, 2019, 1, NULL),
(5, '2020-07-28', 15, '0.00', 4, 9, 2019, 1, NULL),
(6, '2020-07-28', 20, '0.00', 4, 9, 2019, 1, NULL),
(7, '2020-07-28', 23, '0.00', 4, 9, 2019, 1, NULL),
(8, '2020-07-28', 24, '0.00', 4, 9, 2019, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_progress_book`
--

CREATE TABLE `student_progress_book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_requests`
--

CREATE TABLE `student_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suburbs`
--

CREATE TABLE `suburbs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `town_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suburbs`
--

INSERT INTO `suburbs` (`id`, `title`, `town_id`) VALUES
(1, 'Χολαργός', 1),
(2, 'Καλλιθέα', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amka` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `afm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `total_debt` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `total_payed` decimal(10,2) UNSIGNED DEFAULT 0.00,
  `calculated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `amka`, `afm`, `member_id`, `total_debt`, `total_payed`, `calculated_at`) VALUES
(1, '', '', 1, '210.00', '0.00', '2020-08-24 11:40:23'),
(2, '', '', 2, '210.00', '0.00', '2020-08-24 11:40:23'),
(3, '24021983356', '5674359093', 190, '0.00', '0.00', NULL),
(4, '29021981535', '56883090345', 191, '0.00', '0.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_debts`
--

CREATE TABLE `teacher_debts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `month_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `lesson_year` year(4) NOT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher_debts`
--

INSERT INTO `teacher_debts` (`id`, `created_at`, `updated_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`, `starts_at`, `ends_at`) VALUES
(13, '2020-07-06 14:40:55', '2020-07-07 15:29:15', 1, '64.80', 1, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(14, '2020-07-07 05:11:58', '2020-07-07 05:11:58', 2, '0.00', 2, 8, 2019, '2019-08-01 00:00:00', '2019-08-30 23:59:59'),
(15, '2020-07-07 05:11:58', '2020-07-07 15:29:15', 2, '150.00', 2, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(16, '2020-07-06 14:40:55', '2020-07-07 15:29:15', 1, '90.00', 3, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59'),
(17, '2020-07-06 14:40:55', '2020-07-07 15:29:15', 2, '90.00', 4, 9, 2019, '2019-09-01 00:00:00', '2019-09-30 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_leave_days`
--

CREATE TABLE `teacher_leave_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `starting` datetime NOT NULL,
  `ending` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_payments`
--

CREATE TABLE `teacher_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `month_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `lesson_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher_payments`
--

INSERT INTO `teacher_payments` (`id`, `created_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`) VALUES
(1, '2020-05-28 14:48:19', 1, '210.00', 1, 10, 2019),
(2, '2020-05-28 14:48:19', 2, '210.00', 4, 10, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`id`, `teacher_id`, `course_id`) VALUES
(1, 1, 1),
(2, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(65) NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL,
  `duration_minutes` smallint(5) UNSIGNED NOT NULL DEFAULT 60,
  `description` text NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `course_id`, `title`, `difficulty`, `duration_minutes`, `description`, `active`, `created_at`) VALUES
(1, 12, 'Προκαταρτικό τεστ', 1, 60, '', 1, '2020-07-03 18:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `test_progress`
--

CREATE TABLE `test_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `shown_at` datetime NOT NULL,
  `answered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_progress`
--

INSERT INTO `test_progress` (`id`, `submission_id`, `question_id`, `shown_at`, `answered_at`) VALUES
(3, 1, 2, '2020-07-03 10:44:44', '2020-07-31 10:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pool_question_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `test_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `points` tinyint(3) UNSIGNED NOT NULL,
  `penalty` tinyint(3) UNSIGNED NOT NULL,
  `shown_order` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `multiple_select` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `pool_question_id`, `test_id`, `points`, `penalty`, `shown_order`, `active`, `multiple_select`) VALUES
(1, 1, 1, 4, 10, 2, 1, 0),
(2, 2, 1, 4, 10, 1, 1, 0),
(3, 3, 1, 4, 10, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_submissions`
--

CREATE TABLE `test_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `time_window_starts` datetime NOT NULL,
  `time_window_ends` datetime NOT NULL,
  `started_at` datetime DEFAULT NULL COMMENT 'when test started',
  `ended_at` datetime DEFAULT NULL COMMENT 'when test finished',
  `deadline_at` datetime DEFAULT NULL COMMENT 'when  test expires',
  `duration_mins` smallint(5) UNSIGNED NOT NULL,
  `mins_remaining` smallint(5) UNSIGNED NOT NULL,
  `grade` decimal(10,2) NOT NULL,
  `completed` tinyint(3) UNSIGNED NOT NULL,
  `cheat_counter` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_submissions`
--

INSERT INTO `test_submissions` (`id`, `application_id`, `session_id`, `test_id`, `time_window_starts`, `time_window_ends`, `started_at`, `ended_at`, `deadline_at`, `duration_mins`, `mins_remaining`, `grade`, `completed`, `cheat_counter`) VALUES
(1, 1, 'snW1jVuSezMQJFsN0BDKLIk3iXj3zWV', 1, '2019-09-18 00:00:00', '2019-09-28 00:00:00', '2019-09-21 10:00:00', NULL, '2019-09-21 11:30:00', 120, 120, '0.00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_submissions_answers`
--

CREATE TABLE `test_submissions_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `perfecture_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`id`, `title`, `perfecture_id`) VALUES
(1, 'Athens', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_categories`
--

CREATE TABLE `transaction_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL,
  `is_profit` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_categories`
--

INSERT INTO `transaction_categories` (`id`, `title`, `is_profit`) VALUES
(1, 'Debit', 1),
(2, 'Credit', 0),
(3, 'Refunded', 0),
(4, 'Chargeback', 0),
(5, 'Refunded reversed', 1),
(6, 'Chargeback reversed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `univ_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `password`, `enabled`) VALUES
(2, '2020-07-17 15:23:43', '2020-07-17 15:23:43', 'strindberg', '{noop}pass', 1);

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
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_2` (`username`,`authority`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

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
  ADD UNIQUE KEY `title` (`title`,`course_type_id`),
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
  ADD KEY `courses_wages_history_course_id_foreign` (`course_id`),
  ADD KEY `created_at` (`created_at`);

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
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_days_on_name` (`name`);

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
  ADD KEY `groups_age_id_foreign` (`age_id`),
  ADD KEY `groups_fee_id_foreign` (`fee_id`),
  ADD KEY `groups_wage_id_foreign` (`wage_id`),
  ADD KEY `groups_course_id_foreign` (`course_id`),
  ADD KEY `rank_id` (`rank_id`),
  ADD KEY `FKat205al2gpkgh81q73blgn0r5` (`speed_id`);

--
-- Indexes for table `groups_teachers`
--
ALTER TABLE `groups_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_2` (`group_id`,`teacher_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `groups_teachers_wages_history`
--
ALTER TABLE `groups_teachers_wages_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_2` (`group_id`,`teacher_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `group_ranks`
--
ALTER TABLE `group_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_students`
--
ALTER TABLE `group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`,`student_id`),
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
-- Indexes for table `installments_per_group`
--
ALTER TABLE `installments_per_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `installments_student_id_foreign` (`student_id`),
  ADD KEY `group_id` (`group_id`);

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
-- Indexes for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  ADD PRIMARY KEY (`id`),
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
-- Indexes for table `job_application_studies`
--
ALTER TABLE `job_application_studies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `job_application_work`
--
ALTER TABLE `job_application_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

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
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

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
  ADD KEY `members_suburb_id_foreign` (`suburb_id`);

--
-- Indexes for table `members_aud`
--
ALTER TABLE `members_aud`
  ADD PRIMARY KEY (`id`,`rev`);

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
-- Indexes for table `payments_in_advance`
--
ALTER TABLE `payments_in_advance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

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
  ADD KEY `payroll_id` (`payroll_id`),
  ADD KEY `payroll_category_id` (`payroll_category_id`);

--
-- Indexes for table `payroll_categories`
--
ALTER TABLE `payroll_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_groups_analysis`
--
ALTER TABLE `payroll_groups_analysis`
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
-- Indexes for table `pools`
--
ALTER TABLE `pools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `pool_chapters`
--
ALTER TABLE `pool_chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pool_id` (`pool_id`);

--
-- Indexes for table `pool_questions`
--
ALTER TABLE `pool_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `pool_question_answers`
--
ALTER TABLE `pool_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `pool_review_questions`
--
ALTER TABLE `pool_review_questions`
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
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `created_at` (`created_at`);

--
-- Indexes for table `revenue_categories`
--
ALTER TABLE `revenue_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_questionnaire_questions`
--
ALTER TABLE `review_questionnaire_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `questionnaire_id_2` (`questionnaire_id`,`chapter_id`,`question_id`),
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
-- Indexes for table `review_submission_answers`
--
ALTER TABLE `review_submission_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `submission_id_2` (`submission_id`,`question_id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `question_id_2` (`question_id`);

--
-- Indexes for table `revinfo`
--
ALTER TABLE `revinfo`
  ADD PRIMARY KEY (`rev`);

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
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_timetablings_on_days_id` (`days_id`),
  ADD KEY `index_timetablings_on_starting_hour_id` (`starting_hour_id`),
  ADD KEY `index_timetablings_on_ending_hour_id` (`ending_hour_id`);

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
  ADD UNIQUE KEY `member_id` (`member_id`),
  ADD KEY `students_member_id_foreign` (`member_id`);

--
-- Indexes for table `student_debts`
--
ALTER TABLE `student_debts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`group_id`,`month_id`,`lesson_year`),
  ADD KEY `student_debts_group_id_foreign` (`group_id`),
  ADD KEY `student_debts_month_id_foreign` (`month_id`);

--
-- Indexes for table `student_payed`
--
ALTER TABLE `student_payed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_payed_student_id_foreign` (`student_id`),
  ADD KEY `student_payed_group_id_foreign` (`group_id`),
  ADD KEY `student_payed_month_id_foreign` (`month_id`),
  ADD KEY `bank_id` (`bank_id`);

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
  ADD UNIQUE KEY `teacher_id` (`teacher_id`,`group_id`,`month_id`,`lesson_year`),
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
  ADD UNIQUE KEY `teacher_id` (`teacher_id`,`course_id`),
  ADD KEY `teaches_course_id_foreign` (`course_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `test_progress`
--
ALTER TABLE `test_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `submission_id_2` (`submission_id`,`question_id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pool_question_id` (`pool_question_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `test_submissions`
--
ALTER TABLE `test_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `test_submissions_answers`
--
ALTER TABLE `test_submissions_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `towns_perfecture_id_foreign` (`perfecture_id`);

--
-- Indexes for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absencies`
--
ALTER TABLE `absencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ages`
--
ALTER TABLE `ages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `courses_fees_history`
--
ALTER TABLE `courses_fees_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses_wages_history`
--
ALTER TABLE `courses_wages_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_fees`
--
ALTER TABLE `course_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_grades`
--
ALTER TABLE `course_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_type`
--
ALTER TABLE `course_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_wages`
--
ALTER TABLE `course_wages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `diplomas`
--
ALTER TABLE `diplomas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_model`
--
ALTER TABLE `discount_model`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grading_sys`
--
ALTER TABLE `grading_sys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `groupakia`
--
ALTER TABLE `groupakia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups_teachers`
--
ALTER TABLE `groups_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groups_teachers_wages_history`
--
ALTER TABLE `groups_teachers_wages_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_ranks`
--
ALTER TABLE `group_ranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_students`
--
ALTER TABLE `group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installments_per_group`
--
ALTER TABLE `installments_per_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instituts`
--
ALTER TABLE `instituts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `interviews_grading`
--
ALTER TABLE `interviews_grading`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interview_stages`
--
ALTER TABLE `interview_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `job_application_courses`
--
ALTER TABLE `job_application_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_application_studies`
--
ALTER TABLE `job_application_studies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_application_work`
--
ALTER TABLE `job_application_work`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_openings`
--
ALTER TABLE `job_openings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_opening_courses`
--
ALTER TABLE `job_opening_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `logbook`
--
ALTER TABLE `logbook`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `mock_exams`
--
ALTER TABLE `mock_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mock_exams_results_numeric`
--
ALTER TABLE `mock_exams_results_numeric`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mock_exams_results_text`
--
ALTER TABLE `mock_exams_results_text`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `musical_instruments`
--
ALTER TABLE `musical_instruments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `musical_instrument_type`
--
ALTER TABLE `musical_instrument_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parents_children`
--
ALTER TABLE `parents_children`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments_in_advance`
--
ALTER TABLE `payments_in_advance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_analysis`
--
ALTER TABLE `payroll_analysis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_categories`
--
ALTER TABLE `payroll_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payroll_groups_analysis`
--
ALTER TABLE `payroll_groups_analysis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perfectures`
--
ALTER TABLE `perfectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `periods`
--
ALTER TABLE `periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pools`
--
ALTER TABLE `pools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pool_chapters`
--
ALTER TABLE `pool_chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pool_questions`
--
ALTER TABLE `pool_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pool_question_answers`
--
ALTER TABLE `pool_question_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pool_review_questions`
--
ALTER TABLE `pool_review_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `progress_book`
--
ALTER TABLE `progress_book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real_exams`
--
ALTER TABLE `real_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `real_exams_results_numeric`
--
ALTER TABLE `real_exams_results_numeric`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real_exams_results_text`
--
ALTER TABLE `real_exams_results_text`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration_fees`
--
ALTER TABLE `registration_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `revenue_categories`
--
ALTER TABLE `revenue_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_questionnaire`
--
ALTER TABLE `review_questionnaire`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `review_questionnaire_chapters`
--
ALTER TABLE `review_questionnaire_chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_questionnaire_questions`
--
ALTER TABLE `review_questionnaire_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `review_questionnaire_submission`
--
ALTER TABLE `review_questionnaire_submission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_submission_answers`
--
ALTER TABLE `review_submission_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revinfo`
--
ALTER TABLE `revinfo`
  MODIFY `rev` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salary_history`
--
ALTER TABLE `salary_history`
  MODIFY `sal_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_classes`
--
ALTER TABLE `school_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `school_courses`
--
ALTER TABLE `school_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminars`
--
ALTER TABLE `seminars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminar_categories`
--
ALTER TABLE `seminar_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminar_certificates`
--
ALTER TABLE `seminar_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_certificate_modules`
--
ALTER TABLE `seminar_certificate_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_certificate_teachers`
--
ALTER TABLE `seminar_certificate_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_chapters`
--
ALTER TABLE `seminar_chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_groups`
--
ALTER TABLE `seminar_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seminar_modules`
--
ALTER TABLE `seminar_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seminar_modules_curriculum`
--
ALTER TABLE `seminar_modules_curriculum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminar_teachers`
--
ALTER TABLE `seminar_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `speeds`
--
ALTER TABLE `speeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `student_debts`
--
ALTER TABLE `student_debts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `student_payed`
--
ALTER TABLE `student_payed`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student_progress_book`
--
ALTER TABLE `student_progress_book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_requests`
--
ALTER TABLE `student_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suburbs`
--
ALTER TABLE `suburbs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_debts`
--
ALTER TABLE `teacher_debts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `teacher_leave_days`
--
ALTER TABLE `teacher_leave_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_payments`
--
ALTER TABLE `teacher_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teaches`
--
ALTER TABLE `teaches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_progress`
--
ALTER TABLE `test_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_submissions`
--
ALTER TABLE `test_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_submissions_answers`
--
ALTER TABLE `test_submissions_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `university_department`
--
ALTER TABLE `university_department`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `university_type`
--
ALTER TABLE `university_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absencies`
--
ALTER TABLE `absencies`
  ADD CONSTRAINT `absencies_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`),
  ADD CONSTRAINT `absencies_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

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
  ADD CONSTRAINT `diploma_grades_diploma_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

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
  ADD CONSTRAINT `groupakia_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `group_ranks` (`id`),
  ADD CONSTRAINT `groupakia_ibfk_2` FOREIGN KEY (`wage_id`) REFERENCES `course_wages` (`id`),
  ADD CONSTRAINT `groups_age_id_foreign` FOREIGN KEY (`age_id`) REFERENCES `ages` (`id`),
  ADD CONSTRAINT `groups_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `groups_fee_id_foreign` FOREIGN KEY (`fee_id`) REFERENCES `course_fees` (`id`),
  ADD CONSTRAINT `groups_speed_id_foreign` FOREIGN KEY (`speed_id`) REFERENCES `speeds` (`id`);

--
-- Constraints for table `groups_teachers`
--
ALTER TABLE `groups_teachers`
  ADD CONSTRAINT `groups_teachers_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `groups_teachers_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `groups_teachers_wages_history`
--
ALTER TABLE `groups_teachers_wages_history`
  ADD CONSTRAINT `groups_teachers_wages_history_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `groups_teachers_wages_history_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

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
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `history_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `installments_per_group`
--
ALTER TABLE `installments_per_group`
  ADD CONSTRAINT `installments_per_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`);

--
-- Constraints for table `interviews_grading`
--
ALTER TABLE `interviews_grading`
  ADD CONSTRAINT `interviews_grading_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`),
  ADD CONSTRAINT `interviews_grading_ibfk_2` FOREIGN KEY (`stage_id`) REFERENCES `interview_stages` (`id`);

--
-- Constraints for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  ADD CONSTRAINT `interview_schedule_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`);

--
-- Constraints for table `interview_stages`
--
ALTER TABLE `interview_stages`
  ADD CONSTRAINT `interview_stages_ibfk_1` FOREIGN KEY (`opening_id`) REFERENCES `job_openings` (`id`);

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_ibfk_1` FOREIGN KEY (`opening_id`) REFERENCES `job_openings` (`id`);

--
-- Constraints for table `job_application_courses`
--
ALTER TABLE `job_application_courses`
  ADD CONSTRAINT `job_application_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `job_application_courses_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`);

--
-- Constraints for table `job_application_studies`
--
ALTER TABLE `job_application_studies`
  ADD CONSTRAINT `job_application_studies_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`);

--
-- Constraints for table `job_opening_courses`
--
ALTER TABLE `job_opening_courses`
  ADD CONSTRAINT `job_opening_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `job_opening_courses_ibfk_2` FOREIGN KEY (`opening_id`) REFERENCES `job_openings` (`id`);

--
-- Constraints for table `logbook`
--
ALTER TABLE `logbook`
  ADD CONSTRAINT `logbook_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`),
  ADD CONSTRAINT `logbook_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_suburb_id_foreign` FOREIGN KEY (`suburb_id`) REFERENCES `suburbs` (`id`);

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
  ADD CONSTRAINT `mock_exams_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `mock_exams` (`id`),
  ADD CONSTRAINT `mock_exams_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `mock_exams_results_text`
--
ALTER TABLE `mock_exams_results_text`
  ADD CONSTRAINT `mock_exams_results_text_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `mock_exams` (`id`),
  ADD CONSTRAINT `mock_exams_results_text_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `mock_exams_results_text_ibfk_3` FOREIGN KEY (`text_grade_id`) REFERENCES `course_grades` (`id`);

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
-- Constraints for table `payments_in_advance`
--
ALTER TABLE `payments_in_advance`
  ADD CONSTRAINT `payments_in_advance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

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
  ADD CONSTRAINT `payroll_analysis_ibfk_1` FOREIGN KEY (`payroll_category_id`) REFERENCES `payroll_categories` (`id`),
  ADD CONSTRAINT `payroll_analysis_ibfk_2` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`id`);

--
-- Constraints for table `payroll_groups_analysis`
--
ALTER TABLE `payroll_groups_analysis`
  ADD CONSTRAINT `payroll_analysis_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groupakia` (`id`),
  ADD CONSTRAINT `payroll_analysis_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`id`);

--
-- Constraints for table `pools`
--
ALTER TABLE `pools`
  ADD CONSTRAINT `pools_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `pool_chapters`
--
ALTER TABLE `pool_chapters`
  ADD CONSTRAINT `pool_chapters_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`id`);

--
-- Constraints for table `pool_questions`
--
ALTER TABLE `pool_questions`
  ADD CONSTRAINT `pool_questions_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `pool_chapters` (`id`);

--
-- Constraints for table `pool_question_answers`
--
ALTER TABLE `pool_question_answers`
  ADD CONSTRAINT `pool_question_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `pool_questions` (`id`);

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
-- Constraints for table `real_exams_results_text`
--
ALTER TABLE `real_exams_results_text`
  ADD CONSTRAINT `real_exams_results_text_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `real_exams` (`id`),
  ADD CONSTRAINT `real_exams_results_text_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `real_exams_results_text_ibfk_3` FOREIGN KEY (`text_grade_id`) REFERENCES `course_grades` (`id`);

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
  ADD CONSTRAINT `review_questionnaire_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `review_questionnaire_questions`
--
ALTER TABLE `review_questionnaire_questions`
  ADD CONSTRAINT `FKmi49n1wu1bp6i7asrb6w3f71d` FOREIGN KEY (`chapter_id`) REFERENCES `review_questionnaire_chapters` (`id`),
  ADD CONSTRAINT `FKr8otb15feo3y1iri45eqobodo` FOREIGN KEY (`questionnaire_id`) REFERENCES `review_questionnaire` (`id`),
  ADD CONSTRAINT `review_questionnaire_questions_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `pool_review_questions` (`id`);

--
-- Constraints for table `review_questionnaire_submission`
--
ALTER TABLE `review_questionnaire_submission`
  ADD CONSTRAINT `review_questionnaire_submission_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `review_questionnaire` (`id`);

--
-- Constraints for table `review_submission_answers`
--
ALTER TABLE `review_submission_answers`
  ADD CONSTRAINT `review_submission_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `review_questionnaire_questions` (`id`),
  ADD CONSTRAINT `review_submission_answers_ibfk_2` FOREIGN KEY (`submission_id`) REFERENCES `review_questionnaire_submission` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `salary_history`
--
ALTER TABLE `salary_history`
  ADD CONSTRAINT `salary_history_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teaches` (`id`);

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
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`days_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `shifts_ibfk_2` FOREIGN KEY (`starting_hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `shifts_ibfk_3` FOREIGN KEY (`ending_hour_id`) REFERENCES `hours` (`id`);

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
  ADD CONSTRAINT `student_payed_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
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
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `test_progress`
--
ALTER TABLE `test_progress`
  ADD CONSTRAINT `test_progress_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `test_questions` (`id`),
  ADD CONSTRAINT `test_progress_ibfk_2` FOREIGN KEY (`submission_id`) REFERENCES `test_submissions` (`id`);

--
-- Constraints for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD CONSTRAINT `test_questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`),
  ADD CONSTRAINT `test_questions_ibfk_2` FOREIGN KEY (`pool_question_id`) REFERENCES `pool_questions` (`id`);

--
-- Constraints for table `test_submissions`
--
ALTER TABLE `test_submissions`
  ADD CONSTRAINT `test_submissions_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`),
  ADD CONSTRAINT `test_submissions_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`);

--
-- Constraints for table `test_submissions_answers`
--
ALTER TABLE `test_submissions_answers`
  ADD CONSTRAINT `test_submissions_answers_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `pool_question_answers` (`id`),
  ADD CONSTRAINT `test_submissions_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `test_questions` (`id`),
  ADD CONSTRAINT `test_submissions_answers_ibfk_3` FOREIGN KEY (`submission_id`) REFERENCES `test_submissions` (`id`);

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
