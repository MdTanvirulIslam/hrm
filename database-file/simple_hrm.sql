-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 10:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_lists`
--

CREATE TABLE `account_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(191) NOT NULL,
  `initial_balance` double NOT NULL DEFAULT 0,
  `account_number` varchar(191) NOT NULL,
  `branch_code` varchar(191) NOT NULL,
  `bank_branch` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `allowance_option` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `employee_id`, `allowance_option`, `title`, `amount`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Sr. Engineer', 1000.00, 'fixed', 1, '2024-08-28 08:36:56', '2024-08-28 08:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `allowance_options`
--

CREATE TABLE `allowance_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowance_options`
--

INSERT INTO `allowance_options` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Mobile Allowance', 1, '2024-08-28 08:04:19', '2024-08-28 08:04:19'),
(2, 'Laptop Allowance', 1, '2024-08-28 08:04:32', '2024-08-28 08:04:32'),
(3, 'Tour Allowance', 1, '2024-08-28 08:04:46', '2024-08-28 08:04:46'),
(4, 'Conveyance', 1, '2024-08-28 08:04:56', '2024-08-28 08:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` varchar(191) NOT NULL,
  `employee_id` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_employees`
--

CREATE TABLE `announcement_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` int(11) NOT NULL DEFAULT 0,
  `employee` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(191) DEFAULT NULL,
  `appraisal_date` varchar(191) NOT NULL,
  `customer_experience` int(11) NOT NULL DEFAULT 0,
  `marketing` int(11) NOT NULL DEFAULT 0,
  `administration` int(11) NOT NULL DEFAULT 0,
  `professionalism` int(11) NOT NULL DEFAULT 0,
  `integrity` int(11) NOT NULL DEFAULT 0,
  `attendance` int(11) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `purchase_date` date NOT NULL,
  `supported_date` date NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_employees`
--

CREATE TABLE `attendance_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(191) NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time NOT NULL,
  `late` time NOT NULL,
  `early_leaving` time NOT NULL,
  `overtime` time NOT NULL,
  `total_rest` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_employees`
--

INSERT INTO `attendance_employees` (`id`, `employee_id`, `date`, `status`, `clock_in`, `clock_out`, `late`, `early_leaving`, `overtime`, `total_rest`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-08-27 06:25:20', '2024-08-27 06:25:20'),
(2, 2, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:14', '2024-09-01 06:25:14'),
(3, 4, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:14', '2024-09-01 06:25:14'),
(4, 5, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:14', '2024-09-01 06:25:14'),
(5, 6, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:14', '2024-09-01 06:25:14'),
(6, 7, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:35', '2024-09-01 06:25:35'),
(7, 8, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:35', '2024-09-01 06:25:35'),
(8, 3, '2024-08-28', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-01 06:25:46', '2024-09-01 06:25:46'),
(9, 1, '2024-09-03', 'Present', '10:00:00', '14:22:00', '00:00:00', '03:38:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:35:33', '2024-09-03 06:35:33'),
(10, 2, '2024-09-03', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:35:33', '2024-09-03 06:35:33'),
(11, 4, '2024-09-03', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:35:33', '2024-09-03 06:35:33'),
(12, 5, '2024-09-03', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:35:33', '2024-09-03 06:35:33'),
(13, 6, '2024-09-03', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:35:33', '2024-09-03 06:35:33'),
(14, 12, '2024-09-03', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:35:33', '2024-09-03 06:35:33'),
(15, 3, '2024-09-03', 'Present', '10:00:00', '18:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 1, '2024-09-03 06:37:17', '2024-09-03 06:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `award_type` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `gift` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `award_types`
--

INSERT INTO `award_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Employee of the year', 1, '2024-08-28 08:06:50', '2024-08-28 08:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `bg_pg_models`
--

CREATE TABLE `bg_pg_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tender_name` varchar(255) NOT NULL,
  `tender_reference_no` varchar(255) DEFAULT NULL,
  `tender_id` varchar(100) DEFAULT NULL,
  `tender_published_date` date NOT NULL,
  `bg_pg_type` varchar(55) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bg_pg_no` varchar(100) NOT NULL,
  `bg_pg_date` date NOT NULL,
  `bg_pg_amount` double(12,2) UNSIGNED NOT NULL,
  `bg_pg_expire_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bg_pg_models`
--

INSERT INTO `bg_pg_models` (`id`, `client_name`, `address`, `tender_name`, `tender_reference_no`, `tender_id`, `tender_published_date`, `bg_pg_type`, `bank_name`, `bg_pg_no`, `bg_pg_date`, `bg_pg_amount`, `bg_pg_expire_date`, `status`, `created_at`, `updated_at`) VALUES
(2147, 'Biman', 'Biman Bangladesh', 'EDR MDR', 'OTM- 080/2024-2025', '9876', '2025-01-01', 'PO', 'Premier Bank', '1525208888', '2025-01-23', 190000.00, '2025-03-12', 1, NULL, '2025-03-04 04:39:08'),
(2153, 'ABCD', 'ABCD Bangladesh', 'EDR MDR', 'OTM- 080/2024-2025', '9876', '2025-02-27', 'BG', 'Premier Bank', '88909008888', '2025-02-18', 190000.00, '2025-02-28', 2, NULL, '2025-03-04 16:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Niketon', 1, '2024-08-27 06:17:47', '2024-09-01 06:21:23'),
(2, 'Registered Office (34/5, Road-03, Shyamoli Dhaka)', 1, '2024-08-28 08:16:17', '2024-08-28 08:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(191) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_policies`
--

CREATE TABLE `company_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competencies`
--

CREATE TABLE `competencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `complaint_from` int(11) NOT NULL,
  `complaint_against` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `complaint_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `employee_name` int(11) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `description` longtext DEFAULT NULL,
  `contract_description` longtext DEFAULT NULL,
  `employee_signature` longtext DEFAULT NULL,
  `company_signature` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_attechments`
--

CREATE TABLE `contract_attechments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `files` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_comments`
--

CREATE TABLE `contract_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `comment` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_notes`
--

CREATE TABLE `contract_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'All Agreements', 1, '2024-08-28 08:12:24', '2024-08-28 08:12:24'),
(2, 'BG/PG', 1, '2024-08-28 08:12:40', '2024-08-28 08:12:40'),
(3, 'Partnership', 1, '2024-08-28 08:12:51', '2024-08-28 08:12:51'),
(4, 'Membership', 1, '2024-08-28 08:13:00', '2024-08-28 08:13:00'),
(5, 'BUET', 1, '2024-11-25 04:53:48', '2024-11-25 04:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `custom_questions`
--

CREATE TABLE `custom_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) NOT NULL,
  `is_required` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deduction_options`
--

CREATE TABLE `deduction_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `branch_id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical', 1, '2024-08-27 06:18:04', '2024-08-27 06:18:04'),
(2, 1, 'Sales', 1, '2024-08-28 07:32:38', '2024-08-28 07:32:38'),
(3, 1, 'HR and Admin', 1, '2024-08-28 07:33:04', '2024-08-28 07:33:04'),
(4, 1, 'Accounting', 1, '2024-08-28 07:33:19', '2024-08-28 07:33:19'),
(5, 1, 'Support', 1, '2024-08-28 07:33:36', '2024-08-28 07:33:36'),
(6, 1, 'Service', 1, '2024-08-28 07:33:51', '2024-08-28 07:33:51'),
(7, 1, 'Management', 1, '2024-08-28 07:40:01', '2024-08-28 07:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `referal_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `department_id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sr. Engineer', 1, '2024-08-27 06:18:27', '2024-08-27 06:18:27'),
(2, 1, 'General Manager', 1, '2024-08-28 07:34:14', '2024-08-28 07:34:14'),
(3, 1, 'Network Engineer', 1, '2024-08-28 07:34:47', '2024-08-28 07:34:47'),
(4, 1, 'System Engineer', 1, '2024-08-28 07:35:07', '2024-08-28 07:35:07'),
(5, 1, 'Junior Engineer', 1, '2024-08-28 07:36:50', '2024-08-28 07:36:50'),
(6, 2, 'Manager', 1, '2024-08-28 07:37:42', '2024-08-28 07:37:42'),
(7, 2, 'Assistant Manager', 1, '2024-08-28 07:38:05', '2024-08-28 07:38:05'),
(8, 2, 'Senior Manager', 1, '2024-08-28 07:38:29', '2024-08-28 07:38:29'),
(9, 7, 'Managing Director', 1, '2024-08-28 07:40:37', '2024-08-28 07:40:37'),
(10, 7, 'Director', 1, '2024-08-28 07:40:51', '2024-08-28 07:40:51'),
(11, 6, 'Project Manager', 1, '2024-08-28 07:41:16', '2024-08-28 07:41:16'),
(12, 5, 'Office Assistant', 1, '2024-08-28 07:43:22', '2024-08-28 07:43:22'),
(13, 5, 'Cleaner', 1, '2024-08-28 07:43:34', '2024-08-28 07:43:34'),
(14, 3, 'Executive', 1, '2024-08-28 08:32:35', '2024-08-28 08:32:35'),
(15, 2, 'Sales, Executive', 1, '2024-11-25 04:45:10', '2024-11-25 04:45:10'),
(16, 1, 'Network Technician', 1, '2024-11-25 04:52:21', '2024-11-25 04:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_required` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ducument_uploads`
--

CREATE TABLE `ducument_uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL,
  `document` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ducument_uploads`
--

INSERT INTO `ducument_uploads` (`id`, `name`, `role`, `document`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'BB', '0', 'HSM Letter BB_1724735054.pdf', 'Bangladesh Bank Letter', 1, '2024-08-26 23:04:14', '2024-08-26 23:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `from` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `slug`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'New User', NULL, 'new_user', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(2, 'New Employee', NULL, 'new_employee', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 'New Payroll', NULL, 'new_payroll', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 'New Ticket', NULL, 'new_ticket', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 'New Award', NULL, 'new_award', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(6, 'Employee Transfer', NULL, 'employee_transfer', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(7, 'Employee Resignation', NULL, 'employee_resignation', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(8, 'Employee Trip', NULL, 'employee_trip', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(9, 'Employee Promotion', NULL, 'employee_promotion', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(10, 'Employee Complaints', NULL, 'employee_complaints', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(11, 'Employee Warning', NULL, 'employee_warning', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(12, 'Employee Termination', NULL, 'employee_termination', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(13, 'Leave Status', NULL, 'leave_status', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(14, 'contract', NULL, 'contract', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `email_template_langs`
--

CREATE TABLE `email_template_langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'New User', '<p>مرحبا,</p>\n                    <p>مرحبا بك في { app_name }.</p>\n                    <p>.. أنت الآن مستعمل</p>\n                    <p>البريد الالكتروني : { mail } كلمة السرية : { password }</p>\n                    <p>{ app_url }</p>\n                    <p>شكرا</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(2, 1, 'da', 'New User', '<p>Hej,</p>\n                    <p>velkommen til { app_name }.</p>\n                    <p>Du er nu bruger ..</p>\n                    <p>E-mail: { email }</p>\n                    <p>kodeord: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>Tak.</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 1, 'de', 'New User', '<p>Hallo,</p>\n                    <p>Willkommen bei {app_name}.</p>\n                    <p>Sie sind jetzt Benutzer.</p>\n                    <p><strong>E-Mail: {email} </strong></p>\n                    <p><strong>Kennwort: {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>Danke,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 1, 'en', 'New User', '<p>Hello,&nbsp;<br />Welcome to {app_name}.</p>\n                    <p><strong>You are now user..</strong></p>\n                    <p><strong>Email </strong>: {email}<br /><strong>Password</strong> : {password}</p>\n                    <p>{app_url}</p>\n                    <p>Thanks,<br />{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 1, 'es', 'New User', '<p>Hola,</p>\n                    <p>Bienvenido a {app_name}.</p>\n                    <p>Ahora es usuario ..</p>\n                    <p><strong>Correo electr&oacute;nico: {email}</strong></p>\n                    <p><strong> Contrase&ntilde;a: {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>Gracias,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(6, 1, 'fr', 'New User', '<p>Bonjour,</p>\n                    <p>Bienvenue dans { app_name }.</p>\n                    <p>Vous &ecirc;tes maintenant utilisateur.</p>\n                    <p><strong>E-mail: { email } </strong></p>\n                    <p><strong>Mot de passe: { password }</strong></p>\n                    <p>{ adresse_url }</p>\n                    <p>Merci,</p>\n                    <p>{ nom_app }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(7, 1, 'it', 'New User', '<p>Ciao,</p>\n                    <p>Benvenuti in {app_name}.</p>\n                    <p>Ora sei utente ..</p>\n                    <p><strong>Email: {email} </strong></p>\n                    <p><strong>Password: {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>Grazie,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(8, 1, 'ja', 'New User', '<p>こんにちは、</p>\n                    <p>{app_name}へようこそ。</p>\n                    <p>これで、ユーザーは</p>\n                    <p><strong>E メール : {email}</strong></p>\n                    <p><strong> パスワード : {password}</strong></p>\n                    <p>{app_url}</p>\n                    <p>ありがとう。</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(9, 1, 'nl', 'New User', '<p>Hallo,</p>\n                    <p>Welkom bij { app_name }.</p>\n                    <p>U bent nu gebruiker ..</p>\n                    <p><strong>E-mail: { email }</strong></p>\n                    <p><strong> Wachtwoord: { password }</strong></p>\n                    <p>{ app_url }</p>\n                    <p>Bedankt.</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(10, 1, 'pl', 'New User', '<p>Witaj,</p>\n                    <p>Witamy w aplikacji {app_name }.</p>\n                    <p>Jesteś teraz użytkownikiem ..</p>\n                    <p><strong>E-mail</strong>: {email }</p>\n                    <p><strong>Hasło</strong>: {password }</p>\n                    <p>{app_url }</p>\n                    <p>Dziękuję,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(11, 1, 'ru', 'New User', '<p>Здравствуйте,</p>\n                    <p>Добро пожаловать в { app_name }.</p>\n                    <p>Вы теперь пользователь ..</p>\n                    <p><strong>Адрес электронной почты</strong>: { email }</p>\n                    <p><strong> Пароль</strong>: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>Спасибо.</p>\n                    <p>{ app_name&nbsp;}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(12, 1, 'pt', 'New User', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Ol&aacute;, </span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Bem-vindo a {app_name}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Voc&ecirc; agora &eacute; usu&aacute;rio ..</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong>E-mail</strong>: {email}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong> Senha</strong>: {senha}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_url}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(13, 2, 'ar', 'New Employee', '<p>مرحبا { employe_name } ،</p>\n                    <p>مرحبا بك في { app_name }.</p>\n                    <p>أنت الآن موظف</p>\n                    <p>البريد الالكتروني : { employe_email }</p>\n                    <p>كلمة السرية : { employe_password }</p>\n                    <p>{ app_url }</p>\n                    <p>شكرا</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(14, 2, 'da', 'New Employee', '<p>Hej { employee_name },</p>\n                    <p>velkommen til { app_name }.</p>\n                    <p>Du er nu ansat ...</p>\n                    <p>E-mail: { employee_email }</p>\n                    <p>Kodeord: { employee_kodeord }</p>\n                    <p>{ app_url }</p>\n                    <p>Tak.</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(15, 2, 'de', 'New Employee', '<p>Hello {employee_name},</p>\n                    <p>Willkommen bei {app_name}.</p>\n                    <p>Sie sind jetzt Mitarbeiter.</p>\n                    <p>E-Mail: {employee_email}</p>\n                    <p>Kennwort: {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Danke,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(16, 2, 'en', 'New Employee', '<p>Hello {employee_name},&nbsp;<br />Welcome to {app_name}.</p>\n                    <p>You are now Employee..</p>\n                    <p><strong>Email </strong>: {employee_email}</p>\n                    <p><strong>Password</strong> : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Thanks,<br />{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(17, 2, 'es', 'New Employee', '<p style=\"line-height: 28px;\">Hello {employee_name},</p>\n                    <p style=\"line-height: 28px;\">Bienvenido a {app_name}.</p>\n                    <p style=\"line-height: 28px;\">Ahora es Empleado.</p>\n                    <p style=\"line-height: 28px;\">Correo electr&oacute;nico: {employee_email}</p>\n                    <p style=\"line-height: 28px;\">Contrase&ntilde;a: {employee_password}</p>\n                    <p style=\"line-height: 28px;\">{app_url}</p>\n                    <p style=\"line-height: 28px;\">Gracias,</p>\n                    <p style=\"line-height: 28px;\">{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(18, 2, 'fr', 'New Employee', '<p style=\"line-height: 28px;\">Hello { employee_name },</p>\n                    <p style=\"line-height: 28px;\">Bienvenue dans { app_name }.</p>\n                    <p style=\"line-height: 28px;\">Vous &ecirc;tes maintenant Employ&eacute; ..</p>\n                    <p style=\"line-height: 28px;\">Adresse &eacute;lectronique: { employee_email }</p>\n                    <p style=\"line-height: 28px;\">Mot de passe: { employee_password }</p>\n                    <p style=\"line-height: 28px;\">{ adresse_url }</p>\n                    <p style=\"line-height: 28px;\">Merci,</p>\n                    <p style=\"line-height: 28px;\">{ nom_app }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(19, 2, 'it', 'New Employee', '<p style=\"line-height: 28px;\">Hello {employee_name},</p>\n                    <p style=\"line-height: 28px;\">Benvenuti in {app_name}.</p>\n                    <p style=\"line-height: 28px;\">Ora sei Dipendente ..</p>\n                    <p style=\"line-height: 28px;\">Email: {employee_email}</p>\n                    <p style=\"line-height: 28px;\">Password: {employee_password}</p>\n                    <p style=\"line-height: 28px;\">{app_url}</p>\n                    <p style=\"line-height: 28px;\">Grazie,</p>\n                    <p style=\"line-height: 28px;\">{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(20, 2, 'ja', 'New Employee', '<p>{ employee_name} にようこそ、</p>\n                    <p>{app_name}へようこそ。</p>\n                    <p>今は従業員です。</p>\n                    <p>E メール : {employee_email}</p>\n                    <p>パスワード : {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>ありがとう。</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(21, 2, 'nl', 'New Employee', '<p style=\"line-height: 28px;\">Hallo { employee_name },</p>\n                    <p style=\"line-height: 28px;\">Welkom bij { app_name }.</p>\n                    <p style=\"line-height: 28px;\">U bent nu werknemer ..</p>\n                    <p style=\"line-height: 28px;\">E-mail: { employee_email }</p>\n                    <p style=\"line-height: 28px;\">Wachtwoord: { employee_password }</p>\n                    <p style=\"line-height: 28px;\">{ app_url }</p>\n                    <p style=\"line-height: 28px;\">Bedankt.</p>\n                    <p style=\"line-height: 28px;\">{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(22, 2, 'pl', 'New Employee', '<p style=\"line-height: 28px;\">Witaj {employee_name },</p>\n                    <p style=\"line-height: 28px;\">Witamy w aplikacji {app_name }.</p>\n                    <p style=\"line-height: 28px;\">Jesteś teraz Pracownik ..</p>\n                    <p style=\"line-height: 28px;\">E-mail: {employee_email }</p>\n                    <p style=\"line-height: 28px;\">Hasło: {employee_password }</p>\n                    <p style=\"line-height: 28px;\">{app_url }</p>\n                    <p style=\"line-height: 28px;\">Dziękuję,</p>\n                    <p style=\"line-height: 28px;\">{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(23, 2, 'ru', 'New Employee', '<p style=\"line-height: 28px;\">Здравствуйте, { employee_name },</p>\n                    <p style=\"line-height: 28px;\">Добро пожаловать в { app_name }.</p>\n                    <p style=\"line-height: 28px;\">Вы теперь-сотрудник ...</p>\n                    <p style=\"line-height: 28px;\">Электронная почта: { employee_email }</p>\n                    <p style=\"line-height: 28px;\">Пароль: { employee_password }</p>\n                    <p style=\"line-height: 28px;\">{ app_url }</p>\n                    <p style=\"line-height: 28px;\">Спасибо.</p>\n                    <p style=\"line-height: 28px;\">{ имя_программы }</p> ', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(24, 2, 'pt', 'New Employee', '<p>Ol&aacute; {employee_name},</p>\n                    <p>Bem-vindo a {app_name}.</p>\n                    <p>Voc&ecirc; &eacute; agora Funcion&aacute;rio ..</p>\n                    <p>E-mail: {employee_email}</p>\n                    <p>Senha: {employee_password}</p>\n                    <p>{app_url}</p>\n                    <p>Obrigado,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(25, 3, 'ar', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Subject :-إدارة الموارد البشرية / الشركة المعنية بإرسال المدفوعات عن طريق البريد الإلكتروني في وقت تأكيد الدفع.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا { name } ،</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى الدفع المتصل الى { salary_month&nbsp;}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">اضغط ببساطة على الاختيار بأسفل</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">كشوف المرتبات</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">شكرا لك</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إدارة الموارد البشرية ،</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(26, 3, 'da', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Om: HR-departementet / Kompagniet til at sende l&oslash;nsedler via e-mail p&aring; tidspunktet for bekr&aelig;ftelsen af l&oslash;nsedlerne</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hej { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">H&aring;ber denne e-mail finder dig godt! Se vedh&aelig;ftet payseddel for { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">klik bare p&aring; knappen nedenfor</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">L&oslash;nseddel</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Tak.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Med venlig hilsen</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR-afdelingen,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(27, 3, 'de', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrifft: -Personalabteilung/Firma, um Payslips per E-Mail zum Zeitpunkt der Best&auml;tigung des Auszahlungsscheins zu senden</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi {name},</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoffe, diese E-Mail findet dich gut! Bitte sehen Sie den angeh&auml;ngten payslip f&uuml;r {salary_month}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klicken Sie einfach auf den Button unten</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Danke.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrachtet,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Personalabteilung,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(28, 3, 'en', 'New Payroll', '<p><strong>Subjec</strong>t:-HR department/Company to send payslips by email at time of confirmation of payslip</p>\n                    <p>Hi {name},</p>\n                    <p>Hope this email ﬁnds you well! Please see attached payslip for {salary_month}.</p>\n                    <p style=\"text-align: center;\" align=\"center\"><strong>simply click on the button below </strong></p>\n                    <p style=\"text-align: center;\" align=\"center\"><span style=\"font-size: 18pt;\"><a style=\"background: #6676ef; color: #ffffff; font-family: \"Open Sans\", Helvetica, Arial, sans-serif; font-weight: normal; line-height: 120%; margin: 0px; text-decoration: none; text-transform: none;\" href=\"{url}\" target=\"_blank\" rel=\"noopener\"> <strong style=\"color: white; font-weight: bold; text: white;\">Payslip</strong> </a></span></p>\n                    <p style=\"text-align: left;\" align=\"center\">Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><span style=\"color: #000000; font-family: \"Open Sans\", sans-serif; font-size: 14px; background-color: #ffffff;\">{<strong>app_name</strong>}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(29, 3, 'es', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Asunto: -Departamento de RRHH/Empresa para enviar n&oacute;minas por correo electr&oacute;nico en el momento de la confirmaci&oacute;n del pago</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi {name},</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Espero que este email le encuentre bien! Consulte la ficha de pago adjunta para {salary_month}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">simplemente haga clic en el bot&oacute;n de abajo</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Gracias!</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considerando,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Departamento de Recursos Humanos,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(30, 3, 'fr', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Objet: -Ressources humaines / Entreprise pour envoyer des feuillets de paie par courriel au moment de la confirmation du paiement</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Salut { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Jesp&egrave;re que ce courriel vous trouve bien ! Veuillez consulter le bordereau de paie ci-joint pour { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Il suffit de cliquer sur le bouton ci-dessous</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feuillet de paiement</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Je vous remercie</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">D&eacute;partement des RH,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(31, 3, 'it', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Oggetto: - Dipartimento HR / Societ&agrave; per inviare busta paga via email al momento della conferma della busta paga</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Ciao {name},</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Spero che questa email ti trovi bene! Si prega di consultare la busta paga per {salary_month}.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">semplicemente clicca sul pulsante sottostante</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Busta paga</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sentiti libero di raggiungere se hai domande.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Grazie</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Riguardo,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dipartimento HR,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(32, 3, 'ja', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">件名:-HR 部門/企業は、給与明細書の確認時に電子メールで支払いを送信します。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">こんにちは {name}、</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">この E メールでよくご確認ください。 {salary_month}の添付された payslip を参照してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">下のボタンをクリックするだけで</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">給与明細書</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">質問がある場合は、自由に連絡してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ありがとう</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">よろしく</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR 部門</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(33, 3, 'nl', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft: -HR-afdeling/Bedrijf om te betalen payslips per e-mail op het moment van bevestiging van de payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hallo { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoop dat deze e-mail je goed vindt! Zie bijgevoegde payslip voor { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">gewoon klikken op de knop hieronder</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Loonstrook</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Voel je vrij om uit te reiken als je vragen hebt.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dank u wel</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft:</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR-afdeling,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(34, 3, 'pl', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Temat:-Dział HR/Firma do wysyłania payslip&oacute;w drogą mailową w czasie potwierdzania payslipa</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witaj {name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Patrz załączony payslip dla {salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">po prostu kliknij na przycisk poniżej</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Czuj się swobodnie, jeśli masz jakieś pytania.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dziękujemy</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">W odniesieniu do</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dział HR,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name }</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(35, 3, 'ru', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Тема: -HR отдел/Компания для отправки паузу по электронной почте во время подтверждения паузли</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Привет { name },</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный раздел для { salary_month }.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">просто нажмите на кнопку внизу</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Паушлип</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Не стеснитесь, если у вас есть вопросы.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Спасибо.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">С уважением,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Отдел кадров,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(36, 3, 'pt', 'New Payroll', '<p>Assunto:-Departamento de RH / Empresa para enviar payslips por e-mail no momento da confirma&ccedil;&atilde;o do payslip</p>\n                    <p>Oi {name},</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o payslip anexado por {salary_month}.</p>\n                    <p>basta clicar no bot&atilde;o abaixo</p>\n                    <p>Payslip</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(37, 4, 'ar', 'New Ticket', '<p>Subject : -HR ادارة / شركة لارسال ticket ل ـ { ticket_title }</p>\n                    <p>مرحبا { ticket_name }</p>\n                    <p>آمل أن يقوم هذا البريد الالكتروني بايجادك جيدا ! ، كود التذكرة الخاص بك هو { ticket_code }.</p>\n                    <p>{ ticket_description } ،</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(38, 4, 'da', 'New Ticket', '<p>Emne:-HR-afdeling / Kompagni til at sende ticket for { ticket_title }</p>\n                    <p>Hej { ticket_name },</p>\n                    <p>H&aring;ber denne e-mail finder dig godt, din ticket-kode er { ticket_code }.</p>\n                    <p>{ ticket_description },</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(39, 4, 'de', 'New Ticket', '<p>Betreff: -Personalabteilung/Firma zum Senden von Ticket f&uuml;r {ticket_title}</p>\n                    <p>Hi {ticket_name},</p>\n                    <p>Hoffen Sie, diese E-Mail findet Sie gut!, Ihr Ticketcode ist {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(40, 4, 'en', 'New Ticket', '<p ><b>Subject:-HR department/Company to send ticket for {ticket_title}</b></p>\n                    <p ><b>Hi {ticket_name},</b></p>\n                    <p >Hope this email ﬁnds you well! , Your ticket code is {ticket_code}. </p></br>\n                    {ticket_description},\n                    <p >Feel free to reach out if you have any questions.</p></br>\n                    <p><b>Thank you</b></p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>\n                    ', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(41, 4, 'es', 'New Ticket', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar el ticket de {ticket_title}</p>\n                    <p>Hi {ticket_name},</p>\n                    <p>&iexcl;Espero que este correo electr&oacute;nico te encuentre bien!, Tu c&oacute;digo de entrada es {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(42, 4, 'fr', 'New Ticket', '<p>Objet: -HR department / Company to send ticket for { ticket_title }</p>\n                    <p>Hi { ticket_name },</p>\n                    <p>Hope this email vous trouve bien !, Votre code de ticket est { ticket_code }.</p>\n                    <p>{ ticket_description },</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(43, 4, 'it', 'New Ticket', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare ticket per {ticket_title}</p>\n                    <p>Ciao {ticket_name},</p>\n                    <p>Spero che questa email ti trovi bene!, Il tuo codice del biglietto &egrave; {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(44, 4, 'ja', 'New Ticket', '<p>件名:-HR 部門/企業は、 {ticket_title} のチケットを送信します</p>\n                    <p>こんにちは {ticket_name}</p>\n                    <p>この E メールが適切に検出されることを希望しています。チケット・コードは {ticket_code}です。</p>\n                    <p>{ticket_description }</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(45, 4, 'nl', 'New Ticket', '<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van ticket voor { ticket_title }</p>\n                    <p>Hallo { ticket_name },</p>\n                    <p>Hoop dat deze e-mail u goed vindt!, Uw ticket code is { ticket_code }.</p>\n                    <p>{ ticket_description},</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(46, 4, 'pl', 'New Ticket', '<p>Temat:-Dział HR/Firma do wysyłki biletu dla {ticket_title }</p>\n                    <p>Witaj {ticket_name },</p>\n                    <p>Mam nadzieję, że ta wiadomość e-mail znajduje się dobrze!, Tw&oacute;j kod zgłoszenia to {ticket_code }.</p>\n                    <p>{ticket_description },</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(47, 4, 'ru', 'New Ticket', '<p>Тема: -HR отдел/Компания для отправки билета для { ticket_title }</p>\n                    <p>Hi { ticket_name },</p>\n                    <p>Надеюсь, что это письмо найдет вас хорошо!, Ваш код паспорта-{ ticket_code }.</p>\n                    <p>{ ticket_description },</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(48, 4, 'pt', 'New Ticket', '<p>Assunto:-Departamento de RH / Empresa para enviar ingresso para {ticket_title}</p>\n                    <p>Oi {ticket_name},</p>\n                    <p>Espero que este e-mail te encontre bem!, Seu c&oacute;digo de bilhete &eacute; {ticket_code}.</p>\n                    <p>{ticket_description},</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(49, 5, 'ar', 'New Award', '<p>Subject :-إدارة الموارد البشرية / الشركة المعنية بإرسال خطاب تحكيم للاعتراف بموظف</p>\n                    <p>مرحبا { award_name },</p>\n                    <p>ويسرني كثيرا أن أرشحها { award_name }</p>\n                    <p>وإنني مقتنع بأن (هي / هي) هي أفضل موظفة للحصول على الجائزة. وقد أدركت أنها شخصية موجهة نحو تحقيق الأهداف ، وتتسم بالكفاءة والفعالية في التقيد بالمواعيد. إنها دائما على استعداد لمشاركة معرفتها بالتفاصيل</p>\n                    <p>وبالإضافة إلى ذلك ، قامت (هي / هي) أحيانا بحل النزاعات والحالات الصعبة خلال ساعات العمل. (هي / هي) حصلت على بعض الجوائز من المنظمة غير الحكومية داخل البلد ؛ وكان ذلك بسبب المشاركة في أنشطة خيرية لمساعدة المحتاجين.</p>\n                    <p>وأعتقد أن هذه الصفات والصفات يجب أن تكون موضع تقدير. ولذلك ، فإن (هي / هي) تستحق أن تمنحها الجائزة بالتالي.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(50, 5, 'da', 'New Award', '<p>Om: HR-afdelingen / Kompagniet for at sende prisuddeling for at kunne genkende en medarbejder</p>\n                    <p>Hej { award_name },</p>\n                    <p>Jeg er meget glad for at nominere {award_name&nbsp;}</p>\n                    <p>Jeg er tilfreds med, at (hun) er den bedste medarbejder for prisen. Jeg har indset, at hun er en m&aring;lbevidst person, effektiv og meget punktlig. Hun er altid klar til at dele sin viden om detaljer.</p>\n                    <p>Desuden har (he/she) lejlighedsvist l&oslash;st konflikter og vanskelige situationer inden for arbejdstiden. (/hun) har modtaget nogle priser fra den ikkestatslige organisation i landet. Dette skyldes, at der skal v&aelig;re en del i velg&oslash;renhedsaktiviteter for at hj&aelig;lpe de tr&aelig;ngende.</p>\n                    <p>Jeg mener, at disse kvaliteter og egenskaber skal v&aelig;rds&aelig;tte. Derfor fortjener denne pris, at hun nominerer hende.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(51, 5, 'de', 'New Award', '<p>Betrifft: -Personalabteilung/Firma zum Versenden von Pr&auml;mienschreiben, um einen Mitarbeiter zu erkennen</p>\n                    <p>Hi {award_name},</p>\n                    <p>Ich freue mich sehr, {award_name} zu nominieren.</p>\n                    <p>Ich bin zufrieden, dass (he/she) der beste Mitarbeiter f&uuml;r die Auszeichnung ist. Ich habe erkannt, dass sie eine gottorientierte Person ist, effizient und sehr p&uuml;nktlich. Sie ist immer bereit, ihr Wissen &uuml;ber Details zu teilen.</p>\n                    <p>Dar&uuml;ber hinaus hat (he/she) gelegentlich Konflikte und schwierige Situationen innerhalb der Arbeitszeiten gel&ouml;st. (he/she) hat einige Auszeichnungen von der Nichtregierungsorganisation innerhalb des Landes erhalten; dies war wegen der Teilnahme an Wohlt&auml;tigkeitsaktivit&auml;ten, um den Bed&uuml;rftigen zu helfen.</p>\n                    <p>Ich glaube, diese Eigenschaften und Eigenschaften m&uuml;ssen gew&uuml;rdigt werden. Daher verdient (he/she) die Auszeichnung, die sie deshalb nominiert.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(52, 5, 'en', 'New Award', '<p ><b>Subject:-HR department/Company to send award letter to recognize an employee</b></p>\n                    <p ><b>Hi {award_name},</b></p>\n                    <p >I am much pleased to nominate {award_name}  </p>\n                    <p >I am satisfied that (he/she) is the best employee for the award. I have realized that she is a goal-oriented person, efficient and very punctual. She is always ready to share her knowledge of details.</p>\n                    <p>Additionally, (he/she) has occasionally solved conflicts and difficult situations within working hours. (he/she) has received some awards from the non-governmental organization within the country; this was because of taking part in charity activities to help the needy.</p>\n                    <p>I believe these qualities and characteristics need to be appreciated. Therefore, (he/she) deserves the award hence nominating her.</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p><b>Thank you</b></p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(53, 5, 'es', 'New Award', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de premios para reconocer a un empleado</p>\n                    <p>Hi {award_name},</p>\n                    <p>Estoy muy satisfecho de nominar {award_name}</p>\n                    <p>Estoy satisfecho de que (ella) sea el mejor empleado para el premio. Me he dado cuenta de que es una persona orientada al objetivo, eficiente y muy puntual. Ella siempre est&aacute; lista para compartir su conocimiento de los detalles.</p>\n                    <p>Adicionalmente, (he/ella) ocasionalmente ha resuelto conflictos y situaciones dif&iacute;ciles dentro de las horas de trabajo. (h/ella) ha recibido algunos premios de la organizaci&oacute;n no gubernamental dentro del pa&iacute;s; esto fue debido a participar en actividades de caridad para ayudar a los necesitados.</p>\n                    <p>Creo que estas cualidades y caracter&iacute;sticas deben ser apreciadas. Por lo tanto, (h/ella) merece el premio por lo tanto nominarla.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(54, 5, 'fr', 'New Award', '<p>Objet: -Minist&egrave;re des RH / Soci&eacute;t&eacute; denvoi dune lettre dattribution pour reconna&icirc;tre un employ&eacute;</p>\n                    <p>Hi { award_name },</p>\n                    <p>Je suis tr&egrave;s heureux de nommer { award_name }</p>\n                    <p>Je suis convaincu que (he/elle) est le meilleur employ&eacute; pour ce prix. Jai r&eacute;alis&eacute; quelle est une personne orient&eacute;e vers lobjectif, efficace et tr&egrave;s ponctuelle. Elle est toujours pr&ecirc;te &agrave; partager sa connaissance des d&eacute;tails.</p>\n                    <p>De plus, (he/elle) a parfois r&eacute;solu des conflits et des situations difficiles dans les heures de travail. (he/elle) a re&ccedil;u des prix de lorganisation non gouvernementale &agrave; lint&eacute;rieur du pays, parce quelle a particip&eacute; &agrave; des activit&eacute;s de bienfaisance pour aider les n&eacute;cessiteux.</p>\n                    <p>Je crois que ces qualit&eacute;s et ces caract&eacute;ristiques doivent &ecirc;tre appr&eacute;ci&eacute;es. Par cons&eacute;quent, (he/elle) m&eacute;rite le prix donc nomin&eacute;.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(55, 5, 'it', 'New Award', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di premiazione per riconoscere un dipendente</p>\n                    <p>Ciao {award_name},</p>\n                    <p>Sono molto lieto di nominare {award_name}</p>\n                    <p>Sono soddisfatto che (he/lei) sia il miglior dipendente per il premio. Ho capito che &egrave; una persona orientata al goal-oriented, efficiente e molto puntuale. &Egrave; sempre pronta a condividere la sua conoscenza dei dettagli.</p>\n                    <p>Inoltre, (he/lei) ha occasionalmente risolto conflitti e situazioni difficili allinterno delle ore di lavoro. (he/lei) ha ricevuto alcuni premi dallorganizzazione non governativa allinterno del paese; questo perch&eacute; di prendere parte alle attivit&agrave; di beneficenza per aiutare i bisognosi.</p>\n                    <p>Credo che queste qualit&agrave; e caratteristiche debbano essere apprezzate. Pertanto, (he/lei) merita il premio da qui la nomina.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(56, 5, 'ja', 'New Award', '<p>件名: 従業員を認識するための表彰書を送信するための、人事部門/ 会社</p>\n                    <p>やあ {award_name }</p>\n                    <p>{award_name }をノミネートしたいと考えています。</p>\n                    <p>私は ( 彼女が ) 賞のための最高の従業員だと満足している。 私は彼女が、自分が目標指向の人間であり、効率的で、非常に時間厳守であることに気付きました。 彼女はいつも詳細についての知識を共有する準備ができている。</p>\n                    <p>また、時には労働時間内に紛争や困難な状況を解決することがある。 ( 彼女は ) 国内の非政府組織からいくつかの賞を受賞している。このことは、慈善活動に参加して、貧窮者を助けるためのものだった。</p>\n                    <p>これらの特性と特徴を評価する必要があると思います。 そのため、 ( 相続人は ) 賞に値するので彼女を指名することになる。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(57, 5, 'nl', 'New Award', '<p>Betreft: -HR-afdeling/Bedrijf om een gunningsbrief te sturen om een werknemer te herkennen</p>\n                    <p>Hallo { award_name },</p>\n                    <p>Ik ben erg blij om { award_name } te nomineren</p>\n                    <p>Ik ben tevreden dat (he/zij) de beste werknemer voor de prijs is. Ik heb me gerealiseerd dat ze een doelgericht persoon is, effici&euml;nt en punctueel. Ze is altijd klaar om haar kennis van details te delen.</p>\n                    <p>Daarnaast heeft (he/she) af en toe conflicten en moeilijke situaties binnen de werkuren opgelost. (he/zij) heeft een aantal prijzen ontvangen van de niet-gouvernementele organisatie binnen het land; dit was vanwege het deelnemen aan liefdadigheidsactiviteiten om de behoeftigen te helpen.</p>\n                    <p>Ik ben van mening dat deze kwaliteiten en eigenschappen moeten worden gewaardeerd. Daarom, (he/she) verdient de award dus nomineren haar.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(58, 5, 'pl', 'New Award', '<p>Temat:-Dział HR/Firma do wysyłania list&oacute;w wyr&oacute;żnienia do rozpoznania pracownika</p>\n                    <p>Witaj {award_name },</p>\n                    <p>Jestem bardzo zadowolony z nominacji {award_name }</p>\n                    <p>Jestem zadowolony, że (he/she) jest najlepszym pracownikiem do nagrody. Zdałem sobie sprawę, że jest osobą zorientowaną na goły, sprawną i bardzo punktualną. Zawsze jest gotowa podzielić się swoją wiedzą na temat szczeg&oacute;ł&oacute;w.</p>\n                    <p>Dodatkowo, (he/she) od czasu do czasu rozwiązuje konflikty i trudne sytuacje w godzinach pracy. (he/she) otrzymała kilka nagr&oacute;d od organizacji pozarządowej w obrębie kraju; to z powodu wzięcia udziału w akcji charytatywnych, aby pom&oacute;c potrzebującym.</p>\n                    <p>Uważam, że te cechy i cechy muszą być docenione. Dlatego też, (he/she) zasługuje na nagrodę, stąd nominowanie jej.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(59, 5, 'ru', 'New Award', '<p>Тема: -HR отдел/Компания отправить награда письмо о признании сотрудника</p>\n                    <p>Здравствуйте, { award_name },</p>\n                    <p>Мне очень приятно номинировать { award_name }</p>\n                    <p>Я удовлетворена тем, что (х/она) является лучшим работником премии. Я понял, что она ориентированная на цель человек, эффективная и очень пунктуальная. Она всегда готова поделиться своими знаниями о деталях.</p>\n                    <p>Кроме того, время от времени решались конфликты и сложные ситуации в рабочее время. (она) получила некоторые награды от неправительственной организации в стране; это было связано с тем, что они приняли участие в благотворительной деятельности, чтобы помочь нуждающимся.</p>\n                    <p>Я считаю, что эти качества и характеристики заслуживают высокой оценки. Таким образом, она заслуживает того, чтобы наградить ее таким образом.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(60, 5, 'pt', 'New Award', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de premia&ccedil;&atilde;o para reconhecer um funcion&aacute;rio</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Oi {award_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou muito satisfeito em nomear {award_name}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou satisfeito que (he/she) &eacute; o melhor funcion&aacute;rio para o pr&ecirc;mio. Eu percebi que ela &eacute; uma pessoa orientada a goal, eficiente e muito pontual. Ela est&aacute; sempre pronta para compartilhar seu conhecimento de detalhes.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Adicionalmente, (he/she) tem, ocasionalmente, resolvido conflitos e situa&ccedil;&otilde;es dif&iacute;ceis dentro do hor&aacute;rio de trabalho. (he/she) recebeu alguns pr&ecirc;mios da organiza&ccedil;&atilde;o n&atilde;o governamental dentro do pa&iacute;s; isso foi por ter participado de atividades de caridade para ajudar os necessitados.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Eu acredito que essas qualidades e caracter&iacute;sticas precisam ser apreciadas. Por isso, (he/she) merece o pr&ecirc;mio da&iacute; nomeando-a.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(61, 6, 'ar', 'Employee Transfer', '<p>Subject : -HR ادارة / شركة لارسال خطاب نقل الى موظف من مكان الى آخر.</p>\n                    <p>عزيزي { transfer_name },</p>\n                    <p>وفقا لتوجيهات الادارة ، يتم نقل الخدمات الخاصة بك w.e.f. { transfer_date }.</p>\n                    <p>مكان الادخال الجديد الخاص بك هو { transfer_department } قسم من فرع { transfer_branch } وتاريخ التحويل { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(62, 6, 'da', 'Employee Transfer', '<p>Emne:-HR-afdelingen / kompagniet om at sende overf&oslash;rsels brev til en medarbejder fra den ene lokalitet til den anden.</p>\n                    <p>K&aelig;re { transfer_name },</p>\n                    <p>Som Styring af direktiver overf&oslash;res dine serviceydelser w.e.f. { transfer_date }.</p>\n                    <p>Dit nye sted for postering er { transfer_departement } afdeling af { transfer_branch } gren og dato for overf&oslash;rsel { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(63, 6, 'de', 'Employee Transfer', '<p>Betreff: -Personalabteilung/Unternehmen, um einen &Uuml;berweisungsschreiben an einen Mitarbeiter von einem Standort an einen anderen zu senden.</p>\n                    <p>Sehr geehrter {transfer_name},</p>\n                    <p>Wie pro Management-Direktiven werden Ihre Dienste &uuml;ber w.e.f. {transfer_date} &uuml;bertragen.</p>\n                    <p>Ihr neuer Ort der Entsendung ist {transfer_department} Abteilung von {transfer_branch} Niederlassung und Datum der &Uuml;bertragung {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(64, 6, 'en', 'Employee Transfer', '<p ><b>Subject:-HR department/Company to send transfer letter to be issued to an employee from one location to another.</b></p>\n                    <p ><b>Dear {transfer_name},</b></p>\n                    <p >As per Management directives, your services are being transferred w.e.f.{transfer_date}. </p>\n                    <p >Your new place of posting is {transfer_department} department of {transfer_branch} branch and date of transfer {transfer_date}. </p>\n                    {transfer_description}.\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p><b>Thank you</b></p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(65, 6, 'es', 'Employee Transfer', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar carta de transferencia a un empleado de un lugar a otro.</p>\n                    <p>Estimado {transfer_name},</p>\n                    <p>Seg&uacute;n las directivas de gesti&oacute;n, los servicios se transfieren w.e.f. {transfer_date}.</p>\n                    <p>El nuevo lugar de publicaci&oacute;n es el departamento {transfer_department} de la rama {transfer_branch} y la fecha de transferencia {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(66, 6, 'fr', 'Employee Transfer', '<p>Objet: -Minist&egrave;re des RH / Soci&eacute;t&eacute; denvoi dune lettre de transfert &agrave; un employ&eacute; dun endroit &agrave; un autre.</p>\n                    <p>Cher { transfer_name },</p>\n                    <p>Selon les directives de gestion, vos services sont transf&eacute;r&eacute;s dans w.e.f. { transfer_date }.</p>\n                    <p>Votre nouveau lieu daffectation est le d&eacute;partement { transfer_department } de la branche { transfer_branch } et la date de transfert { transfer_date }.</p>\n                    <p>{ description_transfert }.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(67, 6, 'it', 'Employee Transfer', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di trasferimento da rilasciare a un dipendente da una localit&agrave; allaltra.</p>\n                    <p>Caro {transfer_name},</p>\n                    <p>Come per le direttive di Management, i tuoi servizi vengono trasferiti w.e.f. {transfer_date}.</p>\n                    <p>Il tuo nuovo luogo di distacco &egrave; {transfer_department} dipartimento di {transfer_branch} ramo e data di trasferimento {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(68, 6, 'ja', 'Employee Transfer', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di trasferimento da rilasciare a un dipendente da una localit&agrave; allaltra.</p>\n                    <p>Caro {transfer_name},</p>\n                    <p>Come per le direttive di Management, i tuoi servizi vengono trasferiti w.e.f. {transfer_date}.</p>\n                    <p>Il tuo nuovo luogo di distacco &egrave; {transfer_department} dipartimento di {transfer_branch} ramo e data di trasferimento {transfer_date}.</p>\n                    <p>{transfer_description}.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(69, 6, 'nl', 'Employee Transfer', '<p>Betreft: -HR-afdeling/Bedrijf voor verzending van overdrachtsbrief aan een werknemer van de ene plaats naar de andere.</p>\n                    <p>Geachte { transfer_name },</p>\n                    <p>Als per beheerinstructie worden uw services overgebracht w.e.f. { transfer_date }.</p>\n                    <p>Uw nieuwe plaats van post is { transfer_department } van de afdeling { transfer_branch } en datum van overdracht { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(70, 6, 'pl', 'Employee Transfer', '<p>Temat:-Dział HR/Firma do wysyłania listu przelewowego, kt&oacute;ry ma być wydany pracownikowi z jednego miejsca do drugiego.</p>\n                    <p>Droga {transfer_name },</p>\n                    <p>Zgodnie z dyrektywami zarządzania, Twoje usługi są przesyłane w.e.f. {transfer_date }.</p>\n                    <p>Twoje nowe miejsce delegowania to {transfer_department } dział {transfer_branch } gałąź i data transferu {transfer_date }.</p>\n                    <p>{transfer_description }.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(71, 6, 'ru', 'Employee Transfer', '<p>Тема: -HR отдел/Компания для отправки трансферного письма сотруднику из одного места в другое.</p>\n                    <p>Уважаемый { transfer_name },</p>\n                    <p>В соответствии с директивами управления ваши службы передаются .ef. { transfer_date }.</p>\n                    <p>Новое место разноски: { transfer_department} подразделение { transfer_branch } и дата передачи { transfer_date }.</p>\n                    <p>{ transfer_description }.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(72, 6, 'pt', 'Employee Transfer', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de transfer&ecirc;ncia para ser emitida para um funcion&aacute;rio de um local para outro.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {transfer_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Conforme diretivas de Gerenciamento, seus servi&ccedil;os est&atilde;o sendo transferidos w.e.f. {transfer_date}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">O seu novo local de postagem &eacute; {transfer_departamento} departamento de {transfer_branch} ramo e data de transfer&ecirc;ncia {transfer_date}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{transfer_description}.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(73, 7, 'ar', 'Employee Resignation', '<p>Subject :-قسم الموارد البشرية / الشركة لإرسال خطاب استقالته.</p>\n                    <p>عزيزي { assign_user } ،</p>\n                    <p>إنه لمن دواعي الأسف الشديد أن أعترف رسميا باستلام إشعار استقالتك في { notice_date } الى { resignation_date } هو اليوم الأخير لعملك.</p>\n                    <p>لقد كان من دواعي سروري العمل معكم ، وبالنيابة عن الفريق ، أود أن أتمنى لكم أفضل جدا في جميع مساعيكم في المستقبل. ومن خلال هذه الرسالة ، يرجى العثور على حزمة معلومات تتضمن معلومات مفصلة عن عملية الاستقالة.</p>\n                    <p>شكرا لكم مرة أخرى على موقفكم الإيجابي والعمل الجاد كل هذه السنوات.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(74, 7, 'da', 'Employee Resignation', '<p>Om: HR-afdelingen / Kompagniet, for at sende en opsigelse.</p>\n                    <p>K&aelig;re { assign_user },</p>\n                    <p>Det er med stor beklagelse, at jeg formelt anerkender modtagelsen af din opsigelsesmeddelelse p&aring; { notice_date } til { resignation_date } er din sidste arbejdsdag</p>\n                    <p>Det har v&aelig;ret en forn&oslash;jelse at arbejde sammen med Dem, og p&aring; vegne af teamet vil jeg &oslash;nske Dem det bedste i alle Deres fremtidige bestr&aelig;belser. Med dette brev kan du finde en informationspakke med detaljerede oplysninger om tilbagetr&aelig;delsesprocessen.</p>\n                    <p>Endnu en gang tak for Deres positive holdning og h&aring;rde arbejde i alle disse &aring;r.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(75, 7, 'de', 'Employee Resignation', '<p>Betreff: -Personalabteilung/Firma, um R&uuml;ckmeldungsschreiben zu senden.</p>\n                    <p>Sehr geehrter {assign_user},</p>\n                    <p>Es ist mit gro&szlig;em Bedauern, dass ich den Eingang Ihrer R&uuml;cktrittshinweis auf {notice_date} an {resignation_date} offiziell best&auml;tige, ist Ihr letzter Arbeitstag.</p>\n                    <p>Es war eine Freude, mit Ihnen zu arbeiten, und im Namen des Teams m&ouml;chte ich Ihnen w&uuml;nschen, dass Sie in allen Ihren zuk&uuml;nftigen Bem&uuml;hungen am besten sind. In diesem Brief finden Sie ein Informationspaket mit detaillierten Informationen zum R&uuml;cktrittsprozess.</p>\n                    <p>Vielen Dank noch einmal f&uuml;r Ihre positive Einstellung und harte Arbeit all die Jahre.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(76, 7, 'en', 'Employee Resignation', '<p ><b>Subject:-HR department/Company to send resignation letter .</b></p>\n                    <p ><b>Dear {assign_user},</b></p>\n                    <p >It is with great regret that I formally acknowledge receipt of your resignation notice on {notice_date} to {resignation_date} is your final day of work. </p>\n                    <p >It has been a pleasure working with you, and on behalf of the team, I would like to wish you the very best in all your future endeavors. Included with this letter, please find an information packet with detailed information on the resignation process. </p>\n                    <p>Thank you again for your positive attitude and hard work all these years.</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><b>Regards,</b></p>\n                    <p><b>HR Department,</b></p>\n                    <p><b>{app_name}</b></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(77, 7, 'es', 'Employee Resignation', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de renuncia.</p>\n                    <p>Estimado {assign_user},</p>\n                    <p>Es con gran pesar que recibo formalmente la recepci&oacute;n de su aviso de renuncia en {notice_date} a {resignation_date} es su &uacute;ltimo d&iacute;a de trabajo.</p>\n                    <p>Ha sido un placer trabajar con usted, y en nombre del equipo, me gustar&iacute;a desearle lo mejor en todos sus esfuerzos futuros. Incluido con esta carta, por favor encuentre un paquete de informaci&oacute;n con informaci&oacute;n detallada sobre el proceso de renuncia.</p>\n                    <p>Gracias de nuevo por su actitud positiva y trabajo duro todos estos a&ntilde;os.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(78, 7, 'fr', 'Employee Resignation', '<p>Objet: -D&eacute;partement RH / Soci&eacute;t&eacute; denvoi dune lettre de d&eacute;mission.</p>\n                    <p>Cher { assign_user },</p>\n                    <p>Cest avec grand regret que je reconnais officiellement la r&eacute;ception de votre avis de d&eacute;mission sur { notice_date } &agrave; { resignation_date } est votre dernier jour de travail.</p>\n                    <p>Cest un plaisir de travailler avec vous, et au nom de l&eacute;quipe, jaimerais vous souhaiter le meilleur dans toutes vos activit&eacute;s futures. Inclus avec cette lettre, veuillez trouver un paquet dinformation contenant des informations d&eacute;taill&eacute;es sur le processus de d&eacute;mission.</p>\n                    <p>Je vous remercie encore de votre attitude positive et de votre travail acharne durant toutes ces ann&eacute;es.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(79, 7, 'it', 'Employee Resignation', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di dimissioni.</p>\n                    <p>Caro {assign_user},</p>\n                    <p>&Egrave; con grande dispiacere che riconosca formalmente la ricezione del tuo avviso di dimissioni su {notice_date} a {resignation_date} &egrave; la tua giornata di lavoro finale.</p>\n                    <p>&Egrave; stato un piacere lavorare con voi, e a nome della squadra, vorrei augurarvi il massimo in tutti i vostri futuri sforzi. Incluso con questa lettera, si prega di trovare un pacchetto informativo con informazioni dettagliate sul processo di dimissioni.</p>\n                    <p>Grazie ancora per il vostro atteggiamento positivo e duro lavoro in tutti questi anni.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(80, 7, 'ja', 'Employee Resignation', '<p>件名:-HR 部門/企業は辞表を送信します。</p>\n                    <p>{assign_user} の認証を解除します。</p>\n                    <p>{ notice_date} に対するあなたの辞任通知を { resignation_date} に正式に受理することを正式に確認することは、非常に残念です。</p>\n                    <p>あなたと一緒に仕事をしていて、チームのために、あなたの将来の努力において、あなたのことを最高のものにしたいと思っています。 このレターには、辞任プロセスに関する詳細な情報が記載されている情報パケットをご覧ください。</p>\n                    <p>これらの長年の前向きな姿勢と努力を重ねて感謝します。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(81, 7, 'nl', 'Employee Resignation', '<p>Betreft: -HR-afdeling/Bedrijf om ontslagbrief te sturen.</p>\n                    <p>Geachte { assign_user },</p>\n                    <p>Het is met grote spijt dat ik de ontvangst van uw ontslagbrief op { notice_date } tot { resignation_date } formeel de ontvangst van uw laatste dag van het werk bevestigt.</p>\n                    <p>Het was een genoegen om met u samen te werken, en namens het team zou ik u het allerbeste willen wensen in al uw toekomstige inspanningen. Vermeld bij deze brief een informatiepakket met gedetailleerde informatie over het ontslagproces.</p>\n                    <p>Nogmaals bedankt voor uw positieve houding en hard werken al die jaren.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(82, 7, 'pl', 'Employee Resignation', '<p>Temat: -Dział HR/Firma do wysyłania listu rezygnacyjnego.</p>\n                    <p>Drogi użytkownika {assign_user },</p>\n                    <p>Z wielkim żalem, że oficjalnie potwierdzam otrzymanie powiadomienia o rezygnacji w dniu {notice_date } to {resignation_date } to tw&oacute;j ostatni dzień pracy.</p>\n                    <p>Z przyjemnością wsp&oacute;łpracujemy z Tobą, a w imieniu zespołu chciałbym życzyć Wam wszystkiego najlepszego we wszystkich swoich przyszłych przedsięwzięciu. Dołączone do tego listu prosimy o znalezienie pakietu informacyjnego ze szczeg&oacute;łowymi informacjami na temat procesu dymisji.</p>\n                    <p>Jeszcze raz dziękuję za pozytywne nastawienie i ciężką pracę przez te wszystkie lata.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(83, 7, 'ru', 'Employee Resignation', '<p>Тема: -HR отдел/Компания отправить письмо об отставке.</p>\n                    <p>Уважаемый пользователь { assign_user },</p>\n                    <p>С большим сожалением я официально подтверждаю получение вашего уведомления об отставке { notice_date } в { resignation_date }-это ваш последний день работы.</p>\n                    <p>С Вами было приятно работать, и от имени команды я хотел бы по# желать вам самого лучшего во всех ваших будущих начинаниях. В этом письме Вы можете найти информационный пакет с подробной информацией об отставке.</p>\n                    <p>Еще раз спасибо за ваше позитивное отношение и трудолюбие все эти годы.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(84, 7, 'pt', 'Employee Resignation', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de demiss&atilde;o.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {assign_user},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">&Eacute; com grande pesar que reconhe&ccedil;o formalmente o recebimento do seu aviso de demiss&atilde;o em {notice_date} a {resignation_date} &eacute; o seu dia final de trabalho.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Foi um prazer trabalhar com voc&ecirc;, e em nome da equipe, gostaria de desej&aacute;-lo o melhor em todos os seus futuros empreendimentos. Inclu&iacute;dos com esta carta, por favor, encontre um pacote de informa&ccedil;&otilde;es com informa&ccedil;&otilde;es detalhadas sobre o processo de demiss&atilde;o.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado novamente por sua atitude positiva e trabalho duro todos esses anos.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(85, 8, 'ar', 'Employee Trip', '<p>Subject : -HR ادارة / شركة لارسال رسالة رحلة.</p>\n                    <p>عزيزي { employee_trip_name },</p>\n                    <p>قمة الصباح إليك ! أكتب إلى مكتب إدارتكم بطلب متواضع للسفر من أجل زيارة إلى الخارج عن قصد.</p>\n                    <p>وسيكون هذا المنتدى هو المنتدى الرئيسي لأعمال المناخ في العام ، وقد كان محظوظا بما فيه الكفاية لكي يرشح لتمثيل شركتنا والمنطقة خلال الحلقة الدراسية.</p>\n                    <p>إن عضويتي التي دامت ثلاث سنوات كجزء من المجموعة والمساهمات التي قدمتها إلى الشركة ، ونتيجة لذلك ، كانت مفيدة من الناحية التكافلية. وفي هذا الصدد ، فإنني أطلب منكم بصفتي الرئيس المباشر لي أن يسمح لي بالحضور.</p>\n                    <p>مزيد من التفاصيل عن الرحلة :&nbsp;</p>\n                    <p>مدة الرحلة : { start_date } الى { end_date }</p>\n                    <p>الغرض من الزيارة : { purpose_of_visit }</p>\n                    <p>مكان الزيارة : { place_of_visit }</p>\n                    <p>الوصف : { trip_description }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(86, 8, 'da', 'Employee Trip', '<p>Om: HR-afdelingen / Kompagniet, der skal sende udflugten.</p>\n                    <p>K&aelig;re { employee_trip_name },</p>\n                    <p>Godmorgen til dig! Jeg skriver til dit kontor med en ydmyg anmodning om at rejse for en { purpose_of_visit } i udlandet.</p>\n                    <p>Det ville v&aelig;re &aring;rets f&oslash;rende klimaforum, og det ville v&aelig;re heldigt nok at blive nomineret til at repr&aelig;sentere vores virksomhed og regionen under seminaret.</p>\n                    <p>Mit tre&aring;rige medlemskab som en del af den gruppe og de bidrag, jeg har givet til virksomheden, har som f&oslash;lge heraf v&aelig;ret symbiotisk fordelagtigt. I den henseende anmoder jeg om, at De som min n&aelig;rmeste overordnede giver mig lov til at deltage.</p>\n                    <p>Flere oplysninger om turen:</p>\n                    <p>Trip Duration: { start_date } til { end_date }</p>\n                    <p>Form&aring;let med Bes&oslash;g: { purpose_of_visit }</p>\n                    <p>Plads af bes&oslash;g: { place_of_visit }</p>\n                    <p>Beskrivelse: { trip_description }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(87, 8, 'de', 'Employee Trip', '<p>Betreff: -Personalabteilung/Firma, um Reisebrief zu schicken.</p>\n                    <p>Sehr geehrter {employee_trip_name},</p>\n                    <p>Top of the morning to you! Ich schreibe an Ihre Dienststelle mit dem&uuml;tiger Bitte um eine Reise nach einem {purpose_of_visit} im Ausland.</p>\n                    <p>Es w&auml;re das f&uuml;hrende Klima-Business-Forum des Jahres und hatte das Gl&uuml;ck, nominiert zu werden, um unser Unternehmen und die Region w&auml;hrend des Seminars zu vertreten.</p>\n                    <p>Meine dreij&auml;hrige Mitgliedschaft als Teil der Gruppe und die Beitr&auml;ge, die ich an das Unternehmen gemacht habe, sind dadurch symbiotisch vorteilhaft gewesen. In diesem Zusammenhang ersuche ich Sie als meinen unmittelbaren Vorgesetzten, mir zu gestatten, zu besuchen.</p>\n                    <p>Mehr Details zu Reise:</p>\n                    <p>Dauer der Fahrt: {start_date} bis {end_date}</p>\n                    <p>Zweck des Besuchs: {purpose_of_visit}</p>\n                    <p>Ort des Besuchs: {place_of_visit}</p>\n                    <p>Beschreibung: {trip_description}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(88, 8, 'en', 'Employee Trip', '<p><strong>Subject:-HR department/Company to send trip letter .</strong></p>\n                    <p><strong>Dear {employee_trip_name},</strong></p>\n                    <p>Top of the morning to you! I am writing to your department office with a humble request to travel for a {purpose_of_visit} abroad.</p>\n                    <p>It would be the leading climate business forum of the year and have been lucky enough to be nominated to represent our company and the region during the seminar.</p>\n                    <p>My three-year membership as part of the group and contributions I have made to the company, as a result, have been symbiotically beneficial. In that regard, I am requesting you as my immediate superior to permit me to attend.</p>\n                    <p>More detail about trip:{start_date} to {end_date}</p>\n                    <p>Trip Duration:{start_date} to {end_date}</p>\n                    <p>Purpose of Visit:{purpose_of_visit}</p>\n                    <p>Place of Visit:{place_of_visit}</p>\n                    <p>Description:{trip_description}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(89, 8, 'es', 'Employee Trip', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de viaje.</p>\n                    <p>Estimado {employee_trip_name},</p>\n                    <p>&iexcl;Top de la ma&ntilde;ana para ti! Estoy escribiendo a su oficina del departamento con una humilde petici&oacute;n de viajar para un {purpose_of_visit} en el extranjero.</p>\n                    <p>Ser&iacute;a el principal foro de negocios clim&aacute;ticos del a&ntilde;o y han tenido la suerte de ser nominados para representar a nuestra compa&ntilde;&iacute;a y a la regi&oacute;n durante el seminario.</p>\n                    <p>Mi membres&iacute;a de tres a&ntilde;os como parte del grupo y las contribuciones que he hecho a la compa&ntilde;&iacute;a, como resultado, han sido simb&oacute;ticamente beneficiosos. En ese sentido, le estoy solicitando como mi superior inmediato que me permita asistir.</p>\n                    <p>M&aacute;s detalles sobre el viaje:&nbsp;</p>\n                    <p>Duraci&oacute;n del viaje: {start_date} a {end_date}</p>\n                    <p>Finalidad de la visita: {purpose_of_visit}</p>\n                    <p>Lugar de visita: {place_of_visit}</p>\n                    <p>Descripci&oacute;n: {trip_description}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(90, 8, 'fr', 'Employee Trip', '<p>Objet: -Service des RH / Compagnie pour envoyer une lettre de voyage.</p>\n                    <p>Cher { employee_trip_name },</p>\n                    <p>Top of the morning to you ! J&eacute;crai au bureau de votre minist&egrave;re avec une humble demande de voyage pour une {purpose_of_visit } &agrave; l&eacute;tranger.</p>\n                    <p>Il sagit du principal forum sur le climat de lann&eacute;e et a eu la chance d&ecirc;tre d&eacute;sign&eacute; pour repr&eacute;senter notre entreprise et la r&eacute;gion au cours du s&eacute;minaire.</p>\n                    <p>Mon adh&eacute;sion de trois ans au groupe et les contributions que jai faites &agrave; lentreprise, en cons&eacute;quence, ont &eacute;t&eacute; b&eacute;n&eacute;fiques sur le plan symbiotique. &Agrave; cet &eacute;gard, je vous demande d&ecirc;tre mon sup&eacute;rieur imm&eacute;diat pour me permettre dy assister.</p>\n                    <p>Plus de d&eacute;tails sur le voyage:</p>\n                    <p>Dur&eacute;e du voyage: { start_date } &agrave; { end_date }</p>\n                    <p>Objet de la visite: { purpose_of_visit}</p>\n                    <p>Lieu de visite: { place_of_visit }</p>\n                    <p>Description: { trip_description }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(91, 8, 'it', 'Employee Trip', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di viaggio.</p>\n                    <p>Caro {employee_trip_name},</p>\n                    <p>In cima al mattino a te! Scrivo al tuo ufficio dipartimento con umile richiesta di viaggio per un {purpose_of_visit} allestero.</p>\n                    <p>Sarebbe il forum aziendale sul clima leader dellanno e sono stati abbastanza fortunati da essere nominati per rappresentare la nostra azienda e la regione durante il seminario.</p>\n                    <p>La mia adesione triennale come parte del gruppo e i contributi che ho apportato allazienda, di conseguenza, sono stati simbioticamente vantaggiosi. A tal proposito, vi chiedo come mio immediato superiore per consentirmi di partecipare.</p>\n                    <p>Pi&ugrave; dettagli sul viaggio:</p>\n                    <p>Trip Duration: {start_date} a {end_date}</p>\n                    <p>Finalit&agrave; di Visita: {purpose_of_visit}</p>\n                    <p>Luogo di Visita: {place_of_visit}</p>\n                    <p>Descrizione: {trip_description}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(92, 8, 'ja', 'Employee Trip', '<p>件名:-HR 部門/会社は出張レターを送信します。</p>\n                    <p>{ employee_trip_name} に出庫します。</p>\n                    <p>朝のトップだ ! 海外で {purpose_of_visit} をお願いしたいという謙虚な要求をもって、私はあなたの部署に手紙を書いています。</p>\n                    <p>これは、今年の主要な気候ビジネス・フォーラムとなり、セミナーの開催中に当社と地域を代表する候補になるほど幸運にも恵まれています。</p>\n                    <p>私が会社に対して行った 3 年間のメンバーシップは、その結果として、共生的に有益なものでした。 その点では、私は、私が出席することを許可することを、私の即座の上司として</p>\n                    <p>トリップについての詳細 :</p>\n                    <p>トリップ期間:{start_date} を {end_date} に設定します</p>\n                    <p>アクセスの目的 :{purpose_of_visit}</p>\n                    <p>訪問の場所 :{place_of_visit}</p>\n                    <p>説明:{trip_description}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(93, 8, 'nl', 'Employee Trip', '<p>Betreft: -HR-afdeling/Bedrijf om reisbrief te sturen.</p>\n                    <p>Geachte { employee_trip_name },</p>\n                    <p>Top van de ochtend aan u! Ik schrijf uw afdelingsbureau met een bescheiden verzoek om een { purpose_of_visit } in het buitenland te bezoeken.</p>\n                    <p>Het zou het toonaangevende klimaatforum van het jaar zijn en hebben het geluk gehad om genomineerd te worden om ons bedrijf en de regio te vertegenwoordigen tijdens het seminar.</p>\n                    <p>Mijn driejarige lidmaatschap als onderdeel van de groep en bijdragen die ik heb geleverd aan het bedrijf, als gevolg daarvan, zijn symbiotisch gunstig geweest. Wat dat betreft, verzoek ik u als mijn directe chef mij in staat te stellen aanwezig te zijn.</p>\n                    <p>Meer details over reis:</p>\n                    <p>Duur van reis: { start_date } tot { end_date }</p>\n                    <p>Doel van bezoek: { purpose_of_visit }</p>\n                    <p>Plaats van bezoek: { place_of_visit }</p>\n                    <p>Beschrijving: { trip_description }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u we</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(94, 8, 'pl', 'Employee Trip', '<p>Temat:-Dział HR/Firma do wysyłania listu podr&oacute;ży.</p>\n                    <p>Szanowny {employee_trip_name },</p>\n                    <p>Od samego rana do Ciebie! Piszę do twojego biura, z pokornym prośbą o wyjazd na {purpose_of_visit&nbsp;} za granicą.</p>\n                    <p>Byłoby to wiodącym forum biznesowym w tym roku i miało szczęście być nominowane do reprezentowania naszej firmy i regionu podczas seminarium.</p>\n                    <p>Moje trzyletnie członkostwo w grupie i składkach, kt&oacute;re uczyniłem w firmie, w rezultacie, były symbiotycznie korzystne. W tym względzie, zwracam się do pana o m&oacute;j bezpośredni przełożony, kt&oacute;ry pozwoli mi na udział w tej sprawie.</p>\n                    <p>Więcej szczeg&oacute;ł&oacute;w na temat wyjazdu:</p>\n                    <p>Czas trwania rejsu: {start_date } do {end_date }</p>\n                    <p>Cel wizyty: {purpose_of_visit }</p>\n                    <p>Miejsce wizyty: {place_of_visit }</p>\n                    <p>Opis: {trip_description }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(95, 8, 'ru', 'Employee Trip', '<p>Тема: -HR отдел/Компания для отправки письма на поездку.</p>\n                    <p>Уважаемый { employee_trip_name },</p>\n                    <p>С утра до тебя! Я пишу в ваш отдел с смиренным запросом на поездку за границу.</p>\n                    <p>Это был бы ведущий климатический бизнес-форум года и по везло, что в ходе семинара он будет представлять нашу компанию и регион.</p>\n                    <p>Мое трехлетнее членство в составе группы и взносы, которые я внес в компанию, в результате, были симбиотически выгодны. В этой связи я прошу вас как моего непосредственного начальника разрешить мне присутствовать.</p>\n                    <p>Подробнее о поездке:</p>\n                    <p>Длительность поездки: { start_date } в { end_date }</p>\n                    <p>Цель посещения: { purpose_of_visit }</p>\n                    <p>Место посещения: { place_of_visit }</p>\n                    <p>Описание: { trip_description }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(96, 8, 'pt', 'Employee Trip', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de viagem.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_trip_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Topo da manh&atilde; para voc&ecirc;! Estou escrevendo para o seu departamento de departamento com um humilde pedido para viajar por um {purpose_of_visit} no exterior.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Seria o principal f&oacute;rum de neg&oacute;cios clim&aacute;tico do ano e teve a sorte de ser indicado para representar nossa empresa e a regi&atilde;o durante o semin&aacute;rio.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">A minha filia&ccedil;&atilde;o de tr&ecirc;s anos como parte do grupo e contribui&ccedil;&otilde;es que fiz &agrave; empresa, como resultado, foram simbioticamente ben&eacute;fico. A esse respeito, solicito que voc&ecirc; seja meu superior imediato para me permitir comparecer.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Mais detalhes sobre viagem:</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Trip Dura&ccedil;&atilde;o: {start_date} a {end_date}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Objetivo da Visita: {purpose_of_visit}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Local de Visita: {place_of_visit}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Descri&ccedil;&atilde;o: {trip_description}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(97, 9, 'ar', 'Employee Promotion', '<p>Subject : -HR القسم / الشركة لارسال رسالة تهنئة الى العمل للتهنئة بالعمل.</p>\n                    <p>عزيزي { employee_promotion_name },</p>\n                    <p>تهاني على ترقيتك الى { promotion_designation } { promotion_title } الفعال { promotion_date }.</p>\n                    <p>وسنواصل توقع تحقيق الاتساق وتحقيق نتائج عظيمة منكم في دوركم الجديد. ونأمل أن تكون قدوة للموظفين الآخرين في المنظمة.</p>\n                    <p>ونتمنى لكم التوفيق في أداءكم في المستقبل ، وتهانينا !</p>\n                    <p>ومرة أخرى ، تهانئي على الموقف الجديد.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(98, 9, 'da', 'Employee Promotion', '<p>Om: HR-afdelingen / Virksomheden om at sende en lyk&oslash;nskning til jobfremst&oslash;d.</p>\n                    <p>K&aelig;re { employee_promotion_name },</p>\n                    <p>Tillykke med din forfremmelse til { promotion_designation } { promotion_title } effektiv { promotion_date }.</p>\n                    <p>Vi vil fortsat forvente konsekvens og store resultater fra Dem i Deres nye rolle. Vi h&aring;ber, at De vil foreg&aring; med et godt eksempel for de &oslash;vrige ansatte i organisationen.</p>\n                    <p>Vi &oslash;nsker Dem held og lykke med Deres fremtidige optr&aelig;den, og tillykke!</p>\n                    <p>Endnu en gang tillykke med den nye holdning.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(99, 9, 'de', 'Employee Promotion', '<p>Betrifft: -Personalabteilung/Unternehmen, um einen Gl&uuml;ckwunschschreiben zu senden.</p>\n                    <p>Sehr geehrter {employee_promotion_name},</p>\n                    <p>Herzlichen Gl&uuml;ckwunsch zu Ihrer Werbeaktion an {promotion_designation} {promotion_title} wirksam {promotion_date}.</p>\n                    <p>Wir werden von Ihnen in Ihrer neuen Rolle weiterhin Konsistenz und gro&szlig;e Ergebnisse erwarten. Wir hoffen, dass Sie ein Beispiel f&uuml;r die anderen Mitarbeiter der Organisation setzen werden.</p>\n                    <p>Wir w&uuml;nschen Ihnen viel Gl&uuml;ck f&uuml;r Ihre zuk&uuml;nftige Leistung, und gratulieren!</p>\n                    <p>Nochmals herzlichen Gl&uuml;ckwunsch zu der neuen Position.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(100, 9, 'en', 'Employee Promotion', '<p>&nbsp;</p>\n                    <p><strong>Subject:-HR department/Company to send job promotion congratulation letter.</strong></p>\n                    <p><strong>Dear {employee_promotion_name},</strong></p>\n                    <p>Congratulations on your promotion to {promotion_designation} {promotion_title} effective {promotion_date}.</p>\n                    <p>We shall continue to expect consistency and great results from you in your new role. We hope that you will set an example for the other employees of the organization.</p>\n                    <p>We wish you luck for your future performance, and congratulations!.</p>\n                    <p>Again, congratulations on the new position.</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(101, 9, 'es', 'Employee Promotion', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de felicitaci&oacute;n de promoci&oacute;n de empleo.</p>\n                    <p>Estimado {employee_promotion_name},</p>\n                    <p>Felicidades por su promoci&oacute;n a {promotion_designation} {promotion_title} efectiva {promotion_date}.</p>\n                    <p>Seguiremos esperando la coherencia y los grandes resultados de ustedes en su nuevo papel. Esperamos que usted ponga un ejemplo para los otros empleados de la organizaci&oacute;n.</p>\n                    <p>Le deseamos suerte para su futuro rendimiento, y felicitaciones!.</p>\n                    <p>Una vez m&aacute;s, felicidades por la nueva posici&oacute;n.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(102, 9, 'fr', 'Employee Promotion', '<p>Objet: -D&eacute;partement RH / Soci&eacute;t&eacute; denvoi dune lettre de f&eacute;licitations pour la promotion de lemploi.</p>\n                    <p>Cher { employee_promotion_name },</p>\n                    <p>F&eacute;licitations pour votre promotion &agrave; { promotion_d&eacute;signation } { promotion_title } effective { promotion_date }.</p>\n                    <p>Nous continuerons &agrave; vous attendre &agrave; une coh&eacute;rence et &agrave; de grands r&eacute;sultats de votre part dans votre nouveau r&ocirc;le. Nous esp&eacute;rons que vous trouverez un exemple pour les autres employ&eacute;s de lorganisation.</p>\n                    <p>Nous vous souhaitons bonne chance pour vos performances futures et f&eacute;licitations !</p>\n                    <p>Encore une fois, f&eacute;licitations pour le nouveau poste.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(103, 9, 'it', 'Employee Promotion', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare la lettera di congratulazioni alla promozione del lavoro.</p>\n                    <p>Caro {employee_promotion_name},</p>\n                    <p>Complimenti per la tua promozione a {promotion_designation} {promotion_title} efficace {promotion_date}.</p>\n                    <p>Continueremo ad aspettarci coerenza e grandi risultati da te nel tuo nuovo ruolo. Ci auguriamo di impostare un esempio per gli altri dipendenti dellorganizzazione.</p>\n                    <p>Ti auguriamo fortuna per le tue prestazioni future, e complimenti!.</p>\n                    <p>Ancora, complimenti per la nuova posizione.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(104, 9, 'ja', 'Employee Promotion', '<p>件名:-HR 部門/企業は、求人広告の祝賀状を送信します。</p>\n                    <p>{ employee_promotion_name} に出庫します。</p>\n                    <p>{promotion_designation } { promotion_title} {promotion_date} 販促に対するお祝いのお祝いがあります。</p>\n                    <p>今後とも、お客様の新しい役割において一貫性と大きな成果を期待します。 組織の他の従業員の例を設定したいと考えています。</p>\n                    <p>あなたの未来のパフォーマンスをお祈りします。おめでとうございます。</p>\n                    <p>また、新しい地位について祝意を表する。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(105, 9, 'nl', 'Employee Promotion', '<p>Betreft: -HR-afdeling/Bedrijf voor het versturen van de aanbevelingsbrief voor taakpromotie.</p>\n                    <p>Geachte { employee_promotion_name },</p>\n                    <p>Gefeliciteerd met uw promotie voor { promotion_designation } { promotion_title } effective { promotion_date }.</p>\n                    <p>Wij zullen de consistentie en de grote resultaten van u in uw nieuwe rol blijven verwachten. Wij hopen dat u een voorbeeld zult stellen voor de andere medewerkers van de organisatie.</p>\n                    <p>Wij wensen u geluk voor uw toekomstige prestaties, en gefeliciteerd!.</p>\n                    <p>Nogmaals, gefeliciteerd met de nieuwe positie.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(106, 9, 'pl', 'Employee Promotion', '<p>Temat: -Dział kadr/Firma w celu wysłania listu gratulacyjnego dla promocji zatrudnienia.</p>\n                    <p>Szanowny {employee_promotion_name },</p>\n                    <p>Gratulacje dla awansowania do {promotion_designation } {promotion_title } efektywnej {promotion_date }.</p>\n                    <p>W dalszym ciągu oczekujemy konsekwencji i wspaniałych wynik&oacute;w w Twojej nowej roli. Mamy nadzieję, że postawicie na przykład dla pozostałych pracownik&oacute;w organizacji.</p>\n                    <p>Życzymy powodzenia dla przyszłych wynik&oacute;w, gratulujemy!.</p>\n                    <p>Jeszcze raz gratulacje na nowej pozycji.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(107, 9, 'ru', 'Employee Promotion', '<p>Тема: -HR отдел/Компания для отправки письма с поздравлением.</p>\n                    <p>Уважаемый { employee_promotion_name },</p>\n                    <p>Поздравляем вас с продвижением в { promotion_designation } { promotion_title } эффективная { promotion_date }.</p>\n                    <p>Мы будем и впредь ожидать от вас соответствия и больших результатов в вашей новой роли. Мы надеемся, что вы станете примером для других сотрудников организации.</p>\n                    <p>Желаем вам удачи и поздравлений!</p>\n                    <p>Еще раз поздравляю с новой позицией.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(108, 9, 'pt', 'Employee Promotion', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de felicita&ccedil;&atilde;o de promo&ccedil;&atilde;o de emprego.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {employee_promotion_name},</p>\n                    <p style=\"font-size: 14.4px;\">Parab&eacute;ns pela sua promo&ccedil;&atilde;o para {promotion_designation} {promotion_title} efetivo {promotion_date}.</p>\n                    <p style=\"font-size: 14.4px;\">Continuaremos a esperar consist&ecirc;ncia e grandes resultados a partir de voc&ecirc; em seu novo papel. Esperamos que voc&ecirc; defina um exemplo para os demais funcion&aacute;rios da organiza&ccedil;&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Desejamos sorte para o seu desempenho futuro, e parab&eacute;ns!.</p>\n                    <p style=\"font-size: 14.4px;\">Novamente, parab&eacute;ns pela nova posi&ccedil;&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(109, 10, 'ar', 'Employee Complaints', '<p>Subject :-قسم الموارد البشرية / الشركة لإرسال رسالة شكوى.</p>\n                    <p>عزيزي { employee_complaints_name },</p>\n                    <p>وأود أن أبلغ عن صراعا بينكم وبين الشخص الآخر. فقد وقعت عدة حوادث خلال الأيام القليلة الماضية ، وأشعر أن الوقت قد حان لتقديم شكوى رسمية ضده / لها.</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>Regards,</p>\n                    <p>إدارة الموارد البشرية ،</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(110, 10, 'da', 'Employee Complaints', '<p>Om: HR-departementet / Kompagniet for at sende klager.</p>\n                    <p>K&aelig;re { employee_complaints_name },</p>\n                    <p>Jeg vil gerne anmelde en konflikt mellem Dem og den anden person, og der er sket flere episoder i de seneste dage, og jeg mener, at det er p&aring; tide at anmelde en formel klage over for ham.</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(111, 10, 'de', 'Employee Complaints', '<p>Betrifft: -Personalabteilung/Unternehmen zum Senden von Beschwerden.</p>\n                    <p>Sehr geehrter {employee_complaints_name},</p>\n                    <p>Ich m&ouml;chte einen Konflikt zwischen Ihnen und der anderen Person melden. Es hat in den letzten Tagen mehrere Zwischenf&auml;lle gegeben, und ich glaube, es ist an der Zeit, eine formelle Beschwerde gegen ihn zu erstatten.</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(112, 10, 'en', 'Employee Complaints', '<p><strong>Subject:-HR department/Company to send complaints letter.</strong></p>\n                    <p><strong>Dear {employee_complaints_name},</strong></p>\n                    <p>I would like to report a conflict between you and the other person.There have been several incidents over the last few days, and I feel that it is time to report a formal complaint against him/her.</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(113, 10, 'es', 'Employee Complaints', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de quejas.</p>\n                    <p>Estimado {employee_complaints_name},</p>\n                    <p>Me gustar&iacute;a informar de un conflicto entre usted y la otra persona. Ha habido varios incidentes en los &uacute;ltimos d&iacute;as, y creo que es hora de denunciar una queja formal contra &eacute;l.</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(114, 10, 'fr', 'Employee Complaints', '<p>Objet: -Service des ressources humaines / Compagnie pour envoyer une lettre de plainte.</p>\n                    <p>Cher { employee_complaints_name },</p>\n                    <p>Je voudrais signaler un conflit entre vous et lautre personne. Il y a eu plusieurs incidents au cours des derniers jours, et je pense quil est temps de signaler une plainte officielle contre lui.</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(115, 10, 'it', 'Employee Complaints', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di reclamo.</p>\n                    <p>Caro {employee_complaints_name},</p>\n                    <p>Vorrei segnalare un conflitto tra lei e laltra persona Ci sono stati diversi incidenti negli ultimi giorni, e sento che &egrave; il momento di denunciare una denuncia formale contro di lui.</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(116, 10, 'ja', 'Employee Complaints', '<p>件名:-HR 部門/会社は、クレーム・レターを送信します。</p>\n                    <p>{ employee_complaints_name} の Dear&nbsp;</p>\n                    <p>あなたと他の人との間の葛藤を報告したいと思いますこの数日間でいくつかの事件が発生しています彼女に対する正式な申し立てをする時だと感じています</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(117, 10, 'nl', 'Employee Complaints', '<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van klachtenbrief.</p>\n                    <p>Geachte { employee_complaints_name},</p>\n                    <p>Ik zou een conflict willen melden tussen u en de andere persoon. Er zijn de afgelopen dagen verschillende incidenten geweest en ik denk dat het tijd is om een formele klacht tegen hem/haar in te dienen.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(118, 10, 'pl', 'Employee Complaints', '<p>Temat:-Dział HR/Firma do wysyłania listu reklamowego.</p>\n                    <p>Szanowna {employee_complaints_name },</p>\n                    <p>Chciałbym zgłosić konflikt między tobą a drugą osobą. W ciągu ostatnich kilku dni było kilka incydent&oacute;w i czuję, że nadszedł czas, aby zgłosić oficjalną skargę przeciwko niej.</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(119, 10, 'ru', 'Employee Complaints', '<p>Тема: -HR отдел/Компания отправить письмо с жалобами.</p>\n                    <p>Уважаемый { employee_complaints_name }</p>\n                    <p>Я хотел бы сообщить о конфликте между вами и другим человеком. За последние несколько дней произошло несколько инцидентов, и я считаю, что пришло время сообщить о своей официальной жалобе.</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(120, 10, 'pt', 'Employee Complaints', '<p>Assunto:-Departamento de RH / Empresa para enviar carta de reclama&ccedil;&otilde;es.</p>\n                    <p>Querido {employee_complaints_name},</p>\n                    <p>Eu gostaria de relatar um conflito entre voc&ecirc; e a outra pessoa. Houve v&aacute;rios incidentes ao longo dos &uacute;ltimos dias, e eu sinto que &eacute; hora de relatar uma den&uacute;ncia formal contra him/her.</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado</p>\n                    <p>Considera,</p>\n                    <p>Departamento de RH,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(121, 11, 'ar', 'Employee Warning', '<p style=\"text-align: left;\"><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\">Subject : -HR ادارة / شركة لارسال رسالة تحذير. عزيزي { employe_warning_name }, { warning_subject } { warning_description } إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة. شكرا لك Regards, إدارة الموارد البشرية ، { app_name }</span></span></span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(122, 11, 'da', 'Employee Warning', '<p>Om: HR-afdelingen / kompagniet for at sende advarselsbrev.</p>\n                    <p>K&aelig;re { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(123, 11, 'de', 'Employee Warning', '<p>Betreff: -Personalabteilung/Unternehmen zum Senden von Warnschreiben.</p>\n                    <p>Sehr geehrter {employee_warning_name},</p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(124, 11, 'en', 'Employee Warning', '<p><strong>Subject:-HR department/Company to send warning letter.</strong></p>\n                    <p><strong>Dear {employee_warning_name},</strong></p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(125, 11, 'es', 'Employee Warning', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar carta de advertencia.</p>\n                    <p>Estimado {employee_warning_name},</p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(126, 11, 'fr', 'Employee Warning', '<p>Objet: -HR department / Company to send warning letter.</p>\n                    <p>Cher { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(127, 11, 'it', 'Employee Warning', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di avvertimento.</p>\n                    <p>Caro {employee_warning_name},</p>\n                    <p>{warning_subject}</p>\n                    <p>{warning_description}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(128, 11, 'ja', 'Employee Warning', '<p><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\">件名:-HR 部門/企業は警告レターを送信します。 { employee_warning_name} を出庫します。 {warning_subject} {warning_description} 質問がある場合は、自由に連絡してください。 ありがとう よろしく HR 部門 {app_name}</span></span></span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(129, 11, 'nl', 'Employee Warning', '<p>Betreft: -HR-afdeling/bedrijf om een waarschuwingsbrief te sturen.</p>\n                    <p>Geachte { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(130, 11, 'pl', 'Employee Warning', '<p>Temat: -Dział HR/Firma do wysyłania listu ostrzegawczego.</p>\n                    <p>Szanowny {employee_warning_name },</p>\n                    <p>{warning_subject }</p>\n                    <p>{warning_description }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(131, 11, 'ru', 'Employee Warning', '<p>Тема: -HR отдел/Компания для отправки предупреждающего письма.</p>\n                    <p>Уважаемый { employee_warning_name },</p>\n                    <p>{ warning_subject }</p>\n                    <p>{ warning_description }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(132, 11, 'pt', 'Employee Warning', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de advert&ecirc;ncia.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_warning_name},</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_subject}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_description}</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(133, 12, 'ar', 'Employee Termination', '<p style=\"text-align: left;\"><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\"><span style=\"font-size: 12pt; white-space: pre-wrap;\">Subject :-ادارة / شركة HR لارسال رسالة انهاء. عزيزي { </span><span style=\"white-space: pre-wrap;\">employee_termination_name</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } ، هذه الرسالة مكتوبة لإعلامك بأن عملك مع شركتنا قد تم إنهاؤه مزيد من التفاصيل عن الانهاء : تاريخ الاشعار : { </span><span style=\"white-space: pre-wrap;\">notice_date</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } تاريخ الانهاء : { </span><span style=\"white-space: pre-wrap;\">termination_date</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } نوع الانهاء : { termination_type } إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة. شكرا لك Regards, إدارة الموارد البشرية ، { app_name }</span></span></span></span></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(134, 12, 'da', 'Employee Termination', '<p>Emne:-HR-afdelingen / Virksomheden om at sende afslutningstskrivelse.</p>\n                    <p>K&aelig;re { employee_termination_name },</p>\n                    <p>Dette brev er skrevet for at meddele dig, at dit arbejde med vores virksomhed er afsluttet.</p>\n                    <p>Flere oplysninger om oph&aelig;velse:</p>\n                    <p>Adviseringsdato: { notifice_date }</p>\n                    <p>Opsigelsesdato: { termination_date }</p>\n                    <p>Opsigelsestype: { termination_type }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(135, 12, 'de', 'Employee Termination', '<p>Betreff: -Personalabteilung/Firma zum Versenden von K&uuml;ndigungsschreiben.</p>\n                    <p>Sehr geehrter {employee_termination_name},</p>\n                    <p>Dieser Brief wird Ihnen schriftlich mitgeteilt, dass Ihre Besch&auml;ftigung mit unserem Unternehmen beendet ist.</p>\n                    <p>Weitere Details zur K&uuml;ndigung:</p>\n                    <p>K&uuml;ndigungsdatum: {notice_date}</p>\n                    <p>Beendigungsdatum: {termination_date}</p>\n                    <p>Abbruchstyp: {termination_type}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(136, 12, 'en', 'Employee Termination', '<p><strong>Subject:-HR department/Company to send termination letter.</strong></p>\n                    <p><strong>Dear {employee_termination_name},</strong></p>\n                    <p>This letter is written to notify you that your employment with our company is terminated.</p>\n                    <p>More detail about termination:</p>\n                    <p>Notice Date :{notice_date}</p>\n                    <p>Termination Date:{termination_date}</p>\n                    <p>Termination Type:{termination_type}</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(137, 12, 'es', 'Employee Termination', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de rescisi&oacute;n.</p>\n                    <p>Estimado {employee_termination_name},</p>\n                    <p>Esta carta est&aacute; escrita para notificarle que su empleo con nuestra empresa ha terminado.</p>\n                    <p>M&aacute;s detalles sobre la terminaci&oacute;n:</p>\n                    <p>Fecha de aviso: {notice_date}</p>\n                    <p>Fecha de terminaci&oacute;n: {termination_date}</p>\n                    <p>Tipo de terminaci&oacute;n: {termination_type}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(138, 12, 'fr', 'Employee Termination', '<p>Objet: -HR department / Company to send termination letter.</p>\n                    <p>Cher { employee_termination_name },</p>\n                    <p>Cette lettre est r&eacute;dig&eacute;e pour vous aviser que votre emploi aupr&egrave;s de notre entreprise prend fin.</p>\n                    <p>Plus de d&eacute;tails sur larr&ecirc;t:</p>\n                    <p>Date de lavis: { notice_date }</p>\n                    <p>Date de fin: { termination_date}</p>\n                    <p>Type de terminaison: { termination_type }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(139, 12, 'it', 'Employee Termination', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di terminazione.</p>\n                    <p>Caro {employee_termination_name},</p>\n                    <p>Questa lettera &egrave; scritta per comunicarti che la tua occupazione con la nostra azienda &egrave; terminata.</p>\n                    <p>Pi&ugrave; dettagli sulla cessazione:</p>\n                    <p>Data avviso: {notice_data}</p>\n                    <p>Data di chiusura: {termination_date}</p>\n                    <p>Tipo di terminazione: {termination_type}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(140, 12, 'ja', 'Employee Termination', '<p>件名:-HR 部門/企業は終了文字を送信します。</p>\n                    <p>{ employee_termination_name} を終了します。</p>\n                    <p>この手紙は、当社の雇用が終了していることをあなたに通知するために書かれています。</p>\n                    <p>終了についての詳細 :</p>\n                    <p>通知日 :{notice_date}</p>\n                    <p>終了日:{termination_date}</p>\n                    <p>終了タイプ:{termination_type}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(141, 12, 'nl', 'Employee Termination', '<p>Betreft: -HR-afdeling/Bedrijf voor verzending van afgiftebrief.</p>\n                    <p>Geachte { employee_termination_name },</p>\n                    <p>Deze brief is geschreven om u te melden dat uw werk met ons bedrijf wordt be&euml;indigd.</p>\n                    <p>Meer details over be&euml;indiging:</p>\n                    <p>Datum kennisgeving: { notice_date }</p>\n                    <p>Be&euml;indigingsdatum: { termination_date }</p>\n                    <p>Be&euml;indigingstype: { termination_type }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(142, 12, 'pl', 'Employee Termination', '<p>Temat: -Dział kadr/Firma do wysyłania listu zakańczego.</p>\n                    <p>Droga {employee_termination_name },</p>\n                    <p>Ten list jest napisany, aby poinformować Cię, że Twoje zatrudnienie z naszą firmą zostaje zakończone.</p>\n                    <p>Więcej szczeg&oacute;ł&oacute;w na temat zakończenia pracy:</p>\n                    <p>Data ogłoszenia: {notice_date }</p>\n                    <p>Data zakończenia: {termination_date }</p>\n                    <p>Typ zakończenia: {termination_type }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(143, 12, 'ru', 'Employee Termination', '<p>Тема: -HR отдел/Компания отправить письмо о прекращении.</p>\n                    <p>Уважаемый { employee_termination_name },</p>\n                    <p>Это письмо написано, чтобы уведомить вас о том, что ваше трудоустройство с нашей компанией прекратилось.</p>\n                    <p>Более подробная информация о завершении:</p>\n                    <p>Дата уведомления: { notice_date }</p>\n                    <p>Дата завершения: { termination_date }</p>\n                    <p>Тип завершения: { termination_type }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(144, 12, 'pt', 'Employee Termination', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de rescis&atilde;o.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {employee_termination_name},</p>\n                    <p style=\"font-size: 14.4px;\">Esta carta &eacute; escrita para notific&aacute;-lo de que seu emprego com a nossa empresa est&aacute; finalizado.</p>\n                    <p style=\"font-size: 14.4px;\">Mais detalhes sobre a finaliza&ccedil;&atilde;o:</p>\n                    <p style=\"font-size: 14.4px;\">Data de Aviso: {notice_date}</p>\n                    <p style=\"font-size: 14.4px;\">Data de Finaliza&ccedil;&atilde;o: {termination_date}</p>\n                    <p style=\"font-size: 14.4px;\">Tipo de Rescis&atilde;o: {termination_type}</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(145, 13, 'ar', 'Leave Statu', '<p style=\"text-align: left;\">Subject : -HR ادارة / شركة لارسال رسالة الموافقة الى { leave_status } اجازة أو ترك.</p>\n                    <p style=\"text-align: left;\">عزيزي { leave_status_name } ،</p>\n                    <p style=\"text-align: left;\">لدي { leave_status } طلب الخروج الخاص بك الى { leave_reason } من { leave_start_date } الى { leave_end_date }.</p>\n                    <p style=\"text-align: left;\">{ total_leave_days } أيام لدي { leave_status } طلب الخروج الخاص بك ل ـ { leave_reason }.</p>\n                    <p style=\"text-align: left;\">ونحن نطلب منكم أن تكملوا كل أعمالكم المعلقة أو أي قضية مهمة أخرى حتى لا تواجه الشركة أي خسارة أو مشكلة أثناء غيابكم. نحن نقدر لك مصداقيتك لإبلاغنا بوقت كاف مقدما</p>\n                    <p style=\"text-align: left;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p style=\"text-align: left;\">شكرا لك</p>\n                    <p style=\"text-align: left;\">Regards,</p>\n                    <p style=\"text-align: left;\">إدارة الموارد البشرية ،</p>\n                    <p style=\"text-align: left;\">{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(146, 13, 'da', 'Leave Statu', '<p>Emne:-HR-afdelingen / Kompagniet for at sende godkendelsesbrev til { leave_status } en ferie eller orlov.</p>\n                    <p>K&aelig;re { leave_status_name },</p>\n                    <p>Jeg har { leave_status } din orlov-anmodning for { leave_reason } fra { leave_start_date } til { leave_end_date }.</p>\n                    <p>{ total_leave_days } dage Jeg har { leave_status } din anmodning om { leave_reason } for { leave_reason }.</p>\n                    <p>Vi beder dig om at f&aelig;rdigg&oslash;re alt dit udest&aring;ende arbejde eller andet vigtigt sp&oslash;rgsm&aring;l, s&aring; virksomheden ikke st&aring;r over for nogen tab eller problemer under dit frav&aelig;r. Vi s&aelig;tter pris p&aring; din bet&aelig;nksomhed at informere os godt p&aring; forh&aring;nd</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>Med venlig hilsen</p>\n                    <p>HR-afdelingen,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(147, 13, 'de', 'Leave Statu', '<p>Betreff: -Personalabteilung/Firma, um den Genehmigungsschreiben an {leave_status} einen Urlaub oder Urlaub zu schicken.</p>\n                    <p>Sehr geehrter {leave_status_name},</p>\n                    <p>Ich habe {leave_status} Ihre Urlaubsanforderung f&uuml;r {leave_reason} von {leave_start_date} bis {leave_end_date}.</p>\n                    <p>{total_leave_days} Tage Ich habe {leave_status} Ihre Urlaubs-Anfrage f&uuml;r {leave_reason}.</p>\n                    <p>Wir bitten Sie, Ihre gesamte anstehende Arbeit oder ein anderes wichtiges Thema abzuschlie&szlig;en, so dass das Unternehmen w&auml;hrend Ihrer Abwesenheit keinen Verlust oder kein Problem zu Gesicht bekommen hat. Wir sch&auml;tzen Ihre Nachdenklichkeit, um uns im Vorfeld gut zu informieren</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Danke.</p>\n                    <p>Betrachtet,</p>\n                    <p>Personalabteilung,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(148, 13, 'en', 'Leave Statu', '<p><strong>Subject:-HR department/Company to send approval letter to {leave_status} a vacation or leave.</strong></p>\n                    <p><strong>Dear {leave_status_name},</strong></p>\n                    <p>I have {leave_status} your leave request for {leave_reason} from {leave_start_date} to {leave_end_date}.</p>\n                    <p>{total_leave_days} days I have {leave_status}&nbsp; your leave request for {leave_reason}.</p>\n                    <p>We request you to complete all your pending work or any other important issue so that the company does not face any loss or problem during your absence. We appreciate your thoughtfulness to inform us well in advance</p>\n                    <p>&nbsp;</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you</p>\n                    <p><strong>Regards,</strong></p>\n                    <p><strong>HR Department,</strong></p>\n                    <p><strong>{app_name}</strong></p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(149, 13, 'es', 'Leave Statu', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar la carta de aprobaci&oacute;n a {leave_status} unas vacaciones o permisos.</p>\n                    <p>Estimado {leave_status_name},</p>\n                    <p>Tengo {leave_status} la solicitud de licencia para {leave_reason} de {leave_start_date} a {leave_end_date}.</p>\n                    <p>{total_leave_days} d&iacute;as tengo {leave_status} la solicitud de licencia para {leave_reason}.</p>\n                    <p>Le solicitamos que complete todos sus trabajos pendientes o cualquier otro asunto importante para que la empresa no se enfrente a ninguna p&eacute;rdida o problema durante su ausencia. Agradecemos su atenci&oacute;n para informarnos con mucha antelaci&oacute;n</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias!</p>\n                    <p>Considerando,</p>\n                    <p>Departamento de Recursos Humanos,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(150, 13, 'fr', 'Leave Statu', '<p>Objet: -HR department / Company to send approval letter to { leave_status } a vacances or leave.</p>\n                    <p>Cher { leave_status_name },</p>\n                    <p>Jai { leave_statut } votre demande de cong&eacute; pour { leave_reason } de { leave_start_date } &agrave; { leave_date_fin }.</p>\n                    <p>{ total_leave_days } jours I have { leave_status } your leave request for { leave_reason }.</p>\n                    <p>Nous vous demandons de remplir tous vos travaux en cours ou toute autre question importante afin que lentreprise ne soit pas confront&eacute;e &agrave; une perte ou &agrave; un probl&egrave;me pendant votre absence. Nous appr&eacute;cions votre attention pour nous informer longtemps &agrave; lavance</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Je vous remercie</p>\n                    <p>Regards,</p>\n                    <p>D&eacute;partement des RH,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(151, 13, 'it', 'Leave Statu', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di approvazione a {leave_status} una vacanza o un congedo.</p>\n                    <p>Caro {leave_status_name},</p>\n                    <p>Ho {leave_status} la tua richiesta di permesso per {leave_reason} da {leave_start_date} a {leave_end_date}.</p>\n                    <p>{total_leave_days} giorni I ho {leave_status} la tua richiesta di permesso per {leave_reason}.</p>\n                    <p>Ti richiediamo di completare tutte le tue lavorazioni in sospeso o qualsiasi altra questione importante in modo che lazienda non faccia alcuna perdita o problema durante la tua assenza. Apprezziamo la vostra premura per informarci bene in anticipo</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie</p>\n                    <p>Riguardo,</p>\n                    <p>Dipartimento HR,</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(152, 13, 'ja', 'Leave Statu', '<p>件名: 承認レターを { leave_status} に送信するには、 -HR 部門/会社が休暇または休暇を入力します。</p>\n                    <p>{leave_status_name} を終了します。</p>\n                    <p>{ leave_reason } の { leave_start_date} から {leave_end_date}までの { leave_status} の終了要求を { leave_status} しています。</p>\n                    <p>{total_leave_days} 日に { leave_reason}{ leave_status} に対するあなたの休暇要求があります。</p>\n                    <p>お客様は、お客様の不在中に損失や問題が発生しないように、保留中のすべての作業またはその他の重要な問題を完了するよう要求します。 私たちは、前もってお知らせすることに感謝しています。</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとう</p>\n                    <p>よろしく</p>\n                    <p>HR 部門</p>\n                    <p>{app_name}</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(153, 13, 'nl', 'Leave Statu', '<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van een goedkeuringsbrief aan { leave_status } een vakantie of verlof.</p>\n                    <p>Geachte { leave_status_name },</p>\n                    <p>Ik heb { leave_status } uw verzoek om verlof voor { leave_reason } van { leave_start_date } tot { leave_end_date }.</p>\n                    <p>{ total_leave_days } dagen Ik heb { leave_status } uw verzoek om verlof voor { leave_reason }.</p>\n                    <p>Wij vragen u om al uw lopende werk of een andere belangrijke kwestie, zodat het bedrijf geen verlies of probleem tijdens uw afwezigheid geconfronteerd. We waarderen uw bedachtzaamheid om ons van tevoren goed te informeren.</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u wel</p>\n                    <p>Betreft:</p>\n                    <p>HR-afdeling,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(154, 13, 'pl', 'Leave Statu', '<p>Temat: -Dział kadr/Firma wysyłająca list zatwierdzający do {leave_status } wakacji lub urlop&oacute;w.</p>\n                    <p>Drogi {leave_status_name },</p>\n                    <p>Mam {leave_status } żądanie pozostania dla {leave_reason } od {leave_start_date } do {leave_end_date }.</p>\n                    <p>{total_leave_days } dni Mam {leave_status } Twoje żądanie opuszczenia dla {leave_reason }.</p>\n                    <p>Prosimy o wypełnienie wszystkich oczekujących prac lub innych ważnych kwestii, tak aby firma nie borykała się z żadną stratą lub problemem w czasie Twojej nieobecności. Doceniamy Twoją przemyślność, aby poinformować nas dobrze z wyprzedzeniem</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy</p>\n                    <p>W odniesieniu do</p>\n                    <p>Dział HR,</p>\n                    <p>{app_name }</p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(155, 13, 'ru', 'Leave Statu', '<p>Тема: -HR отдел/Компания отправить письмо с утверждением на { leave_status } отпуск или отпуск.</p>\n                    <p>Уважаемый { leave_status_name },</p>\n                    <p>У меня { leave_status } ваш запрос на отпуск для { leave_reason } из { leave_start_date } в { leave_end_date }.</p>\n                    <p>{ total_leave_days } дней { leave_status } ваш запрос на отпуск для { leave_reason }.</p>\n                    <p>Мы просим вас завершить все ваши ожидающие работы или любой другой важный вопрос, чтобы компания не сталкивалась с потерей или проблемой во время вашего отсутствия. Мы ценим вашу задумчивость, чтобы заблаговременно информировать нас о</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>С уважением,</p>\n                    <p>Отдел кадров,</p>\n                    <p>{ app_name }</p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(156, 13, 'pt', 'Leave Statu', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de aprova&ccedil;&atilde;o para {leave_status} f&eacute;rias ou licen&ccedil;a.</p>\n                    <p style=\"font-size: 14.4px;\">Querido {leave_status_name},</p>\n                    <p style=\"font-size: 14.4px;\">Eu tenho {leave_status} sua solicita&ccedil;&atilde;o de licen&ccedil;a para {leave_reason} de {leave_start_date} para {leave_end_date}.</p>\n                    <p style=\"font-size: 14.4px;\">{total_leave_days} dias eu tenho {leave_status} o seu pedido de licen&ccedil;a para {leave_reason}.</p>\n                    <p style=\"font-size: 14.4px;\">Solicitamos que voc&ecirc; complete todo o seu trabalho pendente ou qualquer outra quest&atilde;o importante para que a empresa n&atilde;o enfrente qualquer perda ou problema durante a sua aus&ecirc;ncia. Agradecemos a sua atenciosidade para nos informar com bastante anteced&ecirc;ncia</p>\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(157, 14, 'ar', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>مرحبا </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong><strong>العقد :</strong> </strong>{ contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>تاريخ البدء</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>تاريخ الانتهاء</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">اتطلع للسمع منك. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Regards Regards ، </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{ company_name }</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(158, 14, 'da', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hej </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Aftaleemne:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart-dato</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Slutdato</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Ser frem til at høre fra dig. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kærlig hilsen </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{ company_name }</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(159, 14, 'de', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong><strong> </strong></strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Vertragssubjekt:</strong> {contract_subject} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>tart-Datum</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>: </strong>{contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Freuen Sie sich auf die von Ihnen zu h&ouml;renden Informationen. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">-Regards, </span></span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(160, 14, 'en', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Contract Subject:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>End Date</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Looking forward to hear from you. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Regards, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(161, 14, 'es', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong><strong>Hi </strong></strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong><strong>de contrato:</strong> </strong>{contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">S</span></span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Fecha de finalizaci&oacute;n</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Con ganas de escuchar de usted. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Regards de tipo, </span></span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{contract_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(162, 14, 'fr', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong><strong> </strong></strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Objet du contrat:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Date de d&eacute;but</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Date de fin</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Vous avez h&acirc;te de vous entendre. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Regards </span> </strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{ company_name }</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(163, 14, 'it', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Ciao </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Oggetto Contratto:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Data tarte</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data di fine</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Non vedo lora di sentire da te. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind indipendentemente, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(164, 14, 'ja', 'Contract', '<p><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\"><strong>ハイ </strong>{contract_employee} </span></span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>契約件名:</strong> {契約対象} </span></p>\n                    <p><strong><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: </span></strong><span style=\"font-family: sans-serif;\">{contract_start_date}</span><span style=\"font-family: sans-serif;\"> </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>終了日</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">お客様から連絡をお待ちしています。 </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">クインド・レード </span></span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(165, 14, 'nl', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Contractonderwerp:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Einddatum</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Ik kijk ernaar uit om van u te horen. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Soort Regards, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{ company_name }</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(166, 14, 'pl', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{contract_employee}</span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Temat umowy:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">S</span></span></strong><span style=\"font-family: sans-serif;\"><strong>data tartu</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data zakończenia</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Nie można się doczekać, aby usłyszeć od użytkownika. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Regaty typu, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(167, 14, 'ru', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Привет </strong>{ contract_employee } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Тема договора:</strong> { contract_subject } </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>дата запуска</strong>: { contract_start_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Дата окончания</strong>: { contract_end_date } </span></p>\n                    <p><span style=\"font-family: sans-serif;\">С нетерпением ожидаю услышать от вас. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Карты вида, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{ company_name }</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(168, 14, 'pt', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Oi </strong>{contract_employee} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Assunto do Contrato:</strong> {contract_subject} </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data de término</strong>: {contract_end_date} </span></p>\n                    <p><span style=\"font-family: sans-serif;\">Olhando para a frente para ouvir de você. </span></p>\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Considerar, </span></strong></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-08-22 03:51:10', '2024-08-22 03:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `employee_id` varchar(191) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `company_doj` varchar(191) DEFAULT NULL,
  `documents` varchar(191) DEFAULT NULL,
  `account_holder_name` varchar(191) DEFAULT NULL,
  `account_number` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_identifier_code` varchar(191) DEFAULT NULL,
  `branch_location` varchar(191) DEFAULT NULL,
  `tax_payer_id` varchar(191) DEFAULT NULL,
  `salary_type` int(11) DEFAULT NULL,
  `salary` double DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `name`, `dob`, `gender`, `phone`, `address`, `email`, `password`, `employee_id`, `branch_id`, `department_id`, `designation_id`, `company_doj`, `documents`, `account_holder_name`, `account_number`, `bank_name`, `bank_identifier_code`, `branch_location`, `tax_payer_id`, `salary_type`, `salary`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'Md Tanvirul Islam', '1990-03-01', 'Male', '01812597637', 'Road 28', 'tanvir@infosonik.com', '$2y$10$.0bHSny4JflHyrE664IRXuyeXhV6hcCp.EZWW4mw1HnAmvxubNFiS', '1', 1, 1, 1, '2023-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, '2024-08-27 06:20:56', '2024-08-27 06:20:56'),
(2, 4, 'Sadia Nasrin Haque', '1986-03-28', 'Female', '01811486912', '42/D, West Chowdhury Para, Khilgaon, Dhaka', 'sadia.haque@infosonik.com', '$2y$10$hkXSqyMy/U2AIvZVZ9arr.L5JGNnnmFf0.0.y.oh0vfkkdOr/N222', '2', 1, 1, 2, '2023-07-01', NULL, 'Sadia Nasrin Haque', '018912700000775', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', '284148378947', NULL, 0, 1, 1, '2024-08-28 08:26:12', '2024-08-28 08:26:12'),
(3, 5, 'Zoyaza Islam Mighty', '1996-09-04', 'Female', '+8801797100359', 'Ka-127/D, Khilkhet Uttar Para, Dhaka-1229, Bangladesh', 'mighty@infosonik.com', '$2y$10$ZaT3XoBnjOGZSiN5qICOWuRszgq6iHpieufeKePHDKS9vLs/6mQW6', '3', 1, 3, 14, '2023-11-01', NULL, 'Zoyaza Islam Mighty', '018912700000771', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', 'N/A', NULL, 0, 1, 1, '2024-08-28 08:35:34', '2024-08-28 08:35:34'),
(4, 6, 'Md Amirul Hasan Pulok', '1998-10-15', 'Male', '01722667545', 'Mirpur-1, Dhaka', 'pulok@infosonik.com', '$2y$10$6n7RI7NqS0HF6IAMYOxTN.vkMM.GHX6dxYr658PkXfTkn2op/R.Wu', '4', 1, 1, 3, '2023-06-01', NULL, 'Md. Amirul Hasan Pulok', '018912700000772', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', '550884795389', NULL, 0, 1, 1, '2024-08-28 09:59:18', '2024-08-28 09:59:18'),
(5, 7, 'Md. Mosaddak Mostafa chowdhury', '1999-10-25', 'Male', '01851205292', 'Basree, Dhaka.', 'asif@infosonik.com', '$2y$10$n9PrGv/woVQDMUWnwrYeuOFioakMDf76PdY8eBWZMbIF/g3ESglou', '5', 1, 1, 5, '2023-08-01', NULL, 'Md. Mosaddak Mostafa Chowdhury', '018912700000773', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-08-28 10:11:11', '2024-08-28 10:11:11'),
(6, 8, 'Fahad Hosen', '1998-05-21', 'Male', '01777265483', 'Mirpur-6, Dhaka', 'fahad.hosen@infosonik.com', '$2y$10$dgqiOoTNILNrwmMhNGylcu2AX5RofHH6xVNhboGRasHiJoEVss17W', '6', 1, 1, 4, '2024-08-01', NULL, NULL, NULL, 'Premier Bank', NULL, 'Glass House Branch, Gulshan', '677827533895', NULL, 0, 1, 1, '2024-08-28 10:15:16', '2024-08-28 10:15:16'),
(7, 9, 'T.M. Abdullah Al-Amin', '1978-11-02', 'Male', '01713064503', 'Tejgaon, Dhaka', 'alamin@infosonik.com', '$2y$10$OIvPldKJpz1VWCb.skBbPuee29lzPNb./ZR5ZhsDiY3.xLJlFqy7S', '7', 1, 2, 8, '2024-06-01', NULL, 'T.M. Abdullah Al-Amin', '018912700000828', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', '498588212521', NULL, 0, 1, 1, '2024-08-28 10:35:29', '2024-11-25 04:40:04'),
(8, 10, 'A.S.M Sayem', '1994-12-28', 'Male', '01611085463', 'Mirpur', 'sayem@infosonik.com', '$2y$10$JBTMCaPJQik9eqFu8osRvOXJQnvk7VB5iYjkqVpXlU8rR.bGRpxE2', '8', 1, 2, 7, '2024-07-01', NULL, 'A. S. M Sayem', NULL, 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-08-28 11:29:34', '2024-08-28 11:29:34'),
(9, 11, 'Md Nasir Uddin Prince', '1985-03-31', 'Male', '01670768827', 'Mohammadpur, Dhaka', 'nasir.uddin@infosonik.com', '$2y$10$DvwYEh7mU1y/a1BIAMQD9uQUXecmFvjZpj/D6kZPWdQ1GPXXvDZ4S', '9', 1, 2, 7, '2024-06-01', NULL, 'Md Nasir Uddin Prince', '018912700000840', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:28:28', '2024-11-25 04:39:35'),
(10, 12, 'Mohammad Gulap Robbaney', '1982-01-05', 'Male', '01948200100', 'Badda', 'robbaney@infosonik.com', '$2y$10$xFnp0DgcdEqCYBtQN1hY/OHPn/GXq/OFm6ynXernt2B5BXb3gLb.u', '10', 1, 6, 11, '2023-12-01', NULL, 'Mohammed Gulap Robbaney', '018912700000776', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:32:00', '2024-09-01 09:32:00'),
(11, 13, 'Ashraful Islam', '1989-08-15', 'Male', '01915410255', 'Mirpur, Dhaka.', 'ashraf@infosonik.com', '$2y$10$6UxkzU19HNHJLtjyeqOTLudcG/uhWp/eGCs.KpfXVLadbMS46apTG', '11', 1, 5, 12, '2013-08-01', NULL, 'Md. Ashraful Islam', '018912700000770', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:37:52', '2024-09-01 09:37:52'),
(12, 14, 'Md. Hajjaj Hossain', '1991-01-08', 'Male', '01721518983', 'Mirpur', 'hajjaj@infosonik.com', '$2y$10$UQq5UZNp/oMGFUvQyBcxZO4eWpeaQ4pZeks8fXOB0Vh5wUwabvusi', '12', 1, 1, 4, '2024-08-01', NULL, 'Md. Hajjaj Hossain', '018912700000846', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:45:23', '2024-09-01 09:45:23'),
(13, 15, 'Md Tawfiqul Bari', '1982-06-01', 'Male', '01714412280', 'East Goran', 'tawfiqul.bari@infosonik.com', '$2y$10$0.iXPuSy6u2u0WZCrOrigOl.AvYp/r32L6OkuBvbBnanShEO354Du', '13', 1, 2, 6, '2024-09-01', NULL, 'Md Tawfiqul Bari', NULL, 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:48:35', '2024-09-01 09:48:35'),
(14, 16, 'Md Mostofa Kamal Chowdhury', '1973-02-20', 'Male', '01713014561', 'Mirpur', 'mostofa@infosonik.com', '$2y$10$TmF/NHZaKWls0uZVQAfgYOzbiQfoXCJvrJl7lbsN1RDrfXfG/XEle', '14', 1, 7, 9, '2023-06-01', NULL, 'Md Mostofa Kamal Chowdhury', '018912700000769', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:52:21', '2024-09-01 09:52:21'),
(15, 17, 'Fakhrul Islam', '1974-12-28', 'Male', '01841169574', 'mirpur', 'fakhrul@infosonik.com', '$2y$10$inZzHq6PcVxDRhfUJldtmeQcgAvOWFQtJ3ZJS1T6UdeVlELqRbY1W', '15', 1, 7, 10, '2024-06-01', NULL, 'Fakhrul Islam', '018912700000819', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 09:58:04', '2024-09-01 09:58:04'),
(16, 18, 'Md. Sabbir Ahmed', '1978-11-11', 'Male', '01917775777', 'Jowar Sahara', 'Sabbir@infosonik.com', '$2y$10$v4TvLDpdt.BFoC9/F9DZRumZLG.txG0MkFRfUPTLwXhBeijfn5Fr2', '16', 1, 7, 10, '2024-04-01', NULL, 'Md. Sabbir Ahmed', '018912700000817', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 10:01:35', '2024-09-01 10:01:35'),
(17, 19, 'Shamsul Alam', '1985-12-07', 'Male', '01966121212', 'rampura', 'shuvo@infosonik.com', '$2y$10$3InCpc6z/BlxNaMBiFbT3OAgqXBE98P3XJt.uaoWHnspHwpYnD7Fm', '17', 1, 7, 10, '2012-12-12', NULL, 'Shamsul Alam', '018912700000768', 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-09-01 10:04:50', '2024-09-01 10:04:50'),
(18, 20, 'Rayhan Islam', '2002-02-01', 'Male', '01616563385', 'basabo', 'rayhan@infosonik.com', '$2y$10$BrzvjL6dN5l4OGZ7EmVNc.8.7Q/qN/BLvxohALmU3Abp0RNMWs6aC', '18', 1, 5, 12, '2023-12-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, '2024-09-01 10:07:41', '2024-09-01 10:07:41'),
(19, 21, 'Khandakar Muttakinuzzaman Tonmoy', '1997-10-26', 'Male', '01619382931', 'Middle badda, boishaki soroni', 'tonmoy@infosonik.com', '$2y$10$phcX0Xn6mhhTYtCHHzaI7ODrsnvY3xgaZhaOzn9dDjfcaU0wfz9fu', '19', 1, 2, 15, '2024-11-03', NULL, 'Khandakar Muttakinuzzaman', NULL, 'Premier Bank', NULL, 'Glass House Branch, Gulshan', NULL, NULL, 0, 1, 1, '2024-11-25 04:48:54', '2024-11-25 04:50:03'),
(20, 22, 'MD Rubel Miah', '1999-01-25', 'Male', '+8801518913266', 'motijheel', 'rubel@infosonik.com', '$2y$10$KU1c.M61DbFtzGc/9rQwfe6j69PDHP55V8AhPQiHI7u9eprE3iAC6', '20', 1, 1, 0, '2024-01-25', NULL, 'Md Rubel Miah', NULL, 'Premier Bank', NULL, NULL, NULL, NULL, 0, 1, 1, '2024-11-25 05:00:55', '2024-11-25 05:00:55'),
(21, 23, 'Md Shariful Islam', '1994-01-05', 'Male', '01753548297', 'azimpur', 'sharif@unfosonik.com', '$2y$10$a0ejlTBiu0fFYVoCfbXRXeHu3ENszkHlRI5NwpGcjN9tUvnF5.Wlq', '21', 1, 1, 0, '2022-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, '2024-12-05 05:08:42', '2024-12-05 05:08:42'),
(22, 25, 'ABCD', '0000-00-00', 'Female', '9655857523', 'Blanditiis sunt cul', 'abcd@mailinator.com', '$2y$10$jeOo.5Ry9A8KVVO/C.F4mOL/wJxKtZDbwh7vHhZbi1HusNSILWca6', '22', 1, 1, 1, '11/29/2021', NULL, 'Dean Doyle', '400', 'Brady Workman', '123456', 'surat', '123456', NULL, 0, 1, 1, '2025-02-26 07:18:39', '2025-02-26 07:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `document_value` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` longtext NOT NULL,
  `employee_id` longtext NOT NULL,
  `title` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `color` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `branch_id`, `department_id`, `employee_id`, `title`, `start_date`, `end_date`, `color`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\",\"2\"]', '[\"0\"]', 'Test Event', '2025-08-13', '2025-08-13', 'event-info', 'Event description', 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `event_employees`
--

CREATE TABLE `event_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_employees`
--

INSERT INTO `event_employees` (`id`, `event_id`, `employee_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(2, 1, 2, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(3, 1, 4, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(4, 1, 5, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(5, 1, 6, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(6, 1, 7, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(7, 1, 8, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(8, 1, 9, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(9, 1, 12, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(10, 1, 13, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(11, 1, 19, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(12, 1, 20, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(13, 1, 21, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04'),
(14, 1, 22, 1, '2025-08-12 08:30:04', '2025-08-12 08:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `payee_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `referal_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_types`
--

INSERT INTO `expense_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'House Rent', 1, '2024-08-27 06:19:05', '2024-08-27 06:19:05'),
(2, 'Electric Bill', 1, '2024-08-27 06:19:13', '2024-08-27 06:19:13'),
(3, 'Phone Bill', 1, '2024-08-28 08:09:49', '2024-08-28 08:09:49'),
(4, 'Monthly Bill', 1, '2024-08-28 08:10:01', '2024-08-28 08:10:01'),
(5, 'Service Charge', 1, '2024-08-28 08:10:14', '2024-08-28 08:10:14'),
(6, 'Garage Rent', 1, '2024-08-28 08:10:25', '2024-08-28 08:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `experience_certificates`
--

CREATE TABLE `experience_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experience_certificates`
--

INSERT INTO `experience_certificates` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<h3 style=\"text-align: center;\">بريد إلكتروني تجربة</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>إلي من يهمه الامر</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>مدة الخدمة {duration} في {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>الادوار والمسؤوليات</p>\n            \n            \n            \n            <p>وصف موجز لمسار عمل الموظف وبيان إيجابي من المدير أو المشرف.</p>\n            \n            \n            \n            <p>بإخلاص،</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>التوقيع</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(2, 'da', '<h3 style=\"text-align: center;\">Erfaringsbrev</h3>\n            \n            <p>{app_name}</p>\n            \n            <p>TIL HVEM DET M&Aring;TTE VEDR&Oslash;RE</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Tjenesteperiode {duration} i {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Roller og ansvar</p>\n            \n            \n            \n            <p>Kort beskrivelse af medarbejderens ans&aelig;ttelsesforl&oslash;b og positiv udtalelse fra leder eller arbejdsleder.</p>\n            \n            \n            \n            <p>Med venlig hilsen</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Underskrift</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 'de', '<h3 style=\"text-align: center;\">Erfahrungsbrief</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>WEN ES ANGEHT</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Dienstzeit {duration} in {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Rollen und Verantwortlichkeiten</p>\n            \n            \n            \n            <p>Kurze Beschreibung des beruflichen Werdegangs des Mitarbeiters und eine positive Stellungnahme des Vorgesetzten oder Vorgesetzten.</p>\n            \n            \n            \n            <p>Aufrichtig,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Unterschrift</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 'en', '<p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: center;\" align=\"center\"><span style=\"font-size: 18pt;\"><strong>Experience Letter</strong></span></p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{app_name}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">TO WHOM IT MAY CONCERN</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{date}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{employee_name}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Tenure of Service {duration} in {app_name}.</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{designation}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{payroll}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Roles and Responsibilities</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Brief description of the employee&rsquo;s course of employment and a positive statement from the manager or supervisor.</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Sincerely,</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{employee_name}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{designation}</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Signature</p>\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 'es', '<h3 style=\"text-align: center;\">Carta de experiencia</h3>\n            \n            \n            <p>{app_name}</p>\n            \n            <p>A QUIEN LE INTERESE</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Duraci&oacute;n del servicio {duration} en {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Funciones y responsabilidades</p>\n            \n            \n            \n            <p>Breve descripci&oacute;n del curso de empleo del empleado y una declaraci&oacute;n positiva del gerente o supervisor.</p>\n            \n            \n            \n            <p>Sinceramente,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Firma</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(6, 'fr', '<h3 style=\"text-align: center;\">Lettre dexp&eacute;rience</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>&Agrave; QUI DE DROIT</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Dur&eacute;e du service {duration} dans {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>R&ocirc;les et responsabilit&eacute;s</p>\n            \n            \n            \n            <p>Br&egrave;ve description de l&eacute;volution de lemploi de lemploy&eacute; et une d&eacute;claration positive du gestionnaire ou du superviseur.</p>\n            \n            \n            \n            <p>Sinc&egrave;rement,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Signature</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(7, 'id', '<h3 style=\"text-align: center;\">Surat Pengalaman</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>UNTUK PERHATIAN</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Jangka Waktu Layanan {duration} di {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Peran dan Tanggung Jawab</p>\n            \n            \n            \n            <p>Deskripsi singkat tentang pekerjaan karyawan dan pernyataan positif dari manajer atau supervisor.</p>\n            \n            \n            \n            <p>Sungguh-sungguh,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Tanda tangan</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(8, 'it', '<h3 style=\"text-align: center;\">Lettera di esperienza</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>PER CHI &Egrave; COINVOLTO</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Durata del servizio {duration} in {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Ruoli e responsabilit&agrave;</p>\n            \n            \n            \n            <p>Breve descrizione del percorso lavorativo del dipendente e dichiarazione positiva del manager o supervisore.</p>\n            \n            \n            \n            <p>Cordiali saluti,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Firma</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(9, 'ja', '\n            <h3 style=\"text-align: center;\">体験談</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>ご担当者様</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{app_name} のサービス {duration} の保有期間。</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>役割と責任</p>\n            \n            \n            \n            <p>従業員の雇用コースの簡単な説明と、マネージャーまたはスーパーバイザーからの肯定的な声明。</p>\n            \n            \n            \n            <p>心から、</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>サイン</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(10, 'nl', '<h3 style=\"text-align: center;\">Ervaringsbrief</h3>\n            \n            \n            <p>{app_name}</p>\n            \n            <p>VOOR WIE HET AANGAAT</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Diensttijd {duration} in {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Rollen en verantwoordelijkheden</p>\n            \n            \n            \n            <p>Korte omschrijving van het dienstverband van de medewerker en een positieve verklaring van de leidinggevende of leidinggevende.</p>\n            \n            \n            \n            <p>Eerlijk,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Handtekening</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(11, 'pl', '<h3 style=\"text-align: center;\">Doświadczenie List</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>DO TYCH KT&Oacute;RYCH MOŻE TO DOTYCZYĆ</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Okres świadczenia usług {duration} w aplikacji {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Role i obowiązki</p>\n            \n            \n            \n            <p>Kr&oacute;tki opis przebiegu zatrudnienia pracownika oraz pozytywna opinia kierownika lub przełożonego.</p>\n            \n            \n            \n            <p>Z poważaniem,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Podpis</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(12, 'pt', '<h3 style=\"text-align: center;\">Carta de Experi&ecirc;ncia</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>A QUEM POSSA INTERESSAR</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Tempo de servi&ccedil;o {duration} em {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Pap&eacute;is e responsabilidades</p>\n            \n            \n            \n            <p>Breve descri&ccedil;&atilde;o do curso de emprego do funcion&aacute;rio e uma declara&ccedil;&atilde;o positiva do gerente ou supervisor.</p>\n            \n            \n            \n            <p>Sinceramente,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Assinatura</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(13, 'ru', '<h3 style=\"text-align: center;\">Письмо об опыте</h3>\n            \n            \n            \n            <p>{app_name}</p>\n            \n            <p>ДЛЯ ПРЕДЪЯВЛЕНИЯ ПО МЕСТУ ТРЕБОВАНИЯ</p>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>Срок службы {duration} в {app_name}.</p>\n            \n            <p>{designation}</p>\n            \n            <p>{payroll}</p>\n            \n            <p>Роли и обязанности</p>\n            \n            \n            \n            <p>Краткое описание трудового стажа работника и положительное заключение руководителя или руководителя.</p>\n            \n            \n            \n            <p>Искренне,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Подпись</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generate_offer_letters`
--

CREATE TABLE `generate_offer_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generate_offer_letters`
--

INSERT INTO `generate_offer_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>رسالة عرض</strong></span></p>\n                    \n                    \n                    <p>عزيزي {applicationant_name} ،</p>\n                    \n                    \n                    <p>{app_name} متحمس لاصطحابك على متن الطائرة بصفتك {job_title}.</p>\n                    \n                    <p>كنت على بعد خطوات قليلة من الشروع في العمل. يرجى أخذ الوقت الكافي لمراجعة عرضنا الرسمي. يتضمن تفاصيل مهمة حول راتبك ومزاياك وبنود وشروط عملك المتوقع مع {app_name}.</p>\n                    \n                    \n                    <p>{app_name} يقدم {job_type}. المنصب بالنسبة لك كـ {job_title} ، تقديم التقارير إلى [المدير المباشر / المشرف] بدءًا من {start_date} في {workplace_location}. ساعات العمل المتوقعة هي {days_of_week}.</p>\n                    \n                    \n                    <p>في هذا المنصب ، يعرض عليك {app_name}&nbsp; {salary}أن تبدأ لك بمعدل دفع {salary_type} لكل {salary_duration}. سوف يتم الدفع لك على أساس.</p>\n                    \n                    \n                    <p>كجزء من تعويضك ، إذا كان ذلك ممكنًا ، ستصف مكافأتك ومشاركة الأرباح وهيكل العمولة وخيارات الأسهم وقواعد لجنة التعويضات هنا.</p>\n                    \n                    \n                    <p>بصفتك موظفًا في {app_name} ، ستكون مؤهلاً للحصول على مزايا الاسم المختصر ، مثل التأمين الصحي ، وخطة الأسهم ، والتأمين على الأسنان ، وما إلى ذلك.</p>\n                    \n                    \n                    <p>الرجاء توضيح موافقتك على هذه البنود وقبول هذا العرض عن طريق التوقيع على هذه الاتفاقية وتأريخها في أو قبل {offer_expiration_date}.</p>\n                    \n                    <p>بإخلاص،</p>\n                    \n                    <p>{app_name}</p>\n                    ', 1, '2024-08-22 03:51:08', '2024-08-22 03:51:08'),
(2, 'da', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Tilbudsbrev</strong></span></p>\n                    \n                    <p>K&aelig;re {applicant_name}</p>\n                    \n                    <p>{app_name} er glade for at f&aring; dig med som {job_title}.</p>\n                    \n                    <p>Der var kun et par formaliteter fra at komme p&aring; arbejde. Tag dig tid til at gennemg&aring; vores formelle tilbud. Den indeholder vigtige oplysninger om din kompensation, fordele og vilk&aring;rene og betingelserne for din forventede ans&aelig;ttelse hos {app_name}.</p>\n                    \n                    <p>{app_name} tilbyder en {job_type}. stilling til dig som {job_title}, der rapporterer til [n&aelig;rmeste leder/supervisor] fra og med {start_date} p&aring;{workplace_location}. Forventet arbejdstid er {days_of_week}.</p>\n                    \n                    \n                    <p>I denne stilling tilbyder {app_name} at starte dig med en l&oslash;nsats p&aring; {salary} pr. {salary_type}. Du vil blive betalt p&aring; {salary_duration}-basis.</p>\n                    \n                    <p>Som en del af din kompensation, du ogs&aring; tilbyder, hvis det er relevant, vil du beskrive din bonus, overskudsdeling, kommissionsstruktur, aktieoptioner og regler for kompensationsudvalget her.</p>\n                    \n                    \n                    <p>Som ansat hos {app_name} vil du v&aelig;re berettiget til kort navnefordele, s&aring;som sundhedsforsikring, aktieplan, tandforsikring osv.</p>\n                    \n                    <p>Angiv venligst din accept af disse vilk&aring;r og accepter dette tilbud ved at underskrive og datere denne aftale p&aring; eller f&oslash;r {offer_expiration_date}.</p>\n                    \n                    <p>Med venlig hilsen</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 'de', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Angebotsschreiben</strong></span></p>\n                    \n                    \n                    <p>Sehr geehrter {applicant_name},</p>\n                    \n                    \n                    <p>{app_name} freut sich, Sie als {job_title} an Bord zu holen.</p>\n                    \n                    \n                    <p>Nur noch wenige Formalit&auml;ten bis zur Arbeit. Bitte nehmen Sie sich die Zeit, unser formelles Angebot zu pr&uuml;fen. Es enth&auml;lt wichtige Details zu Ihrer Verg&uuml;tung, Ihren Leistungen und den Bedingungen Ihrer voraussichtlichen Anstellung bei {app_name}.</p>\n                    \n                    \n                    <p>{app_name} bietet einen {job_type} an. Position f&uuml;r Sie als {job_title}, ab {start_date} am {workplace_location} unterstellt an unmittelbarer Manager/Vorgesetzter. Erwartete Arbeitszeiten sind {days_of_week}.</p>\n                    \n                    \n                    <p>In dieser Position bietet {app_name} Ihnen an, mit einem Gehaltssatz von {salary} pro {salary_type} zu beginnen. Sie werden auf Basis von {salary_duration} bezahlt.</p>\n                    \n                    \n                    <p>Als Teil Ihrer Verg&uuml;tung, die Sie gegebenenfalls auch anbieten, beschreiben Sie hier Ihren Bonus, Ihre Gewinnbeteiligung, Ihre Provisionsstruktur, Ihre Aktienoptionen und die Regeln des Verg&uuml;tungsausschusses.</p>\n                    \n                    \n                    <p>Als Mitarbeiter von {app_name} haben Sie Anspruch auf Kurznamenvorteile wie Krankenversicherung, Aktienplan, Zahnversicherung usw.</p>\n                    \n                    \n                    \n                    <p>Bitte erkl&auml;ren Sie Ihr Einverst&auml;ndnis mit diesen Bedingungen und nehmen Sie dieses Angebot an, indem Sie diese Vereinbarung am oder vor dem {offer_expiration_date} unterzeichnen und datieren.</p>\n                    \n                    \n                    <p>Aufrichtig,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 'en', '<p style=\"text-align: center;\"><strong>Offer Letter</strong></p>\n                    \n                    <p>Dear {applicant_name},</p>\n                    \n                    <p>{app_name} is excited to bring you on board as {job_title}.</p>\n                    \n                    <p>Were just a few formalities away from getting down to work. Please take the time to review our formal offer. It includes important details about your compensation, benefits, and the terms and conditions of your anticipated employment with {app_name}.</p>\n                    \n                    <p>{app_name} is offering a {job_type}. position for you as {job_title}, reporting to [immediate manager/supervisor] starting on {start_date} at{workplace_location}. Expected hours of work are{days_of_week}.</p>\n                    \n                    <p>In this position, {app_name} is offering to start you at a pay rate of {salary} per {salary_type}. You will be paid on a{salary_duration} basis.&nbsp;</p>\n                    \n                    <p>As part of your compensation, were also offering [if applicable, youll describe your bonus, profit sharing, commission structure, stock options, and compensation committee rules here].</p>\n                    \n                    <p>As an employee of {app_name} , you will be eligible for briefly name benefits, such as health insurance, stock plan, dental insurance, etc.</p>\n                    \n                    <p>Please indicate your agreement with these terms and accept this offer by signing and dating this agreement on or before {offer_expiration_date}.</p>\n                    \n                    <p>Sincerely,</p>\n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 'es', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\n                    \n                    \n                    <p>Estimado {applicant_name},</p>\n                    \n                    <p>{app_name} se complace en incorporarlo como {job_title}.</p>\n                    \n                    \n                    <p>Faltaban s&oacute;lo unos tr&aacute;mites para ponerse manos a la obra. T&oacute;mese el tiempo para revisar nuestra oferta formal. Incluye detalles importantes sobre su compensaci&oacute;n, beneficios y los t&eacute;rminos y condiciones de su empleo anticipado con {app_name}.</p>\n                    \n                    \n                    <p>{app_name} est&aacute; ofreciendo {job_type}. posici&oacute;n para usted como {job_title}, reportando al gerente/supervisor inmediato a partir del {start_date} en {workplace_location}. Las horas de trabajo esperadas son {days_of_week}.</p>\n                    \n                    \n                    <p>En este puesto, {app_name} te ofrece comenzar con una tarifa de pago de {salary} por {salary_type}. Se le pagar&aacute; sobre la base de {salary_duration}.</p>\n                    \n                    \n                    <p>Como parte de su compensaci&oacute;n, tambi&eacute;n ofrecemos, si corresponde, aqu&iacute; describir&aacute; su bonificaci&oacute;n, participaci&oacute;n en las ganancias, estructura de comisiones, opciones sobre acciones y reglas del comit&eacute; de compensaci&oacute;n.</p>\n                    \n                    \n                    <p>Como empleado de {app_name}, ser&aacute; elegible para beneficios de nombre breve, como seguro m&eacute;dico, plan de acciones, seguro dental, etc.</p>\n                    \n                    \n                    <p>Indique su acuerdo con estos t&eacute;rminos y acepte esta oferta firmando y fechando este acuerdo el {offer_expiration_date} o antes.</p>\n                    \n                    \n                    <p>Sinceramente,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(6, 'fr', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Lettre doffre</strong></span></p>\n                    \n                    \n                    <p>Cher {applicant_name},</p>\n                    \n                    \n                    <p>{app_name} est ravi de vous accueillir en tant que {job_title}.</p>\n                    \n                    \n                    <p>&Eacute;taient juste quelques formalit&eacute;s loin de se mettre au travail. Veuillez prendre le temps dexaminer notre offre formelle. Il comprend des d&eacute;tails importants sur votre r&eacute;mun&eacute;ration, vos avantages et les termes et conditions de votre emploi pr&eacute;vu avec {app_name}.</p>\n                    \n                    \n                    <p>{app_name} propose un {job_type}. poste pour vous en tant que {job_title}, relevant du directeur/superviseur imm&eacute;diat &agrave; partir du {start_date} &agrave; {workplace_location}. Les heures de travail pr&eacute;vues sont de {days_of_week}.</p>\n                    \n                    \n                    <p>&Agrave; ce poste, {app_name} vous propose de commencer avec un taux de r&eacute;mun&eacute;ration de {salary} par {salary_type}. Vous serez pay&eacute; sur une base de {salary_duration}.</p>\n                    \n                    \n                    <p>Dans le cadre de votre r&eacute;mun&eacute;ration, le cas &eacute;ch&eacute;ant, vous d&eacute;crivez ici votre bonus, votre participation aux b&eacute;n&eacute;fices, votre structure de commission, vos options sur actions et les r&egrave;gles du comit&eacute; de r&eacute;mun&eacute;ration.</p>\n                    \n                    \n                    <p>En tant quemploy&eacute; de {app_name}, vous aurez droit &agrave; des avantages bri&egrave;vement nomm&eacute;s, tels que lassurance maladie, le plan dactionnariat, lassurance dentaire, etc.</p>\n                    \n                    \n                    <p>Veuillez indiquer votre accord avec ces conditions et accepter cette offre en signant et en datant cet accord au plus tard le {offer_expiration_date}.</p>\n                    \n                    \n                    <p>Sinc&egrave;rement,</p>\n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(7, 'id', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Surat penawaran</strong></span></p>\n                    \n                    \n                    <p>{applicant_name} yang terhormat,</p>\n                    \n                    \n                    <p>{app_name} dengan senang hati membawa Anda sebagai {job_title}.</p>\n                    \n                    \n                    <p>Tinggal beberapa formalitas lagi untuk mulai bekerja. Harap luangkan waktu untuk meninjau penawaran resmi kami. Ini mencakup detail penting tentang kompensasi, tunjangan, serta persyaratan dan ketentuan pekerjaan yang Anda harapkan dengan {app_name}.</p>\n                    \n                    \n                    <p>{app_name} menawarkan {job_type}. posisi untuk Anda sebagai {job_title}, melapor ke manajer/penyelia langsung mulai {start_date} di{workplace_location}. Jam kerja yang diharapkan adalah{days_of_week}.</p>\n                    \n                    \n                    <p>Di posisi ini, {app_name} menawarkan untuk memulai Anda dengan tarif pembayaran {salary} per {salary_type}. Anda akan dibayar berdasarkan {salary_duration}.</p>\n                    \n                    \n                    <p>Sebagai bagian dari kompensasi Anda, yang juga ditawarkan jika berlaku, Anda akan menjelaskan bonus, pembagian keuntungan, struktur komisi, opsi saham, dan aturan komite kompensasi Anda di sini.</p>\n                    \n                    \n                    <p>Sebagai karyawan {app_name} , Anda akan memenuhi syarat untuk mendapatkan manfaat singkat, seperti asuransi kesehatan, paket saham, asuransi gigi, dll.</p>\n                    \n                    \n                    <p>Harap tunjukkan persetujuan Anda dengan persyaratan ini dan terima penawaran ini dengan menandatangani dan memberi tanggal pada perjanjian ini pada atau sebelum {offer_expiration_date}.</p>\n                    \n                    \n                    <p>Sungguh-sungguh,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(8, 'it', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Lettera di offerta</strong></span></p>\n                    \n                    \n                    <p>Gentile {nome_richiedente},</p>\n                    \n                    \n                    <p>{app_name} &egrave; entusiasta di portarti a bordo come {job_title}.</p>\n                    \n                    \n                    <p>Mancavano solo poche formalit&agrave; per mettersi al lavoro. Per favore, prenditi del tempo per rivedere la nostra offerta formale. Include dettagli importanti sul compenso, i vantaggi e i termini e le condizioni del tuo impiego previsto con {app_name}.</p>\n                    \n                    \n                    <p>{app_name} offre un {job_type}. posizione per te come {job_title}, riportando al manager/supervisore immediato a partire da {start_date} a {workplace_location}. Lorario di lavoro previsto &egrave; di {days_of_week}.</p>\n                    \n                    \n                    <p>In questa posizione, {app_name} ti offre di iniziare con una paga di {salary} per {salary_type}. Sarai pagato su base {salary_duration}.</p>\n                    \n                    \n                    <p>Come parte del tuo compenso, se applicabile, descrivi anche il tuo bonus, la partecipazione agli utili, la struttura delle commissioni, le stock option e le regole del comitato di compensazione qui.</p>\n                    \n                    \n                    <p>In qualit&agrave; di dipendente di {app_name} , avrai diritto a vantaggi per nomi brevi, come assicurazione sanitaria, piano azionario, assicurazione dentale, ecc.</p>\n                    \n                    \n                    <p>Indica il tuo accordo con questi termini e accetta questa offerta firmando e datando questo accordo entro il {offer_expiration_date}.</p>\n                    \n                    \n                    <p>Cordiali saluti,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(9, 'ja', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>内定通知</strong></span></p>\n                    \n                    \n                    <p>{applicant_name} 様</p>\n                    \n                    <p>{app_name} は、あなたを {job_title} として迎えることに興奮しています。</p>\n                    \n                    <p>仕事に取り掛かる前に、ほんの少しの手続きがありました。時間をかけて正式なオファーを確認してください。これには、あなたの報酬、福利厚生、および {app_name} での予想される雇用条件に関する重要な詳細が含まれています。</p>\n                    \n                    <p>{app_name} が {job_type} を提供しています。 {job_title} として、{start_date} から {workplace_location} の直属のマネージャー/スーパーバイザーに報告します。予想される勤務時間は {days_of_week} です。</p>\n                    \n                    <p>このポジションでは、{app_name} は、{salary_type} あたり {salary} の賃金率であなたをスタートさせることを提案しています。 {salary_duration} 単位で支払われます。</p>\n                    \n                    <p>報酬の一部として、該当する場合は提供もしていました。ボーナス、利益分配、手数料体系、ストック オプション、および報酬委員会の規則についてここに説明します。</p>\n                    \n                    <p>{app_name} の従業員として、健康保険、ストック プラン、歯科保険などの簡単な名前の特典を受ける資格があります。</p>\n                    \n                    <p>{offer_expiration_date} 日までに本契約に署名し日付を記入して、これらの条件に同意し、このオファーを受け入れてください。</p>\n                    \n                    <p>心から、</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(10, 'nl', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Aanbiedingsbrief</strong></span></p>\n                    \n                    \n                    \n                    <p>Beste {applicant_name},</p>\n                    \n                    \n                    \n                    <p>{app_name} is verheugd je aan boord te mogen verwelkomen als {job_title}.</p>\n                    \n                    \n                    \n                    <p>Waren slechts een paar formaliteiten verwijderd om aan het werk te gaan. Neem de tijd om ons formele aanbod te bekijken. Het bevat belangrijke details over uw vergoeding, voordelen en de voorwaarden van uw verwachte dienstverband bij {app_name}.</p>\n                    \n                    \n                    \n                    <p>{app_name} biedt een {job_type} aan. functie voor jou als {job_title}, rapporterend aan directe manager/supervisor vanaf {start_date} op {workplace_location}. De verwachte werkuren zijn {days_of_week}.</p>\n                    \n                    \n                    \n                    <p>In deze functie biedt {app_name} aan om je te starten tegen een salaris van {salary} per {salary_type}. U wordt betaald op basis van {salary_duration}.</p>\n                    \n                    \n                    \n                    <p>Als onderdeel van uw vergoeding, die u, indien van toepassing, ook aanbiedt, beschrijft u hier uw bonus, winstdeling, commissiestructuur, aandelenopties en regels van het vergoedingscomit&eacute;.</p>\n                    \n                    \n                    \n                    <p>Als medewerker van {app_name} kom je in aanmerking voor korte naamvoordelen, zoals een ziektekostenverzekering, aandelenplan, tandartsverzekering, enz.</p>\n                    \n                    \n                    \n                    <p>Geef aan dat u akkoord gaat met deze voorwaarden en accepteer deze aanbieding door deze overeenkomst op of v&oacute;&oacute;r {offer_expiration_date} te ondertekenen en te dateren.</p>\n                    \n                    \n                    \n                    <p>Eerlijk,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(11, 'pl', '<p style=\"text-align: center;\"><strong><span style=\"font-size: 18pt;\">List ofertowy</span></strong></p>\n                    \n                    <p>Drogi {applicant_name},</p>\n                    \n                    <p>{app_name} z radością zaprasza Cię do wsp&oacute;łpracy jako {job_title}.</p>\n                    \n                    <p>Od rozpoczęcia pracy dzieliło mnie tylko kilka formalności. Prosimy o poświęcenie czasu na zapoznanie się z naszą oficjalną ofertą. Zawiera ważne szczeg&oacute;ły dotyczące Twojego wynagrodzenia, świadczeń oraz warunk&oacute;w Twojego przewidywanego zatrudnienia w {app_name}.</p>\n                    \n                    \n                    <p>{app_name} oferuje {job_type}. stanowisko dla Ciebie jako {job_title}, raportowanie do bezpośredniego przełożonego/przełożonego począwszy od {start_date} w {workplace_location}. Przewidywane godziny pracy to {days_of_week}.</p>\n                    \n                    \n                    <p>Na tym stanowisku {app_name} oferuje Ci rozpoczęcie pracy za stawkę {salary} za {salary_type}. Otrzymasz zapłatę na podstawie {salary_duration}.</p>\n                    \n                    \n                    <p>W ramach wynagrodzenia, kt&oacute;re oferowaliśmy, jeśli dotyczy, opiszesz tutaj swoją premię, podział zysk&oacute;w, strukturę prowizji, opcje na akcje i zasady komitetu ds. Wynagrodzeń.</p>\n                    \n                    \n                    <p>Jako pracownik {app_name} będziesz mieć prawo do kr&oacute;tkich imiennych świadczeń, takich jak ubezpieczenie zdrowotne, plan akcji, ubezpieczenie dentystyczne itp.</p>\n                    \n                    <p>Zaznacz, że zgadzasz się z tymi warunkami i zaakceptuj tę ofertę, podpisując i datując tę ​​umowę w dniu {offer_expiration_date} lub wcześniej.</p>\n                    \n                    <p>Z poważaniem,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(12, 'pt', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\n                    \n                    \n                    <p>Prezado {applicant_name},</p>\n                    \n                    \n                    <p>{app_name} tem o prazer de trazer voc&ecirc; a bordo como {job_title}.</p>\n                    \n                    \n                    <p>Faltavam apenas algumas formalidades para come&ccedil;ar a trabalhar. Por favor, reserve um tempo para revisar nossa oferta formal. Ele inclui detalhes importantes sobre sua remunera&ccedil;&atilde;o, benef&iacute;cios e os termos e condi&ccedil;&otilde;es de seu emprego previsto com {app_name}.</p>\n                    \n                    \n                    <p>{app_name} est&aacute; oferecendo um {job_type}. posi&ccedil;&atilde;o para voc&ecirc; como {job_title}, reportando-se ao gerente/supervisor imediato a partir de {start_date} em {workplace_location}. As horas de trabalho previstas s&atilde;o {days_of_week}.</p>\n                    \n                    \n                    <p>Nesta posi&ccedil;&atilde;o, {app_name} est&aacute; oferecendo para voc&ecirc; come&ccedil;ar com uma taxa de pagamento de {salary} por {salary_type}. Voc&ecirc; ser&aacute; pago em uma base de {salary_duration}.</p>\n                    \n                    \n                    <p>Como parte de sua remunera&ccedil;&atilde;o, tamb&eacute;m oferecida, se aplic&aacute;vel, voc&ecirc; descrever&aacute; seu b&ocirc;nus, participa&ccedil;&atilde;o nos lucros, estrutura de comiss&otilde;es, op&ccedil;&otilde;es de a&ccedil;&otilde;es e regras do comit&ecirc; de remunera&ccedil;&atilde;o aqui.</p>\n                    \n                    \n                    <p>Como funcion&aacute;rio de {app_name} , voc&ecirc; se qualificar&aacute; para benef&iacute;cios de nome breve, como seguro sa&uacute;de, plano de a&ccedil;&otilde;es, seguro odontol&oacute;gico etc.</p>\n                    \n                    \n                    <p>Indique sua concord&acirc;ncia com estes termos e aceite esta oferta assinando e datando este contrato em ou antes de {offer_expiration_date}.</p>\n                    \n                    \n                    <p>Sinceramente,</p>\n                    \n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(13, 'ru', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Письмо с предложением</strong></span></p>\n                    \n                    \n                    <p>Уважаемый {applicant_name!</p>\n                    \n                    \n                    <p>{app_name} рад предложить вам присоединиться к нам в качестве {job_title}.</p>\n                    \n                    \n                    <p>Осталось всего несколько формальностей, чтобы приступить к работе. Пожалуйста, найдите время, чтобы ознакомиться с нашим официальным предложением. В нем содержится важная информация о вашем вознаграждении, льготах и ​​условиях вашего предполагаемого трудоустройства в {app_name}.</p>\n                    \n                    \n                    <p>{app_name} предлагает {job_type}. должность для вас как {job_title}, подчинение непосредственному руководителю/руководителю начиная с {start_date} в {workplace_location}. Ожидаемое рабочее время: {days_of_week}.</p>\n                    \n                    \n                    <p>На этой должности {app_name} предлагает вам начать работу со ставкой заработной платы {salary} за {salary_type}. Вам будут платить на основе {salary_duration}.</p>\n                    \n                    \n                    <p>В рамках вашего вознаграждения мы также предлагаем, если это применимо, вы описываете свой бонус, распределение прибыли, структуру комиссионных, опционы на акции и правила компенсационного комитета здесь.</p>\n                    \n                    \n                    <p>Как сотрудник {app_name}, вы будете иметь право на краткосрочные льготы, такие как медицинская страховка, план акций, стоматологическая страховка и т. д.</p>\n                    \n                    \n                    <p>Пожалуйста, подтвердите свое согласие с этими условиями и примите это предложение, подписав и датировав это соглашение не позднее {offer_expiration_date}.</p>\n                    \n                    \n                    <p>Искренне,</p>\n                    <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `genrate_payslip_options`
--

CREATE TABLE `genrate_payslip_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_trackings`
--

CREATE TABLE `goal_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` int(11) NOT NULL,
  `goal_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `rating` varchar(191) DEFAULT NULL,
  `target_achievement` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `progress` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_types`
--

CREATE TABLE `goal_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `occasion` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_types`
--

CREATE TABLE `income_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` int(11) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0,
  `designation` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(191) DEFAULT NULL,
  `customer_experience` int(11) NOT NULL DEFAULT 0,
  `marketing` int(11) NOT NULL DEFAULT 0,
  `administration` int(11) NOT NULL DEFAULT 0,
  `professionalism` int(11) NOT NULL DEFAULT 0,
  `integrity` int(11) NOT NULL DEFAULT 0,
  `attendance` int(11) NOT NULL DEFAULT 0,
  `created_user` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_schedules`
--

CREATE TABLE `interview_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate` int(11) NOT NULL,
  `employee` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `comment` text DEFAULT NULL,
  `employee_response` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_restricts`
--

CREATE TABLE `ip_restricts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `requirement` text DEFAULT NULL,
  `branch` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `skill` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `applicant` varchar(191) DEFAULT NULL,
  `visibility` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `custom_question` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job` int(11) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `resume` varchar(191) DEFAULT NULL,
  `cover_letter` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `stage` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `skill` text DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `is_archive` int(11) NOT NULL DEFAULT 0,
  `custom_question` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_application_notes`
--

CREATE TABLE `job_application_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` int(11) NOT NULL DEFAULT 0,
  `note_created` int(11) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_on_boards`
--

CREATE TABLE `job_on_boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application` int(11) NOT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `job_type` varchar(191) DEFAULT NULL,
  `days_of_week` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `salary_type` varchar(191) DEFAULT NULL,
  `salary_duration` varchar(191) DEFAULT NULL,
  `convert_to_employee` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_stages`
--

CREATE TABLE `job_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_stages`
--

INSERT INTO `job_stages` (`id`, `title`, `order`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Applied', 0, 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(2, 'Phone Screen', 0, 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 'Interview', 0, 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 'Hired', 0, 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 'Rejected', 0, 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(6, 'Termination', 0, 1, '2024-08-28 08:08:55', '2024-08-28 08:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `joining_letters`
--

CREATE TABLE `joining_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `joining_letters`
--

INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<h2 style=\"text-align: center;\"><strong>خطاب الانضمام</strong></h2>\n            <p>{date}</p>\n            <p>{employee_name}</p>\n            <p>{address}</p>\n            <p>الموضوع: موعد لوظيفة {designation}</p>\n            <p>عزيزي {employee_name} ،</p>\n            <p>يسعدنا أن نقدم لك منصب {designation} مع {app_name} \"الشركة\" وفقًا للشروط التالية و</p>\n            <p>الظروف:</p>\n            <p>1. بدء العمل</p>\n            <p>سيصبح عملك ساريًا اعتبارًا من {start_date}</p>\n            <p>2. المسمى الوظيفي</p>\n            <p>سيكون المسمى الوظيفي الخاص بك هو {designation}.</p>\n            <p>3. الراتب</p>\n            <p>سيكون راتبك والمزايا الأخرى على النحو المبين في الجدول 1 ، طيه.</p>\n            <p>4. مكان الإرسال</p>\n            <p>سيتم إرسالك إلى {branch}. ومع ذلك ، قد يُطلب منك العمل في أي مكان عمل تمتلكه الشركة ، أو</p>\n            <p>قد تحصل لاحقًا.</p>\n            <p>5. ساعات العمل</p>\n            <p>أيام العمل العادية هي من الاثنين إلى الجمعة. سيُطلب منك العمل لساعات حسب الضرورة لـ</p>\n            <p>أداء واجباتك على النحو الصحيح تجاه الشركة. ساعات العمل العادية من {start_time} إلى {end_time} وأنت</p>\n            <p>من المتوقع أن يعمل ما لا يقل عن {total_hours} ساعة كل أسبوع ، وإذا لزم الأمر لساعات إضافية اعتمادًا على</p>\n            <p>المسؤوليات.</p>\n            <p>6. الإجازة / العطل</p>\n            <p>6.1 يحق لك الحصول على إجازة غير رسمية مدتها 12 يومًا.</p>\n            <p>6.2 يحق لك الحصول على إجازة مرضية مدفوعة الأجر لمدة 12 يوم عمل.</p>\n            <p>6.3 تخطر الشركة بقائمة الإجازات المعلنة في بداية كل عام.</p>\n            <p>7. طبيعة الواجبات</p>\n            <p>ستقوم بأداء أفضل ما لديك من واجبات متأصلة في منصبك ومهام إضافية مثل الشركة</p>\n            <p>قد يدعوك لأداء ، من وقت لآخر. واجباتك المحددة منصوص عليها في الجدول الثاني بهذه الرسالة.</p>\n            <p>8. ممتلكات الشركة</p>\n            <p>ستحافظ دائمًا على ممتلكات الشركة في حالة جيدة ، والتي قد يتم تكليفك بها للاستخدام الرسمي خلال فترة عملها</p>\n            <p>عملك ، ويجب أن تعيد جميع هذه الممتلكات إلى الشركة قبل التخلي عن الرسوم الخاصة بك ، وإلا فإن التكلفة</p>\n            <p>نفس الشيء سوف تسترده منك الشركة.</p>\n            <p>9. الاقتراض / قبول الهدايا</p>\n            <p>لن تقترض أو تقبل أي أموال أو هدية أو مكافأة أو تعويض مقابل مكاسبك الشخصية من أو تضع نفسك بأي طريقة أخرى</p>\n            <p>بموجب التزام مالي تجاه أي شخص / عميل قد تكون لديك تعاملات رسمية معه.</p>\n            <p>10. الإنهاء</p>\n            <p>10.1 يمكن للشركة إنهاء موعدك ، دون أي سبب ، من خلال إعطائك ما لا يقل عن [إشعار] قبل أشهر</p>\n            <p>إشعار خطي أو راتب بدلاً منه. لغرض هذا البند ، يقصد بالراتب المرتب الأساسي.</p>\n            <p>10.2 إنهاء عملك مع الشركة ، دون أي سبب ، من خلال تقديم ما لا يقل عن إشعار الموظف</p>\n            <p>أشهر الإخطار أو الراتب عن الفترة غير المحفوظة ، المتبقية بعد تعديل الإجازات المعلقة ، كما في التاريخ.</p>\n            <p>10.3 تحتفظ الشركة بالحق في إنهاء عملك بإيجاز دون أي فترة إشعار أو مدفوعات إنهاء</p>\n            <p>إذا كان لديه سبب معقول للاعتقاد بأنك مذنب بسوء السلوك أو الإهمال ، أو ارتكبت أي خرق جوهري لـ</p>\n            <p>العقد ، أو تسبب في أي خسارة للشركة.</p>\n            <p>10. 4 عند إنهاء عملك لأي سبب من الأسباب ، ستعيد إلى الشركة جميع ممتلكاتك ؛ المستندات و</p>\n            <p>الأوراق الأصلية ونسخها ، بما في ذلك أي عينات ، وأدبيات ، وعقود ، وسجلات ، وقوائم ، ورسومات ، ومخططات ،</p>\n            <p>الرسائل والملاحظات والبيانات وما شابه ذلك ؛ والمعلومات السرية التي بحوزتك أو تحت سيطرتك والمتعلقة بك</p>\n            <p>التوظيف أو الشؤون التجارية للعملاء.</p>\n            <p>11. المعلومات السرية</p>\n            <p>11. 1 أثناء عملك في الشركة ، سوف تكرس وقتك واهتمامك ومهارتك كلها بأفضل ما لديك من قدرات</p>\n            <p>عملها. لا يجوز لك ، بشكل مباشر أو غير مباشر ، الانخراط أو الارتباط بنفسك ، أو الارتباط به ، أو القلق ، أو التوظيف ، أو</p>\n            <p>الوقت أو متابعة أي دورة دراسية على الإطلاق ، دون الحصول على إذن مسبق من الشركة أو الانخراط في أي عمل آخر أو</p>\n            <p>الأنشطة أو أي وظيفة أخرى أو العمل بدوام جزئي أو متابعة أي دورة دراسية على الإطلاق ، دون إذن مسبق من</p>\n            <p>شركة.</p>\n            <p>11. المعلومات السرية</p>\n            <p>11. 1 أثناء عملك في الشركة ، سوف تكرس وقتك واهتمامك ومهارتك كلها بأفضل ما لديك من قدرات</p>\n            <p>عملها. لا يجوز لك ، بشكل مباشر أو غير مباشر ، الانخراط أو الارتباط بنفسك ، أو الارتباط به ، أو القلق ، أو التوظيف ، أو</p>\n            <p>الوقت أو متابعة أي دورة دراسية على الإطلاق ، دون الحصول على إذن مسبق من الشركة أو الانخراط في أي عمل آخر أو</p>\n            <p>الأنشطة أو أي وظيفة أخرى أو العمل بدوام جزئي أو متابعة أي دورة دراسية على الإطلاق ، دون إذن مسبق من</p>\n            <p>شركة.</p>\n            <p>11.2 يجب عليك دائمًا الحفاظ على أعلى درجة من السرية والحفاظ على سرية السجلات والوثائق وغيرها</p>\n            <p>المعلومات السرية المتعلقة بأعمال الشركة والتي قد تكون معروفة لك أو مخولة لك بأي وسيلة</p>\n            <p>ولن تستخدم هذه السجلات والمستندات والمعلومات إلا بالطريقة المصرح بها حسب الأصول لصالح الشركة. إلى عن على</p>\n            <p>أغراض هذا البند \"المعلومات السرية\" تعني المعلومات المتعلقة بأعمال الشركة وعملائها</p>\n            <p>التي لا تتوفر لعامة الناس والتي قد تتعلمها أثناء عملك. هذا يشمل،</p>\n            <p>على سبيل المثال لا الحصر ، المعلومات المتعلقة بالمنظمة وقوائم العملاء وسياسات التوظيف والموظفين والمعلومات</p>\n            <p>حول منتجات الشركة وعملياتها بما في ذلك الأفكار والمفاهيم والإسقاطات والتكنولوجيا والكتيبات والرسم والتصاميم ،</p>\n            <p>المواصفات وجميع الأوراق والسير الذاتية والسجلات والمستندات الأخرى التي تحتوي على هذه المعلومات السرية.</p>\n            <p>11.3 لن تقوم في أي وقت بإزالة أي معلومات سرية من المكتب دون إذن.</p>\n            \n            <p>11.4 واجبك في الحماية وعدم الإفشاء</p>\n            \n            <p>تظل المعلومات السرية سارية بعد انتهاء أو إنهاء هذه الاتفاقية و / أو عملك مع الشركة.</p>\n            \n            <p>11.5 سوف يجعلك خرق شروط هذا البند عرضة للفصل بإجراءات موجزة بموجب الفقرة أعلاه بالإضافة إلى أي</p>\n            \n            <p>أي تعويض آخر قد يكون للشركة ضدك في القانون.</p>\n            \n            <p>12. الإخطارات</p>\n            \n            <p>يجوز لك إرسال إخطارات إلى الشركة على عنوان مكتبها المسجل. يمكن أن ترسل لك الشركة إشعارات على</p>\n            \n            <p>العنوان الذي أشرت إليه في السجلات الرسمية.</p>\n            \n            \n            \n            <p>13. تطبيق سياسة الشركة</p>\n            \n            <p>يحق للشركة تقديم إعلانات السياسة من وقت لآخر فيما يتعلق بمسائل مثل استحقاق الإجازة والأمومة</p>\n            \n            <p>الإجازة ، ومزايا الموظفين ، وساعات العمل ، وسياسات النقل ، وما إلى ذلك ، ويمكن تغييرها من وقت لآخر وفقًا لتقديرها الخاص.</p>\n            \n            <p>جميع قرارات سياسة الشركة هذه ملزمة لك ويجب أن تلغي هذه الاتفاقية إلى هذا الحد.</p>\n            \n            \n            \n            <p>14. القانون الحاكم / الاختصاص القضائي</p>\n            \n            <p>يخضع عملك في الشركة لقوانين الدولة. تخضع جميع النزاعات للاختصاص القضائي للمحكمة العليا</p>\n            \n            <p>غوجارات فقط.</p>\n            \n            \n            \n            <p>15. قبول عرضنا</p>\n            \n            <p>يرجى تأكيد قبولك لعقد العمل هذا من خلال التوقيع وإعادة النسخة المكررة.</p>\n            \n            \n            \n            <p>نرحب بكم ونتطلع إلى تلقي موافقتكم والعمل معكم.</p>\n            \n            \n            \n            <p>تفضلوا بقبول فائق الاحترام،</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(2, 'da', '<h3 style=\"text-align: center;\"><strong>Tilslutningsbrev</strong></h3>\n            \n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{address}</p>\n            \n            <p>Emne: Udn&aelig;vnelse til stillingen som {designation}</p>\n            \n            \n            \n            \n            \n            \n            \n            <p>K&aelig;re {employee_name}</p>\n            \n            \n            \n            <p>Vi er glade for at kunne tilbyde dig stillingen som {designation} hos {app_name} \"Virksomheden\" p&aring; f&oslash;lgende vilk&aring;r og</p>\n            \n            <p>betingelser:</p>\n            \n            \n            <p>1. P&aring;begyndelse af ans&aelig;ttelse</p>\n            \n            <p>Din ans&aelig;ttelse tr&aelig;der i kraft fra {start_date}</p>\n            \n            \n            \n            <p>2. Jobtitel</p>\n            \n            \n            <p>Din jobtitel vil v&aelig;re {designation}.</p>\n            \n            \n            \n            <p>3. L&oslash;n</p>\n            \n            <p>Din l&oslash;n og andre goder vil v&aelig;re som angivet i skema 1, hertil.</p>\n            \n            \n            \n            <p>4. Udstationeringssted</p>\n            \n            <p>Du vil blive sl&aring;et op p&aring; {branch}. Du kan dog blive bedt om at arbejde p&aring; ethvert forretningssted, som virksomheden har, eller</p>\n            \n            <p>senere kan erhverve.</p>\n            \n            \n            <p>5. Arbejdstimer</p>\n            \n            <p>De normale arbejdsdage er mandag til fredag. Du vil blive forpligtet til at arbejde i de timer, som er n&oslash;dvendige for</p>\n            \n            <p>beh&oslash;rig varetagelse af dine pligter over for virksomheden. Den normale arbejdstid er fra {start_time} til {end_time}, og det er du</p>\n            \n            <p>forventes at arbejde ikke mindre end {total_hours} timer hver uge, og om n&oslash;dvendigt yderligere timer afh&aelig;ngigt af din</p>\n            \n            <p>ansvar.</p>\n            \n            \n            \n            <p>6. Orlov/Ferie</p>\n            \n            <p>6.1 Du har ret til tilf&aelig;ldig ferie p&aring; 12 dage.</p>\n            \n            <p>6.2 Du har ret til 12 arbejdsdages sygefrav&aelig;r med l&oslash;n.</p>\n            \n            <p>6.3 Virksomheden skal meddele en liste over erkl&aelig;rede helligdage i begyndelsen af ​​hvert &aring;r.</p>\n            \n            \n            \n            <p>7. Arbejdsopgavernes art</p>\n            \n            <p>Du vil efter bedste evne udf&oslash;re alle de opgaver, der er iboende i din stilling og s&aring;danne yderligere opgaver som virksomheden</p>\n            \n            <p>kan opfordre dig til at optr&aelig;de, fra tid til anden. Dine specifikke pligter er beskrevet i skema II hertil.</p>\n            \n            \n            <p>8. Firmaejendom</p>\n            \n            <p>Du vil altid vedligeholde virksomhedens ejendom i god stand, som kan blive overdraget til dig til officiel brug i l&oslash;bet af</p>\n            \n            <p>din ans&aelig;ttelse, og skal returnere al s&aring;dan ejendom til virksomheden, f&oslash;r du opgiver din afgift, i modsat fald vil omkostningerne</p>\n            \n            <p>af samme vil blive inddrevet fra dig af virksomheden.</p>\n            \n            \n            \n            <p>9. L&aring;n/modtagelse af gaver</p>\n            \n            <p>Du vil ikke l&aring;ne eller acceptere nogen penge, gave, bel&oslash;nning eller kompensation for dine personlige gevinster fra eller p&aring; anden m&aring;de placere dig selv</p>\n            \n            <p>under en &oslash;konomisk forpligtelse over for enhver person/kunde, som du m&aring;tte have officielle forbindelser med.</p>\n            \n            <p>10. Opsigelse</p>\n            \n            <p>10.1 Din ans&aelig;ttelse kan opsiges af virksomheden uden nogen grund ved at give dig mindst [varsel] m&aring;neder f&oslash;r</p>\n            \n            <p>skriftligt varsel eller l&oslash;n i stedet herfor. Ved l&oslash;n forst&aring;s i denne paragraf grundl&oslash;n.</p>\n            \n            <p>10.2 Du kan opsige dit ans&aelig;ttelsesforhold i virksomheden uden nogen grund ved at give mindst [Medarbejdermeddelelse]</p>\n            \n            <p>m&aring;neders forudg&aring;ende varsel eller l&oslash;n for den ikke-opsparede periode, tilbage efter regulering af afventende orlov, som p&aring; dato.</p>\n            \n            <p>10.3 Virksomheden forbeholder sig retten til at opsige dit ans&aelig;ttelsesforhold midlertidigt uden opsigelsesfrist eller opsigelsesbetaling</p>\n            \n            <p>hvis den har rimelig grund til at tro, at du er skyldig i forseelse eller uagtsomhed, eller har beg&aring;et et grundl&aelig;ggende brud p&aring;</p>\n            \n            <p>kontrakt, eller for&aring;rsaget tab for virksomheden.</p>\n            \n            <p>10. 4 Ved oph&oslash;r af din ans&aelig;ttelse uanset &aring;rsag, vil du returnere al ejendom til virksomheden; dokumenter, og</p>\n            \n            <p>papir, b&aring;de originale og kopier heraf, inklusive pr&oslash;ver, litteratur, kontrakter, optegnelser, lister, tegninger, tegninger,</p>\n            \n            <p>breve, notater, data og lignende; og fortrolige oplysninger, i din besiddelse eller under din kontrol vedr&oslash;rende din</p>\n            \n            <p>ans&aelig;ttelse eller til kunders forretningsforhold.</p>\n            <p>11. Fortrolige oplysninger</p>\n            \n            <p>11. 1 Under din ans&aelig;ttelse i virksomheden vil du bruge al din tid, opm&aelig;rksomhed og dygtighed efter bedste evne til</p>\n            \n            <p>sin virksomhed. Du m&aring; ikke, direkte eller indirekte, engagere eller associere dig med, v&aelig;re forbundet med, bekymret, ansat eller</p>\n            \n            <p>tid eller forf&oslash;lge et hvilket som helst studieforl&oslash;b uden forudg&aring;ende tilladelse fra virksomheden. involveret i anden virksomhed eller</p>\n            \n            <p>aktiviteter eller enhver anden stilling eller arbejde p&aring; deltid eller forf&oslash;lge ethvert studieforl&oslash;b uden forudg&aring;ende tilladelse fra</p>\n            \n            <p>Selskab.</p>\n            <p>11.2 Du skal altid opretholde den h&oslash;jeste grad af fortrolighed og opbevare optegnelser, dokumenter og andre fortrolige oplysninger.</p>\n            \n            <p>Fortrolige oplysninger vedr&oslash;rende virksomhedens virksomhed, som kan v&aelig;re kendt af dig eller betroet dig p&aring; nogen m&aring;de</p>\n            \n            <p>og du vil kun bruge s&aring;danne optegnelser, dokumenter og oplysninger p&aring; en beh&oslash;rigt autoriseret m&aring;de i virksomhedens interesse. Til</p>\n            \n            <p>form&aring;lene med denne paragraf \"Fortrolige oplysninger\" betyder oplysninger om virksomhedens og dets kunders forretning</p>\n            \n            <p>som ikke er tilg&aelig;ngelig for offentligheden, og som du kan l&aelig;re i l&oslash;bet af din ans&aelig;ttelse. Dette inkluderer,</p>\n            \n            <p>men er ikke begr&aelig;nset til information vedr&oslash;rende organisationen, dens kundelister, ans&aelig;ttelsespolitikker, personale og information</p>\n            \n            <p>om virksomhedens produkter, processer, herunder ideer, koncepter, projektioner, teknologi, manualer, tegning, design,</p>\n            \n            <p>specifikationer og alle papirer, CVer, optegnelser og andre dokumenter, der indeholder s&aring;danne fortrolige oplysninger.</p>\n            \n            <p>11.3 Du vil p&aring; intet tidspunkt fjerne fortrolige oplysninger fra kontoret uden tilladelse.</p>\n            \n            <p>11.4 Din pligt til at beskytte og ikke oplyse</p>\n            \n            <p>e Fortrolige oplysninger vil overleve udl&oslash;bet eller opsigelsen af ​​denne aftale og/eller din ans&aelig;ttelse hos virksomheden.</p>\n            \n            <p>11.5 Overtr&aelig;delse af betingelserne i denne klausul vil g&oslash;re dig ansvarlig for midlertidig afskedigelse i henhold til klausulen ovenfor ud over evt.</p>\n            \n            <p>andre retsmidler, som virksomheden m&aring;tte have mod dig i henhold til loven.</p>\n            <p>12. Meddelelser</p>\n            \n            <p>Meddelelser kan gives af dig til virksomheden p&aring; dets registrerede kontoradresse. Meddelelser kan gives af virksomheden til dig p&aring;</p>\n            \n            <p>den adresse, du har angivet i de officielle optegnelser.</p>\n            \n            \n            \n            <p>13. Anvendelse af virksomhedens politik</p>\n            \n            <p>Virksomheden er berettiget til fra tid til anden at afgive politiske erkl&aelig;ringer vedr&oslash;rende sager som ret til orlov, barsel</p>\n            \n            <p>orlov, ansattes ydelser, arbejdstider, overf&oslash;rselspolitikker osv., og kan &aelig;ndre det samme fra tid til anden efter eget sk&oslash;n.</p>\n            \n            <p>Alle s&aring;danne politiske beslutninger fra virksomheden er bindende for dig og tilsides&aelig;tter denne aftale i det omfang.</p>\n            \n            \n            \n            <p>14. G&aelig;ldende lov/Jurisdiktion</p>\n            \n            <p>Din ans&aelig;ttelse hos virksomheden er underlagt landets love. Alle tvister er underlagt High Courts jurisdiktion</p>\n            \n            <p>Kun Gujarat.</p>\n            \n            \n            \n            <p>15. Accept af vores tilbud</p>\n            \n            <p>Bekr&aelig;ft venligst din accept af denne ans&aelig;ttelseskontrakt ved at underskrive og returnere kopien.</p>\n            \n            \n            \n            <p>Vi byder dig velkommen og ser frem til at modtage din accept og til at arbejde sammen med dig.</p>\n            \n            \n            \n            <p>Venlig hilsen,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 'de', '<h3 style=\"text-align: center;\"><strong>Beitrittsbrief</strong></h3>\n            \n            <p>{date}</p>\n            <p>{employee_name}</p>\n            <p>{address}</p>\n            \n            \n            \n            <p>Betreff: Ernennung f&uuml;r die Stelle von {designation}</p>\n            \n            \n            \n            \n            \n            \n            \n            <p>Sehr geehrter {employee_name},</p>\n            \n            \n            \n            <p>Wir freuen uns, Ihnen die Position von {designation} bei {app_name} dem &bdquo;Unternehmen&ldquo; zu den folgenden Bedingungen anbieten zu k&ouml;nnen</p>\n            \n            <p>Bedingungen:</p>\n            \n            \n            <p>1. Aufnahme des Arbeitsverh&auml;ltnisses</p>\n            \n            <p>Ihre Anstellung gilt ab dem {start_date}</p>\n            \n            \n            <p>2. Berufsbezeichnung</p>\n            \n            <p>Ihre Berufsbezeichnung lautet {designation}.</p>\n            \n            \n            <p>3. Gehalt</p>\n            \n            <p>Ihr Gehalt und andere Leistungen sind in Anhang 1 zu diesem Dokument aufgef&uuml;hrt.</p>\n            \n            \n            <p>4. Postort</p>\n            \n            <p>Sie werden bei {branch} eingestellt. Es kann jedoch erforderlich sein, dass Sie an jedem Gesch&auml;ftssitz arbeiten, den das Unternehmen hat, oder</p>\n            \n            <p>sp&auml;ter erwerben kann.</p>\n            \n            \n            <p>5. Arbeitszeit</p>\n            <p>Die normalen Arbeitstage sind Montag bis Freitag. Sie m&uuml;ssen so viele Stunden arbeiten, wie es f&uuml;r die erforderlich ist</p>\n            <p>ordnungsgem&auml;&szlig;e Erf&uuml;llung Ihrer Pflichten gegen&uuml;ber dem Unternehmen. Die normalen Arbeitszeiten sind von {start_time} bis {end_time} und Sie sind es</p>\n            <p>voraussichtlich nicht weniger als {total_hours} Stunden pro Woche arbeiten, und falls erforderlich, abh&auml;ngig von Ihren zus&auml;tzlichen Stunden</p>\n            <p>Verantwortlichkeiten.</p>\n            \n            \n            \n            <p>6. Urlaub/Urlaub</p>\n            \n            <p>6.1 Sie haben Anspruch auf Freizeiturlaub von 12 Tagen.</p>\n            \n            <p>6.2 Sie haben Anspruch auf 12 Arbeitstage bezahlten Krankenurlaub.</p>\n            \n            <p>6.3 Das Unternehmen teilt zu Beginn jedes Jahres eine Liste der erkl&auml;rten Feiertage mit.</p>\n            \n            \n            \n            <p>7. Art der Pflichten</p>\n            \n            <p>Sie werden alle Aufgaben, die mit Ihrer Funktion verbunden sind, sowie alle zus&auml;tzlichen Aufgaben als Unternehmen nach besten Kr&auml;ften erf&uuml;llen</p>\n            \n            <p>kann Sie von Zeit zu Zeit zur Leistung auffordern. Ihre spezifischen Pflichten sind in Anhang II zu diesem Dokument aufgef&uuml;hrt.</p>\n            \n            \n            \n            <p>8. Firmeneigentum</p>\n            \n            <p>Sie werden das Firmeneigentum, das Ihnen im Laufe der Zeit f&uuml;r offizielle Zwecke anvertraut werden kann, stets in gutem Zustand halten</p>\n            \n            <p>Ihrer Anstellung und muss all dieses Eigentum an das Unternehmen zur&uuml;ckgeben, bevor Sie Ihre Geb&uuml;hr aufgeben, andernfalls die Kosten</p>\n            \n            <p>derselben werden von der Gesellschaft von Ihnen zur&uuml;ckgefordert.</p>\n            \n            \n            \n            <p>9. Leihen/Annehmen von Geschenken</p>\n            \n            <p>Sie werden kein Geld, Geschenk, keine Belohnung oder Entsch&auml;digung f&uuml;r Ihre pers&ouml;nlichen Gewinne von sich leihen oder annehmen oder sich anderweitig platzieren</p>\n            \n            <p>unter finanzieller Verpflichtung gegen&uuml;ber Personen/Kunden, mit denen Sie m&ouml;glicherweise dienstliche Beziehungen unterhalten.</p>\n            \n            <p>10. K&uuml;ndigung</p>\n            \n            <p>10.1 Ihre Ernennung kann vom Unternehmen ohne Angabe von Gr&uuml;nden gek&uuml;ndigt werden, indem es Ihnen mindestens [K&uuml;ndigung] Monate im Voraus mitteilt</p>\n            \n            <p>schriftliche K&uuml;ndigung oder Gehalt statt dessen. Gehalt im Sinne dieser Klausel bedeutet Grundgehalt.</p>\n            \n            <p>10.2 Sie k&ouml;nnen Ihre Anstellung beim Unternehmen ohne Angabe von Gr&uuml;nden k&uuml;ndigen, indem Sie mindestens [Mitarbeitermitteilung]</p>\n            \n            <p>K&uuml;ndigungsfrist von Monaten oder Gehalt f&uuml;r den nicht angesparten Zeitraum, der nach Anpassung der anstehenden Urlaubstage &uuml;brig bleibt, zum Stichtag.</p>\n            \n            <p>10.3 Das Unternehmen beh&auml;lt sich das Recht vor, Ihr Arbeitsverh&auml;ltnis ohne K&uuml;ndigungsfrist oder Abfindungszahlung fristlos zu k&uuml;ndigen</p>\n            \n            <p>wenn es begr&uuml;ndeten Anlass zu der Annahme gibt, dass Sie sich eines Fehlverhaltens oder einer Fahrl&auml;ssigkeit schuldig gemacht haben oder einen wesentlichen Versto&szlig; begangen haben</p>\n            \n            <p>oder dem Unternehmen Verluste verursacht haben.</p>\n            \n            <p>10. 4 Bei Beendigung Ihres Besch&auml;ftigungsverh&auml;ltnisses, aus welchem ​​Grund auch immer, werden Sie s&auml;mtliches Eigentum an das Unternehmen zur&uuml;ckgeben; Dokumente und</p>\n            \n            <p>Papier, sowohl Original als auch Kopien davon, einschlie&szlig;lich aller Muster, Literatur, Vertr&auml;ge, Aufzeichnungen, Listen, Zeichnungen, Blaupausen,</p>\n            \n            <p>Briefe, Notizen, Daten und dergleichen; und vertrauliche Informationen, die sich in Ihrem Besitz oder unter Ihrer Kontrolle befinden und sich auf Sie beziehen</p>\n            \n            <p>Besch&auml;ftigung oder f&uuml;r die gesch&auml;ftlichen Angelegenheiten der Kunden.</p>\n            \n            <p>11. Confidential Information</p>\n            \n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\n            \n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\n            \n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\n            \n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\n            \n            <p>Company.</p>\n            \n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other&nbsp;</p>\n            \n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\n            \n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\n            \n            <p>the purposes of this clause &lsquo;Confidential Information&rsquo; means information about the Company&rsquo;s business and that of its customers</p>\n            \n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\n            \n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\n            \n            <p>about the Company&rsquo;s products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,&nbsp;</p>\n            \n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\n            \n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\n            \n            <p>11.4 Your duty to safeguard and not disclos</p>\n            \n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\n            \n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\n            \n            <p>other remedy the Company may have against you in law.</p>\n            <p>12. Notices</p>\n            \n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\n            \n            <p>the address intimated by you in the official records.</p>\n            \n            \n            \n            <p>13. Applicability of Company Policy</p>\n            \n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\n            \n            <p>leave, employees&rsquo; benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\n            \n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that&nbsp; extent.</p>\n            \n            \n            \n            <p>14. Governing Law/Jurisdiction</p>\n            \n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\n            \n            <p>Gujarat only.</p>\n            \n            \n            \n            <p>15. Acceptance of our offer</p>\n            \n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\n            \n            \n            \n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\n            \n            \n            \n            <p>Yours Sincerely,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 'en', '<h3 style=\"text-align: center;\">Joining Letter</h3>\n            <p>{date}</p>\n            <p>{employee_name}</p>\n            <p>{address}</p>\n            <p>Subject: Appointment for the post of {designation}</p>\n            <p>Dear {employee_name},</p>\n            <p>We are pleased to offer you the position of {designation} with {app_name} theCompany on the following terms and</p>\n            <p>conditions:</p>\n            <p>1. Commencement of employment</p>\n            <p>Your employment will be effective, as of {start_date}</p>\n            <p>2. Job title</p>\n            <p>Your job title will be{designation}.</p>\n            <p>3. Salary</p>\n            <p>Your salary and other benefits will be as set out in Schedule 1, hereto.</p>\n            <p>4. Place of posting</p>\n            <p>You will be posted at {branch}. You may however be required to work at any place of business which the Company has, or</p>\n            <p>may later acquire.</p>\n            <p>5. Hours of Work</p>\n            <p>The normal working days are Monday through Friday. You will be required to work for such hours as necessary for the</p>\n            <p>proper discharge of your duties to the Company. The normal working hours are from {start_time} to {end_time} and you are</p>\n            <p>expected to work not less than {total_hours} hours each week, and if necessary for additional hours depending on your</p>\n            <p>responsibilities.</p>\n            <p>6. Leave/Holidays</p>\n            <p>6.1 You are entitled to casual leave of 12 days.</p>\n            <p>6.2 You are entitled to 12 working days of paid sick leave.</p>\n            <p>6.3 The Company shall notify a list of declared holidays at the beginning of each year.</p>\n            <p>7. Nature of duties</p>\n            <p>You will perform to the best of your ability all the duties as are inherent in your post and such additional duties as the company</p>\n            <p>may call upon you to perform, from time to time. Your specific duties are set out in Schedule II hereto.</p>\n            <p>8. Company property</p>\n            <p>You will always maintain in good condition Company property, which may be entrusted to you for official use during the course of</p>\n            <p>your employment, and shall return all such property to the Company prior to relinquishment of your charge, failing which the cost</p>\n            <p>of the same will be recovered from you by the Company.</p>\n            <p>9. Borrowing/accepting gifts</p>\n            <p>You will not borrow or accept any money, gift, reward, or compensation for your personal gains from or otherwise place yourself</p>\n            <p>under pecuniary obligation to any person/client with whom you may be having official dealings.</p>\n            <p>10. Termination</p>\n            <p>10.1 Your appointment can be terminated by the Company, without any reason, by giving you not less than [Notice] months prior</p>\n            <p>notice in writing or salary in lieu thereof. For the purpose of this clause, salary shall mean basic salary.</p>\n            <p>10.2 You may terminate your employment with the Company, without any cause, by giving no less than [Employee Notice]</p>\n            <p>months prior notice or salary for the unsaved period, left after adjustment of pending leaves, as on date.</p>\n            <p>10.3 The Company reserves the right to terminate your employment summarily without any notice period or termination payment</p>\n            <p>if it has reasonable ground to believe you are guilty of misconduct or negligence, or have committed any fundamental breach of</p>\n            <p>contract, or caused any loss to the Company.</p>\n            <p>10. 4 On the termination of your employment for whatever reason, you will return to the Company all property; documents, and</p>\n            <p>paper, both original and copies thereof, including any samples, literature, contracts, records, lists, drawings, blueprints,</p>\n            <p>letters, notes, data and the like; and Confidential Information, in your possession or under your control relating to your</p>\n            <p>employment or to clients business affairs.</p>\n            <p>11. Confidential Information</p>\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\n            <p>Company.</p>\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other</p>\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\n            <p>the purposes of this clauseConfidential Information means information about the Companys business and that of its customers</p>\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\n            <p>about the Companys products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,</p>\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\n            <p>11.4 Your duty to safeguard and not disclos</p>\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\n            <p>other remedy the Company may have against you in law.</p>\n            <p>12. Notices</p>\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\n            <p>the address intimated by you in the official records.</p>\n            <p>13. Applicability of Company Policy</p>\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\n            <p>leave, employees benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that extent.</p>\n            <p>14. Governing Law/Jurisdiction</p>\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\n            <p>Gujarat only.</p>\n            <p>15. Acceptance of our offer</p>\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\n            <p>Yours Sincerely,</p>\n            <p>{app_name}</p>\n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 'es', '<h3 style=\"text-align: center;\"><strong>Carta de uni&oacute;n</strong></h3>\n            \n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{address}</p>\n            \n            \n            \n            <p>Asunto: Nombramiento para el puesto de {designation}</p>\n            \n            \n            \n            <p>Estimado {employee_name},</p>\n            \n            <p>Nos complace ofrecerle el puesto de {designation} con {app_name}, la Compa&ntilde;&iacute;a en los siguientes t&eacute;rminos y</p>\n            \n            <p>condiciones:</p>\n            \n            \n            <p>1. Comienzo del empleo</p>\n            \n            <p>Su empleo ser&aacute; efectivo a partir del {start_date}</p>\n            \n            \n            <p>2. T&iacute;tulo del trabajo</p>\n            <p>El t&iacute;tulo de su trabajo ser&aacute; {designation}.</p>\n            \n            <p>3. Salario</p>\n            \n            <p>Su salario y otros beneficios ser&aacute;n los establecidos en el Anexo 1 del presente.</p>\n            \n            \n            <p>4. Lugar de destino</p>\n            <p>Se le publicar&aacute; en {branch}. Sin embargo, es posible que deba trabajar en cualquier lugar de negocios que tenga la Compa&ntilde;&iacute;a, o</p>\n            \n            <p>puede adquirir posteriormente.</p>\n            \n            \n            \n            <p>5. Horas de trabajo</p>\n            \n            <p>Los d&iacute;as normales de trabajo son de lunes a viernes. Se le pedir&aacute; que trabaje las horas que sean necesarias para el</p>\n            \n            <p>cumplimiento adecuado de sus deberes para con la Compa&ntilde;&iacute;a. El horario normal de trabajo es de {start_time} a {end_time} y usted est&aacute;</p>\n            \n            <p>se espera que trabaje no menos de {total_hours} horas cada semana y, si es necesario, horas adicionales dependiendo de su</p>\n            \n            <p>responsabilidades.</p>\n            \n            \n            \n            <p>6. Licencia/Vacaciones</p>\n            \n            <p>6.1 Tiene derecho a un permiso eventual de 12 d&iacute;as.</p>\n            \n            <p>6.2 Tiene derecho a 12 d&iacute;as laborables de baja por enfermedad remunerada.</p>\n            \n            <p>6.3 La Compa&ntilde;&iacute;a deber&aacute; notificar una lista de d&iacute;as festivos declarados al comienzo de cada a&ntilde;o.</p>\n            \n            \n            \n            <p>7. Naturaleza de los deberes</p>\n            \n            <p>Desempe&ntilde;ar&aacute; lo mejor que pueda todas las funciones inherentes a su puesto y aquellas funciones adicionales que la empresa</p>\n            \n            <p>puede pedirte que act&uacute;es, de vez en cuando. Sus deberes espec&iacute;ficos se establecen en el Anexo II del presente.</p>\n            \n            \n            \n            <p>8. Propiedad de la empresa</p>\n            \n            <p>Siempre mantendr&aacute; en buenas condiciones la propiedad de la Compa&ntilde;&iacute;a, que se le puede confiar para uso oficial durante el curso de</p>\n            \n            <p>su empleo, y devolver&aacute; todos esos bienes a la Compa&ntilde;&iacute;a antes de renunciar a su cargo, en caso contrario, el costo</p>\n            \n            <p>de la misma ser&aacute; recuperada de usted por la Compa&ntilde;&iacute;a.</p>\n            \n            \n            \n            <p>9. Tomar prestado/aceptar regalos</p>\n            \n            <p>No pedir&aacute; prestado ni aceptar&aacute; dinero, obsequios, recompensas o compensaciones por sus ganancias personales o se colocar&aacute; de otra manera</p>\n            \n            <p>bajo obligaci&oacute;n pecuniaria a cualquier persona/cliente con quien pueda tener tratos oficiales.</p>\n            <p>10. Terminaci&oacute;n</p>\n            \n            <p>10.1 Su nombramiento puede ser rescindido por la Compa&ntilde;&iacute;a, sin ning&uacute;n motivo, al darle no menos de [Aviso] meses antes</p>\n            \n            <p>aviso por escrito o salario en su lugar. Para los efectos de esta cl&aacute;usula, se entender&aacute; por salario el salario base.</p>\n            \n            <p>10.2 Puede rescindir su empleo con la Compa&ntilde;&iacute;a, sin ninguna causa, dando no menos de [Aviso al empleado]</p>\n            \n            <p>meses de preaviso o salario por el per&iacute;odo no ahorrado, remanente despu&eacute;s del ajuste de licencias pendientes, a la fecha.</p>\n            \n            <p>10.3 La Compa&ntilde;&iacute;a se reserva el derecho de rescindir su empleo sumariamente sin ning&uacute;n per&iacute;odo de preaviso o pago por rescisi&oacute;n</p>\n            \n            <p>si tiene motivos razonables para creer que usted es culpable de mala conducta o negligencia, o ha cometido una violaci&oacute;n fundamental de</p>\n            \n            <p>contrato, o causado cualquier p&eacute;rdida a la Compa&ntilde;&iacute;a.</p>\n            \n            <p>10. 4 A la terminaci&oacute;n de su empleo por cualquier motivo, devolver&aacute; a la Compa&ntilde;&iacute;a todos los bienes; documentos, y</p>\n            \n            <p>papel, tanto en original como en copia del mismo, incluyendo cualquier muestra, literatura, contratos, registros, listas, dibujos, planos,</p>\n            \n            <p>cartas, notas, datos y similares; e Informaci&oacute;n confidencial, en su posesi&oacute;n o bajo su control en relaci&oacute;n con su</p>\n            \n            <p>empleo o a los asuntos comerciales de los clientes.</p>\n            <p>11. Informaci&oacute;n confidencial</p>\n            \n            <p>11. 1 Durante su empleo en la Compa&ntilde;&iacute;a, dedicar&aacute; todo su tiempo, atenci&oacute;n y habilidad lo mejor que pueda para</p>\n            \n            <p>son negocios. Usted no deber&aacute;, directa o indirectamente, comprometerse o asociarse con, estar conectado, interesado, empleado o</p>\n            \n            <p>tiempo o seguir cualquier curso de estudio, sin el permiso previo de la Compa&ntilde;&iacute;a. participar en cualquier otro negocio o</p>\n            \n            <p>actividades o cualquier otro puesto o trabajo a tiempo parcial o seguir cualquier curso de estudio, sin el permiso previo de la</p>\n            \n            <p>Compa&ntilde;&iacute;a.</p>\n            \n            <p>11.2 Siempre debe mantener el m&aacute;s alto grado de confidencialidad y mantener como confidenciales los registros, documentos y otros</p>\n            \n            <p>Informaci&oacute;n confidencial relacionada con el negocio de la Compa&ntilde;&iacute;a que usted pueda conocer o confiarle por cualquier medio</p>\n            \n            <p>y utilizar&aacute; dichos registros, documentos e informaci&oacute;n solo de manera debidamente autorizada en inter&eacute;s de la Compa&ntilde;&iacute;a. Para</p>\n            \n            <p>A los efectos de esta cl&aacute;usula, \"Informaci&oacute;n confidencial\" significa informaci&oacute;n sobre el negocio de la Compa&ntilde;&iacute;a y el de sus clientes.</p>\n            \n            <p>que no est&aacute; disponible para el p&uacute;blico en general y que usted puede aprender en el curso de su empleo. Esto incluye,</p>\n            \n            <p>pero no se limita a, informaci&oacute;n relacionada con la organizaci&oacute;n, sus listas de clientes, pol&iacute;ticas de empleo, personal e informaci&oacute;n</p>\n            \n            <p>sobre los productos de la Compa&ntilde;&iacute;a, procesos que incluyen ideas, conceptos, proyecciones, tecnolog&iacute;a, manuales, dibujos, dise&ntilde;os,</p>\n            \n            <p>especificaciones, y todos los papeles, curr&iacute;culos, registros y otros documentos que contengan dicha Informaci&oacute;n Confidencial.</p>\n            \n            <p>11.3 En ning&uacute;n momento, sacar&aacute; ninguna Informaci&oacute;n Confidencial de la oficina sin permiso.</p>\n            \n            <p>11.4 Su deber de salvaguardar y no divulgar</p>\n            \n            <p>La Informaci&oacute;n Confidencial sobrevivir&aacute; a la expiraci&oacute;n o terminaci&oacute;n de este Acuerdo y/o su empleo con la Compa&ntilde;&iacute;a.</p>\n            \n            <p>11.5 El incumplimiento de las condiciones de esta cl&aacute;usula le har&aacute; pasible de despido sumario en virtud de la cl&aacute;usula anterior adem&aacute;s de cualquier</p>\n            \n            <p>otro recurso que la Compa&ntilde;&iacute;a pueda tener contra usted por ley.</p>\n            <p>12. Avisos</p>\n            \n            <p>Usted puede enviar notificaciones a la Compa&ntilde;&iacute;a a su domicilio social. La Compa&ntilde;&iacute;a puede enviarle notificaciones a usted en</p>\n            \n            <p>la direcci&oacute;n indicada por usted en los registros oficiales.</p>\n            \n            \n            \n            <p>13. Aplicabilidad de la pol&iacute;tica de la empresa</p>\n            \n            <p>La Compa&ntilde;&iacute;a tendr&aacute; derecho a hacer declaraciones de pol&iacute;tica de vez en cuando relacionadas con asuntos como el derecho a licencia, maternidad</p>\n            \n            <p>licencia, beneficios de los empleados, horas de trabajo, pol&iacute;ticas de transferencia, etc., y puede modificarlas de vez en cuando a su sola discreci&oacute;n.</p>\n            \n            <p>Todas las decisiones pol&iacute;ticas de la Compa&ntilde;&iacute;a ser&aacute;n vinculantes para usted y anular&aacute;n este Acuerdo en esa medida.</p>\n            \n            \n            \n            <p>14. Ley aplicable/Jurisdicci&oacute;n</p>\n            \n            <p>Su empleo con la Compa&ntilde;&iacute;a est&aacute; sujeto a las leyes del Pa&iacute;s. Todas las disputas estar&aacute;n sujetas a la jurisdicci&oacute;n del Tribunal Superior</p>\n            \n            <p>S&oacute;lo Gujarat.</p>\n            \n            \n            \n            <p>15. Aceptaci&oacute;n de nuestra oferta</p>\n            \n            <p>Por favor, confirme su aceptaci&oacute;n de este Contrato de Empleo firmando y devolviendo el duplicado.</p>\n            \n            \n            \n            <p>Le damos la bienvenida y esperamos recibir su aceptaci&oacute;n y trabajar con usted.</p>\n            \n            \n            \n            <p>Tuyo sinceramente,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>\n            ', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');
INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(6, 'fr', '<h3 style=\"text-align: center;\">Lettre dadh&eacute;sion</h3>\n            \n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            <p>{address}</p>\n            \n            \n            <p>Objet : Nomination pour le poste de {designation}</p>\n            \n            \n            \n            <p>Cher {employee_name},</p>\n            \n            \n            <p>Nous sommes heureux de vous proposer le poste de {designation} avec {app_name} la \"Soci&eacute;t&eacute;\" selon les conditions suivantes et</p>\n            \n            <p>les conditions:</p>\n            \n            <p>1. Entr&eacute;e en fonction</p>\n            \n            <p>Votre emploi sera effectif &agrave; partir du {start_date}</p>\n            \n            \n            \n            <p>2. Intitul&eacute; du poste</p>\n            \n            <p>Votre titre de poste sera {designation}.</p>\n            \n            \n            \n            <p>3. Salaire</p>\n            \n            <p>Votre salaire et vos autres avantages seront tels quindiqu&eacute;s &agrave; lannexe 1 ci-jointe.</p>\n            \n            \n            <p>4. Lieu de d&eacute;tachement</p>\n            <p>Vous serez affect&eacute; &agrave; {branch}. Vous pouvez cependant &ecirc;tre tenu de travailler dans nimporte quel lieu daffaires que la Soci&eacute;t&eacute; a, ou</p>\n            \n            <p>pourra acqu&eacute;rir plus tard.</p>\n            \n            \n            \n            <p>5. Heures de travail</p>\n            \n            <p>Les jours ouvrables normaux sont du lundi au vendredi. Vous devrez travailler les heures n&eacute;cessaires &agrave; la</p>\n            \n            <p>lexercice correct de vos fonctions envers la Soci&eacute;t&eacute;. Les heures normales de travail vont de {start_time} &agrave; {end_time} et vous &ecirc;tes</p>\n            \n            <p>devrait travailler au moins {total_hours} heures par semaine, et si n&eacute;cessaire des heures suppl&eacute;mentaires en fonction de votre</p>\n            \n            <p>responsabilit&eacute;s.</p>\n            \n            <p>6. Cong&eacute;s/Vacances</p>\n            \n            <p>6.1 Vous avez droit &agrave; un cong&eacute; occasionnel de 12 jours.</p>\n            \n            <p>6.2 Vous avez droit &agrave; 12 jours ouvrables de cong&eacute; de maladie pay&eacute;.</p>\n            \n            <p>6.3 La Soci&eacute;t&eacute; communiquera une liste des jours f&eacute;ri&eacute;s d&eacute;clar&eacute;s au d&eacute;but de chaque ann&eacute;e.</p>\n            \n            \n            \n            <p>7. Nature des fonctions</p>\n            \n            <p>Vous ex&eacute;cuterez au mieux de vos capacit&eacute;s toutes les t&acirc;ches inh&eacute;rentes &agrave; votre poste et les t&acirc;ches suppl&eacute;mentaires que lentreprise</p>\n            \n            <p>peut faire appel &agrave; vous pour effectuer, de temps &agrave; autre. Vos fonctions sp&eacute;cifiques sont &eacute;nonc&eacute;es &agrave; lannexe II ci-jointe.</p>\n            \n            \n            \n            <p>8. Biens sociaux</p>\n            \n            <p>Vous maintiendrez toujours en bon &eacute;tat les biens de la Soci&eacute;t&eacute;, qui peuvent vous &ecirc;tre confi&eacute;s pour un usage officiel au cours de votre</p>\n            \n            <p>votre emploi, et doit restituer tous ces biens &agrave; la Soci&eacute;t&eacute; avant labandon de votre charge, &agrave; d&eacute;faut de quoi le co&ucirc;t</p>\n            \n            <p>de m&ecirc;me seront r&eacute;cup&eacute;r&eacute;s aupr&egrave;s de vous par la Soci&eacute;t&eacute;.</p>\n            \n            \n            \n            <p>9. Emprunter/accepter des cadeaux</p>\n            \n            <p>Vous nemprunterez ni naccepterez dargent, de cadeau, de r&eacute;compense ou de compensation pour vos gains personnels ou vous placerez autrement</p>\n            \n            <p>sous obligation p&eacute;cuniaire envers toute personne/client avec qui vous pourriez avoir des relations officielles.</p>\n            <p>10. R&eacute;siliation</p>\n            \n            <p>10.1 Votre nomination peut &ecirc;tre r&eacute;sili&eacute;e par la Soci&eacute;t&eacute;, sans aucune raison, en vous donnant au moins [Pr&eacute;avis] mois avant</p>\n            \n            <p>un pr&eacute;avis &eacute;crit ou un salaire en tenant lieu. Aux fins de la pr&eacute;sente clause, salaire sentend du salaire de base.</p>\n            \n            <p>10.2 Vous pouvez r&eacute;silier votre emploi au sein de la Soci&eacute;t&eacute;, sans motif, en donnant au moins [Avis &agrave; lemploy&eacute;]</p>\n            \n            <p>mois de pr&eacute;avis ou de salaire pour la p&eacute;riode non &eacute;pargn&eacute;e, restant apr&egrave;s r&eacute;gularisation des cong&eacute;s en attente, &agrave; la date.</p>\n            \n            <p>10.3 La Soci&eacute;t&eacute; se r&eacute;serve le droit de r&eacute;silier votre emploi sans pr&eacute;avis ni indemnit&eacute; de licenciement.</p>\n            \n            <p>sil a des motifs raisonnables de croire que vous &ecirc;tes coupable dinconduite ou de n&eacute;gligence, ou que vous avez commis une violation fondamentale de</p>\n            \n            <p>contrat, ou caus&eacute; une perte &agrave; la Soci&eacute;t&eacute;.</p>\n            \n            <p>10. 4 &Agrave; la fin de votre emploi pour quelque raison que ce soit, vous restituerez &agrave; la Soci&eacute;t&eacute; tous les biens ; document, et</p>\n            \n            <p>papier, &agrave; la fois loriginal et les copies de celui-ci, y compris les &eacute;chantillons, la litt&eacute;rature, les contrats, les dossiers, les listes, les dessins, les plans,</p>\n            \n            <p>lettres, notes, donn&eacute;es et similaires; et Informations confidentielles, en votre possession ou sous votre contr&ocirc;le relatives &agrave; votre</p>\n            \n            <p>lemploi ou aux affaires commerciales des clients.</p>\n            <p>11. Informations confidentielles</p>\n            \n            <p>11. 1 Au cours de votre emploi au sein de la Soci&eacute;t&eacute;, vous consacrerez tout votre temps, votre attention et vos comp&eacute;tences au mieux de vos capacit&eacute;s pour</p>\n            \n            <p>son affaire. Vous ne devez pas, directement ou indirectement, vous engager ou vous associer &agrave;, &ecirc;tre li&eacute; &agrave;, concern&eacute;, employ&eacute; ou</p>\n            \n            <p>temps ou poursuivre quelque programme d&eacute;tudes que ce soit, sans lautorisation pr&eacute;alable de la Soci&eacute;t&eacute;. engag&eacute; dans toute autre entreprise ou</p>\n            \n            <p>activit&eacute;s ou tout autre poste ou travail &agrave; temps partiel ou poursuivre des &eacute;tudes quelconques, sans lautorisation pr&eacute;alable du</p>\n            \n            <p>Compagnie.</p>\n            \n            <p>11.2 Vous devez toujours maintenir le plus haut degr&eacute; de confidentialit&eacute; et garder confidentiels les dossiers, documents et autres</p>\n            \n            <p>Informations confidentielles relatives &agrave; lactivit&eacute; de la Soci&eacute;t&eacute; dont vous pourriez avoir connaissance ou qui vous seraient confi&eacute;es par tout moyen</p>\n            \n            <p>et vous nutiliserez ces registres, documents et informations que dune mani&egrave;re d&ucirc;ment autoris&eacute;e dans lint&eacute;r&ecirc;t de la Soci&eacute;t&eacute;. Pour</p>\n            \n            <p>aux fins de la pr&eacute;sente clause &laquo; Informations confidentielles &raquo; d&eacute;signe les informations sur les activit&eacute;s de la Soci&eacute;t&eacute; et celles de ses clients</p>\n            \n            <p>qui nest pas accessible au grand public et dont vous pourriez avoir connaissance dans le cadre de votre emploi. Ceci comprend,</p>\n            \n            <p>mais sans sy limiter, les informations relatives &agrave; lorganisation, ses listes de clients, ses politiques demploi, son personnel et les informations</p>\n            \n            <p>sur les produits, les processus de la Soci&eacute;t&eacute;, y compris les id&eacute;es, les concepts, les projections, la technologie, les manuels, les dessins, les conceptions,</p>\n            \n            <p>sp&eacute;cifications, et tous les papiers, curriculum vitae, dossiers et autres documents contenant de telles informations confidentielles.</p>\n            \n            <p>11.3 &Agrave; aucun moment, vous ne retirerez des informations confidentielles du bureau sans autorisation.</p>\n            \n            <p>11.4 Votre devoir de prot&eacute;ger et de ne pas divulguer</p>\n            \n            <p>Les Informations confidentielles survivront &agrave; lexpiration ou &agrave; la r&eacute;siliation du pr&eacute;sent Contrat et/ou &agrave; votre emploi au sein de la Soci&eacute;t&eacute;.</p>\n            \n            <p>11.5 La violation des conditions de cette clause vous rendra passible dun renvoi sans pr&eacute;avis en vertu de la clause ci-dessus en plus de tout</p>\n            \n            <p>autre recours que la Soci&eacute;t&eacute; peut avoir contre vous en droit.</p>\n            <p>12. Avis</p>\n            \n            <p>Des avis peuvent &ecirc;tre donn&eacute;s par vous &agrave; la Soci&eacute;t&eacute; &agrave; ladresse de son si&egrave;ge social. Des avis peuvent vous &ecirc;tre donn&eacute;s par la Soci&eacute;t&eacute; &agrave;</p>\n            \n            <p>ladresse que vous avez indiqu&eacute;e dans les registres officiels.</p>\n            \n            \n            \n            <p>13. Applicabilit&eacute; de la politique de lentreprise</p>\n            \n            <p>La Soci&eacute;t&eacute; est autoris&eacute;e &agrave; faire des d&eacute;clarations de politique de temps &agrave; autre concernant des questions telles que le droit aux cong&eacute;s, la maternit&eacute;</p>\n            \n            <p>les cong&eacute;s, les avantages sociaux des employ&eacute;s, les heures de travail, les politiques de transfert, etc., et peut les modifier de temps &agrave; autre &agrave; sa seule discr&eacute;tion.</p>\n            \n            <p>Toutes ces d&eacute;cisions politiques de la Soci&eacute;t&eacute; vous lieront et pr&eacute;vaudront sur le pr&eacute;sent Contrat dans cette mesure.</p>\n            \n            \n            \n            <p>14. Droit applicable/juridiction</p>\n            \n            <p>Votre emploi au sein de la Soci&eacute;t&eacute; est soumis aux lois du pays. Tous les litiges seront soumis &agrave; la comp&eacute;tence du tribunal de grande instance</p>\n            \n            <p>Gujarat uniquement.</p>\n            \n            \n            \n            <p>15. Acceptation de notre offre</p>\n            \n            <p>Veuillez confirmer votre acceptation de ce contrat de travail en signant et en renvoyant le duplicata.</p>\n            \n            \n            \n            <p>Nous vous souhaitons la bienvenue et nous nous r&eacute;jouissons de recevoir votre acceptation et de travailler avec vous.</p>\n            \n            \n            \n            <p>Cordialement,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(7, 'id', '<h3 style=\"text-align: center;\">Surat Bergabung</h3>\n            \n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{address}</p>\n            \n            \n            \n            <p>Perihal: Pengangkatan untuk jabatan {designation}</p>\n            \n            \n            <p>{employee_name} yang terhormat,</p>\n            \n            <p>Kami dengan senang hati menawarkan kepada Anda, posisi {designation} dengan {app_name} sebagai Perusahaan dengan persyaratan dan</p>\n            \n            <p>kondisi:</p>\n            \n            \n            \n            <p>1. Mulai bekerja</p>\n            \n            <p>Pekerjaan Anda akan efektif, mulai {start_date}</p>\n            \n            \n            <p>2. Jabatan</p>\n            <p>Jabatan Anda adalah {designation}.</p>\n            \n            <p>3. Gaji</p>\n            <p>Gaji Anda dan tunjangan lainnya akan diatur dalam Jadwal 1, di sini.</p>\n            \n            \n            <p>4. Tempat posting</p>\n            \n            <p>Anda akan diposkan di {branch}. Namun Anda mungkin diminta untuk bekerja di tempat bisnis mana pun yang dimiliki Perusahaan, atau</p>\n            \n            <p>nantinya dapat memperoleh.</p>\n            \n            \n            \n            <p>5. Jam Kerja</p>\n            \n            <p>Hari kerja normal adalah Senin sampai Jumat. Anda akan diminta untuk bekerja selama jam-jam yang diperlukan untuk</p>\n            \n            <p>pelaksanaan tugas Anda dengan benar di Perusahaan. Jam kerja normal adalah dari {start_time} hingga {end_time} dan Anda</p>\n            \n            <p>diharapkan bekerja tidak kurang dari {total_hours} jam setiap minggu, dan jika perlu untuk jam tambahan tergantung pada</p>\n            \n            <p>tanggung jawab.</p>\n            \n            \n            \n            <p>6. Cuti/Libur</p>\n            \n            <p>6.1 Anda berhak atas cuti biasa selama 12 hari.</p>\n            \n            <p>6.2 Anda berhak atas 12 hari kerja cuti sakit berbayar.</p>\n            \n            <p>6.3 Perusahaan akan memberitahukan daftar hari libur yang diumumkan pada awal setiap tahun.</p>\n            \n            \n            \n            <p>7. Sifat tugas</p>\n            \n            <p>Anda akan melakukan yang terbaik dari kemampuan Anda semua tugas yang melekat pada jabatan Anda dan tugas tambahan seperti perusahaan</p>\n            \n            <p>dapat memanggil Anda untuk tampil, dari waktu ke waktu. Tugas khusus Anda ditetapkan dalam Jadwal II di sini.</p>\n            \n            \n            \n            <p>8. Properti perusahaan</p>\n            \n            <p>Anda akan selalu menjaga properti Perusahaan dalam kondisi baik, yang dapat dipercayakan kepada Anda untuk penggunaan resmi selama</p>\n            \n            <p>pekerjaan Anda, dan akan mengembalikan semua properti tersebut kepada Perusahaan sebelum melepaskan biaya Anda, jika tidak ada biayanya</p>\n            \n            <p>yang sama akan dipulihkan dari Anda oleh Perusahaan.</p>\n            \n            \n            \n            <p>9. Meminjam/menerima hadiah</p>\n            \n            <p>Anda tidak akan meminjam atau menerima uang, hadiah, hadiah, atau kompensasi apa pun untuk keuntungan pribadi Anda dari atau dengan cara lain menempatkan diri Anda sendiri</p>\n            \n            <p>di bawah kewajiban uang kepada setiap orang/klien dengan siapa Anda mungkin memiliki hubungan resmi.</p>\n            <p>10. Penghentian</p>\n            \n            <p>10.1 Penunjukan Anda dapat diakhiri oleh Perusahaan, tanpa alasan apa pun, dengan memberi Anda tidak kurang dari [Pemberitahuan] bulan sebelumnya</p>\n            \n            <p>pemberitahuan secara tertulis atau gaji sebagai penggantinya. Untuk maksud pasal ini, gaji berarti gaji pokok.</p>\n            \n            <p>10.2 Anda dapat memutuskan hubungan kerja Anda dengan Perusahaan, tanpa alasan apa pun, dengan memberikan tidak kurang dari [Pemberitahuan Karyawan]</p>\n            \n            <p>pemberitahuan atau gaji bulan sebelumnya untuk periode yang belum disimpan, yang tersisa setelah penyesuaian cuti yang tertunda, pada tanggal.</p>\n            \n            <p>10.3 Perusahaan berhak untuk mengakhiri hubungan kerja Anda dengan segera tanpa pemberitahuan jangka waktu atau pembayaran pemutusan hubungan kerja</p>\n            \n            <p>jika memiliki alasan yang masuk akal untuk meyakini bahwa Anda bersalah atas kesalahan atau kelalaian, atau telah melakukan pelanggaran mendasar apa pun terhadap</p>\n            \n            <p>kontrak, atau menyebabkan kerugian bagi Perusahaan.</p>\n            \n            <p>10. 4 Pada pemutusan hubungan kerja Anda karena alasan apa pun, Anda akan mengembalikan semua properti kepada Perusahaan; dokumen, dan</p>\n            \n            <p>kertas, baik asli maupun salinannya, termasuk contoh, literatur, kontrak, catatan, daftar, gambar, cetak biru,</p>\n            \n            <p>surat, catatan, data dan sejenisnya; dan Informasi Rahasia, yang Anda miliki atau di bawah kendali Anda terkait dengan</p>\n            \n            <p>pekerjaan atau untuk urusan bisnis klien.</p>\n            <p>11. Informasi Rahasia</p>\n            \n            <p>11. 1 Selama bekerja di Perusahaan, Anda akan mencurahkan seluruh waktu, perhatian, dan keterampilan Anda sebaik mungkin untuk</p>\n            \n            <p>bisnisnya. Anda tidak boleh, secara langsung atau tidak langsung, terlibat atau mengasosiasikan diri Anda dengan, terhubung dengan, terkait, dipekerjakan, atau</p>\n            \n            <p>waktu atau mengikuti program studi apapun, tanpa izin sebelumnya dari Perusahaan.terlibat dalam bisnis lain atau</p>\n            \n            <p>kegiatan atau pos atau pekerjaan paruh waktu lainnya atau mengejar program studi apa pun, tanpa izin sebelumnya dari</p>\n            \n            <p>Perusahaan.</p>\n            \n            <p>11.2 Anda harus selalu menjaga tingkat kerahasiaan tertinggi dan merahasiakan catatan, dokumen, dan lainnya</p>\n            \n            <p>Informasi Rahasia yang berkaitan dengan bisnis Perusahaan yang mungkin Anda ketahui atau rahasiakan kepada Anda dengan cara apa pun</p>\n            \n            <p>dan Anda akan menggunakan catatan, dokumen, dan informasi tersebut hanya dengan cara yang sah untuk kepentingan Perusahaan. Untuk</p>\n            \n            <p>tujuan klausul ini Informasi Rahasia berarti informasi tentang bisnis Perusahaan dan pelanggannya</p>\n            \n            <p>yang tidak tersedia untuk masyarakat umum dan yang mungkin Anda pelajari selama masa kerja Anda. Ini termasuk,</p>\n            \n            <p>tetapi tidak terbatas pada, informasi yang berkaitan dengan organisasi, daftar pelanggannya, kebijakan ketenagakerjaan, personel, dan informasi</p>\n            \n            <p>tentang produk Perusahaan, proses termasuk ide, konsep, proyeksi, teknologi, manual, gambar, desain,</p>\n            \n            <p>spesifikasi, dan semua makalah, resume, catatan dan dokumen lain yang berisi Informasi Rahasia tersebut.</p>\n            \n            <p>11.3 Kapan pun Anda akan menghapus Informasi Rahasia apa pun dari kantor tanpa izin.</p>\n            \n            <p>11.4 Kewajiban Anda untuk melindungi dan tidak mengungkapkan</p>\n            \n            <p>e Informasi Rahasia akan tetap berlaku setelah berakhirnya atau pengakhiran Perjanjian ini dan/atau hubungan kerja Anda dengan Perusahaan.</p>\n            \n            <p>11.5 Pelanggaran terhadap ketentuan klausul ini akan membuat Anda bertanggung jawab atas pemecatan singkat berdasarkan klausul di atas selain dari:</p>\n            \n            <p>upaya hukum lain yang mungkin dimiliki Perusahaan terhadap Anda secara hukum.</p>\n            <p>12. Pemberitahuan</p>\n            \n            <p>Pemberitahuan dapat diberikan oleh Anda kepada Perusahaan di alamat kantor terdaftarnya. Pemberitahuan dapat diberikan oleh Perusahaan kepada Anda di</p>\n            \n            <p>alamat yang diberitahukan oleh Anda dalam catatan resmi.</p>\n            \n            \n            \n            <p>13. Keberlakuan Kebijakan Perusahaan</p>\n            \n            <p>Perusahaan berhak untuk membuat pernyataan kebijakan dari waktu ke waktu berkaitan dengan hal-hal seperti hak cuti, persalinan</p>\n            \n            <p>cuti, tunjangan karyawan, jam kerja, kebijakan transfer, dll., dan dapat mengubahnya dari waktu ke waktu atas kebijakannya sendiri.</p>\n            \n            <p>Semua keputusan kebijakan Perusahaan tersebut akan mengikat Anda dan akan mengesampingkan Perjanjian ini sejauh itu.</p>\n            \n            \n            \n            <p>14. Hukum/Yurisdiksi yang Mengatur</p>\n            \n            <p>Pekerjaan Anda dengan Perusahaan tunduk pada undang-undang Negara. Semua perselisihan akan tunduk pada yurisdiksi Pengadilan Tinggi</p>\n            \n            <p>Gujarat saja.</p>\n            \n            \n            \n            <p>15. Penerimaan penawaran kami</p>\n            \n            <p>Harap konfirmasikan penerimaan Anda atas Kontrak Kerja ini dengan menandatangani dan mengembalikan salinan duplikatnya.</p>\n            \n            \n            \n            <p>Kami menyambut Anda dan berharap untuk menerima penerimaan Anda dan bekerja sama dengan Anda.</p>\n            \n            \n            \n            <p>Dengan hormat,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(8, 'it', '<h3 style=\"text-align: center;\">Lettera di adesione</h3>\n            \n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{address}</p>\n            \n            <p>Oggetto: Appuntamento alla carica di {designation}</p>\n            \n            \n            <p>Gentile {employee_name},</p>\n            \n            <p>Siamo lieti di offrirti la posizione di {designation} con {app_name} la \"Societ&agrave;\" alle seguenti condizioni e</p>\n            \n            <p>condizioni:</p>\n            \n            \n            <p>1. Inizio del rapporto di lavoro</p>\n            \n            <p>Il tuo impiego sar&agrave; effettivo a partire da {start_date}</p>\n            \n            \n            \n            <p>2. Titolo di lavoro</p>\n            \n            <p>Il tuo titolo di lavoro sar&agrave; {designation}.</p>\n            \n            <p>3. Stipendio</p>\n            \n            <p>Il tuo stipendio e altri benefici saranno come indicato nellAllegato 1, qui di seguito.</p>\n            \n            \n            \n            <p>4. Luogo di invio</p>\n            \n            <p>Sarai inviato a {branch}. Tuttavia, potrebbe essere richiesto di lavorare in qualsiasi luogo di attivit&agrave; che la Societ&agrave; ha, o</p>\n            \n            <p>potr&agrave; successivamente acquisire.</p>\n            \n            \n            \n            <p>5. Orario di lavoro</p>\n            \n            <p>I normali giorni lavorativi sono dal luned&igrave; al venerd&igrave;. Ti verr&agrave; richiesto di lavorare per le ore necessarie per il</p>\n            \n            <p>corretto adempimento dei propri doveri nei confronti della Societ&agrave;. Lorario di lavoro normale va da {start_time} a {end_time} e tu lo sei</p>\n            \n            <p>dovrebbe lavorare non meno di {total_hours} ore ogni settimana e, se necessario, per ore aggiuntive a seconda del tuo</p>\n            \n            <p>responsabilit&agrave;.</p>\n            \n            \n            \n            <p>6. Permessi/Festivit&agrave;</p>\n            \n            <p>6.1 Hai diritto a un congedo occasionale di 12 giorni.</p>\n            \n            <p>6.2 Hai diritto a 12 giorni lavorativi di congedo per malattia retribuito.</p>\n            \n            <p>6.3 La Societ&agrave; comunica allinizio di ogni anno un elenco delle festivit&agrave; dichiarate.</p>\n            \n            \n            \n            <p>7. Natura degli incarichi</p>\n            \n            <p>Eseguirai al meglio delle tue capacit&agrave; tutti i compiti inerenti al tuo incarico e compiti aggiuntivi come lazienda</p>\n            \n            <p>pu&ograve; invitarti a esibirti, di tanto in tanto. I tuoi doveri specifici sono stabiliti nellAllegato II del presente documento.</p>\n            \n            \n            \n            <p>8. Propriet&agrave; aziendale</p>\n            \n            <p>Manterrete sempre in buono stato i beni dellAzienda, che nel corso dellanno potrebbero esservi affidati per uso ufficiale</p>\n            \n            <p>il tuo impiego, e restituir&agrave; tutte queste propriet&agrave; alla Societ&agrave; prima della rinuncia al tuo addebito, in caso contrario il costo</p>\n            \n            <p>degli stessi saranno da voi recuperati dalla Societ&agrave;.</p>\n            \n            \n            \n            <p>9. Prendere in prestito/accettare regali</p>\n            \n            <p>Non prenderai in prestito n&eacute; accetterai denaro, dono, ricompensa o compenso per i tuoi guadagni personali da o altrimenti collocato te stesso</p>\n            \n            <p>sotto obbligazione pecuniaria nei confronti di qualsiasi persona/cliente con cui potresti avere rapporti ufficiali.</p>\n            <p>10. Cessazione</p>\n            \n            <p>10.1 Il tuo incarico pu&ograve; essere risolto dalla Societ&agrave;, senza alcun motivo, dandoti non meno di [Avviso] mesi prima</p>\n            \n            <p>avviso scritto o stipendio in sostituzione di esso. Ai fini della presente clausola, per stipendio si intende lo stipendio base.</p>\n            \n            <p>10.2 &Egrave; possibile terminare il proprio rapporto di lavoro con la Societ&agrave;, senza alcuna causa, fornendo non meno di [Avviso per il dipendente]</p>\n            \n            <p>mesi di preavviso o stipendio per il periodo non risparmiato, lasciato dopo ladeguamento delle ferie pendenti, come alla data.</p>\n            \n            <p>10.3 La Societ&agrave; si riserva il diritto di terminare il rapporto di lavoro sommariamente senza alcun periodo di preavviso o pagamento di cessazione</p>\n            \n            <p>se ha fondati motivi per ritenere che tu sia colpevole di cattiva condotta o negligenza, o abbia commesso una violazione fondamentale</p>\n            \n            <p>contratto, o ha causato danni alla Societ&agrave;.</p>\n            \n            <p>10. 4 Alla cessazione del rapporto di lavoro per qualsiasi motivo, restituirete alla Societ&agrave; tutti i beni; documenti, e</p>\n            \n            <p>carta, sia in originale che in copia, inclusi eventuali campioni, letteratura, contratti, registrazioni, elenchi, disegni, progetti,</p>\n            \n            <p>lettere, note, dati e simili; e Informazioni Riservate, in tuo possesso o sotto il tuo controllo, relative alla tua</p>\n            \n            <p>lavoro o agli affari dei clienti.</p>\n            <p>11. Confidential Information</p>\n            \n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\n            \n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\n            \n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\n            \n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\n            \n            <p>Company.</p>\n            \n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other&nbsp;</p>\n            \n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\n            \n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\n            \n            <p>the purposes of this clause &lsquo;Confidential Information&rsquo; means information about the Company&rsquo;s business and that of its customers</p>\n            \n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\n            \n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\n            \n            <p>about the Company&rsquo;s products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,&nbsp;</p>\n            \n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\n            \n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\n            \n            <p>11.4 Your duty to safeguard and not disclos</p>\n            \n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\n            \n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\n            \n            <p>other remedy the Company may have against you in law.</p>\n            <p>12. Notices</p>\n            \n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\n            \n            <p>the address intimated by you in the official records.</p>\n            \n            \n            \n            <p>13. Applicability of Company Policy</p>\n            \n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\n            \n            <p>leave, employees&rsquo; benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\n            \n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that&nbsp; extent.</p>\n            \n            \n            \n            <p>14. Governing Law/Jurisdiction</p>\n            \n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\n            \n            <p>Gujarat only.</p>\n            \n            \n            \n            <p>15. Acceptance of our offer</p>\n            \n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\n            \n            \n            \n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\n            \n            \n            \n            <p>Yours Sincerely,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>\n            ', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(9, 'ja', '<h3 style=\"text-align: center;\">入会の手紙</h3>\n            \n            <p>{date}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{address}</p>\n            \n            \n            \n            <p>件名: {designation} の役職への任命</p>\n            \n            \n            \n            <p>{employee_name} 様</p>\n            \n            \n            <p>{app_name} の {designation} の地位を以下の条件で「会社」として提供できることをうれしく思います。</p>\n            \n            <p>条件：</p>\n            \n            \n            <p>1. 雇用開始</p>\n            \n            <p>あなたの雇用は {start_date} から有効になります</p>\n            \n            \n            <p>2. 役職</p>\n            \n            <p>あなたの役職は{designation}になります。</p>\n            \n            \n            <p>3. 給与</p>\n            \n            <p>あなたの給与およびその他の福利厚生は、本明細書のスケジュール 1 に記載されているとおりです。</p>\n            \n            \n            <p>4. 掲示場所</p>\n            \n            <p>{branch} に掲載されます。ただし、会社が所有する事業所で働く必要がある場合があります。</p>\n            \n            <p>後で取得する場合があります。</p>\n            \n            \n            \n            <p>5. 労働時間</p>\n            \n            <p>通常の営業日は月曜日から金曜日です。あなたは、そのために必要な時間働く必要があります。</p>\n            \n            <p>会社に対するあなたの義務の適切な遂行。通常の勤務時間は {start_time} から {end_time} までで、あなたは</p>\n            \n            <p>毎週 {total_hours} 時間以上の勤務が期待される</p>\n            \n            <p>責任。</p>\n            \n            \n            \n            <p>6.休暇・休日</p>\n            \n            <p>6.1 12 日間の臨時休暇を取得する権利があります。</p>\n            \n            <p>6.2 12 日間の有給病気休暇を取る権利があります。</p>\n            \n            <p>6.3 当社は、毎年の初めに宣言された休日のリストを通知するものとします。</p>\n            \n            \n            \n            <p>7. 職務内容</p>\n            \n            <p>あなたは、自分のポストに固有のすべての義務と、会社としての追加の義務を最大限に遂行します。</p>\n            \n            <p>時々あなたに演奏を依頼するかもしれません。あなたの特定の義務は、本明細書のスケジュール II に記載されています。</p>\n            \n            \n            \n            <p>8. 会社財産</p>\n            \n            <p>あなたは、会社の所有物を常に良好な状態に維持するものとします。</p>\n            \n            <p>あなたの雇用を放棄し、あなたの料金を放棄する前に、そのようなすべての財産を会社に返還するものとします。</p>\n            \n            <p>同じのは、会社によってあなたから回収されます。</p>\n            \n            \n            \n            <p>9. 貸出・贈答品の受け取り</p>\n            \n            <p>あなたは、あなた自身から、または他の方法であなた自身の場所から個人的な利益を得るための金銭、贈り物、報酬、または補償を借りたり、受け取ったりしません。</p>\n            \n            <p>あなたが公式の取引をしている可能性のある人物/クライアントに対する金銭的義務の下で。</p>\n            <p>10. 終了</p>\n            \n            <p>10.1 少なくとも [通知] か月前に通知することにより、理由のいかんを問わず、会社はあなたの任命を終了することができます。</p>\n            \n            <p>書面による通知またはその代わりの給与。この条項の目的上、給与とは基本給を意味するものとします。</p>\n            \n            <p>10.2 あなたは、少なくとも [従業員通知] を提出することにより、理由のいかんを問わず、会社での雇用を終了することができます。</p>\n            \n            <p>保留中の休暇の調整後に残された、保存されていない期間の数か月前の通知または給与は、日付のとおりです。</p>\n            \n            <p>10.3 当社は、通知期間や解雇補償金なしに、あなたの雇用を即座に終了させる権利を留保します。</p>\n            \n            <p>あなたが不正行為または過失で有罪であると信じる合理的な根拠がある場合、または基本的な違反を犯した場合</p>\n            \n            <p>契約、または当社に損害を与えた。</p>\n            \n            <p>10. 4 何らかの理由で雇用が終了した場合、あなたは会社にすべての財産を返還するものとします。ドキュメント、および</p>\n            \n            <p>サンプル、文献、契約書、記録、リスト、図面、青写真を含む、原本とコピーの両方の紙、</p>\n            \n            <p>手紙、メモ、データなど。あなたが所有する、またはあなたの管理下にある機密情報。</p>\n            \n            <p>雇用またはクライアントの業務に。</p>\n            <p>11. 機密情報</p>\n            \n            <p>11. 1 当社での雇用期間中、あなたは自分の全時間、注意、およびスキルを、自分の能力の限りを尽くして捧げます。</p>\n            \n            <p>そのビジネス。あなたは、直接的または間接的に、関与したり、関連付けたり、接続したり、関係したり、雇用したり、または</p>\n            \n            <p>会社の事前の許可なしに、時間や学習コースを追求すること。他のビジネスに従事すること、または</p>\n            \n            <p>の事前の許可なしに、活動またはその他の投稿またはアルバイトをしたり、何らかの研究コースを追求したりすること。</p>\n            \n            <p>会社。</p>\n            \n            <p>11.2 常に最高度の機密性を維持し、記録、文書、およびその他の情報を機密として保持する必要があります。</p>\n            \n            <p>お客様が知っている、または何らかの方法でお客様に内密にされている可能性がある、当社の事業に関連する機密情報</p>\n            \n            <p>また、あなたは、会社の利益のために正当に承認された方法でのみ、そのような記録、文書、および情報を使用するものとします。為に</p>\n            \n            <p>この条項の目的 「機密情報」とは、会社の事業および顧客の事業に関する情報を意味します。</p>\n            \n            <p>これは一般には公開されておらず、雇用の過程で学習する可能性があります。これも、</p>\n            \n            <p>組織、その顧客リスト、雇用方針、人事、および情報に関連する情報に限定されません</p>\n            \n            <p>当社の製品、アイデアを含むプロセス、コンセプト、予測、技術、マニュアル、図面、デザイン、</p>\n            \n            <p>仕様、およびそのような機密情報を含むすべての書類、履歴書、記録、およびその他の文書。</p>\n            \n            <p>11.3 いかなる時も、許可なくオフィスから機密情報を削除しないでください。</p>\n            \n            <p>11.4 保護し、開示しないというあなたの義務</p>\n            \n            <p>e 機密情報は、本契約および/または当社との雇用の満了または終了後も存続します。</p>\n            \n            <p>11.5 この条項の条件に違反した場合、上記の条項に基づく略式解雇の対象となります。</p>\n            \n            <p>会社が法律であなたに対して持つことができるその他の救済。</p>\n            <p>12. 通知</p>\n            \n            <p>通知は、登録された事務所の住所で会社に提出することができます。通知は、当社からお客様に提供される場合があります。</p>\n            \n            <p>公式記録であなたがほのめかした住所。</p>\n            \n            \n            \n            <p>13. 会社方針の適用性</p>\n            \n            <p>会社は、休暇の資格、出産などの事項に関して、随時方針を宣言する権利を有するものとします。</p>\n            \n            <p>休暇、従業員の福利厚生、勤務時間、異動ポリシーなどであり、独自の裁量により随時変更される場合があります。</p>\n            \n            <p>当社のそのようなポリシー決定はすべて、あなたを拘束し、その範囲で本契約を無効にするものとします。</p>\n            \n            \n            \n            <p>14. 準拠法・裁判管轄</p>\n            \n            <p>当社でのあなたの雇用は、国の法律の対象となります。すべての紛争は、高等裁判所の管轄に服するものとします</p>\n            \n            <p>グジャラートのみ。</p>\n            \n            \n            \n            <p>15. オファーの受諾</p>\n            \n            <p>副本に署名して返送することにより、この雇用契約に同意したことを確認してください。</p>\n            \n            \n            \n            <p>私たちはあなたを歓迎し、あなたの受け入れを受け取り、あなたと一緒に働くことを楽しみにしています.</p>\n            \n            \n            \n            <p>敬具、</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(10, 'nl', '<h3 style=\"text-align: center;\">Deelnemende brief</h3>\n            \n            <p>{date}</p>\n            \n            <p>{employee}</p>\n            \n            <p>{address}</p>\n            \n            <p>Onderwerp: Benoeming voor de functie van {designation}</p>\n            \n            <p>Beste {employee_name},</p>\n            \n            <p>We zijn verheugd u de positie van {designation} bij {app_name} het Bedrijf aan te bieden onder de volgende voorwaarden en</p>\n            \n            <p>conditie:</p>\n            \n            \n            <p>1. Indiensttreding</p>\n            <p>Uw dienstverband gaat in op {start_date}</p>\n            \n            \n            <p>2. Functietitel</p>\n            \n            <p>Uw functietitel wordt {designation}.</p>\n            \n            <p>3. Salaris</p>\n            \n            <p>Uw salaris en andere voordelen zijn zoals uiteengezet in Schema 1 hierbij.</p>\n            \n            <p>4. Plaats van detachering</p>\n            \n            <p>Je wordt geplaatst op {branch}. Het kan echter zijn dat u moet werken op een bedrijfslocatie die het Bedrijf heeft, of</p>\n            \n            <p>later kan verwerven.</p>\n            \n            \n            \n            <p>5. Werkuren</p>\n            \n            <p>De normale werkdagen zijn van maandag tot en met vrijdag. Je zal de uren moeten werken die nodig zijn voor de</p>\n            \n            <p>correcte uitvoering van uw taken jegens het bedrijf. De normale werkuren zijn van {start_time} tot {end_time} en jij bent</p>\n            \n            <p>naar verwachting niet minder dan {total_hours} uur per week werken, en indien nodig voor extra uren, afhankelijk van uw</p>\n            \n            <p>verantwoordelijkheden.</p>\n            \n            \n            \n            <p>6. Verlof/Vakantie</p>\n            \n            <p>6.1 Je hebt recht op tijdelijk verlof van 12 dagen.</p>\n            \n            <p>6.2 U heeft recht op 12 werkdagen betaald ziekteverlof.</p>\n            \n            <p>6.3 De Maatschappij stelt aan het begin van elk jaar een lijst van verklaarde feestdagen op.</p>\n            \n            \n            \n            <p>7. Aard van de taken</p>\n            \n            <p>Je voert alle taken die inherent zijn aan je functie en bijkomende taken zoals het bedrijf naar beste vermogen uit;</p>\n            \n            <p>kan van tijd tot tijd een beroep op u doen om op te treden. Uw specifieke taken zijn uiteengezet in Bijlage II hierbij.</p>\n            \n            \n            \n            <p>8. Bedrijfseigendommen</p>\n            \n            <p>U onderhoudt bedrijfseigendommen, die u in de loop van</p>\n            \n            <p>uw dienstverband, en zal al deze eigendommen aan het Bedrijf teruggeven voordat afstand wordt gedaan van uw kosten, bij gebreke waarvan de kosten</p>\n            \n            <p>hiervan zal door het Bedrijf van u worden verhaald.</p>\n            \n            \n            \n            <p>9. Geschenken lenen/aannemen</p>\n            \n            <p>U zult geen geld, geschenken, beloningen of vergoedingen voor uw persoonlijk gewin lenen of accepteren van uzelf of uzelf op een andere manier plaatsen</p>\n            \n            <p>onder geldelijke verplichting jegens een persoon/klant met wie u mogelijk offici&euml;le betrekkingen heeft.</p>\n            <p>10. Be&euml;indiging</p>\n            \n            <p>10.1 Uw aanstelling kan door het Bedrijf zonder opgaaf van reden worden be&euml;indigd door u minimaal [Opzegging] maanden van tevoren</p>\n            \n            <p>schriftelijke opzegging of daarvoor in de plaats komend salaris. In dit artikel wordt onder salaris verstaan ​​het basissalaris.</p>\n            \n            <p>10.2 U kunt uw dienstverband bij het Bedrijf be&euml;indigen, zonder enige reden, door niet minder dan [Mededeling van de werknemer]</p>\n            \n            <p>maanden opzegtermijn of salaris voor de niet gespaarde periode, overgebleven na aanpassing van hangende verlofdagen, zoals op datum.</p>\n            \n            <p>10.3 Het bedrijf behoudt zich het recht voor om uw dienstverband op staande voet te be&euml;indigen zonder enige opzegtermijn of be&euml;indigingsvergoeding</p>\n            \n            <p>als het redelijke grond heeft om aan te nemen dat u zich schuldig heeft gemaakt aan wangedrag of nalatigheid, of een fundamentele schending van</p>\n            \n            <p>contract, of enig verlies voor het Bedrijf veroorzaakt.</p>\n            \n            <p>10. 4 Bij be&euml;indiging van uw dienstverband om welke reden dan ook, geeft u alle eigendommen terug aan het Bedrijf; documenten, en</p>\n            \n            <p>papier, zowel origineel als kopie&euml;n daarvan, inclusief eventuele monsters, literatuur, contracten, bescheiden, lijsten, tekeningen, blauwdrukken,</p>\n            \n            <p>brieven, notities, gegevens en dergelijke; en Vertrouwelijke informatie, in uw bezit of onder uw controle met betrekking tot uw</p>\n            \n            <p>werkgelegenheid of de zakelijke aangelegenheden van klanten.</p>\n            <p>11. Vertrouwelijke informatie</p>\n            \n            <p>11. 1 Tijdens uw dienstverband bij het Bedrijf besteedt u al uw tijd, aandacht en vaardigheden naar uw beste vermogen aan:</p>\n            \n            <p>zijn zaken. U mag zich niet, direct of indirect, inlaten met of verbonden zijn met, betrokken zijn bij, betrokken zijn bij, in dienst zijn van of</p>\n            \n            <p>tijd doorbrengen of een studie volgen, zonder voorafgaande toestemming van het bedrijf.bezig met een ander bedrijf of</p>\n            \n            <p>werkzaamheden of enige andere functie of werk in deeltijd of het volgen van welke opleiding dan ook, zonder voorafgaande toestemming van de</p>\n            \n            <p>Bedrijf.</p>\n            \n            <p>11.2 U moet altijd de hoogste graad van vertrouwelijkheid handhaven en de records, documenten en andere</p>\n            \n            <p>Vertrouwelijke informatie met betrekking tot het bedrijf van het bedrijf die u op enigerlei wijze bekend is of in vertrouwen is genomen</p>\n            \n            <p>en u zult dergelijke records, documenten en informatie alleen gebruiken op een naar behoren gemachtigde manier in het belang van het bedrijf. Voor</p>\n            \n            <p>de doeleinden van deze clausule Vertrouwelijke informatiebetekent informatie over het bedrijf van het bedrijf en dat van zijn klanten</p>\n            \n            <p>die niet beschikbaar is voor het grote publiek en die u tijdens uw dienstverband kunt leren. Dit bevat,</p>\n            \n            <p>maar is niet beperkt tot informatie met betrekking tot de organisatie, haar klantenlijsten, werkgelegenheidsbeleid, personeel en informatie</p>\n            \n            <p>over de producten, processen van het bedrijf, inclusief idee&euml;n, concepten, projecties, technologie, handleidingen, tekeningen, ontwerpen,</p>\n            \n            <p>specificaties, en alle papieren, cvs, dossiers en andere documenten die dergelijke vertrouwelijke informatie bevatten.</p>\n            \n            <p>11.3 U verwijdert nooit vertrouwelijke informatie van het kantoor zonder toestemming.</p>\n            \n            <p>11.4 Uw plicht om te beschermen en niet openbaar te maken</p>\n            \n            <p>e Vertrouwelijke informatie blijft van kracht na het verstrijken of be&euml;indigen van deze Overeenkomst en/of uw dienstverband bij het Bedrijf.</p>\n            \n            <p>11.5 Schending van de voorwaarden van deze clausule maakt u aansprakelijk voor ontslag op staande voet op grond van de bovenstaande clausule, naast eventuele:</p>\n            \n            <p>ander rechtsmiddel dat het Bedrijf volgens de wet tegen u heeft.</p>\n            <p>12. Kennisgevingen</p>\n            \n            <p>Kennisgevingen kunnen door u aan het Bedrijf worden gedaan op het adres van de maatschappelijke zetel. Kennisgevingen kunnen door het bedrijf aan u worden gedaan op:</p>\n            \n            <p>het door u opgegeven adres in de offici&euml;le administratie.</p>\n            \n            \n            \n            <p>13. Toepasselijkheid van het bedrijfsbeleid</p>\n            \n            <p>Het bedrijf heeft het recht om van tijd tot tijd beleidsverklaringen af ​​te leggen met betrekking tot zaken als verlofrecht, moederschap</p>\n            \n            <p>verlof, werknemersvoordelen, werkuren, transferbeleid, enz., en kan deze van tijd tot tijd naar eigen goeddunken wijzigen.</p>\n            \n            <p>Al dergelijke beleidsbeslissingen van het Bedrijf zijn bindend voor u en hebben voorrang op deze Overeenkomst in die mate.</p>\n            \n            \n            \n            <p>14. Toepasselijk recht/jurisdictie</p>\n            \n            <p>Uw dienstverband bij het bedrijf is onderworpen aan de landelijke wetgeving. Alle geschillen zijn onderworpen aan de jurisdictie van de High Court</p>\n            \n            <p>Alleen Gujarat.</p>\n            \n            \n            \n            <p>15. Aanvaarding van ons aanbod</p>\n            \n            <p>Bevestig uw aanvaarding van deze arbeidsovereenkomst door het duplicaat te ondertekenen en terug te sturen.</p>\n            \n            \n            \n            <p>Wij heten u van harte welkom en kijken ernaar uit uw acceptatie te ontvangen en met u samen te werken.</p>\n            \n            \n            \n            <p>Hoogachtend,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{date}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');
INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(11, 'pl', '<h3 style=\"text-align: center;\">Dołączanie listu</h3>\n            \n            <p>{date }</p>\n            \n            <p>{employee_name }</p>\n            \n            <p>{address }</p>\n            \n            \n            <p>Dotyczy: mianowania na stanowisko {designation}</p>\n            \n            <p>Szanowny {employee_name },</p>\n            \n            <p>Mamy przyjemność zaoferować Państwu, stanowisko {designation} z {app_name } \"Sp&oacute;łka\" na poniższych warunkach i</p>\n            <p>warunki:</p>\n            \n            <p>1. Rozpoczęcie pracy</p>\n            \n            <p>Twoje zatrudnienie będzie skuteczne, jak na {start_date }</p>\n            \n            <p>2. Tytuł zadania</p>\n            <p>Tw&oacute;j tytuł pracy to {designation}.</p>\n            \n            <p>3. Salary</p>\n            \n            <p>Twoje wynagrodzenie i inne świadczenia będą określone w Zestawieniu 1, do niniejszego rozporządzenia.</p>\n            \n            \n            <p>4. Miejsce delegowania</p>\n            <p>Użytkownik zostanie opublikowany w {branch }. Użytkownik może jednak być zobowiązany do pracy w dowolnym miejscu prowadzenia działalności, kt&oacute;re Sp&oacute;łka posiada, lub może p&oacute;źniej nabyć.</p>\n            \n            <p>5. Godziny pracy</p>\n            <p>Normalne dni robocze są od poniedziałku do piątku. Będziesz zobowiązany do pracy na takie godziny, jakie są niezbędne do prawidłowego wywiązania się ze swoich obowiązk&oacute;w wobec Sp&oacute;łki. Normalne godziny pracy to {start_time } do {end_time }, a użytkownik oczekuje, że będzie pracować nie mniej niż {total_hours } godzin tygodniowo, a jeśli to konieczne, przez dodatkowe godziny w zależności od Twojego</p>\n            <p>odpowiedzialności.</p>\n            \n            <p>6. Urlop/Wakacje</p>\n            \n            <p>6.1 Przysługuje prawo do urlopu dorywczego w ciągu 12 dni.</p>\n            \n            <p>6.2 Użytkownik ma prawo do 12 dni roboczych od wypłatnego zwolnienia chorobowego.</p>\n            \n            <p>6.3 Sp&oacute;łka powiadamia na początku każdego roku wykaz ogłoszonych świąt.&nbsp;</p>\n            \n            \n            \n            <p>7. Rodzaj obowiązk&oacute;w</p>\n            \n            <p>Będziesz wykonywać na najlepsze ze swojej zdolności wszystkie obowiązki, jak są one nieodłączne w swoim poście i takie dodatkowe obowiązki, jak firma może zadzwonić do wykonania, od czasu do czasu. Państwa szczeg&oacute;lne obowiązki są określone w załączniku II do niniejszego rozporządzenia.</p>\n            \n            \n            \n            <p>8. Właściwość przedsiębiorstwa</p>\n            \n            <p>Zawsze będziesz utrzymywać w dobrej kondycji Firmy, kt&oacute;ra może być powierzona do użytku służbowego w trakcie trwania</p>\n            \n            <p>Twoje zatrudnienie, i zwr&oacute;ci wszystkie takie nieruchomości do Sp&oacute;łki przed zrzeczeniem się opłaty, w przeciwnym razie koszty te same będą odzyskane od Ciebie przez Sp&oacute;łkę.</p>\n            \n            <p>9. Wypożyczanie/akceptowanie prezent&oacute;w</p>\n            \n            <p>Nie będziesz pożyczał ani nie akceptować żadnych pieniędzy, dar&oacute;w, nagrody lub odszkodowania za swoje osobiste zyski z lub w inny spos&oacute;b złożyć się w ramach zobowiązania pieniężnego do jakiejkolwiek osoby/klienta, z kt&oacute;rym może być posiadanie oficjalne relacje.</p>\n            <p>10. Zakończenie</p>\n            \n            <p>10.1 Powołanie może zostać wypowiedziane przez Sp&oacute;łkę, bez względu na przyczynę, poprzez podanie nie mniej niż [ Zawiadomienie] miesięcy uprzedniego wypowiedzenia na piśmie lub wynagrodzenia w miejsce jego wystąpienia. Dla cel&oacute;w niniejszej klauzuli, wynagrodzenie oznacza wynagrodzenie podstawowe.</p>\n            \n            <p>10.2 Użytkownik może rozwiązać umowę o pracę ze Sp&oacute;łką, bez jakiejkolwiek przyczyny, podając nie mniej niż [ ogłoszenie o pracowniku] miesiące przed powiadomieniem lub wynagrodzeniem za niezaoszczędzony okres, pozostawiony po skorygowaniu oczekujących liści, jak na dzień.</p>\n            \n            <p>10.3 Sp&oacute;łka zastrzega sobie prawo do wypowiedzenia umowy o pracę bez okresu wypowiedzenia lub wypłaty z tytułu rozwiązania umowy, jeżeli ma on uzasadnione podstawy, aby sądzić, że jesteś winny wykroczenia lub niedbalstwa, lub popełnił jakiekolwiek istotne naruszenie umowy lub spowodował jakiekolwiek straty w Sp&oacute;łce.&nbsp;</p>\n            \n            <p>10. 4 W sprawie rozwiązania stosunku pracy z jakiegokolwiek powodu, powr&oacute;cisz do Sp&oacute;łki wszystkie nieruchomości; dokumenty, i&nbsp;</p>\n            \n            <p>papieru, zar&oacute;wno oryginału, jak i jego kopii, w tym wszelkich pr&oacute;bek, literatury, um&oacute;w, zapis&oacute;w, wykaz&oacute;w, rysunk&oacute;w, konspekt&oacute;w,</p>\n            \n            <p>listy, notatki, dane i podobne; informacje poufne, znajdujące się w posiadaniu lub pod Twoją kontrolą związane z zatrudnieniem lub sprawami biznesowymi klient&oacute;w.&nbsp; &nbsp;</p>\n            \n            \n            \n            <p>11. Informacje poufne</p>\n            \n            <p>11. 1 Podczas swojego zatrudnienia z Firmą poświęcisz cały czas, uwagę i umiejętności na najlepszą z Twoich możliwości</p>\n            \n            <p>swojej działalności gospodarczej. Użytkownik nie może, bezpośrednio lub pośrednio, prowadzić lub wiązać się z, być związany z, dotyka, zatrudniony lub czas lub prowadzić jakikolwiek kierunek studi&oacute;w, bez uprzedniej zgody Company.zaangażował się w innej działalności gospodarczej lub działalności lub jakikolwiek inny post lub pracy w niepełnym wymiarze czasu lub prowadzić jakikolwiek kierunek studi&oacute;w, bez uprzedniej zgody</p>\n            \n            <p>Firma.</p>\n            \n            <p>11.2 Zawsze musisz zachować najwyższy stopień poufności i zachować jako poufny akt, dokumenty, i inne&nbsp;</p>\n            \n            <p>Informacje poufne dotyczące działalności Sp&oacute;łki, kt&oacute;re mogą być znane Państwu lub w dowolny spos&oacute;b zwierzyny, a Użytkownik będzie posługiwać się takimi zapisami, dokumentami i informacjami tylko w spos&oacute;b należycie autoryzowany w interesie Sp&oacute;łki. Do cel&oacute;w niniejszej klauzuli \"Informacje poufne\" oznaczają informacje o działalności Sp&oacute;łki oraz o jej klientach, kt&oacute;re nie są dostępne dla og&oacute;łu społeczeństwa i kt&oacute;re mogą być przez Państwa w trakcie zatrudnienia dowiedzione przez Państwa. Obejmuje to,</p>\n            \n            <p>ale nie ogranicza się do informacji związanych z organizacją, jej listami klient&oacute;w, politykami zatrudnienia, personelem oraz informacjami o produktach firmy, procesach, w tym pomysłach, koncepcjach, projekcjach, technikach, podręcznikach, rysunkach, projektach,&nbsp;</p>\n            \n            <p>specyfikacje, a także wszystkie dokumenty, życiorysy, zapisy i inne dokumenty zawierające takie informacje poufne.</p>\n            \n            <p>11.3 W żadnym momencie nie usunie Pan żadnych Informacji Poufnych z urzędu bez zezwolenia.</p>\n            \n            <p>11.4 Tw&oacute;j obowiązek ochrony a nie disclos</p>\n            \n            <p>Informacje poufne przetrwają wygaśnięcie lub rozwiązanie niniejszej Umowy i/lub Twoje zatrudnienie w Sp&oacute;łce.</p>\n            \n            <p>11.5 Naruszenie warunk&oacute;w niniejszej klauzuli spowoduje, że Użytkownik będzie zobowiązany do skr&oacute;conej umowy w ramach klauzuli powyżej, opr&oacute;cz wszelkich innych środk&oacute;w zaradcze, jakie Sp&oacute;łka może mieć przeciwko Państwu w prawie.</p>\n            \n            \n            \n            <p>12. Uwagi</p>\n            \n            <p>Ogłoszenia mogą być podane przez Państwa do Sp&oacute;łki pod adresem jej siedziby. Ogłoszenia mogą być podane przez Sp&oacute;łkę do Państwa na adres intymniony przez Państwa w ewidencji urzędowej.</p>\n            \n            \n            \n            <p>13. Stosowność polityki firmy</p>\n            \n            <p>Sp&oacute;łka jest uprawniona do składania deklaracji politycznych od czasu do czasu dotyczących spraw takich jak prawo do urlopu macierzyńskiego, macierzyństwo</p>\n            \n            <p>urlop&oacute;w, świadczeń pracowniczych, godzin pracy, polityki transferowej itp., a także mogą zmieniać to samo od czasu do czasu według własnego uznania.</p>\n            \n            <p>Wszystkie takie decyzje polityczne Sp&oacute;łki są wiążące dla Państwa i przesłaniają niniejszą Umowę w tym zakresie.</p>\n            \n            \n            \n            <p>14. Prawo właściwe/jurysdykcja</p>\n            \n            <p>Twoje zatrudnienie ze Sp&oacute;łką podlega prawu krajowi. Wszelkie spory podlegają właściwości Sądu Najwyższego</p>\n            \n            <p>Tylko Gujarat.</p>\n            \n            \n            \n            <p>15. Akceptacja naszej oferty</p>\n            \n            <p>Prosimy o potwierdzenie przyjęcia niniejszej Umowy o pracę poprzez podpisanie i zwr&oacute;cenie duplikatu.</p>\n            \n            \n            \n            <p>Zapraszamy Państwa i czekamy na Państwa przyjęcie i wsp&oacute;łpracę z Tobą.</p>\n            \n            \n            \n            <p>Z Państwa Sincerely,</p>\n            \n            <p>{app_name }</p>\n            \n            <p>{date }</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(12, 'pt', '<h3 style=\"text-align: center;\">Carta De Ades&atilde;o</h3>\n            \n            <p>{data}</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{address}</p>\n            \n            \n            <p>Assunto: Nomea&ccedil;&atilde;o para o cargo de {designation}</p>\n            \n            <p>Querido {employee_name},</p>\n            \n            \n            <p>Temos o prazer de oferec&ecirc;-lo, a posi&ccedil;&atilde;o de {designation} com {app_name} a Empresa nos seguintes termos e</p>\n            <p>condi&ccedil;&otilde;es:</p>\n            \n            \n            <p>1. Comentamento do emprego</p>\n            \n            <p>Seu emprego ser&aacute; efetivo, a partir de {start_date}</p>\n            \n            \n            <p>2. T&iacute;tulo do emprego</p>\n            \n            <p>Seu cargo de trabalho ser&aacute; {designation}.</p>\n            \n            <p>3. Sal&aacute;rio</p>\n            \n            <p>Seu sal&aacute;rio e outros benef&iacute;cios ser&atilde;o conforme estabelecido no Planejamento 1, hereto.</p>\n            \n            <p>4. Local de postagem</p>\n            \n            <p>Voc&ecirc; ser&aacute; postado em {branch}. Voc&ecirc; pode, no entanto, ser obrigado a trabalhar em qualquer local de neg&oacute;cios que a Empresa tenha, ou possa posteriormente adquirir.</p>\n            \n            <p>5. Horas de Trabalho</p>\n            \n            <p>Os dias normais de trabalho s&atilde;o de segunda a sexta-feira. Voc&ecirc; ser&aacute; obrigado a trabalhar por tais horas, conforme necess&aacute;rio para a quita&ccedil;&atilde;o adequada de suas fun&ccedil;&otilde;es para a Companhia. As horas de trabalho normais s&atilde;o de {start_time} para {end_time} e voc&ecirc; deve trabalhar n&atilde;o menos de {total_horas} horas semanais, e se necess&aacute;rio para horas adicionais dependendo do seu</p>\n            <p>responsabilidades.</p>\n            \n            <p>6. Leave / Holidays</p>\n            \n            <p>6,1 Voc&ecirc; tem direito a licen&ccedil;a casual de 12 dias.</p>\n            \n            <p>6,2 Voc&ecirc; tem direito a 12 dias &uacute;teis de licen&ccedil;a remunerada remunerada.</p>\n            \n            <p>6,3 Companhia notificar&aacute; uma lista de feriados declarados no in&iacute;cio de cada ano.&nbsp;</p>\n            \n            \n            \n            <p>7. Natureza dos deveres</p>\n            \n            <p>Voc&ecirc; ir&aacute; executar ao melhor da sua habilidade todos os deveres como s&atilde;o inerentes ao seu cargo e tais deveres adicionais como a empresa pode ligar sobre voc&ecirc; para executar, de tempos em tempos. Os seus deveres espec&iacute;ficos s&atilde;o estabelecidos no Hereto do Planejamento II.</p>\n            \n            \n            \n            <p>8. Propriedade da empresa</p>\n            \n            <p>Voc&ecirc; sempre manter&aacute; em bom estado propriedade Empresa, que poder&aacute; ser confiada a voc&ecirc; para uso oficial durante o curso de</p>\n            \n            <p>o seu emprego, e devolver&aacute; toda essa propriedade &agrave; Companhia antes de abdicar de sua acusa&ccedil;&atilde;o, falhando qual o custo do mesmo ser&aacute; recuperado de voc&ecirc; pela Companhia.</p>\n            \n            \n            \n            <p>9. Borremir / aceitar presentes</p>\n            \n            <p>Voc&ecirc; n&atilde;o vai pedir empr&eacute;stimo ou aceitar qualquer dinheiro, presente, recompensa ou indeniza&ccedil;&atilde;o por seus ganhos pessoais de ou de outra forma colocar-se sob obriga&ccedil;&atilde;o pecuni&aacute;ria a qualquer pessoa / cliente com quem voc&ecirc; pode estar tendo rela&ccedil;&otilde;es oficiais.</p>\n            \n            \n            \n            <p>10. Termina&ccedil;&atilde;o</p>\n            \n            <p>10,1 Sua nomea&ccedil;&atilde;o pode ser rescindida pela Companhia, sem qualquer raz&atilde;o, dando-lhe n&atilde;o menos do que [aviso] meses de aviso pr&eacute;vio por escrito ou de sal&aacute;rio em lieu deste. Para efeito da presente cl&aacute;usula, o sal&aacute;rio deve significar sal&aacute;rio base.</p>\n            \n            <p>10,2 Voc&ecirc; pode rescindir seu emprego com a Companhia, sem qualquer causa, ao dar nada menos que [Aviso de contrata&ccedil;&atilde;o] meses de aviso pr&eacute;vio ou sal&aacute;rio para o per&iacute;odo n&atilde;o salvo, deixado ap&oacute;s ajuste de folhas pendentes, conforme data de encontro.</p>\n            \n            <p>10,3 Empresa reserva-se o direito de rescindir o seu emprego sumariamente sem qualquer prazo de aviso ou de rescis&atilde;o se tiver terreno razo&aacute;vel para acreditar que voc&ecirc; &eacute; culpado de m&aacute; conduta ou neglig&ecirc;ncia, ou tenha cometido qualquer viola&ccedil;&atilde;o fundamental de contrato, ou tenha causado qualquer perda para a Empresa.&nbsp;</p>\n            \n            <p>10. 4 Sobre a rescis&atilde;o do seu emprego por qualquer motivo, voc&ecirc; retornar&aacute; para a Empresa todos os bens; documentos e&nbsp;</p>\n            \n            <p>papel, tanto originais como c&oacute;pias dos mesmos, incluindo quaisquer amostras, literatura, contratos, registros, listas, desenhos, plantas,</p>\n            \n            <p>cartas, notas, dados e semelhantes; e Informa&ccedil;&otilde;es Confidenciais, em sua posse ou sob seu controle relacionado ao seu emprego ou aos neg&oacute;cios de neg&oacute;cios dos clientes.&nbsp; &nbsp;</p>\n            \n            \n            \n            <p>11. Informa&ccedil;&otilde;es Confidenciais</p>\n            \n            <p>11. 1 Durante o seu emprego com a Companhia voc&ecirc; ir&aacute; dedicar todo o seu tempo, aten&ccedil;&atilde;o e habilidade para o melhor de sua capacidade de</p>\n            \n            <p>o seu neg&oacute;cio. Voc&ecirc; n&atilde;o deve, direta ou indiretamente, se envolver ou associar-se com, estar conectado com, preocupado, empregado, ou tempo ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do Company.engajado em qualquer outro neg&oacute;cio ou atividades ou qualquer outro cargo ou trabalho parcial ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do</p>\n            \n            <p>Empresa.</p>\n            \n            <p>11,2 &Eacute; preciso manter sempre o mais alto grau de confidencialidade e manter como confidenciais os registros, documentos e outros&nbsp;</p>\n            \n            <p>Informa&ccedil;&otilde;es confidenciais relativas ao neg&oacute;cio da Companhia que possam ser conhecidas por voc&ecirc; ou confiadas em voc&ecirc; por qualquer meio e utilizar&atilde;o tais registros, documentos e informa&ccedil;&otilde;es apenas de forma devidamente autorizada no interesse da Companhia. Para efeitos da presente cl&aacute;usula \"Informa&ccedil;&otilde;es confidenciais\" significa informa&ccedil;&atilde;o sobre os neg&oacute;cios da Companhia e a dos seus clientes que n&atilde;o est&aacute; dispon&iacute;vel para o p&uacute;blico em geral e que poder&aacute; ser aprendida por voc&ecirc; no curso do seu emprego. Isso inclui,</p>\n            \n            <p>mas n&atilde;o se limita a, informa&ccedil;&otilde;es relativas &agrave; organiza&ccedil;&atilde;o, suas listas de clientes, pol&iacute;ticas de emprego, pessoal, e informa&ccedil;&otilde;es sobre os produtos da Companhia, processos incluindo ideias, conceitos, proje&ccedil;&otilde;es, tecnologia, manuais, desenho, desenhos,&nbsp;</p>\n            \n            <p>especifica&ccedil;&otilde;es, e todos os pap&eacute;is, curr&iacute;culos, registros e outros documentos que contenham tais Informa&ccedil;&otilde;es Confidenciais.</p>\n            \n            <p>11,3 Em nenhum momento, voc&ecirc; remover&aacute; quaisquer Informa&ccedil;&otilde;es Confidenciais do escrit&oacute;rio sem permiss&atilde;o.</p>\n            \n            <p>11,4 O seu dever de salvaguardar e n&atilde;o os desclos</p>\n            \n            <p>Informa&ccedil;&otilde;es Confidenciais sobreviver&atilde;o &agrave; expira&ccedil;&atilde;o ou &agrave; rescis&atilde;o deste Contrato e / ou do seu emprego com a Companhia.</p>\n            \n            <p>11,5 Viola&ccedil;&atilde;o das condi&ccedil;&otilde;es desta cl&aacute;usula ir&aacute; torn&aacute;-lo sujeito a demiss&atilde;o sum&aacute;ria sob a cl&aacute;usula acima, al&eacute;m de qualquer outro rem&eacute;dio que a Companhia possa ter contra voc&ecirc; em lei.</p>\n            \n            \n            \n            <p>12. Notices</p>\n            \n            <p>Os avisos podem ser conferidos por voc&ecirc; &agrave; Empresa em seu endere&ccedil;o de escrit&oacute;rio registrado. Os avisos podem ser conferidos pela Companhia a voc&ecirc; no endere&ccedil;o intimado por voc&ecirc; nos registros oficiais.</p>\n            \n            \n            \n            <p>13. Aplicabilidade da Pol&iacute;tica da Empresa</p>\n            \n            <p>A Companhia tem direito a fazer declara&ccedil;&otilde;es de pol&iacute;tica de tempos em tempos relativos a mat&eacute;rias como licen&ccedil;a de licen&ccedil;a, maternidade</p>\n            \n            <p>sair, benef&iacute;cios dos empregados, horas de trabalho, pol&iacute;ticas de transfer&ecirc;ncia, etc., e pode alterar o mesmo de vez em quando a seu exclusivo crit&eacute;rio.</p>\n            \n            <p>Todas essas decis&otilde;es de pol&iacute;tica da Companhia devem ser vinculativas para si e substituir&atilde;o este Acordo nessa medida.</p>\n            \n            \n            \n            <p>14. Direito / Jurisdi&ccedil;&atilde;o</p>\n            \n            <p>Seu emprego com a Companhia est&aacute; sujeito &agrave;s leis do Pa&iacute;s. Todas as disputas est&atilde;o sujeitas &agrave; jurisdi&ccedil;&atilde;o do Tribunal Superior</p>\n            \n            <p>Gujarat apenas.</p>\n            \n            \n            \n            <p>15. Aceita&ccedil;&atilde;o da nossa oferta</p>\n            \n            <p>Por favor, confirme sua aceita&ccedil;&atilde;o deste Contrato de Emprego assinando e retornando a c&oacute;pia duplicada.</p>\n            \n            \n            \n            <p>N&oacute;s acolhemos voc&ecirc; e estamos ansiosos para receber sua aceita&ccedil;&atilde;o e para trabalhar com voc&ecirc;.</p>\n            \n            \n            \n            <p>Seu Sinceramente,</p>\n            \n            <p>{app_name}</p>\n            \n            <p>{data}</p>\n            ', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(13, 'ru', '<h3 style=\"text-align: center;\">Присоединение к письму</h3>\n            \n            <p>{date}</p>\n            \n            <p>{ employee_name }</p>\n            <p>{address}</p>\n            \n            <p>Тема: Назначение на должность {designation}</p>\n            \n            <p>Уважаемый { employee_name },</p>\n            \n            <p>Мы рады предложить Вам, позицию {designation} с { app_name } Компания на следующих условиях и</p>\n            \n            <p>условия:</p>\n            \n            \n            <p>1. Начало работы</p>\n            \n            <p>Ваше трудоустройство будет эффективным, начиная с { start_date }</p>\n            \n            \n            <p>2. Название должности</p>\n            <p>Ваш заголовок задания будет {designation}.</p>\n            \n            <p>3. Зарплата</p>\n            <p>Ваши оклады и другие пособия будут установлены в соответствии с расписанием, изложенным в приложении 1 к настоящему.</p>\n            \n            <p>4. Место размещения</p>\n            <p>Вы будете работать в { branch }. Вы, однако, можете работать в любом месте, которое компания имеет или может впоследствии приобрести.</p>\n            \n            \n            \n            <p>5. Часы работы</p>\n            <p>Обычные рабочие дни-с понедельника по пятницу. Вы должны будете работать в течение таких часов, как это необходимо для надлежащего выполнения Ваших обязанностей перед компанией. Обычные рабочие часы-от { start_time } до { end_time }, и вы, как ожидается, будут работать не менее { total_hours } часов каждую неделю, и при необходимости в течение дополнительных часов в зависимости от вашего</p>\n            <p>ответственности.</p>\n            <p>6. Отпуск/Праздники</p>\n            \n            <p>6.1 Вы имеете право на случайный отпуск продолжительностью 12 дней.</p>\n            \n            <p>6.2 Вы имеете право на 12 рабочих дней оплачиваемого отпуска по болезни.</p>\n            \n            <p>6.3 Компания в начале каждого года уведомляет об объявленных праздниках.&nbsp;</p>\n            \n            \n            \n            <p>7. Характер обязанностей</p>\n            \n            <p>Вы будете выполнять все обязанности, присующие вам, и такие дополнительные обязанности, которые компания может призвать к вам, время от времени. Ваши конкретные обязанности изложены в приложении II к настоящему.</p>\n            \n            \n            \n            <p>8. Свойство компании</p>\n            \n            <p>Вы всегда будете поддерживать в хорошем состоянии имущество Компании, которое может быть доверено Вам для служебного пользования в течение</p>\n            \n            <p>вашей занятости, и возвратит все это имущество Компании до отказа от вашего заряда, при отсутствии которого стоимость одного и того же имущества будет взыскана с Вас компанией.</p>\n            \n            \n            \n            <p>9. Боровить/принять подарки</p>\n            \n            <p>Вы не будете брать взаймы или принимать какие-либо деньги, подарки, вознаграждение или компенсацию за ваши личные доходы от или в ином месте под денежный долг любому лицу/клиенту, с которым у вас могут быть официальные сделки.</p>\n            \n            \n            \n            <p>10. Прекращение</p>\n            \n            <p>10.1 Ваше назначение может быть прекращено компанией без каких бы то ни было оснований, предоставляя Вам не менее [ Уведомление] месяцев, предшея уведомлению в письменной форме или окладе вместо них. Для целей этого положения заработная плата означает базовый оклад.</p>\n            \n            <p>10.2 Вы можете прекратить свою трудовую деятельность с компанией без каких-либо причин, предоставляя не меньше, чем [ Employee Notice] months  предварительное уведомление или оклад за несохраненный период, оставатся после корректировки отложенных листьев, как на сегодняшний день.</p>\n            \n            <p>10.3 Компания оставляет за собой право прекратить вашу работу в суммарном порядке без какого-либо уведомления о сроке или увольнении, если у нее есть достаточные основания полагать, что вы виновны в проступке или халатности, или совершили какое-либо существенное нарушение договора, или причинило убытки Компании.&nbsp;</p>\n            \n            <p>10. 4 О прекращении вашей работы по какой бы то ни было причине вы вернетесь в Компании все имущество; документы, а&nbsp;</p>\n            \n            <p>бумаги, как оригинальные, так и их копии, включая любые образцы, литературу, контракты, записи, списки, чертежи, чертежи,</p>\n            \n            <p>письма, заметки, данные и тому подобное; и Конфиденциальная информация, в вашем распоряжении или под вашим контролем, связанным с вашей работой или деловыми делами клиентов.&nbsp; &nbsp;</p>\n            \n            \n            \n            <p>11. Конфиденциальная информация</p>\n            \n            <p>11. 1 Во время вашего трудоустройства с компанией Вы посвяте все свое время, внимание, умение максимально</p>\n            \n            <p>Его бизнес. Вы не должны, прямо или косвенно, заниматься или ассоциировать себя с заинтересованными, занятым, занятым, или временем, или продолжать любой курс обучения, без предварительного разрешения Компани.заниматься каким-либо другим бизнесом или деятельностью или любой другой пост или работать неполный рабочий день или заниматься какой бы то ни было исследованием, без предварительного разрешения</p>\n            \n            <p>Компания.</p>\n            \n            <p>11.2 Вы всегда должны сохранять наивысшую степень конфиденциальности и хранить в качестве конфиденциальной записи, документы и другие&nbsp;</p>\n            \n            <p>Конфиденциальная информация, касающаяся бизнеса Компании, которая может быть вам известна или конфиденциальна любым способом, и Вы будете использовать такие записи, документы и информацию только в установленном порядке в интересах Компании. Для целей настоящей статьи \"Конфиденциальная информация\" означает информацию о бизнесе Компании и о ее клиентах, которая недоступна для широкой общественности и которая может быть изучилась Вами в ходе вашей работы. Это включает в себя:</p>\n            \n            <p>но не ограничивается информацией, касающейся организации, ее списков клиентов, политики в области занятости, персонала и информации о продуктах Компании, процессах, включая идеи, концепции, прогнозы, технологии, руководства, чертеж, чертеж,&nbsp;</p>\n            \n            <p>спецификации, и все бумаги, резюме, записи и другие документы, содержащие такую Конфиденциальную Информацию.</p>\n            \n            <p>11.3 В любое время вы не будете удалять конфиденциальную информацию из офиса без разрешения.</p>\n            \n            <p>11.4 Ваш долг защищать и не отсосать</p>\n            \n            <p>e Конфиденциальная информация выдержит срок действия или прекращения действия настоящего Соглашения и/или вашей работы с компанией.</p>\n            \n            <p>11.5 Нарушение условий, изложенных в настоящем положении, приведет к тому, что в дополнение к любым другим средствам правовой защиты, которые компания может иметь против вас, в соответствии с вышеприведенным положением, вы можете получить краткое увольнение в соответствии с этим положением.</p>\n            \n            \n            \n            <p>12. Замечания</p>\n            \n            <p>Уведомления могут быть даны Вами Компании по адресу ее зарегистрированного офиса. Извещения могут быть даны компанией Вам по адресу, с которым вы в официальных отчетах.</p>\n            \n            \n            \n            <p>13. Применимость политики компании</p>\n            \n            <p>Компания вправе время от времени делать политические заявления по таким вопросам, как право на отпуск, материнство</p>\n            \n            <p>отпуска, пособия для работников, продолжительность рабочего дня, трансферная политика и т.д. и время от времени могут изменяться исключительно по своему усмотрению.</p>\n            \n            <p>Все такие принципиальные решения Компании являются обязательными для Вас и переопределяют это Соглашение в такой степени.</p>\n            \n            \n            \n            <p>14. Регулирующий Право/юрисдикция</p>\n            \n            <p>Ваше трудоустройство с компанией подпадает под действие законов страны. Все споры подлежат юрисдикции Высокого суда</p>\n            \n            <p>Только Гуджарат.</p>\n            \n            \n            \n            <p>15. Принятие нашего предложения</p>\n            \n            <p>Пожалуйста, подтвердите свое согласие с этим Договором о занятости, подписав и возвращая дубликат копии.</p>\n            \n            \n            \n            <p>Мы приветствуем Вас и надеемся на то, что Вы принимаете свое согласие и работаете с Вами.</p>\n            \n            \n            \n            <p>Искренне Ваш,</p>\n            \n            <p>{ app_name }</p>\n            \n            <p>{date}</p>\n            ', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_sections`
--

CREATE TABLE `landing_page_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(191) NOT NULL,
  `section_order` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `section_type` enum('section-1','section-2','section-3','section-4','section-5','section-6','section-7','section-8','section-9','section-10','section-plan') NOT NULL,
  `default_content` text NOT NULL,
  `section_demo_image` text NOT NULL,
  `section_blade_file_name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `applied_on` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_leave_days` varchar(191) NOT NULL,
  `leave_reason` varchar(191) NOT NULL,
  `remark` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `employee_id`, `leave_type_id`, `applied_on`, `start_date`, `end_date`, `total_leave_days`, `leave_reason`, `remark`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 8, 1, '2024-09-09', '2024-09-09', '2024-09-10', '1', 'VIRAL FEVER AND FLUE', 'APPROVED', 'Approved', 1, '2024-09-09 05:29:50', '2024-09-09 05:32:05'),
(4, 6, 3, '2024-09-09', '2024-09-08', '2024-09-10', '2', 'FAMILY ISSUE', 'FAMILY ISSUE', 'Approved', 1, '2024-09-09 05:32:50', '2024-09-09 05:35:34'),
(5, 3, 1, '2024-09-09', '2024-09-08', '2024-09-09', '1', 'FEVER AND UPSET STOMACH', 'FEVER AND UPSET STOMACH', 'Approved', 1, '2024-09-09 05:33:53', '2024-09-09 05:34:04'),
(6, 4, 1, '2024-09-10', '2024-09-09', '2024-09-10', '1', 'Fever', 'Fever', 'Approved', 1, '2024-09-10 08:45:09', '2024-09-10 08:48:02'),
(7, 4, 3, '2024-09-10', '2024-09-04', '2024-09-06', '2', 'Wedding', 'Wedding', 'Approved', 1, '2024-09-10 08:45:57', '2024-09-10 08:48:20'),
(8, 5, 1, '2024-09-10', '2024-09-08', '2024-09-13', '5', 'Fever and Allergy', 'Fever and Allergy', 'Approved', 1, '2024-09-10 08:47:51', '2024-09-15 04:42:05'),
(9, 11, 3, '2024-09-15', '2024-09-15', '2024-09-16', '1', 'Family Reason', 'Family Reason', 'Approved', 1, '2024-09-15 04:42:54', '2024-09-15 04:44:07'),
(10, 4, 1, '2024-09-15', '2024-09-12', '2024-09-13', '1', 'Physical Sickness', 'Physical Sickness', 'Approved', 1, '2024-09-15 04:43:54', '2024-09-15 04:44:18'),
(11, 18, 3, '2024-09-25', '2024-09-22', '2024-09-23', '1', 'Home issue', 'Home issue', 'Approved', 1, '2024-09-25 10:48:02', '2024-09-25 10:48:53'),
(12, 11, 1, '2024-09-25', '2024-09-22', '2024-09-23', '1', 'Dysentery', 'Dysentery', 'Approved', 1, '2024-09-25 10:48:43', '2024-09-25 10:49:15'),
(13, 13, 3, '2024-10-01', '2024-09-29', '2024-09-30', '1', 'Studay at home', 'Studay at home', 'Approved', 1, '2024-10-01 05:27:02', '2024-10-01 05:27:15'),
(14, 13, 1, '2024-10-01', '2024-09-01', '2024-09-02', '1', 'Viral Flu', 'Viral Flu', 'Approved', 1, '2024-10-01 05:29:02', '2024-10-01 05:29:36'),
(15, 4, 1, '2024-10-15', '2024-10-15', '2024-10-16', '1', 'Medical Issue', 'Medical Issue', 'Approved', 1, '2024-10-15 05:13:29', '2024-10-15 05:42:12'),
(17, 2, 1, '2024-10-15', '2024-10-14', '2024-10-16', '2', 'medical check up', 'medical check up', 'Approved', 1, '2024-10-15 05:37:43', '2024-10-15 05:42:45'),
(18, 9, 3, '2024-10-15', '2024-10-08', '2024-10-09', '1', 'Wife Sick', 'Wife Sick', 'Approved', 1, '2024-10-15 05:41:29', '2024-10-15 05:43:03'),
(19, 18, 3, '2024-10-15', '2024-10-06', '2024-10-10', '4', 'Home emergency', 'Home emergency', 'Approved', 1, '2024-10-15 05:44:34', '2024-10-15 05:44:54'),
(20, 2, 3, '2024-10-17', '2024-10-16', '2024-10-17', '1', 'Lift issue', 'Lift issue', 'Approved', 1, '2024-10-17 05:49:57', '2024-10-20 06:17:29'),
(21, 11, 3, '2024-10-20', '2024-10-20', '2024-10-21', '1', 'Wife Sick', 'Wife Sick', 'Approved', 1, '2024-10-20 06:12:22', '2024-10-20 06:12:34'),
(22, 8, 1, '2024-10-21', '2024-10-21', '2024-10-22', '1', 'Bike Accident', 'Bike Accident', 'Approved', 1, '2024-10-21 09:21:01', '2024-10-21 09:21:39'),
(23, 4, 3, '2024-11-25', '2024-11-03', '2024-11-04', '1', 'Family reason', 'Casual', 'Approved', 1, '2024-11-25 04:28:35', '2024-11-25 04:31:08'),
(24, 11, 3, '2024-11-25', '2024-11-24', '2024-11-25', '1', 'Family issue', 'Brother is missing', 'Approved', 1, '2024-11-25 04:29:11', '2024-11-25 04:33:11'),
(25, 6, 3, '2024-11-25', '2024-11-21', '2024-11-22', '1', 'Traffic jam at MOHAKHALI', 'Traffic jam at MOHAKHALI', 'Approved', 1, '2024-11-25 04:29:47', '2024-11-25 04:33:23'),
(26, 3, 3, '2024-11-25', '2024-11-24', '2024-11-25', '1', 'Family issue', 'Family issue.', 'Approved', 1, '2024-11-25 04:30:51', '2024-11-25 04:33:35'),
(27, 13, 3, '2024-11-25', '2024-11-19', '2024-11-20', '1', 'feeling not well', 'feeling not well', 'Approved', 1, '2024-11-25 04:33:01', '2024-11-25 04:33:46'),
(28, 7, 3, '2024-11-25', '2024-11-24', '2024-11-25', '1', 'Outside of Dhaka', 'Outside of Dhaka', 'Approved', 1, '2024-11-25 04:34:36', '2024-11-25 04:34:52'),
(29, 3, 1, '2024-11-25', '2024-10-24', '2024-11-07', '14', 'Sick leave for dengue', 'Dengue', 'Approved', 1, '2024-11-25 04:35:58', '2024-11-25 04:37:03'),
(30, 3, 3, '2024-11-25', '2024-11-10', '2024-11-14', '4', 'Dengue recovery', 'NEED rest for dengue recovery', 'Approved', 1, '2024-11-25 04:36:53', '2024-11-25 04:37:15'),
(31, 21, 3, '2024-12-05', '2024-12-04', '2024-12-05', '1', 'personal issue', 'personal issue', 'Approved', 1, '2024-12-05 05:09:41', '2024-12-10 08:58:54'),
(32, 4, 1, '2024-12-10', '2024-12-09', '2024-12-10', '1', 'SICK', 'SICK', 'Approved', 1, '2024-12-10 08:09:04', '2024-12-29 08:18:22'),
(33, 20, 3, '2024-12-22', '2024-12-15', '2024-12-17', '2', 'tour', 'tour', 'Approved', 1, '2024-12-22 10:25:54', '2024-12-22 10:27:12'),
(34, 8, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'VISIT FAMILY', 'VISIT FAMILY', 'Approved', 1, '2024-12-29 08:04:35', '2024-12-29 08:06:46'),
(35, 6, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'FAMILY PURPOSE', 'FAMILY PURPOSE', 'Approved', 1, '2024-12-29 08:05:06', '2024-12-29 08:07:02'),
(36, 12, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'FAMILY', 'FAMILY', 'Approved', 1, '2024-12-29 08:05:38', '2024-12-29 08:07:16'),
(37, 10, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'FAMILY', 'FAMILY', 'Approved', 1, '2024-12-29 08:06:29', '2024-12-29 08:07:29'),
(38, 4, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'ABCENT', 'ABCENT', 'Approved', 1, '2024-12-29 08:08:16', '2024-12-29 08:15:32'),
(39, 19, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'CASUAL', 'CASUAL', 'Approved', 1, '2024-12-29 08:13:01', '2024-12-29 08:15:44'),
(40, 9, 3, '2024-12-29', '2024-12-26', '2024-12-27', '1', 'CASUAL', 'CASUAL', 'Approved', 1, '2024-12-29 08:15:21', '2024-12-29 08:15:56'),
(41, 3, 3, '2024-12-29', '2024-12-15', '2024-12-16', '1', 'FAMILY', 'FAMILY', 'Approved', 1, '2024-12-29 08:16:59', '2024-12-29 08:17:07'),
(42, 10, 3, '2025-01-13', '2025-01-05', '2025-01-07', '2', 'Family Doctor issue', 'Family Doctor issue', 'Approved', 1, '2025-01-13 05:38:58', '2025-01-13 05:39:15'),
(43, 12, 3, '2025-01-13', '2025-01-05', '2025-01-06', '1', 'Family issue', 'Family issue', 'Approved', 1, '2025-01-13 05:40:30', '2025-01-13 05:40:45'),
(44, 6, 3, '2025-01-21', '2025-01-19', '2025-01-20', '1', 'Family tour', 'Family tour', 'Approved', 1, '2025-01-21 04:36:22', '2025-01-26 09:50:35'),
(45, 12, 3, '2025-01-21', '2025-01-19', '2025-01-20', '1', 'travel', 'travel', 'Approved', 1, '2025-01-21 04:36:48', '2025-01-26 09:50:54'),
(46, 3, 3, '2025-01-21', '2025-01-19', '2025-01-20', '1', 'family', 'family', 'Approved', 1, '2025-01-21 04:38:05', '2025-01-26 09:51:14'),
(47, 1, 3, '2025-01-26', '2025-01-26', '2025-01-27', '1', 'FAMILY', 'FAMILY', 'Approved', 1, '2025-01-26 09:49:06', '2025-01-26 09:51:28'),
(48, 1, 3, '2025-02-13', '2025-02-12', '2025-02-14', '2', 'Family issue (wedding)', 'Family issue (wedding)', 'Approved', 1, '2025-02-13 06:52:13', '2025-02-13 06:52:58'),
(49, 1, 3, '2025-02-13', '2024-11-17', '2024-11-18', '1', 'personal reason', 'personal reason', 'Approved', 1, '2025-02-13 06:54:08', '2025-02-13 08:07:34'),
(50, 21, 3, '2025-02-13', '2025-02-16', '2025-02-18', '2', 'PERSONAL REASON', 'PERSONAL REASON', 'Approved', 1, '2025-02-13 08:07:02', '2025-02-13 08:07:56'),
(51, 13, 3, '2025-02-13', '2025-02-13', '2025-02-14', '1', 'without inform', 'without inform', 'Approved', 1, '2025-02-13 10:29:10', '2025-02-13 10:29:26'),
(52, 9, 3, '2025-02-18', '2025-02-18', '2025-02-19', '1', 'operation of brother-in-law', 'operation of brother-in-law', 'Approved', 1, '2025-02-18 05:06:30', '2025-02-18 05:07:27'),
(53, 20, 1, '2025-02-18', '2025-02-18', '2025-02-19', '1', 'fever', 'fever', 'Approved', 1, '2025-02-18 05:07:06', '2025-02-18 05:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `days` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `title`, `days`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sick', 14, 1, '2024-08-27 06:18:41', '2024-08-27 06:18:41'),
(2, 'Annual Leave', 18, 1, '2024-08-28 08:01:50', '2024-08-28 08:01:50'),
(3, 'Casual Leave', 10, 1, '2024-08-28 08:02:19', '2024-08-28 08:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_option` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_options`
--

CREATE TABLE `loan_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` longtext NOT NULL,
  `employee_id` longtext NOT NULL,
  `title` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `branch_id`, `department_id`, `employee_id`, `title`, `date`, `time`, `note`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 0, '[\"0\"]', '[\"0\"]', 'TEST MEETING', '2025-02-25', '11:00:00', 'Meeting note', 1, '2025-02-24 11:38:17', '2025-02-24 11:38:17'),
(3, 1, '[\"1\"]', '[\"0\"]', 'Technical meeting', '2025-02-24', '13:00:00', 'Technical meeting', 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(4, 1, '[\"2\"]', '[\"0\"]', 'Sales Meeting', '2025-02-25', '14:00:00', 'sales meeting', 1, '2025-02-24 11:46:35', '2025-02-24 11:46:35'),
(5, 1, '[\"7\"]', '[\"0\"]', 'Management Meeting', '2025-02-24', '17:00:00', 'Management Meeting', 1, '2025-02-24 11:52:31', '2025-02-24 11:52:31'),
(7, 0, '[\"0\"]', '[\"0\"]', 'test11', '2025-02-26', '10:43:00', 'test11', 1, '2025-02-24 12:43:24', '2025-02-24 12:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_employees`
--

CREATE TABLE `meeting_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meeting_employees`
--

INSERT INTO `meeting_employees` (`id`, `meeting_id`, `employee_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(2, 3, 2, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(3, 3, 4, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(4, 3, 5, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(5, 3, 6, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(6, 3, 12, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(7, 3, 20, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(8, 3, 21, 1, '2025-02-24 11:40:29', '2025-02-24 11:40:29'),
(9, 4, 7, 1, '2025-02-24 11:46:35', '2025-02-24 11:46:35'),
(10, 4, 8, 1, '2025-02-24 11:46:35', '2025-02-24 11:46:35'),
(11, 4, 9, 1, '2025-02-24 11:46:35', '2025-02-24 11:46:35'),
(12, 4, 13, 1, '2025-02-24 11:46:35', '2025-02-24 11:46:35'),
(13, 4, 19, 1, '2025-02-24 11:46:35', '2025-02-24 11:46:35'),
(14, 5, 14, 1, '2025-02-24 11:52:31', '2025-02-24 11:52:31'),
(15, 5, 15, 1, '2025-02-24 11:52:31', '2025-02-24 11:52:31'),
(16, 5, 16, 1, '2025-02-24 11:52:31', '2025-02-24 11:52:31'),
(17, 5, 17, 1, '2025-02-24 11:52:31', '2025-02-24 11:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_28_102009_create_settings_table', 1),
(5, '2019_12_26_101754_create_departments_table', 1),
(6, '2019_12_26_101814_create_designations_table', 1),
(7, '2019_12_26_105721_create_documents_table', 1),
(8, '2019_12_27_083751_create_branches_table', 1),
(9, '2019_12_27_090831_create_employees_table', 1),
(10, '2019_12_27_112922_create_employee_documents_table', 1),
(11, '2019_12_28_050508_create_awards_table', 1),
(12, '2019_12_28_050919_create_award_types_table', 1),
(13, '2019_12_31_060916_create_termination_types_table', 1),
(14, '2019_12_31_062259_create_terminations_table', 1),
(15, '2019_12_31_070521_create_resignations_table', 1),
(16, '2019_12_31_072252_create_travels_table', 1),
(17, '2019_12_31_090637_create_promotions_table', 1),
(18, '2019_12_31_092838_create_transfers_table', 1),
(19, '2019_12_31_100319_create_warnings_table', 1),
(20, '2019_12_31_103019_create_complaints_table', 1),
(21, '2020_01_02_090837_create_payslip_types_table', 1),
(22, '2020_01_02_093331_create_allowance_options_table', 1),
(23, '2020_01_02_102558_create_loan_options_table', 1),
(24, '2020_01_02_103822_create_deduction_options_table', 1),
(25, '2020_01_02_110828_create_genrate_payslip_options_table', 1),
(26, '2020_01_02_111807_create_set_salaries_table', 1),
(27, '2020_01_03_084302_create_allowances_table', 1),
(28, '2020_01_03_101735_create_commissions_table', 1),
(29, '2020_01_03_105019_create_loans_table', 1),
(30, '2020_01_03_105046_create_saturation_deductions_table', 1),
(31, '2020_01_03_105100_create_other_payments_table', 1),
(32, '2020_01_03_105111_create_overtimes_table', 1),
(33, '2020_01_04_072527_create_pay_slips_table', 1),
(34, '2020_01_06_045425_create_account_lists_table', 1),
(35, '2020_01_06_062213_create_payees_table', 1),
(36, '2020_01_06_070037_create_payers_table', 1),
(37, '2020_01_06_072939_create_income_types_table', 1),
(38, '2020_01_06_073055_create_expense_types_table', 1),
(39, '2020_01_06_085218_create_deposits_table', 1),
(40, '2020_01_06_090709_create_payment_types_table', 1),
(41, '2020_01_06_121442_create_expenses_table', 1),
(42, '2020_01_06_124036_create_transfer_balances_table', 1),
(43, '2020_01_13_084720_create_events_table', 1),
(44, '2020_01_16_041720_create_announcements_table', 1),
(45, '2020_01_16_090747_create_leave_types_table', 1),
(46, '2020_01_16_093256_create_leaves_table', 1),
(47, '2020_01_16_110357_create_meetings_table', 1),
(48, '2020_01_17_051906_create_tickets_table', 1),
(49, '2020_01_17_112647_create_ticket_replies_table', 1),
(50, '2020_01_23_101613_create_meeting_employees_table', 1),
(51, '2020_01_23_123844_create_event_employees_table', 1),
(52, '2020_01_24_062752_create_announcement_employees_table', 1),
(53, '2020_01_27_052503_create_attendance_employees_table', 1),
(54, '2020_02_28_051636_create_time_sheets_table', 1),
(55, '2020_04_21_115823_create_assets_table', 1),
(56, '2020_05_01_122144_create_ducument_uploads_table', 1),
(57, '2020_05_04_070452_create_indicators_table', 1),
(58, '2020_05_05_023742_create_appraisals_table', 1),
(59, '2020_05_05_061241_create_goal_types_table', 1),
(60, '2020_05_05_095926_create_goal_trackings_table', 1),
(61, '2020_05_07_093520_create_company_policies_table', 1),
(62, '2020_05_07_131311_create_training_types_table', 1),
(63, '2020_05_08_023838_create_trainers_table', 1),
(64, '2020_05_08_043039_create_trainings_table', 1),
(65, '2020_05_21_065337_create_permission_tables', 1),
(66, '2020_07_18_065859_create_messageses_table', 1),
(67, '2020_07_22_131715_change_amount_type_size', 1),
(68, '2020_10_07_034726_create_holidays_table', 1),
(69, '2021_02_19_085311_add_ticket_created__in_tickets', 1),
(70, '2021_03_13_093312_create_ip_restricts_table', 1),
(71, '2021_03_13_114832_create_job_categories_table', 1),
(72, '2021_03_13_123125_create_job_stages_table', 1),
(73, '2021_03_15_094707_create_jobs_table', 1),
(74, '2021_03_15_153745_create_job_applications_table', 1),
(75, '2021_03_16_115140_create_job_application_notes_table', 1),
(76, '2021_03_17_163107_create_custom_questions_table', 1),
(77, '2021_03_18_140630_create_interview_schedules_table', 1),
(78, '2021_03_22_122532_create_job_on_boards_table', 1),
(79, '2021_06_22_114423_create_landing_page_sections_table', 1),
(80, '2021_08_20_084119_create_competencies_table', 1),
(81, '2021_08_21_044211_add_rating_in_competencies', 1),
(82, '2021_11_22_043537_create_performance__types_table', 1),
(83, '2021_12_24_064955_create_zoom_meetings_table', 1),
(84, '2022_03_16_064851_add_type_to_allowance', 1),
(85, '2022_06_30_120227_remove_date_from_holidays_table', 1),
(86, '2022_06_30_120525_add_start_date_to_holidays_table', 1),
(87, '2022_06_30_120542_add_end_date_to_holidays_table', 1),
(88, '2022_07_19_071401_create_email_templates_table', 1),
(89, '2022_07_19_071414_create_email_template_langs_table', 1),
(90, '2022_07_19_071557_user_email_templates_table', 1),
(91, '2022_08_03_050715_create_contract_types_table', 1),
(92, '2022_08_03_050734_create_contracts_table', 1),
(93, '2022_08_03_050752_create_contract_attechments_table', 1),
(94, '2022_08_03_050823_create_contract_comments_table', 1),
(95, '2022_08_03_050848_create_contract_notes_table', 1),
(96, '2022_08_23_043144_generate_offer_letter', 1),
(97, '2022_08_23_043307_joining_letter', 1),
(98, '2022_08_23_043319_experience_certificate', 1),
(99, '2022_08_23_043411_noc_certificate', 1),
(100, '2022_12_08_999999_add_active_status_to_users', 1),
(101, '2022_12_08_999999_add_avatar_to_users', 1),
(102, '2022_12_08_999999_add_dark_mode_to_users', 1),
(103, '2022_12_08_999999_add_messenger_color_to_users', 1),
(104, '2022_12_08_999999_create_favorites_table', 1),
(105, '2022_12_08_999999_create_messages_table', 1),
(106, '2022_12_12_061935_add_employee_id_to_assets', 1),
(107, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(108, '2025_02_25_113428_create_bg_pg_models_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 24);

-- --------------------------------------------------------

--
-- Table structure for table `noc_certificates`
--

CREATE TABLE `noc_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `noc_certificates`
--

INSERT INTO `noc_certificates` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<h3 style=\"text-align: center;\">شهادة عدم ممانعة</h3>\n            \n            \n            \n            <p>التاريخ: {date}</p>\n            \n            \n            \n            <p>إلى من يهمه الأمر</p>\n            \n            \n            \n            <p>هذه الشهادة مخصصة للمطالبة بشهادة عدم ممانعة (NoC) للسيدة / السيد {employee_name} إذا انضمت إلى أي مؤسسة أخرى وقدمت خدماتها / خدماتها. يتم إبلاغه لأنه قام بتصفية جميع أرصدته واستلام أمانه من شركة {app_name}.</p>\n            \n            \n            \n            <p>نتمنى لها / لها التوفيق في المستقبل.</p>\n            \n            \n            \n            <p>بإخلاص،</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>التوقيع</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(2, 'da', '<h3 style=\"text-align: center;\">Ingen indsigelsesattest</h3>\n            \n            \n            \n            <p>Dato: {date}</p>\n            \n            \n            \n            <p>Til hvem det m&aring;tte vedr&oslash;re</p>\n            \n            \n            \n            <p>Dette certifikat er for at g&oslash;re krav p&aring; et No Objection Certificate (NoC) for Ms. / Mr. {employee_name}, hvis hun/han tilslutter sig og leverer sine tjenester til enhver anden organisation. Det informeres, da hun/han har udlignet alle sine saldi og modtaget sin sikkerhed fra {app_name}-virksomheden.</p>\n            \n            \n            \n            <p>Vi &oslash;nsker hende/ham held og lykke i fremtiden.</p>\n            \n            \n            \n            <p>Med venlig hilsen</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Underskrift</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(3, 'de', '<h3 style=\"text-align: center;\">Kein Einwand-Zertifikat</h3>\n            \n            \n            \n            <p>Datum {date}</p>\n            \n            \n            \n            <p>Wen auch immer es betrifft</p>\n            \n            \n            \n            <p>Dieses Zertifikat soll ein Unbedenklichkeitszertifikat (NoC) f&uuml;r Frau / Herrn {employee_name} beanspruchen, wenn sie/er einer anderen Organisation beitritt und ihre/seine Dienste anbietet. Sie wird informiert, da sie/er alle ihre/seine Guthaben ausgeglichen und ihre/seine Sicherheit von der Firma {app_name} erhalten hat.</p>\n            \n            \n            \n            <p>Wir w&uuml;nschen ihr/ihm viel Gl&uuml;ck f&uuml;r die Zukunft.</p>\n            \n            \n            \n            <p>Aufrichtig,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Unterschrift</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(4, 'en', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>No Objection Certificate</strong></span></p>\n            \n            <p>Date: {date}</p>\n            \n            <p>To Whomsoever It May Concern</p>\n            \n            <p>This certificate is to claim a No Objection Certificate (NoC) for Ms. / Mr. {employee_name} if she/he joins and provides her/his services to any other organization. It is informed as she/he has cleared all her/his balances and received her/his security from {app_name} Company.</p>\n            \n            <p>We wish her/him good luck in the future.</p>\n            \n            <p>Sincerely,</p>\n            <p>{employee_name}</p>\n            <p>{designation}</p>\n            <p>Signature</p>\n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(5, 'es', '<h3 style=\"text-align: center;\">Certificado de conformidad</h3>\n            \n            \n            \n            <p>Fecha: {date}</p>\n            \n            \n            \n            <p>A quien corresponda</p>\n            \n            \n            \n            <p>Este certificado es para reclamar un Certificado de No Objeci&oacute;n (NoC) para la Sra. / Sr. {employee_name} si ella / &eacute;l se une y brinda sus servicios a cualquier otra organizaci&oacute;n. Se informa que &eacute;l/ella ha liquidado todos sus saldos y recibido su seguridad de {app_name} Company.</p>\n            \n            \n            \n            <p>Le deseamos buena suerte en el futuro.</p>\n            \n            \n            \n            <p>Sinceramente,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Firma</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(6, 'fr', '<h3 style=\"text-align: center;\">Aucun certificat dopposition</h3>\n            \n            \n            <p>Date : {date}</p>\n            \n            \n            <p>&Agrave; toute personne concern&eacute;e</p>\n            \n            \n            <p>Ce certificat sert &agrave; r&eacute;clamer un certificat de non-objection (NoC) pour Mme / M. {employee_name} sil rejoint et fournit ses services &agrave; toute autre organisation. Il est inform&eacute; quil a sold&eacute; tous ses soldes et re&ccedil;u sa garantie de la part de la soci&eacute;t&eacute; {app_name}.</p>\n            \n            \n            <p>Nous lui souhaitons bonne chance pour lavenir.</p>\n            \n            \n            <p>Sinc&egrave;rement,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Signature</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(7, 'id', '<h3 style=\"text-align: center;\">Sertifikat Tidak Keberatan</h3>\n            \n            \n            \n            <p>Tanggal: {date}</p>\n            \n            \n            \n            <p>Kepada Siapa Pun Yang Memprihatinkan</p>\n            \n            \n            \n            <p>Sertifikat ini untuk mengklaim No Objection Certificate (NoC) untuk Ibu / Bapak {employee_name} jika dia bergabung dan memberikan layanannya ke organisasi lain mana pun. Diberitahukan karena dia telah melunasi semua saldonya dan menerima jaminannya dari Perusahaan {app_name}.</p>\n            \n            \n            \n            <p>Kami berharap dia sukses di masa depan.</p>\n            \n            \n            \n            <p>Sungguh-sungguh,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Tanda tangan</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(8, 'it', '<h3 style=\"text-align: center;\">Certificato di nulla osta</h3>\n            \n            \n            \n            <p>Data: {date}</p>\n            \n            \n            \n            <p>A chi pu&ograve; interessare</p>\n            \n            \n            \n            <p>Questo certificato serve a richiedere un certificato di non obiezione (NoC) per la signora / il signor {employee_name} se si unisce e fornisce i suoi servizi a qualsiasi altra organizzazione. Viene informato in quanto ha liquidato tutti i suoi saldi e ricevuto la sua sicurezza dalla societ&agrave; {app_name}.</p>\n            \n            \n            \n            <p>Le auguriamo buona fortuna per il futuro.</p>\n            \n            \n            \n            <p>Cordiali saluti,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Firma</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(9, 'ja', '<h3 style=\"text-align: center;\">異議なし証明書</h3>\n            \n            \n            \n            <p>日付: {date}</p>\n            \n            \n            \n            <p>関係者各位</p>\n            \n            \n            \n            <p>この証明書は、Ms. / Mr. {employee_name} が他の組織に参加してサービスを提供する場合に、異議なし証明書 (NoC) を請求するためのものです。彼女/彼/彼がすべての残高を清算し、{app_name} 会社から彼女/彼のセキュリティを受け取ったことが通知されます。</p>\n            \n            \n            \n            <p>彼女/彼の今後の幸運を祈っています。</p>\n            \n            \n            \n            <p>心から、</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>サイン</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(10, 'nl', '<h3 style=\"text-align: center;\">Geen bezwaarcertificaat</h3>\n            \n            \n            \n            <p>Datum: {date}</p>\n            \n            \n            \n            <p>Aan wie het ook aangaat</p>\n            \n            \n            \n            <p>Dit certificaat is bedoeld om aanspraak te maken op een Geen Bezwaarcertificaat (NoC) voor mevrouw/dhr. {employee_name} als zij/hij lid wordt en haar/zijn diensten verleent aan een andere organisatie. Het wordt ge&iuml;nformeerd als zij/hij al haar/zijn saldos heeft gewist en haar/zijn zekerheid heeft ontvangen van {app_name} Company.</p>\n            \n            \n            \n            <p>We wensen haar/hem veel succes in de toekomst.</p>\n            \n            \n            \n            <p>Eerlijk,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Handtekening</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(11, 'pl', '<h3 style=\"text-align: center;\">Certyfikat braku sprzeciwu</h3>\n            \n            \n            \n            <p>Data: {date}</p>\n            \n            \n            \n            <p>Do kogo to może dotyczyć</p>\n            \n            \n            \n            <p>Ten certyfikat służy do ubiegania się o Certyfikat No Objection Certificate (NoC) dla Pani/Pana {employee_name}, jeśli ona/ona dołącza i świadczy swoje usługi na rzecz jakiejkolwiek innej organizacji. Jest o tym informowany, ponieważ wyczyścił wszystkie swoje salda i otrzymał swoje zabezpieczenie od firmy {app_name}.</p>\n            \n            \n            \n            <p>Życzymy jej/jej powodzenia w przyszłości.</p>\n            \n            \n            \n            <p>Z poważaniem,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Podpis</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(12, 'pt', '<h3 style=\"text-align: center;\">Certificado de n&atilde;o obje&ccedil;&atilde;o</h3>\n            \n            \n            \n            <p>Data: {date}</p>\n            \n            \n            \n            <p>A quem interessar</p>\n            \n            \n            \n            <p>Este certificado &eacute; para reivindicar um Certificado de N&atilde;o Obje&ccedil;&atilde;o (NoC) para a Sra. / Sr. {employee_name} se ela ingressar e fornecer seus servi&ccedil;os a qualquer outra organiza&ccedil;&atilde;o. &Eacute; informado que ela cancelou todos os seus saldos e recebeu sua garantia da empresa {app_name}.</p>\n            \n            \n            \n            <p>Desejamos-lhe boa sorte no futuro.</p>\n            \n            \n            \n            <p>Sinceramente,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Assinatura</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09'),
(13, 'ru', '<h3 style=\"text-align: center;\">Сертификат об отсутствии возражений</h3>\n            \n            \n            \n            <p>Дата: {date}</p>\n            \n            \n            \n            <p>Кого бы это ни касалось</p>\n            \n            \n            \n            <p>Этот сертификат предназначен для получения Сертификата об отсутствии возражений (NoC) для г-жи / г-на {employee_name}, если она / он присоединяется и предоставляет свои услуги любой другой организации. Сообщается, что она/он очистила все свои балансы и получила свою безопасность от компании {app_name}.</p>\n            \n            \n            \n            <p>Мы желаем ей/ему удачи в будущем.</p>\n            \n            \n            \n            <p>Искренне,</p>\n            \n            <p>{employee_name}</p>\n            \n            <p>{designation}</p>\n            \n            <p>Подпись</p>\n            \n            <p>{app_name}</p>', 1, '2024-08-22 03:51:09', '2024-08-22 03:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `other_payments`
--

CREATE TABLE `other_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `overtimes`
--

CREATE TABLE `overtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `number_of_days` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payees`
--

CREATE TABLE `payees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payee_name` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payers`
--

CREATE TABLE `payers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payer_name` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Vendor Payment', 1, '2024-08-28 08:10:56', '2024-08-28 08:10:56'),
(2, 'Received Payment', 1, '2024-08-28 08:11:36', '2024-08-28 08:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `payslip_types`
--

CREATE TABLE `payslip_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payslip_types`
--

INSERT INTO `payslip_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'HR and Admin', 1, '2024-08-28 08:03:56', '2024-08-28 08:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `pay_slips`
--

CREATE TABLE `pay_slips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `net_payble` int(11) NOT NULL,
  `salary_month` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `allowance` text NOT NULL,
  `commission` text NOT NULL,
  `loan` text NOT NULL,
  `saturation_deduction` text NOT NULL,
  `other_payment` text NOT NULL,
  `overtime` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performance__types`
--

CREATE TABLE `performance__types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Manage User', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(2, 'Create User', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(3, 'Edit User', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(4, 'Delete User', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(5, 'Manage Role', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(6, 'Create Role', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(7, 'Delete Role', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(8, 'Edit Role', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(9, 'Manage Award', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(10, 'Create Award', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(11, 'Delete Award', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(12, 'Edit Award', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(13, 'Manage Transfer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(14, 'Create Transfer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(15, 'Delete Transfer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(16, 'Edit Transfer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(17, 'Manage Resignation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(18, 'Create Resignation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(19, 'Edit Resignation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(20, 'Delete Resignation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(21, 'Manage Travel', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(22, 'Create Travel', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(23, 'Edit Travel', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(24, 'Delete Travel', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(25, 'Manage Promotion', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(26, 'Create Promotion', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(27, 'Edit Promotion', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(28, 'Delete Promotion', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(29, 'Manage Complaint', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(30, 'Create Complaint', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(31, 'Edit Complaint', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(32, 'Delete Complaint', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(33, 'Manage Warning', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(34, 'Create Warning', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(35, 'Edit Warning', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(36, 'Delete Warning', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(37, 'Manage Termination', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(38, 'Create Termination', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(39, 'Edit Termination', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(40, 'Delete Termination', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(41, 'Manage Department', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(42, 'Create Department', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(43, 'Edit Department', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(44, 'Delete Department', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(45, 'Manage Designation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(46, 'Create Designation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(47, 'Edit Designation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(48, 'Delete Designation', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(49, 'Manage Document Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(50, 'Create Document Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(51, 'Edit Document Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(52, 'Delete Document Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(53, 'Manage Branch', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(54, 'Create Branch', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(55, 'Edit Branch', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(56, 'Delete Branch', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(57, 'Manage Award Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(58, 'Create Award Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(59, 'Edit Award Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(60, 'Delete Award Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(61, 'Manage Termination Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(62, 'Create Termination Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(63, 'Edit Termination Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(64, 'Delete Termination Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(65, 'Manage Employee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(66, 'Create Employee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(67, 'Edit Employee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(68, 'Delete Employee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(69, 'Show Employee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(70, 'Manage Payslip Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(71, 'Create Payslip Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(72, 'Edit Payslip Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(73, 'Delete Payslip Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(74, 'Manage Allowance Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(75, 'Create Allowance Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(76, 'Edit Allowance Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(77, 'Delete Allowance Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(78, 'Manage Loan Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(79, 'Create Loan Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(80, 'Edit Loan Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(81, 'Delete Loan Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(82, 'Manage Deduction Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(83, 'Create Deduction Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(84, 'Edit Deduction Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(85, 'Delete Deduction Option', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(86, 'Manage Set Salary', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(87, 'Create Set Salary', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(88, 'Edit Set Salary', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(89, 'Delete Set Salary', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(90, 'Manage Allowance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(91, 'Create Allowance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(92, 'Edit Allowance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(93, 'Delete Allowance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(94, 'Create Commission', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(95, 'Create Loan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(96, 'Create Saturation Deduction', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(97, 'Create Other Payment', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(98, 'Create Overtime', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(99, 'Edit Commission', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(100, 'Delete Commission', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(101, 'Edit Loan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(102, 'Delete Loan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(103, 'Edit Saturation Deduction', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(104, 'Delete Saturation Deduction', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(105, 'Edit Other Payment', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(106, 'Delete Other Payment', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(107, 'Edit Overtime', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(108, 'Delete Overtime', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(109, 'Manage Pay Slip', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(110, 'Create Pay Slip', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(111, 'Edit Pay Slip', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(112, 'Delete Pay Slip', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(113, 'Manage Account List', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(114, 'Create Account List', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(115, 'Edit Account List', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(116, 'Delete Account List', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(117, 'View Balance Account List', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(118, 'Manage Payee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(119, 'Create Payee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(120, 'Edit Payee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(121, 'Delete Payee', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(122, 'Manage Payer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(123, 'Create Payer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(124, 'Edit Payer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(125, 'Delete Payer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(126, 'Manage Expense Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(127, 'Create Expense Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(128, 'Edit Expense Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(129, 'Delete Expense Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(130, 'Manage Income Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(131, 'Edit Income Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(132, 'Delete Income Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(133, 'Create Income Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(134, 'Manage Payment Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(135, 'Create Payment Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(136, 'Edit Payment Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(137, 'Delete Payment Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(138, 'Manage Deposit', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(139, 'Create Deposit', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(140, 'Edit Deposit', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(141, 'Delete Deposit', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(142, 'Manage Expense', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(143, 'Create Expense', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(144, 'Edit Expense', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(145, 'Delete Expense', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(146, 'Manage Transfer Balance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(147, 'Create Transfer Balance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(148, 'Edit Transfer Balance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(149, 'Delete Transfer Balance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(150, 'Manage Event', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(151, 'Create Event', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(152, 'Edit Event', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(153, 'Delete Event', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(154, 'Manage Announcement', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(155, 'Create Announcement', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(156, 'Edit Announcement', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(157, 'Delete Announcement', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(158, 'Manage Leave Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(159, 'Create Leave Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(160, 'Edit Leave Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(161, 'Delete Leave Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(162, 'Manage Leave', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(163, 'Create Leave', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(164, 'Edit Leave', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(165, 'Delete Leave', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(166, 'Manage Meeting', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(167, 'Create Meeting', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(168, 'Edit Meeting', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(169, 'Delete Meeting', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(170, 'Manage Ticket', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(171, 'Create Ticket', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(172, 'Edit Ticket', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(173, 'Delete Ticket', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(174, 'Manage Attendance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(175, 'Create Attendance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(176, 'Edit Attendance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(177, 'Delete Attendance', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(178, 'Manage Language', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(179, 'Create Language', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(180, 'Manage Plan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(181, 'Create Plan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(182, 'Edit Plan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(183, 'Buy Plan', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(184, 'Manage System Settings', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(185, 'Manage Company Settings', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(186, 'Manage TimeSheet', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(187, 'Create TimeSheet', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(188, 'Edit TimeSheet', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(189, 'Delete TimeSheet', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(190, 'Manage Order', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(191, 'manage coupon', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(192, 'create coupon', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(193, 'edit coupon', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(194, 'delete coupon', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(195, 'Manage Assets', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(196, 'Create Assets', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(197, 'Edit Assets', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(198, 'Delete Assets', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(199, 'Manage Document', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(200, 'Create Document', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(201, 'Edit Document', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(202, 'Delete Document', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(203, 'Manage Employee Profile', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(204, 'Show Employee Profile', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(205, 'Manage Employee Last Login', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(206, 'Manage Indicator', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(207, 'Create Indicator', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(208, 'Edit Indicator', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(209, 'Delete Indicator', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(210, 'Show Indicator', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(211, 'Manage Appraisal', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(212, 'Create Appraisal', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(213, 'Edit Appraisal', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(214, 'Delete Appraisal', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(215, 'Show Appraisal', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(216, 'Manage Goal Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(217, 'Create Goal Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(218, 'Edit Goal Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(219, 'Delete Goal Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(220, 'Manage Goal Tracking', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(221, 'Create Goal Tracking', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(222, 'Edit Goal Tracking', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(223, 'Delete Goal Tracking', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(224, 'Manage Company Policy', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(225, 'Create Company Policy', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(226, 'Edit Company Policy', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(227, 'Delete Company Policy', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(228, 'Manage Trainer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(229, 'Create Trainer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(230, 'Edit Trainer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(231, 'Delete Trainer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(232, 'Show Trainer', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(233, 'Manage Training', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(234, 'Create Training', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(235, 'Edit Training', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(236, 'Delete Training', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(237, 'Show Training', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(238, 'Manage Training Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(239, 'Create Training Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(240, 'Edit Training Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(241, 'Delete Training Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(242, 'Manage Report', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(243, 'Manage Holiday', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(244, 'Create Holiday', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(245, 'Edit Holiday', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(246, 'Delete Holiday', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(247, 'Manage Job Category', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(248, 'Create Job Category', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(249, 'Edit Job Category', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(250, 'Delete Job Category', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(251, 'Manage Job Stage', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(252, 'Create Job Stage', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(253, 'Edit Job Stage', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(254, 'Delete Job Stage', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(255, 'Manage Job', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(256, 'Create Job', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(257, 'Edit Job', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(258, 'Delete Job', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(259, 'Show Job', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(260, 'Manage Job Application', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(261, 'Create Job Application', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(262, 'Edit Job Application', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(263, 'Delete Job Application', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(264, 'Show Job Application', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(265, 'Move Job Application', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(266, 'Add Job Application Note', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(267, 'Delete Job Application Note', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(268, 'Add Job Application Skill', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(269, 'Manage Job OnBoard', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(270, 'Manage Custom Question', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(271, 'Create Custom Question', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(272, 'Edit Custom Question', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(273, 'Delete Custom Question', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(274, 'Manage Interview Schedule', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(275, 'Create Interview Schedule', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(276, 'Edit Interview Schedule', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(277, 'Delete Interview Schedule', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(278, 'Manage Career', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(279, 'Manage Competencies', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(280, 'Create Competencies', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(281, 'Edit Competencies', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(282, 'Delete Competencies', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(283, 'Create Performance Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(284, 'Edit Performance Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(285, 'Delete Performance Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(286, 'Create Performance Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(287, 'Edit Performance Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(288, 'Delete Performance Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(289, 'Manage Contract Types', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(290, 'Create Contract Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(291, 'Edit Contract Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(292, 'Delete Contract Type', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(293, 'Manage Contracts', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(294, 'Create Contract', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(295, 'Edit Contract', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(296, 'Delete Contract', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(297, 'Store Note', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(298, 'Delete Note', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(299, 'Store Comment', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(300, 'Delete Comment', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(301, 'Delete Attachment', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(302, 'Create BG/PO/PG', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(303, 'Edit BG/PO/PG', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(304, 'Delete BG/PO/PG', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(305, 'Manage BG/PO/PG', 'web', '2024-08-22 03:51:05', '2024-08-22 03:51:05');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `promotion_title` varchar(191) NOT NULL,
  `promotion_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resignations`
--

CREATE TABLE `resignations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `notice_date` date NOT NULL,
  `resignation_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'company', 'web', 0, '2024-08-22 03:51:05', '2024-08-22 03:51:05'),
(2, 'hr', 'web', 1, '2024-08-22 03:51:07', '2024-08-22 03:51:07'),
(3, 'employee', 'web', 1, '2024-08-22 03:51:08', '2024-08-22 03:51:08'),
(4, 'super admin', 'web', 1, '2025-02-24 05:31:07', '2025-02-24 05:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 1),
(10, 2),
(10, 4),
(11, 1),
(11, 2),
(11, 4),
(12, 1),
(12, 2),
(12, 4),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(14, 1),
(14, 2),
(14, 4),
(15, 1),
(15, 2),
(15, 4),
(16, 1),
(16, 2),
(16, 4),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(22, 1),
(22, 2),
(22, 4),
(23, 1),
(23, 2),
(23, 4),
(24, 1),
(24, 2),
(24, 4),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(26, 1),
(26, 2),
(26, 4),
(27, 1),
(27, 2),
(27, 4),
(28, 1),
(28, 2),
(28, 4),
(29, 1),
(29, 2),
(29, 3),
(29, 4),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(35, 1),
(35, 2),
(35, 3),
(35, 4),
(36, 1),
(36, 2),
(36, 3),
(36, 4),
(37, 1),
(37, 2),
(37, 3),
(37, 4),
(38, 1),
(38, 2),
(38, 4),
(39, 1),
(39, 2),
(39, 4),
(40, 1),
(40, 2),
(40, 4),
(41, 1),
(41, 2),
(41, 4),
(42, 1),
(42, 2),
(42, 4),
(43, 1),
(43, 2),
(43, 4),
(44, 1),
(44, 2),
(44, 4),
(45, 1),
(45, 2),
(45, 4),
(46, 1),
(46, 2),
(46, 4),
(47, 1),
(47, 2),
(47, 4),
(48, 1),
(48, 2),
(48, 4),
(49, 1),
(49, 2),
(49, 4),
(50, 1),
(50, 2),
(50, 4),
(51, 1),
(51, 2),
(51, 4),
(52, 1),
(52, 2),
(52, 4),
(53, 1),
(53, 2),
(53, 4),
(54, 1),
(54, 2),
(54, 4),
(55, 1),
(55, 2),
(55, 4),
(56, 1),
(56, 2),
(56, 4),
(57, 1),
(57, 2),
(57, 4),
(58, 1),
(58, 2),
(58, 4),
(59, 1),
(59, 2),
(59, 4),
(60, 1),
(60, 2),
(60, 4),
(61, 1),
(61, 2),
(61, 4),
(62, 1),
(62, 2),
(62, 4),
(63, 1),
(63, 2),
(63, 4),
(64, 1),
(64, 2),
(64, 4),
(65, 1),
(65, 2),
(65, 3),
(65, 4),
(66, 1),
(66, 2),
(66, 4),
(67, 1),
(67, 2),
(67, 3),
(67, 4),
(68, 1),
(68, 2),
(68, 4),
(69, 1),
(69, 2),
(69, 3),
(69, 4),
(70, 1),
(70, 2),
(70, 4),
(71, 1),
(71, 2),
(71, 4),
(72, 1),
(72, 2),
(72, 4),
(73, 1),
(73, 2),
(73, 4),
(74, 1),
(74, 2),
(74, 4),
(75, 1),
(75, 2),
(75, 4),
(76, 1),
(76, 2),
(76, 4),
(77, 1),
(77, 2),
(77, 4),
(78, 1),
(78, 2),
(78, 4),
(79, 1),
(79, 2),
(79, 4),
(80, 1),
(80, 2),
(80, 4),
(81, 1),
(81, 2),
(81, 4),
(82, 1),
(82, 2),
(82, 4),
(83, 1),
(83, 2),
(83, 4),
(84, 1),
(84, 2),
(84, 4),
(85, 1),
(85, 2),
(85, 4),
(86, 1),
(86, 2),
(86, 4),
(87, 1),
(87, 2),
(87, 4),
(88, 1),
(88, 2),
(88, 4),
(89, 1),
(89, 2),
(89, 4),
(90, 1),
(90, 2),
(90, 3),
(90, 4),
(91, 1),
(91, 2),
(91, 4),
(92, 1),
(92, 2),
(92, 4),
(93, 1),
(93, 2),
(93, 4),
(94, 1),
(94, 2),
(94, 4),
(95, 1),
(95, 2),
(95, 4),
(96, 1),
(96, 2),
(96, 4),
(97, 1),
(97, 2),
(97, 4),
(98, 1),
(98, 2),
(98, 4),
(99, 1),
(99, 2),
(99, 4),
(100, 1),
(100, 2),
(100, 4),
(101, 1),
(101, 2),
(101, 4),
(102, 1),
(102, 2),
(102, 4),
(103, 1),
(103, 2),
(103, 4),
(104, 1),
(104, 2),
(104, 4),
(105, 1),
(105, 2),
(105, 4),
(106, 1),
(106, 2),
(106, 4),
(107, 1),
(107, 2),
(107, 4),
(108, 1),
(108, 2),
(108, 4),
(109, 1),
(109, 2),
(109, 4),
(110, 1),
(110, 2),
(110, 4),
(111, 1),
(111, 2),
(111, 4),
(112, 1),
(112, 2),
(112, 4),
(113, 1),
(113, 4),
(114, 1),
(114, 4),
(115, 1),
(115, 4),
(116, 1),
(116, 4),
(117, 1),
(118, 1),
(118, 4),
(119, 1),
(119, 4),
(120, 1),
(120, 4),
(121, 1),
(121, 4),
(122, 1),
(122, 4),
(123, 1),
(123, 4),
(124, 1),
(124, 4),
(125, 1),
(125, 4),
(126, 1),
(126, 4),
(127, 1),
(127, 4),
(128, 1),
(128, 4),
(129, 1),
(129, 4),
(130, 1),
(130, 4),
(131, 1),
(131, 4),
(132, 1),
(132, 4),
(133, 1),
(133, 4),
(134, 1),
(134, 4),
(135, 1),
(135, 4),
(136, 1),
(136, 4),
(137, 1),
(137, 4),
(138, 1),
(138, 4),
(139, 1),
(139, 4),
(140, 1),
(140, 4),
(141, 1),
(141, 4),
(142, 1),
(142, 4),
(143, 1),
(143, 4),
(144, 1),
(144, 4),
(145, 1),
(145, 4),
(146, 1),
(146, 4),
(147, 1),
(147, 4),
(148, 1),
(148, 4),
(149, 1),
(149, 4),
(150, 1),
(150, 2),
(150, 3),
(150, 4),
(151, 1),
(151, 2),
(151, 4),
(152, 1),
(152, 2),
(152, 4),
(153, 1),
(153, 2),
(153, 4),
(154, 1),
(154, 2),
(154, 3),
(154, 4),
(155, 1),
(155, 2),
(155, 4),
(156, 1),
(156, 2),
(156, 4),
(157, 1),
(157, 2),
(157, 4),
(158, 1),
(158, 2),
(158, 4),
(159, 1),
(159, 2),
(159, 4),
(160, 1),
(160, 2),
(160, 4),
(161, 1),
(161, 2),
(161, 4),
(162, 1),
(162, 2),
(162, 3),
(162, 4),
(163, 1),
(163, 2),
(163, 3),
(163, 4),
(164, 1),
(164, 2),
(164, 3),
(164, 4),
(165, 1),
(165, 2),
(165, 3),
(165, 4),
(166, 1),
(166, 2),
(166, 3),
(166, 4),
(167, 1),
(167, 2),
(167, 4),
(168, 1),
(168, 2),
(168, 4),
(169, 1),
(169, 2),
(169, 4),
(170, 1),
(170, 2),
(170, 3),
(170, 4),
(171, 1),
(171, 2),
(171, 3),
(171, 4),
(172, 1),
(172, 2),
(172, 3),
(172, 4),
(173, 1),
(173, 2),
(173, 3),
(173, 4),
(174, 1),
(174, 2),
(174, 3),
(174, 4),
(175, 1),
(175, 2),
(175, 4),
(176, 1),
(176, 2),
(176, 4),
(177, 1),
(177, 2),
(177, 4),
(178, 1),
(180, 1),
(180, 4),
(181, 4),
(182, 4),
(183, 1),
(183, 4),
(184, 1),
(185, 1),
(186, 1),
(186, 2),
(186, 3),
(186, 4),
(187, 1),
(187, 2),
(187, 3),
(187, 4),
(188, 1),
(188, 2),
(188, 3),
(188, 4),
(189, 1),
(189, 2),
(189, 3),
(189, 4),
(190, 1),
(195, 1),
(195, 2),
(195, 4),
(196, 1),
(196, 2),
(196, 4),
(197, 1),
(197, 2),
(197, 4),
(198, 1),
(198, 2),
(198, 4),
(199, 1),
(199, 2),
(199, 3),
(199, 4),
(200, 1),
(200, 4),
(201, 1),
(201, 4),
(202, 1),
(202, 4),
(203, 1),
(203, 2),
(203, 4),
(204, 1),
(204, 2),
(204, 4),
(205, 1),
(205, 2),
(205, 4),
(206, 1),
(206, 2),
(206, 4),
(207, 1),
(207, 2),
(207, 4),
(208, 1),
(208, 2),
(208, 4),
(209, 1),
(209, 2),
(209, 4),
(210, 1),
(210, 2),
(210, 4),
(211, 1),
(211, 2),
(211, 4),
(212, 1),
(212, 2),
(212, 4),
(213, 1),
(213, 2),
(213, 4),
(214, 1),
(214, 2),
(214, 4),
(215, 1),
(215, 2),
(215, 4),
(216, 1),
(216, 2),
(216, 4),
(217, 1),
(217, 2),
(217, 4),
(218, 1),
(218, 2),
(218, 4),
(219, 1),
(219, 2),
(219, 4),
(220, 1),
(220, 2),
(220, 4),
(221, 1),
(221, 2),
(221, 4),
(222, 1),
(222, 2),
(222, 4),
(223, 1),
(223, 2),
(223, 4),
(224, 1),
(224, 2),
(224, 4),
(225, 1),
(225, 2),
(225, 4),
(226, 1),
(226, 2),
(226, 4),
(227, 1),
(227, 2),
(227, 4),
(228, 1),
(228, 2),
(228, 4),
(229, 1),
(229, 2),
(229, 4),
(230, 1),
(230, 2),
(230, 4),
(231, 1),
(231, 2),
(231, 4),
(232, 1),
(232, 2),
(232, 4),
(233, 1),
(233, 2),
(233, 4),
(234, 1),
(234, 2),
(234, 4),
(235, 1),
(235, 2),
(235, 4),
(236, 1),
(236, 2),
(236, 4),
(237, 1),
(237, 2),
(237, 4),
(238, 1),
(238, 2),
(238, 4),
(239, 1),
(239, 2),
(239, 4),
(240, 1),
(240, 2),
(240, 4),
(241, 1),
(241, 2),
(241, 4),
(242, 1),
(242, 2),
(242, 4),
(243, 1),
(243, 2),
(243, 3),
(243, 4),
(244, 1),
(244, 2),
(244, 4),
(245, 1),
(245, 2),
(245, 4),
(246, 1),
(246, 2),
(246, 4),
(247, 1),
(247, 2),
(247, 4),
(248, 1),
(248, 2),
(248, 4),
(249, 1),
(249, 2),
(249, 4),
(250, 1),
(250, 2),
(250, 4),
(251, 1),
(251, 2),
(251, 4),
(252, 1),
(252, 2),
(252, 4),
(253, 1),
(253, 2),
(253, 4),
(254, 1),
(254, 2),
(254, 4),
(255, 1),
(255, 2),
(255, 4),
(256, 1),
(256, 2),
(256, 4),
(257, 1),
(257, 2),
(257, 4),
(258, 1),
(258, 2),
(258, 4),
(259, 1),
(259, 2),
(259, 4),
(260, 1),
(260, 2),
(260, 4),
(261, 1),
(261, 2),
(261, 4),
(262, 1),
(262, 2),
(262, 4),
(263, 1),
(263, 2),
(263, 4),
(264, 1),
(264, 2),
(264, 4),
(265, 1),
(265, 2),
(265, 4),
(266, 1),
(266, 2),
(266, 4),
(267, 1),
(267, 2),
(267, 4),
(268, 1),
(268, 2),
(268, 4),
(269, 1),
(269, 2),
(269, 4),
(270, 1),
(270, 2),
(270, 4),
(271, 1),
(271, 2),
(271, 4),
(272, 1),
(272, 2),
(272, 4),
(273, 1),
(273, 2),
(273, 4),
(274, 1),
(274, 2),
(275, 1),
(275, 2),
(276, 1),
(276, 2),
(277, 1),
(277, 2),
(278, 1),
(278, 2),
(278, 3),
(278, 4),
(279, 1),
(279, 4),
(280, 1),
(280, 4),
(281, 1),
(281, 4),
(282, 1),
(282, 4),
(283, 1),
(283, 2),
(283, 4),
(284, 1),
(284, 2),
(284, 4),
(285, 1),
(285, 2),
(285, 4),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(298, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 2),
(303, 2),
(304, 2),
(305, 2);

-- --------------------------------------------------------

--
-- Table structure for table `saturation_deductions`
--

CREATE TABLE `saturation_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `deduction_option` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'local_storage_validation', 'csv,jpeg,jpg,pdf,png,xls,xlsx', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(2, 'wasabi_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(3, 's3_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(4, 'local_storage_max_upload_size', '2048000', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(5, 'wasabi_max_upload_size', '2048000', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(6, 's3_max_upload_size', '2048000', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(7, 'storage_setting', 'local', 1, '2024-08-22 03:51:10', '2024-08-22 03:51:10'),
(8, 'company_logo', 'dark_logo.png', 1, NULL, NULL),
(9, 'default_language', 'en', 1, NULL, NULL),
(10, 'theme_color', 'theme-3', 1, NULL, NULL),
(11, 'is_sidebar_transperent', 'on', 1, NULL, NULL),
(12, 'display_landing_page', 'off', 1, NULL, NULL),
(13, 'gdpr_cookie', 'off', 1, NULL, NULL),
(14, 'disable_signup_button', 'off', 1, NULL, NULL),
(15, 'dark_mode', 'off', 1, NULL, NULL),
(32, 'company_logo_light', 'light_logo.png', 1, NULL, NULL),
(40, 'company_name', 'Infosonik Systems Limited', 1, NULL, NULL),
(41, 'company_address', '“Southern Ridge” Apartment# B-6, House# 64, Road# 03, Block# B, Niketon Housing Society, Gulshan', 1, NULL, NULL),
(42, 'company_city', 'Dhaka', 1, NULL, NULL),
(43, 'company_state', 'Gulshan-1', 1, NULL, NULL),
(44, 'company_zipcode', '1212', 1, NULL, NULL),
(45, 'company_country', 'Bangladesh', 1, NULL, NULL),
(46, 'company_telephone', '0 1797-100359', 1, NULL, NULL),
(47, 'company_email', 'mighty@infosonik.com', 1, NULL, NULL),
(48, 'company_email_from_name', 'HR', 1, NULL, NULL),
(49, 'company_start_time', '10:00', 1, NULL, NULL),
(50, 'company_end_time', '18:00', 1, NULL, NULL),
(51, 'ip_restrict', 'on', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `set_salaries`
--

CREATE TABLE `set_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminations`
--

CREATE TABLE `terminations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `notice_date` date NOT NULL,
  `termination_date` date NOT NULL,
  `termination_type` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termination_types`
--

CREATE TABLE `termination_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `priority` varchar(191) NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `ticket_code` varchar(191) NOT NULL,
  `ticket_created` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_sheets`
--

CREATE TABLE `time_sheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `hours` double(8,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` varchar(191) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `contact` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `expertise` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` int(11) NOT NULL,
  `trainer_option` int(11) NOT NULL,
  `training_type` int(11) NOT NULL,
  `trainer` int(11) NOT NULL,
  `training_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `employee` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `performance` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_types`
--

CREATE TABLE `training_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `training_types`
--

INSERT INTO `training_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'PGD in HRM', 1, '2024-08-28 08:06:08', '2024-08-28 08:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_balances`
--

CREATE TABLE `transfer_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `referal_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) NOT NULL,
  `place_of_visit` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `lang` varchar(191) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_color` varchar(191) NOT NULL DEFAULT '#2180f3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `lang`, `last_login`, `is_active`, `created_by`, `remember_token`, `created_at`, `updated_at`, `active_status`, `dark_mode`, `messenger_color`) VALUES
(1, 'company', 'company@example.com', NULL, '$2y$10$oM1uQi8Y58qJrcTR7RuhauuDWTqP5iz2rA1sMyEC1z/zrnf6IphOi', 'company', '', 'en', '2025-03-04 16:53:54', 1, '0', NULL, '2024-08-22 03:51:07', '2025-03-04 16:53:54', 0, 0, '#2180f3'),
(2, 'hr', 'hr@example.com', NULL, '$2y$10$KGyihY1i8425HWedIY/b3uxZURgl0fn.LPPLkZ0yTm0dKLGG5aLfW', 'hr', '', 'en', '2025-04-08 05:48:22', 1, '1', NULL, '2024-08-22 03:51:08', '2025-04-08 05:48:22', 0, 0, '#2180f3'),
(3, 'Md Tanvirul Islam', 'tanvir@infosonik.com', NULL, '$2y$10$DFmvVVu62m1UiSPO3Hsc.ePVMlTu1pVU1p0EZx6oap0GunFVwnXPK', 'employee', NULL, 'en', '2025-08-12 08:36:22', 1, '1', NULL, '2024-08-27 06:20:56', '2025-08-12 08:36:22', 0, 0, '#2180f3'),
(4, 'Sadia Nasrin Haque', 'sadia.haque@infosonik.com', NULL, '$2y$10$3Vt2g4FQ5nLKmD7QtqW4k.JsJksGlM6O.3lKuVk1x5yFlZM8knbce', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 08:26:12', '2024-08-28 08:26:12', 0, 0, '#2180f3'),
(5, 'Zoyaza Islam Mighty', 'mighty@infosonik.com', NULL, '$2y$10$wKzldDc5.YE0cCVXHnNGCO8Izt4tV6PZ1h7IQpzAOPBY9emseFdrW', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 08:35:34', '2024-08-28 08:35:34', 0, 0, '#2180f3'),
(6, 'Md Amirul Hasan Pulok', 'pulok@infosonik.com', NULL, '$2y$10$Jd7WNYIYzFO1HcDR2fgAEeaVm16nPWRZbxzXnnOidiVWDDjEYGb.u', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 09:59:18', '2024-08-28 09:59:18', 0, 0, '#2180f3'),
(7, 'Md. Mosaddak Mostafa chowdhury', 'asif@infosonik.com', NULL, '$2y$10$sePsUSWTZJq/Pa1kivWgb.5NJ8anIHsIYGkTbwNmBL5isYytTsFAS', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 10:11:11', '2024-08-28 10:11:11', 0, 0, '#2180f3'),
(8, 'Fahad Hosen', 'fahad.hosen@infosonik.com', NULL, '$2y$10$MFyXlFiKFGLesIQmNVMcLuSPtm8alus.31l4W0RU7cCJiP6hymyuu', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 10:15:16', '2024-08-28 10:15:16', 0, 0, '#2180f3'),
(9, 'T.M. Abdullah Al-Amin', 'alamin@infosonik.com', NULL, '$2y$10$hyiggqkF05kmAfn886L4pOCG6AYliO.oqF63xN9am6yJvw1VYqGZS', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 10:35:29', '2024-08-28 10:35:29', 0, 0, '#2180f3'),
(10, 'A.S.M Sayem', 'sayem@infosonik.com', NULL, '$2y$10$xRb3ZHzafiCmSh8nZw1yd.hpWLCOHj3l6AOw8mWupuln5qA5bvp6G', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-08-28 11:29:34', '2024-08-28 11:29:34', 0, 0, '#2180f3'),
(11, 'Md Nasir Uddin Prince', 'nasir.uddin@infosonik.com', NULL, '$2y$10$YKnePpgIe4SGycKIYHuUVeNNDFBo811s9iNAA7rQBrseIZfwBzv1y', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:28:28', '2024-09-01 09:28:28', 0, 0, '#2180f3'),
(12, 'Mohammad Gulap Robbaney', 'robbaney@infosonik.com', NULL, '$2y$10$VyyA4PuUDvwCXYtaHMa52ee0gmh9EVYa4Lii.s1G/YiBJ4e1CHrme', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:32:00', '2024-09-01 09:32:00', 0, 0, '#2180f3'),
(13, 'Ashraful Islam', 'ashraf@infosonik.com', NULL, '$2y$10$5dOMTIO6VZxoQdqCltfiIeHgw1UAA9Jqn9gayiAd9eR6zGTYJFgA2', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:37:51', '2024-09-01 09:37:51', 0, 0, '#2180f3'),
(14, 'Md. Hajjaj Hossain', 'hajjaj@infosonik.com', NULL, '$2y$10$qy00anZfGwqS01GUqRTo5.4CUGOGQBVwQNcyezzMrfkyOwWmJS5FO', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:45:23', '2024-09-01 09:45:23', 0, 0, '#2180f3'),
(15, 'Md Tawfiqul Bari', 'tawfiqul.bari@infosonik.com', NULL, '$2y$10$/Pe54H.QP1G9oEzoUO0D3uMSeiX52YnFSsai7Gp.1gUVNBS4I27VO', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:48:35', '2024-09-01 09:48:35', 0, 0, '#2180f3'),
(16, 'Md Mostofa Kamal Chowdhury', 'mostofa@infosonik.com', NULL, '$2y$10$PBRIQVAy2owoCVz.4B2Hku2EEM00BkTLk7qRmYRMmkZctsIJRBdPS', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:52:21', '2024-09-01 09:52:21', 0, 0, '#2180f3'),
(17, 'Fakhrul Islam', 'fakhrul@infosonik.com', NULL, '$2y$10$Tvq6b9ZYmDwOsRHMypBMS.5D2e2gHvR33UrNwlP2fnul1pQNDILaa', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 09:58:04', '2024-09-01 09:58:04', 0, 0, '#2180f3'),
(18, 'Md. Sabbir Ahmed', 'Sabbir@infosonik.com', NULL, '$2y$10$O6nSYH3w8PhMSMsVn99EV.mLhXfyxPE2m1TW6aH.9TwztHb61nDAe', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 10:01:35', '2024-09-01 10:01:35', 0, 0, '#2180f3'),
(19, 'Shamsul Alam', 'shuvo@infosonik.com', NULL, '$2y$10$EdA/av6GKYcHO.kcVn5souix2qI.CFlS5D6mQ.U9JPm3hd61JrFIu', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 10:04:50', '2024-09-01 10:04:50', 0, 0, '#2180f3'),
(20, 'Rayhan Islam', 'rayhan@infosonik.com', NULL, '$2y$10$xqjhNWZoxdzNs4riFgyM2eORXFQw0Aeo78EalUqLWhHys6IeIDTQa', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-09-01 10:07:41', '2024-09-01 10:07:41', 0, 0, '#2180f3'),
(21, 'Khandakar Muttakinuzzaman Tonmoy', 'tonmoy@infosonik.com', NULL, '$2y$10$x56gNmTa/DTRHUHYXC0eZOzAo1GMd.X/AodkO2bvj3G7QU2j3A3ka', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-11-25 04:48:54', '2024-11-25 04:48:54', 0, 0, '#2180f3'),
(22, 'MD Rubel Miah', 'rubel@infosonik.com', NULL, '$2y$10$tFB14kUrHfDbOeiNDkdct.P5mtGySuOmabMd.pmW2mrmBDGtmwwmy', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-11-25 05:00:55', '2024-11-25 05:00:55', 0, 0, '#2180f3'),
(23, 'Md Shariful Islam', 'sharif@unfosonik.com', NULL, '$2y$10$9f6Hw4msERxYKvTNGvD.te9fK8KoAebOh23KxaukwYm5Q7KNQKCea', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2024-12-05 05:08:42', '2024-12-05 05:08:42', 0, 0, '#2180f3'),
(24, 'Admin', 'admin@gmail.com', '2025-02-24 05:32:07', '$2y$10$m1B3mSPrB0OLkbAiKRpheueEzEPV02RrU.foyue55V6rg6piFA7Cq', 'admin', NULL, 'en', '2025-08-12 08:24:48', 1, '1', NULL, '2025-02-24 05:32:07', '2025-08-12 08:24:48', 0, 0, '#2180f3'),
(25, 'ABCD', 'abcd@mailinator.com', NULL, '$2y$10$T37k6Yq6OSYhWk1ZrNAPXefydRfMZQ8wJDdSlYI.GSA3mh7wZIwGi', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2025-02-26 07:18:38', '2025-02-26 07:18:38', 0, 0, '#2180f3'),
(26, '1', 'NULL', NULL, '$2y$10$1uCZIsbUkDaErPIDHWZjb.39Ljg80r.2XlgYiyIR6jIoW8OLXa.FC', 'employee', NULL, 'en', NULL, 1, '1', NULL, '2025-02-26 09:43:17', '2025-02-26 09:43:17', 0, 0, '#2180f3');

-- --------------------------------------------------------

--
-- Table structure for table `user_email_templates`
--

CREATE TABLE `user_email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_email_templates`
--

INSERT INTO `user_email_templates` (`id`, `template_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:20'),
(2, 2, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:23'),
(3, 3, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:24'),
(4, 4, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:25'),
(5, 5, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:26'),
(6, 6, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:28'),
(7, 7, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:28'),
(8, 8, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:30'),
(9, 9, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:31'),
(10, 10, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:13:32'),
(11, 11, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:14:18'),
(12, 12, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:14:19'),
(13, 13, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:14:20'),
(14, 14, 1, 0, '2024-08-22 03:51:10', '2025-02-24 12:14:21'),
(15, 1, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(16, 2, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(17, 3, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(18, 4, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(19, 5, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(20, 6, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(21, 7, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(22, 8, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(23, 9, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(24, 10, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(25, 11, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(26, 12, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(27, 13, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07'),
(28, 14, 1, 1, '2025-02-24 05:32:07', '2025-02-24 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE `warnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warning_to` int(11) NOT NULL,
  `warning_by` int(11) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `warning_date` date NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zoom_meetings`
--

CREATE TABLE `zoom_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `meeting_id` varchar(191) NOT NULL DEFAULT '0',
  `user_id` varchar(191) NOT NULL DEFAULT '0',
  `password` varchar(191) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `duration` int(11) NOT NULL DEFAULT 0,
  `start_url` text DEFAULT NULL,
  `join_url` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT 'waiting',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_lists`
--
ALTER TABLE `account_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowance_options`
--
ALTER TABLE `allowance_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement_employees`
--
ALTER TABLE `announcement_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_employees`
--
ALTER TABLE `attendance_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bg_pg_models`
--
ALTER TABLE `bg_pg_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_policies`
--
ALTER TABLE `company_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competencies`
--
ALTER TABLE `competencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_attechments`
--
ALTER TABLE `contract_attechments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_comments`
--
ALTER TABLE `contract_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_notes`
--
ALTER TABLE `contract_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_questions`
--
ALTER TABLE `custom_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deduction_options`
--
ALTER TABLE `deduction_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ducument_uploads`
--
ALTER TABLE `ducument_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_employees`
--
ALTER TABLE `event_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience_certificates`
--
ALTER TABLE `experience_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generate_offer_letters`
--
ALTER TABLE `generate_offer_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genrate_payslip_options`
--
ALTER TABLE `genrate_payslip_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_types`
--
ALTER TABLE `goal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_types`
--
ALTER TABLE `income_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interview_schedules`
--
ALTER TABLE `interview_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_restricts`
--
ALTER TABLE `ip_restricts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_application_notes`
--
ALTER TABLE `job_application_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_on_boards`
--
ALTER TABLE `job_on_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_stages`
--
ALTER TABLE `job_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joining_letters`
--
ALTER TABLE `joining_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_sections`
--
ALTER TABLE `landing_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_options`
--
ALTER TABLE `loan_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_employees`
--
ALTER TABLE `meeting_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `noc_certificates`
--
ALTER TABLE `noc_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_payments`
--
ALTER TABLE `other_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payees`
--
ALTER TABLE `payees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payers`
--
ALTER TABLE `payers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_types`
--
ALTER TABLE `payslip_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_slips`
--
ALTER TABLE `pay_slips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance__types`
--
ALTER TABLE `performance__types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resignations`
--
ALTER TABLE `resignations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `saturation_deductions`
--
ALTER TABLE `saturation_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `set_salaries`
--
ALTER TABLE `set_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminations`
--
ALTER TABLE `terminations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `termination_types`
--
ALTER TABLE `termination_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_sheets`
--
ALTER TABLE `time_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_types`
--
ALTER TABLE `training_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_balances`
--
ALTER TABLE `transfer_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_lists`
--
ALTER TABLE `account_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `allowance_options`
--
ALTER TABLE `allowance_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_employees`
--
ALTER TABLE `announcement_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_employees`
--
ALTER TABLE `attendance_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_types`
--
ALTER TABLE `award_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bg_pg_models`
--
ALTER TABLE `bg_pg_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2154;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_policies`
--
ALTER TABLE `company_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competencies`
--
ALTER TABLE `competencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_attechments`
--
ALTER TABLE `contract_attechments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_comments`
--
ALTER TABLE `contract_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_notes`
--
ALTER TABLE `contract_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custom_questions`
--
ALTER TABLE `custom_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deduction_options`
--
ALTER TABLE `deduction_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ducument_uploads`
--
ALTER TABLE `ducument_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_employees`
--
ALTER TABLE `event_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `experience_certificates`
--
ALTER TABLE `experience_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generate_offer_letters`
--
ALTER TABLE `generate_offer_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `genrate_payslip_options`
--
ALTER TABLE `genrate_payslip_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_types`
--
ALTER TABLE `goal_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_types`
--
ALTER TABLE `income_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_schedules`
--
ALTER TABLE `interview_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_restricts`
--
ALTER TABLE `ip_restricts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_application_notes`
--
ALTER TABLE `job_application_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_on_boards`
--
ALTER TABLE `job_on_boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_stages`
--
ALTER TABLE `job_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `joining_letters`
--
ALTER TABLE `joining_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `landing_page_sections`
--
ALTER TABLE `landing_page_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_options`
--
ALTER TABLE `loan_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `meeting_employees`
--
ALTER TABLE `meeting_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `noc_certificates`
--
ALTER TABLE `noc_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `other_payments`
--
ALTER TABLE `other_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `overtimes`
--
ALTER TABLE `overtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payees`
--
ALTER TABLE `payees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payers`
--
ALTER TABLE `payers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payslip_types`
--
ALTER TABLE `payslip_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pay_slips`
--
ALTER TABLE `pay_slips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance__types`
--
ALTER TABLE `performance__types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resignations`
--
ALTER TABLE `resignations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `saturation_deductions`
--
ALTER TABLE `saturation_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `set_salaries`
--
ALTER TABLE `set_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terminations`
--
ALTER TABLE `terminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `termination_types`
--
ALTER TABLE `termination_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_sheets`
--
ALTER TABLE `time_sheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_types`
--
ALTER TABLE `training_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_balances`
--
ALTER TABLE `transfer_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
