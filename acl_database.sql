-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2025 at 04:51 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acl_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `first_name`, `last_name`, `dob`, `gender`, `email`, `password_hash`, `phone`, `address`, `image_path`) VALUES
(1, 'Mark', 'Samuel', '1980-01-15', 'Male', 'mark.samuel@auslabclinics.com', 'hashed_password_1', '+61 400 000 001', '123 Admin St, Sydney, NSW', '/uploads/admins/mark_samuel.jpg'),
(2, 'Alice', 'Johnson', '1975-05-20', 'Female', 'alice.johnson@auslabclinics.com', 'hashed_password_2', '+61 400 000 002', '456 Admin Rd, Melbourne, VIC', '/uploads/admins/alice_johnson.jpg'),
(3, 'Bob', 'Williams', '1982-09-10', 'Male', 'bob.williams@auslabclinics.com', 'hashed_password_3', '+61 400 000 003', '789 Admin Ave, Brisbane, QLD', '/uploads/admins/bob_williams.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `status` enum('Upcoming','Completed','Missed','Cancelled') DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `admin_id` (`admin_id`),
  KEY `package_id` (`package_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `admin_id`, `package_id`, `appointment_date`, `appointment_time`, `status`, `location_id`) VALUES
(15, 5, 2, 2, '2025-06-02', '15:30:00', 'Missed', 2),
(14, 4, 1, 1, '2025-03-25', '08:45:00', 'Missed', 1),
(13, 3, 3, 3, '2025-04-10', '11:00:00', 'Completed', 3),
(12, 2, 2, 2, '2025-04-28', '09:30:00', 'Completed', 2),
(11, 1, 1, 1, '2025-05-15', '10:00:00', 'Upcoming', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`message_id`, `full_name`, `email`, `subject`, `message`, `date_sent`) VALUES
(1, 'Ashmi Maharjan', 'ashmi.maharjan@example.com', 'Lab Test Inquiry', 'I would like to know more about the blood test packages.', '2025-05-10 09:15:00'),
(2, 'Zephyr Nguyen', 'zephyr.nguyen@example.com', 'Appointment Reschedule', 'Can I reschedule my upcoming appointment to next week?', '2025-05-11 14:22:00'),
(3, 'Fatima Al-Farsi', 'fatima.alfarsi@example.com', 'Payment Issue', 'I am facing problems with my invoice payment online.', '2025-05-12 10:30:00'),
(4, 'Kwame Boateng', 'kwame.boateng@example.com', 'Feedback', 'Great service, but the waiting time was a bit long.', '2025-05-13 16:05:00'),
(5, 'Sakura Tanaka', 'sakura.tanaka@example.com', 'Test Result Delay', 'My test results have not been updated yet. Please advise.', '2025-05-14 08:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comments` text,
  `feedback_date` date DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `patient_id`, `rating`, `comments`, `feedback_date`) VALUES
(1, 1, 5, 'Excellent service and friendly staff!', '2025-05-10'),
(2, 2, 4, 'Very good, but the waiting time could be shorter.', '2025-05-11'),
(3, 3, 3, 'Average experience. The process was a bit confusing.', '2025-05-12'),
(4, 4, 2, 'Not satisfied with the communication regarding my results.', '2025-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `service` varchar(100) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_no` (`invoice_no`),
  KEY `patient_id` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `patient_id`, `service`, `invoice_no`, `amount`, `invoice_date`, `invoice_image_path`) VALUES
(1, 1, 'Blood Test Package', 'INV-20250510-001', '120.00', '2025-05-10', NULL),
(2, 2, 'Kidney Function Test', 'INV-20250511-002', '85.50', '2025-05-11', NULL),
(3, 3, 'Liver Function Test', 'INV-20250512-003', '99.00', '2025-05-12', NULL),
(4, 4, 'Full Health Checkup', 'INV-20250513-004', '200.00', '2025-05-13', NULL),
(5, 5, 'Diabetes Screening', 'INV-20250514-005', '75.00', '2025-05-14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `opening_hours` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `name`, `address`, `image_path`, `opening_hours`) VALUES
(1, 'Dorevitch Pathology, Sydney', '123 Sydney Rd, Sydney, NSW 2000', NULL, 'Mon-Fri: 8:00 - 14:00\nSat-Sun: 8:00 - 13:00'),
(2, 'Melbourne Uni Pathology', '456 University St, Melbourne, VIC 3000', NULL, 'Mon-Fri: 8:00 - 14:00\nSat-Sun: 8:00 - 13:00'),
(3, 'St Vincent Pathology, Brisbane', '789 Health Ave, Brisbane, QLD 4000', NULL, 'Mon-Fri: 8:00 - 14:00\nSat-Sun: 8:00 - 13:00');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emergency_contact` varchar(100) DEFAULT NULL,
  `emergency_relationship` varchar(50) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `dob`, `gender`, `blood_type`, `email`, `password_hash`, `phone`, `address`, `emergency_contact`, `emergency_relationship`, `image_path`) VALUES
(1, 'Ashmi', 'Maharjan', '1990-07-15', 'Female', 'A+', 'ashmi.maharjan@example.com', 'hashed_password_ashmi', '+61 412 345 678', '123 Health St, Melbourne, VIC 3000', 'Sita Maharjan', 'Sister', ''),
(2, 'Zephyr', 'Nguyen', '1987-02-11', 'Male', 'O-', 'zephyr.nguyen@example.com', 'hashed_password_zephyr', '+61 412 345 690', '12 Lotus Crescent, Sydney, NSW', 'An Nguyen', 'Mother', ''),
(3, 'Priya', 'Chakraborty', '1994-09-23', 'Female', 'B+', 'priya.chakraborty@example.com', 'hashed_password_priya', '+61 412 345 691', '88 Banyan Rd, Brisbane, QLD', 'Rahul Chakraborty', 'Father', ''),
(4, 'Kwame', 'Boateng', '1982-05-18', 'Male', 'AB-', 'kwame.boateng@example.com', 'hashed_password_kwame', '+61 412 345 692', '7 Palm Ave, Perth, WA', 'Ama Boateng', 'Sister', ''),
(5, 'Fatima', 'Al-Farsi', '1996-11-02', 'Female', 'O+', 'fatima.alfarsi@example.com', 'hashed_password_fatima', '+61 412 345 693', '23 Olive St, Adelaide, SA', 'Layla Al-Farsi', 'Mother', ''),
(6, 'Joaquim', 'da Silva', '1989-04-29', 'Male', 'A-', 'joaquim.dasilva@example.com', 'hashed_password_joaquim', '+61 412 345 694', '55 Jacaranda Blvd, Darwin, NT', 'Maria da Silva', 'Wife', ''),
(7, 'Sakura', 'Tanaka', '1993-12-12', 'Female', 'B-', 'sakura.tanaka@example.com', 'hashed_password_sakura', '+61 412 345 695', '101 Cherry Blossom Ln, Hobart, TAS', 'Hiroshi Tanaka', 'Brother', '');

-- --------------------------------------------------------

--
-- Table structure for table `samples`
--

DROP TABLE IF EXISTS `samples`;
CREATE TABLE IF NOT EXISTS `samples` (
  `sample_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `sample_type` varchar(50) DEFAULT NULL,
  `collection_date` date DEFAULT NULL,
  `status` enum('Collected','Processing','Completed','Issue') DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`sample_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `samples`
--

INSERT INTO `samples` (`sample_id`, `patient_id`, `sample_type`, `collection_date`, `status`, `last_updated`) VALUES
(1, 7, 'Blood', '2025-05-07', 'Collected', '2025-05-08 09:00:00'),
(2, 1, 'Blood', '2025-05-10', 'Processing', '2025-05-11 09:45:00'),
(3, 2, 'Blood', '2025-04-28', 'Completed', '2025-04-29 14:15:00'),
(4, 3, 'Urine', '2025-05-01', 'Collected', '2025-05-01 10:00:00'),
(5, 4, 'Blood', '2025-05-12', 'Processing', '2025-05-13 11:30:00'),
(6, 5, 'Blood', '2025-05-14', 'Issue', '2025-05-15 08:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `test_packages`
--

DROP TABLE IF EXISTS `test_packages`;
CREATE TABLE IF NOT EXISTS `test_packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `factors` text,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test_packages`
--

INSERT INTO `test_packages` (`package_id`, `name`, `price`, `factors`, `image_path`) VALUES
(1, 'Common Blood Test', '100.00', 'Red Blood Cell,White Blood Cell,Hemoglobin', ''),
(2, 'Blood Sugar Test', '75.00', 'Fasting Glucose,Hba1C(DCCT/IFCC)', ''),
(3, 'Kidney Function Test', '120.00', 'B.Urea Nitrogen,Serum Creatinine,Uric Acid', ''),
(4, 'Liver Function Test', '110.00', 'Alanine Aminotransferase,Asparate Aminotransferase,Alkaline Phosphatase', '');

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
CREATE TABLE IF NOT EXISTS `test_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `result_date` date DEFAULT NULL,
  `result_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `patient_id` (`patient_id`),
  KEY `package_id` (`package_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test_results`
--

INSERT INTO `test_results` (`result_id`, `patient_id`, `package_id`, `result_date`, `result_image_path`) VALUES
(1, 1, 1, '2025-05-11', ''),
(2, 2, 2, '2025-04-29', ''),
(3, 3, 3, '2025-05-02', ''),
(4, 4, 4, '2025-05-13', ''),
(5, 5, 1, '2025-05-16', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
