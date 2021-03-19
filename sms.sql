-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2021 at 03:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sports_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `court_booking_details`
--

CREATE TABLE `court_booking_details` (
  `booking_id` int(11) NOT NULL,
  `court_id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `till_time` time DEFAULT NULL,
  `status` enum('Booked','Available','Rescheduled') DEFAULT NULL,
  `booked_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `court_booking_details`
--

INSERT INTO `court_booking_details` (`booking_id`, `court_id`, `from_date`, `to_date`, `from_time`, `till_time`, `status`, `booked_by`) VALUES
(1, 8, '2021-03-14', NULL, '10:00:00', '12:00:00', 'Booked', 10),
(2, 2, '2021-03-14', '2021-03-15', '07:00:00', '10:00:00', 'Booked', 11),
(4, 8, '2021-03-15', NULL, '10:00:00', '12:00:00', 'Available', NULL),
(5, 2, '2021-03-15', NULL, '07:00:00', '08:00:00', 'Available', NULL),
(6, 6, '2021-03-15', '2021-03-20', '08:00:00', '10:00:00', 'Booked', 17),
(7, 6, '2021-03-15', '2021-03-20', '06:00:00', '08:00:00', 'Available', NULL),
(8, 5, '2021-03-15', '2021-03-20', '07:00:00', '09:00:00', 'Booked', 18),
(9, 5, '2021-03-08', '2021-03-13', '07:00:00', '09:00:00', 'Booked', 18),
(10, 5, '2021-03-15', '2021-03-20', '18:00:00', '20:00:00', 'Booked', 15),
(11, 7, '2021-03-15', '2021-03-20', '18:00:00', '20:00:00', 'Booked', 20),
(12, 5, '2021-03-22', '2021-03-27', '08:00:00', '10:00:00', 'Booked', 19);

-- --------------------------------------------------------

--
-- Table structure for table `court_details`
--

CREATE TABLE `court_details` (
  `court_id` int(11) NOT NULL,
  `court_name` varchar(50) NOT NULL,
  `length` float NOT NULL,
  `width` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `court_details`
--

INSERT INTO `court_details` (`court_id`, `court_name`, `length`, `width`) VALUES
(1, 'Cricket Ground', 22.12, 12.5),
(2, 'Badminton Court', 13.4, 6.1),
(4, 'Bascketball Court', 28.7, 15.2),
(5, 'Karate', 4.9, 6.1),
(6, 'Kabaddi Ground', 65, 45),
(7, 'Running ground', 32, 45),
(8, 'Chess Room', 12, 8);

-- --------------------------------------------------------

--
-- Table structure for table `employee_absence_details`
--

CREATE TABLE `employee_absence_details` (
  `emp_attendance_id` int(11) NOT NULL,
  `absent_from` date DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `attendance` enum('Present','Absent') DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `absent_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_absence_details`
--

INSERT INTO `employee_absence_details` (`emp_attendance_id`, `absent_from`, `emp_id`, `attendance`, `reason`, `absent_to`) VALUES
(1, '2020-03-11', 13, 'Absent', 'Family Emergency', NULL),
(2, '2020-03-15', 10, 'Absent', 'Medical Reason', NULL),
(3, '2020-03-15', 11, 'Absent', 'Medical Reason', NULL),
(4, '2021-01-31', 10, 'Absent', 'Personal Reason', NULL),
(5, '2021-02-04', 12, 'Absent', 'Personal Emergency', '2021-02-09'),
(7, '2021-04-13', 19, 'Absent', 'Planned Leave', '2021-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `employee_complaints`
--

CREATE TABLE `employee_complaints` (
  `complaint_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `priority` enum('P1','P2','P3') DEFAULT NULL,
  `created_on` date DEFAULT curdate(),
  `stauts` enum('Created','Assigned','Resolved','Rejected','Closed') DEFAULT NULL,
  `updated_on` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_complaints`
--

INSERT INTO `employee_complaints` (`complaint_id`, `created_by`, `assigned_to`, `description`, `priority`, `created_on`, `stauts`, `updated_on`) VALUES
(1, 10, 13, 'Time management between two match slots needs improvement', 'P1', '2021-03-13', 'Assigned', '2021-03-13'),
(2, 12, 13, 'Organise the equipments after the match.', 'P1', '2021-02-01', 'Assigned', '2021-03-13'),
(3, 10, 12, 'More information about the ongoing offers', 'P2', '2021-02-14', 'Resolved', '2021-03-13'),
(8, 16, 13, 'Need extra dan in Chess rooms', 'P2', '2021-03-14', 'Created', '2021-03-14'),
(9, 19, 13, 'Snacka arrangement', 'P2', '2021-03-14', 'Rejected', '2021-03-14');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `emp_id` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `department` enum('Choaching','Enquiry','Inventory','Management') DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `joining_date` date NOT NULL,
  `curr_date` date DEFAULT curdate(),
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `expertise` varchar(100) NOT NULL,
  `is_employee` tinyint(1) DEFAULT 1
) ;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`emp_id`, `fname`, `lname`, `email`, `contact`, `department`, `salary`, `joining_date`, `curr_date`, `gender`, `expertise`, `is_employee`) VALUES
(10, 'Raj', 'Singh', 'Singh.raj@gmail.com', 9832890987, 'Choaching', 50000, '2020-02-12', '2021-03-13', 'Male', 'Chess', 1),
(11, 'Sona', 'Mohan', 'Sona.mohan@gmail.com', 8832890987, 'Choaching', 35000, '2020-05-13', '2021-03-13', 'Female', 'Badminton, Tennis', 1),
(12, 'Heena', 'Patel', 'Heena.patel@gmail.com', 8032800987, 'Enquiry', 10000, '2020-06-29', '2021-03-13', 'Female', 'Enquiry', 1),
(13, 'Giri', 'S', 'Giri.S@gmail.com', 9021905699, 'Management', 60000, '2021-02-01', '2021-03-13', 'Male', 'Management', 1),
(14, 'Abhi', 'Partani', 'Abhi.partani@gmail.com', 9232100988, 'Inventory', 10000, '2020-06-01', '2021-03-13', 'Male', 'Management', 1),
(15, 'Parth', 'Mohit', 'parth.mohit@gmail.com', 980987890, 'Choaching', 20000, '2020-08-10', '2021-03-14', 'Male', 'Kabaddi', 1),
(16, 'Vimala', 'Rani', 'vimala.rani@yahoo.com', 990987890, 'Choaching', 10000, '2020-08-13', '2021-03-14', 'Female', 'Chess', 1),
(17, 'Pramod', 'Sharma', 'pramod.sharma@yahoo.com', 880987890, 'Choaching', 22000, '2020-07-10', '2021-03-14', 'Male', 'Kabaddi', 1),
(18, 'Virendra', 'M', 'Virendra123@gmail.com', 980087890, 'Choaching', 15000, '2020-07-10', '2021-03-14', 'Male', 'Karate', 1),
(19, 'Sunita', 'Mahajan', 'Sunita.mahajan@gmail.com', 980987890, 'Choaching', 25000, '2020-09-17', '2021-03-14', 'Female', 'Karate', 1),
(20, 'Suresh', 'Kumar', 'Suresh.kumar@gmail.com', 980987800, 'Choaching', 17000, '2020-09-21', '2021-03-14', 'Male', 'Running', 1),
(21, 'Mohit', 'Parel', 'Mohit.parel@gmail.com', 981087890, 'Choaching', 12000, '2020-11-01', '2021-02-28', 'Male', 'Football', 0),
(22, 'Umesh', 'Kumar', 'umesh.kumar@gmail.com', 980981239, 'Inventory', 12000, '2020-10-10', '2021-03-14', 'Male', 'Management', 1),
(23, 'Sushma', 'Naini', 'Sushma.naini@gmail.com', 870987890, 'Management', 13000, '2020-10-16', '2021-03-14', 'Female', 'Management', 1),
(24, 'Abhinav', 'Shastri', 'Abhinav.shastri@yahoo.com', 980321890, 'Enquiry', 14500, '2020-08-17', '2021-03-14', 'Male', 'Management', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_order_request`
--

CREATE TABLE `employee_order_request` (
  `request_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `priority` enum('P1','P2','P3') DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `dead_line` date DEFAULT NULL,
  `status` enum('Created','Assigned','In-Progess','Completed','Rejected','Closed') DEFAULT 'Created',
  `created_date` date DEFAULT curdate(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_order_request`
--

INSERT INTO `employee_order_request` (`request_id`, `created_by`, `description`, `priority`, `assigned_to`, `dead_line`, `status`, `created_date`, `updated_on`) VALUES
(1, 10, 'More tennis ball are needed. 2 packets', 'P1', 13, '2021-04-13', 'Created', '2021-03-13', '2021-03-13 18:31:55'),
(2, 11, 'Cricket gears 2 pairs are needed.', 'P2', 13, '2021-04-13', 'Created', '2021-03-13', '2021-03-13 18:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `related_sports` varchar(30) NOT NULL,
  `equipment_set` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `name`, `related_sports`, `equipment_set`, `quantity`) VALUES
(1, 'Tennis Balls', 'Tennis', 4, 10),
(2, 'Badminton Rackets', 'Badminton', 1, 8),
(3, 'Badminton Shuttle', 'Badminton', 1, 8),
(4, 'Bascket Ball', 'Bascketball', NULL, 3),
(5, 'Chess Set', 'Chess', 2, 6),
(6, 'Cricket Bat', 'Cricket', NULL, 4),
(7, 'Karate safty Mat', 'Karate', 3, 10),
(8, 'Foot Ball', 'Football', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_order`
--

CREATE TABLE `equipment_order` (
  `order_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `amount_per` float DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `status` enum('Placed','Cancelled','Delivered') DEFAULT NULL,
  `placed_by` int(11) NOT NULL,
  `placed_date` date DEFAULT curdate(),
  `is_completed` enum('Y','N') DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment_order`
--

INSERT INTO `equipment_order` (`order_id`, `equipment_id`, `amount_per`, `quantity`, `status`, `placed_by`, `placed_date`, `is_completed`, `updated_on`, `total_amount`) VALUES
(101, 5, 150, 2, 'Placed', 14, '2021-02-13', 'N', '2021-03-13 18:54:35', 300),
(102, 8, 200, 2, 'Delivered', 14, '2021-02-13', 'Y', '2021-03-13 18:56:47', 400);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_set`
--

CREATE TABLE `equipment_set` (
  `set_id` int(11) NOT NULL,
  `set_description` varchar(200) DEFAULT NULL,
  `sport_name` varchar(40) DEFAULT NULL,
  `total_set` int(11) DEFAULT NULL,
  `availabel_set` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment_set`
--

INSERT INTO `equipment_set` (`set_id`, `set_description`, `sport_name`, `total_set`, `availabel_set`) VALUES
(1, 'Badminton-set each set includes 2 rackets and 2 shuttles', 'Badminton', 4, 3),
(2, 'One set includes a chess board,32 chess pieces, a stop watch', 'Chess', 4, 2),
(3, 'Karate Mats- 3', 'Karate', 6, 4),
(4, '2 Tennise Rackerts and 3 Tennis Balls', 'Tennis', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_usage`
--

CREATE TABLE `equipment_usage` (
  `coach_id` int(11) NOT NULL,
  `from_date` date DEFAULT curdate(),
  `to_date` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `num_of_sets` int(11) NOT NULL DEFAULT 1,
  `equipment_set_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment_usage`
--

INSERT INTO `equipment_usage` (`coach_id`, `from_date`, `to_date`, `from_time`, `to_time`, `num_of_sets`, `equipment_set_id`) VALUES
(10, '2021-03-11', '2021-03-13', '10:00:00', '11:00:00', 1, 2),
(11, '2021-03-13', NULL, '10:00:00', '11:00:00', 1, 1),
(18, '2021-03-15', '2021-03-20', '07:00:00', '09:00:00', 1, 3),
(18, '2021-03-08', '2021-03-13', '07:00:00', '09:00:00', 1, 3),
(19, '2021-03-22', '2021-03-27', '08:00:00', '10:00:00', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `userType` enum('Player','Employee') NOT NULL,
  `is_valid` tinyint(1) DEFAULT 1
) ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `userType`, `is_valid`) VALUES
('Abhi.partani@gmail.com', 'parantani@1234', 'Employee', 1),
('Abhinav.shastri@yahoo.com', 'abhinav@123', 'Employee', 1),
('Ajay.varma@yahoo.com', 'ajay@1234', 'Player', 1),
('amina.mulla@yahoo.com', 'amina.mulla', 'Player', 1),
('Anil.yadav@gmail.com', 'anil.yadav', 'Player', 1),
('david.kumar@yahoo.com', 'David@kumar', 'Player', 1),
('devendra.patel@gmail.com', 'devendra@123', 'Player', 1),
('Giri.S@gmail.com', 'giri@1234', 'Employee', 1),
('Heena.patel@gmail.com', 'heenapatel', 'Employee', 1),
('Jimmy.sharma@gmail.com', 'jimmyjimmy', 'Player', 1),
('John.M@gmail.com', 'John@m123', 'Player', 1),
('Kabir.lamba@gmail.com', 'kabir@1234', 'Player', 1),
('mahendra1@yahoo.com', '1@mahendra', 'Player', 1),
('Mohit.parel@gmail.com', 'mohit.parel', 'Employee', 0),
('Mukesh.khanna@gmail.com', 'mukeshKhanna', 'Player', 1),
('parth.mohit@gmail.com', 'parth@1234', 'Employee', 1),
('Pooja.singh@gmail.com', 'singhpooja', 'Player', 1),
('pramod.sharma@yahoo.com', 'pramod.sharma', 'Employee', 1),
('Priti.shaha@gmail.com', 'Shaha@1234', 'Player', 1),
('Shweta.g@gmail.com', 'shweta@1234', 'Player', 1),
('Singh.raj@gmail.com', 'rajasarkar', 'Employee', 1),
('Sona.mohan@gmail.com', 'live@1243', 'Employee', 1),
('Sunita.mahajan@gmail.com', 'sunita@1234', 'Employee', 1),
('Suresh.kumar@gmail.com', 'sursh@12345', 'Employee', 1),
('Suresh.singh@gmail.com', 'singh@1234', 'Player', 1),
('Sushma.naini@gmail.com', 'Sushma@0987', 'Employee', 1),
('umesh.kumar@gmail.com', 'umesh.kumar', 'Employee', 1),
('Venu.g@yahoo.com', 'venug@123', 'Player', 1),
('vimala.rani@yahoo.com', 'vimalarani', 'Employee', 1),
('Vinit.mahajan@yahoo.com', 'vinitmahajan', 'Player', 1),
('Virat.mehta@gmail.com', 'viratmehta', 'Player', 1),
('Virendra123@gmail.com', 'virendra@12345', 'Employee', 1),
('will.weeton@yahoo.com', 'wittonwill', 'Player', 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_details`
--

CREATE TABLE `membership_details` (
  `membership_name` varchar(50) NOT NULL,
  `membership_description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membership_details`
--

INSERT INTO `membership_details` (`membership_name`, `membership_description`) VALUES
('Bronze', 'This membership includes facilities access for 3 months from joining date'),
('Gold', 'This membership includes facilities access for 9 months from joining date'),
('Platinum', 'This membership includes facilities access for 12 months (i.e. A full year) from joining date'),
('Silver', 'This membership includes facilities access for 6 months from joining date');

-- --------------------------------------------------------

--
-- Table structure for table `offer_details`
--

CREATE TABLE `offer_details` (
  `offer_id` int(11) NOT NULL,
  `offer_description` varchar(2000) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `is_valid` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offer_details`
--

INSERT INTO `offer_details` (`offer_id`, `offer_description`, `valid_from`, `valid_till`, `is_valid`) VALUES
(1, '10% offer for new memebr', '2021-02-01', '2021-02-28', 0),
(2, 'Till 500 Rs off on a referal ', '2021-03-10', '2021-03-25', 1),
(3, '15% on Platinum membership', '2021-01-01', '2021-12-31', 1),
(4, '10% on Gold membership', '2021-01-01', '2021-06-30', 1),
(5, '5% on Silver membership', '2021-01-01', '2021-03-31', 1),
(6, '1000 Rs off for immidiate joiners', '2021-01-01', '2021-02-28', 0),
(7, '5% off on joining in group', '2020-12-27', '2021-01-15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `total_amount` float DEFAULT NULL,
  `remaining_amount` float DEFAULT NULL,
  `status` enum('Not Paid','Paid','In-Installments') NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_offer_applied` enum('Y','N') DEFAULT 'N',
  `offer_id` int(11) DEFAULT NULL,
  `amount_after_offer` float DEFAULT NULL,
  `paid_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `player_id`, `total_amount`, `remaining_amount`, `status`, `updated_on`, `is_offer_applied`, `offer_id`, `amount_after_offer`, `paid_amount`) VALUES
(1, 101, 5000, 0, 'Paid', '2021-03-14 04:44:04', 'N', NULL, 5000, 5000),
(2, 102, 5000, 2500, 'In-Installments', '2021-03-14 04:45:01', 'N', NULL, 5000, 2500),
(3, 105, 10000, 5000, 'In-Installments', '2021-03-14 04:45:41', 'N', NULL, 5000, 5000),
(5, 108, 10000, 4000, 'In-Installments', '2021-03-14 04:47:47', 'Y', 1, 9000, 5000),
(6, 103, 2500, 0, 'Paid', '2021-03-14 04:58:52', 'N', NULL, 2500, 2500),
(7, 104, 7500, 2500, 'In-Installments', '2021-03-14 04:58:52', 'N', NULL, 7500, 5000),
(8, 106, 5000, 0, 'Paid', '2021-03-14 04:58:52', 'N', NULL, 5000, 5000),
(9, 107, 7500, 0, 'Paid', '2021-03-14 04:58:52', 'N', NULL, 7500, 7500),
(10, 109, 10000, 7500, 'In-Installments', '2021-03-14 04:58:52', 'N', NULL, 10000, 2500),
(11, 110, 2500, 0, 'Paid', '2021-03-14 04:58:52', 'N', NULL, 2500, 2500),
(12, 111, 7500, 5000, 'In-Installments', '2021-03-14 04:58:52', 'N', NULL, 7500, 2500),
(13, 112, 5000, 0, 'Paid', '2021-03-14 04:58:52', 'N', NULL, 5000, 5000),
(14, 112, 5000, 0, 'Paid', '2021-03-14 10:06:26', 'Y', 5, 4750, 4750),
(15, 127, 7500, 1750, 'In-Installments', '2021-03-14 10:06:26', 'Y', 4, 6750, 5000),
(16, 128, 2500, 0, 'Paid', '2021-03-14 10:06:26', 'N', NULL, 2500, 2500),
(17, 129, 10000, 2500, 'In-Installments', '2021-03-14 10:06:26', 'Y', 3, 2500, 5000),
(18, 130, 5000, 0, 'Paid', '2021-03-14 10:06:26', 'Y', 4, 4750, 4750),
(19, 131, 10000, 3500, 'In-Installments', '2021-03-14 10:06:26', 'Y', 3, 8500, 5000),
(20, 132, 7500, 1750, 'In-Installments', '2021-03-14 10:06:26', 'Y', 4, 6750, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `players_change_request`
--

CREATE TABLE `players_change_request` (
  `request_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `priority` enum('P1','P2','P3') DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `dead_line` date DEFAULT NULL,
  `status` enum('Created','Assigned','In-Progress','Completed','Rejected') DEFAULT 'Created',
  `created_date` date DEFAULT curdate(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `players_change_request`
--

INSERT INTO `players_change_request` (`request_id`, `created_by`, `description`, `priority`, `assigned_to`, `dead_line`, `status`, `created_date`, `updated_on`) VALUES
(1, 103, 'Need to change the team as my schedules is not fit for me', 'P1', 10, NULL, 'Assigned', '2021-02-18', '2021-03-14 05:04:55'),
(2, 107, 'Need to change the sport to learn new sport', 'P1', 10, NULL, 'Assigned', '2021-01-10', '2021-03-14 05:13:05'),
(3, 110, 'Need to change the team', 'P1', 10, NULL, 'Completed', '2021-01-10', '2021-03-14 05:14:03'),
(4, 111, 'Need to split practice schedule in two to manage time', 'P1', 10, NULL, 'Rejected', '2021-02-10', '2021-03-14 05:16:17'),
(5, 112, 'Need to change team to manage time', 'P1', 10, NULL, 'In-Progress', '2021-02-10', '2021-03-14 05:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `player_absence_details`
--

CREATE TABLE `player_absence_details` (
  `attendance_id` int(11) NOT NULL,
  `absent_from` date DEFAULT NULL,
  `player_id` int(11) NOT NULL,
  `practice_id` int(11) NOT NULL,
  `attendence` enum('Present','Absent') DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `absent_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player_absence_details`
--

INSERT INTO `player_absence_details` (`attendance_id`, `absent_from`, `player_id`, `practice_id`, `attendence`, `reason`, `absent_to`) VALUES
(1, '2021-03-14', 106, 1, 'Absent', 'Medical Reason', NULL),
(2, '2021-03-08', 129, 6, 'Absent', 'Personal Reason', NULL),
(3, '2021-03-16', 130, 8, 'Absent', 'Planned Leave', '2021-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `player_personal_details`
--

CREATE TABLE `player_personal_details` (
  `player_id` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` bigint(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `photo_ID` varchar(200) NOT NULL,
  `joining_date` date DEFAULT NULL,
  `curr_date` date DEFAULT curdate(),
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `interested_sport` varchar(100) NOT NULL,
  `membership_type` varchar(50) DEFAULT NULL,
  `is_member` tinyint(1) DEFAULT 1,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player_personal_details`
--

INSERT INTO `player_personal_details` (`player_id`, `fname`, `lname`, `email`, `contact`, `dob`, `address`, `photo_ID`, `joining_date`, `curr_date`, `gender`, `interested_sport`, `membership_type`, `is_member`, `updated_on`) VALUES
(101, 'Kabir', 'Lamba', 'kabir.lamba@gmail.com', 9823199087, '2001-02-12', 'Sector 49, Gurgaon', 'D:\\SMS\\kabir.bmp', '2021-01-12', '2021-03-13', 'Male', 'Kabaddi,Badminton', 'Silver', 1, '2021-03-14 10:57:02'),
(102, 'Will', 'Witton', 'will.weeton@yahoo.com', 784390754, '1999-12-01', 'Gurgaon Sector 24', 'D:\\SMS\\Will.bmp', '2020-09-01', '2020-12-13', 'Male', 'Football', 'Silver', 0, '2021-03-14 10:57:02'),
(103, 'Virat', 'Mehta', 'Virat.mehta@gmail.com', 774391754, '1993-11-10', 'Near Vatika business Centre, Gurgaon', 'D:\\SMS\\Virat.bmp', '2020-12-13', '2021-03-13', 'Male', 'Football', 'Bronze', 1, '2021-03-14 10:57:02'),
(104, 'Vinit', 'Mahajan', 'Vinit.mahajan@yahoo.com', 7884390700, '1992-11-16', 'Opp to gold gym gurgaon', 'D:\\SMS\\Vinit.bmp', '2020-07-06', '2021-03-13', 'Male', 'Badminton', 'Silver', 1, '2021-03-14 10:57:02'),
(105, 'Venu', 'Gopal', 'Venu.g@yahoo.com', 984390714, '1992-12-01', 'Sector 20 Gurgaon', 'D:\\SMS\\Venu.bmp', '2020-12-03', '2021-03-13', 'Male', 'Badminton', 'Silver', 1, '2021-03-14 10:57:02'),
(106, 'Suresh', 'Singh', 'Suresh.singh@gmail.com', 88421980754, '1991-02-27', 'Sector 20 Gurgaon', 'D:\\SMS\\Suresh.bmp', '2020-11-29', '2021-03-13', 'Male', 'Chess', 'Silver', 1, '2021-03-14 10:57:02'),
(107, 'Shweta', 'G', 'Shweta.g@gmail.com', 90843901232, '1998-05-21', 'Near state bank of india sector 21 Gurgaon', 'D:\\SMS\\Shweta.bmp', '2020-04-14', '2021-03-13', 'Female', 'Tennis', 'Gold', 1, '2021-03-14 10:57:02'),
(108, 'Priti', 'Shaha', 'Priti.shaha@gmail.com', 8143900754, '1999-08-17', 'Near Vatika business centre', 'D:\\SMS\\Priti.bmp', '2021-02-13', '2021-03-13', 'Female', 'Badminton', 'Platinum', 1, '2021-03-14 10:57:02'),
(109, 'Pooja', 'Singh', 'Pooja.singh@gmail.com', 9021439075, '1999-08-14', 'Near Hudda City Center Gurgaon', 'D:\\SMS\\Pooja.bmp', '2020-08-19', '2021-03-13', 'Female', 'Badminton', 'Platinum', 1, '2021-03-14 10:57:02'),
(110, 'Mukesh', 'Khanna', 'Mukesh.khanna@gmail.com', 9021909075, '1998-02-17', 'Sector 12 Gurgaon', 'D:\\SMS\\Mukesh.bmp', '2020-08-01', '2021-03-13', 'Male', 'Chess', 'Bronze', 1, '2021-03-14 10:57:02'),
(111, 'Mahendra', 'M', 'mahendra1@yahoo.com', 8621439095, '2000-10-04', 'Secotr 45 gurgaon', 'D:\\SMS\\Mahendra.bmp', '2020-10-19', '2021-03-13', 'Male', 'Tennis', 'Gold', 1, '2021-03-14 10:57:02'),
(112, 'John', 'M', 'John.M@gmail.com', 9921439075, '2000-08-04', 'Sector 26 gurgaon', 'D:\\SMS\\Joh.nbmp', '2020-07-25', '2021-03-13', 'Male', 'Badminton', 'Silver', 1, '2021-03-14 10:57:02'),
(127, 'Jimmy', 'Sharma', 'Jimmy.sharma@gmail.com', 9977909878, '2000-07-21', 'Sector 49 Gurgaon', 'D\\SMS\\Mahendra.bmp', '2021-02-16', '2021-03-14', 'Male', 'Chess', 'Gold', 1, '2021-03-14 10:57:02'),
(128, 'Ajay', 'Varma', 'Ajay.varma@yahoo.com', 7978909878, '2001-05-18', 'Sector 19 Gurgaon', 'D\\SMS\\Ajay.bmp', '2021-03-19', '2021-03-14', 'Male', 'Running', 'Bronze', 1, '2021-03-14 10:57:02'),
(129, 'Amina', 'Mulla', 'amina.mulla@yahoo.com', 8970109878, '1999-04-18', 'Sector 11 Gurgaon', 'D\\SMS\\Amina.bmp', '2020-10-16', '2021-03-14', 'Male', 'Karate', 'Platinum', 1, '2021-03-14 10:57:02'),
(130, 'Anil', 'Yadav', 'Anil.yadav@gmail.com', 8978901200, '2001-12-18', 'Sector 18 Gurgaon', 'D\\SMS\\Anil.bmp', '2021-04-01', '2021-03-14', 'Male', 'Karate', 'Silver', 1, '2021-03-14 10:57:02'),
(131, 'David', 'Kumar', 'david.kumar@yahoo.com', 7823091823, '2000-12-11', 'Opposite glods gym', 'D\\SMS\\David.bmp', '2020-10-20', '2021-03-14', 'Male', 'Kabaddi', 'Platinum', 1, '2021-03-14 10:57:02'),
(132, 'Devendra', 'Patel', 'devendra.patel@gmail.com', 7890912390, '2000-01-29', 'Sector 18 Gurgaon', 'D\\SMS\\Devendra.bmp', '2021-02-19', '2021-03-14', 'Male', 'Kabaddi', 'Gold', 1, '2021-03-14 10:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `practice_id` int(11) NOT NULL,
  `practice_date` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `till_time` time DEFAULT NULL,
  `status` enum('Confirmed','Canceled','Rescheduled') DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `court_booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practice`
--

INSERT INTO `practice` (`practice_id`, `practice_date`, `from_time`, `till_time`, `status`, `team_id`, `updated_on`, `court_booking_id`) VALUES
(1, '2021-03-14', '10:00:00', '12:00:00', 'Canceled', 4, '2021-03-14 06:31:07', 1),
(2, '2021-03-14', '07:00:00', '10:00:00', 'Confirmed', 2, '2021-03-14 06:36:59', 2),
(3, '2021-03-15', '07:00:00', '10:00:00', 'Confirmed', 3, '2021-03-14 06:37:19', 2),
(4, '2021-03-15', '18:00:00', '20:00:00', 'Confirmed', 6, '2021-03-14 10:40:14', 11),
(5, '2021-03-15', '07:00:00', '09:00:00', 'Confirmed', 10, '2021-03-14 10:40:14', 9),
(6, '2021-03-08', '07:00:00', '09:00:00', 'Confirmed', 10, '2021-03-14 10:40:14', 8),
(7, '2021-03-16', '07:00:00', '10:00:00', 'Confirmed', 2, '2021-03-14 10:43:53', 2),
(8, '2021-03-16', '07:00:00', '09:00:00', 'Rescheduled', 10, '2021-03-14 10:43:53', 9),
(9, '2021-03-22', '08:00:00', '10:00:00', 'Confirmed', 6, '2021-03-14 12:19:07', 12),
(10, '2021-03-22', '08:00:00', '10:00:00', 'Confirmed', 7, '2021-03-14 12:19:07', 12);

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `sport_name` varchar(50) NOT NULL,
  `sport_type` enum('Single','Multi-Player') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`sport_name`, `sport_type`) VALUES
('Badminton', 'Multi-Player'),
('Bascketball', 'Multi-Player'),
('Boxing', 'Multi-Player'),
('Chess', 'Multi-Player'),
('Cricket', 'Single'),
('Football', 'Multi-Player'),
('Kabaddi', 'Multi-Player'),
('Karate', 'Multi-Player'),
('Running', 'Single'),
('Tennis', 'Multi-Player');

-- --------------------------------------------------------

--
-- Table structure for table `team_assignment`
--

CREATE TABLE `team_assignment` (
  `player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_assignment`
--

INSERT INTO `team_assignment` (`player_id`, `team_id`) VALUES
(107, 1),
(111, 1),
(112, 2),
(101, 2),
(105, 2),
(108, 2),
(109, 3),
(106, 4),
(110, 4),
(129, 10),
(130, 10),
(101, 9),
(131, 9),
(132, 9),
(128, 6);

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(30) DEFAULT NULL,
  `sport` varchar(30) NOT NULL,
  `totalPlayer` int(11) NOT NULL,
  `accoupied_position` int(11) NOT NULL,
  `remaining_position` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_details`
--

INSERT INTO `team_details` (`team_id`, `team_name`, `sport`, `totalPlayer`, `accoupied_position`, `remaining_position`, `coach_id`) VALUES
(1, 'Alpha Team', 'Tennis', 4, 2, 2, 11),
(2, 'Smash Team', 'Badminton', 6, 4, 2, 11),
(3, 'Amigos', 'Badminton', 6, 5, 1, 11),
(4, 'Bosses', 'Chess', 2, 2, 0, 10),
(5, 'Chargers', 'Chess', 2, 2, 0, 16),
(6, 'Thunder', 'Running', 3, 1, 2, 20),
(7, 'Captains', 'karate', 3, 2, 1, 19),
(8, 'Giants', 'Kabaddi', 10, 3, 7, 15),
(9, 'Eagles', 'Kabaddi', 6, 3, 3, 17),
(10, 'Flash', 'Karate', 4, 2, 2, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `court_booking_details`
--
ALTER TABLE `court_booking_details`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `court_id` (`court_id`),
  ADD KEY `booked_by` (`booked_by`);

--
-- Indexes for table `court_details`
--
ALTER TABLE `court_details`
  ADD PRIMARY KEY (`court_id`);

--
-- Indexes for table `employee_absence_details`
--
ALTER TABLE `employee_absence_details`
  ADD PRIMARY KEY (`emp_attendance_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `employee_complaints`
--
ALTER TABLE `employee_complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employee_order_request`
--
ALTER TABLE `employee_order_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`),
  ADD KEY `equipment_set` (`equipment_set`);

--
-- Indexes for table `equipment_order`
--
ALTER TABLE `equipment_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `placed_by` (`placed_by`);

--
-- Indexes for table `equipment_set`
--
ALTER TABLE `equipment_set`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `sport_name` (`sport_name`);

--
-- Indexes for table `equipment_usage`
--
ALTER TABLE `equipment_usage`
  ADD KEY `coach_id` (`coach_id`),
  ADD KEY `equipment_set_id` (`equipment_set_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `membership_details`
--
ALTER TABLE `membership_details`
  ADD PRIMARY KEY (`membership_name`);

--
-- Indexes for table `offer_details`
--
ALTER TABLE `offer_details`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `offer_fk` (`offer_id`);

--
-- Indexes for table `players_change_request`
--
ALTER TABLE `players_change_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `player_absence_details`
--
ALTER TABLE `player_absence_details`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `practice_id` (`practice_id`);

--
-- Indexes for table `player_personal_details`
--
ALTER TABLE `player_personal_details`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `membership_type` (`membership_type`);

--
-- Indexes for table `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`practice_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD UNIQUE KEY `sport_name` (`sport_name`);

--
-- Indexes for table `team_assignment`
--
ALTER TABLE `team_assignment`
  ADD KEY `team_id` (`team_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `fk_coach_id` (`coach_id`),
  ADD KEY `sports_fk` (`sport`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `court_booking_details`
--
ALTER TABLE `court_booking_details`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `court_details`
--
ALTER TABLE `court_details`
  MODIFY `court_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_absence_details`
--
ALTER TABLE `employee_absence_details`
  MODIFY `emp_attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_complaints`
--
ALTER TABLE `employee_complaints`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_order_request`
--
ALTER TABLE `employee_order_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `equipment_order`
--
ALTER TABLE `equipment_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `equipment_set`
--
ALTER TABLE `equipment_set`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `offer_details`
--
ALTER TABLE `offer_details`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `players_change_request`
--
ALTER TABLE `players_change_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_absence_details`
--
ALTER TABLE `player_absence_details`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `player_personal_details`
--
ALTER TABLE `player_personal_details`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `practice`
--
ALTER TABLE `practice`
  MODIFY `practice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `court_booking_details`
--
ALTER TABLE `court_booking_details`
  ADD CONSTRAINT `court_booking_details_ibfk_1` FOREIGN KEY (`court_id`) REFERENCES `court_details` (`court_id`),
  ADD CONSTRAINT `court_booking_details_ibfk_2` FOREIGN KEY (`booked_by`) REFERENCES `employee_details` (`emp_id`);

--
-- Constraints for table `employee_absence_details`
--
ALTER TABLE `employee_absence_details`
  ADD CONSTRAINT `employee_absence_details_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_details` (`emp_id`);

--
-- Constraints for table `employee_complaints`
--
ALTER TABLE `employee_complaints`
  ADD CONSTRAINT `employee_complaints_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `employee_details` (`emp_id`),
  ADD CONSTRAINT `employee_complaints_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employee_details` (`emp_id`);

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`);

--
-- Constraints for table `employee_order_request`
--
ALTER TABLE `employee_order_request`
  ADD CONSTRAINT `employee_order_request_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employee_details` (`emp_id`),
  ADD CONSTRAINT `employee_order_request_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `employee_details` (`emp_id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`equipment_set`) REFERENCES `equipment_set` (`set_id`);

--
-- Constraints for table `equipment_order`
--
ALTER TABLE `equipment_order`
  ADD CONSTRAINT `equipment_order_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`),
  ADD CONSTRAINT `equipment_order_ibfk_2` FOREIGN KEY (`placed_by`) REFERENCES `employee_details` (`emp_id`);

--
-- Constraints for table `equipment_set`
--
ALTER TABLE `equipment_set`
  ADD CONSTRAINT `equipment_set_ibfk_1` FOREIGN KEY (`sport_name`) REFERENCES `sports` (`sport_name`);

--
-- Constraints for table `equipment_usage`
--
ALTER TABLE `equipment_usage`
  ADD CONSTRAINT `equipment_usage_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `employee_details` (`emp_id`),
  ADD CONSTRAINT `equipment_usage_ibfk_3` FOREIGN KEY (`equipment_set_id`) REFERENCES `equipment_set` (`set_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `offer_fk` FOREIGN KEY (`offer_id`) REFERENCES `offer_details` (`offer_id`),
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player_personal_details` (`player_id`);

--
-- Constraints for table `players_change_request`
--
ALTER TABLE `players_change_request`
  ADD CONSTRAINT `players_change_request_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `player_personal_details` (`player_id`),
  ADD CONSTRAINT `players_change_request_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `employee_details` (`emp_id`);

--
-- Constraints for table `player_absence_details`
--
ALTER TABLE `player_absence_details`
  ADD CONSTRAINT `player_absence_details_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player_personal_details` (`player_id`),
  ADD CONSTRAINT `player_absence_details_ibfk_2` FOREIGN KEY (`practice_id`) REFERENCES `practice` (`practice_id`);

--
-- Constraints for table `player_personal_details`
--
ALTER TABLE `player_personal_details`
  ADD CONSTRAINT `player_personal_details_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`),
  ADD CONSTRAINT `player_personal_details_ibfk_2` FOREIGN KEY (`membership_type`) REFERENCES `membership_details` (`membership_name`);

--
-- Constraints for table `practice`
--
ALTER TABLE `practice`
  ADD CONSTRAINT `practice_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team_details` (`team_id`);

--
-- Constraints for table `team_assignment`
--
ALTER TABLE `team_assignment`
  ADD CONSTRAINT `team_assignment_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team_details` (`team_id`),
  ADD CONSTRAINT `team_assignment_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player_personal_details` (`player_id`);

--
-- Constraints for table `team_details`
--
ALTER TABLE `team_details`
  ADD CONSTRAINT `fk_coach_id` FOREIGN KEY (`coach_id`) REFERENCES `employee_details` (`emp_id`),
  ADD CONSTRAINT `sports_fk` FOREIGN KEY (`sport`) REFERENCES `sports` (`sport_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
