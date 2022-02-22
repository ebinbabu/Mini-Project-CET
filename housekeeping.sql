-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2022 at 04:45 PM
-- Server version: 5.7.37-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `housekeeping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(12) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `hostel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `hostel`) VALUES
(1, 'admin', 'admin', 'CET');

-- --------------------------------------------------------

--
-- Table structure for table `cleanrequest`
--

CREATE TABLE `cleanrequest` (
  `request_id` int(12) NOT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `cleaningtime` time DEFAULT NULL,
  `req_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cleanrequest`
--

INSERT INTO `cleanrequest` (`request_id`, `rollnumber`, `worker_id`, `date`, `cleaningtime`, `req_status`) VALUES
(1, 1001, NULL, '2022-02-23', '19:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaint_id` int(12) NOT NULL,
  `feedback_id` int(11) DEFAULT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  `complaint` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(12) NOT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `rating` tinyint(2) DEFAULT NULL,
  `timein` time DEFAULT NULL,
  `timeout` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `housekeeper`
--

CREATE TABLE `housekeeper` (
  `worker_id` int(12) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `hostel` varchar(20) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `room_cleaned` int(5) DEFAULT NULL,
  `complaints` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `rollnumber` int(12) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `room` varchar(8) DEFAULT NULL,
  `floor` tinyint(4) DEFAULT NULL,
  `hostel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`rollnumber`, `password`, `room`, `floor`, `hostel`) VALUES
(1001, '21232f297a57a5a743894a0e4a801fc3', 'cs01', 1, 'cet');

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `suggestion_id` int(12) NOT NULL,
  `feedback_id` int(11) DEFAULT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  `suggestion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cleanrequest`
--
ALTER TABLE `cleanrequest`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `rollnumber` (`rollnumber`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `feedback_id` (`feedback_id`),
  ADD KEY `rollnumber` (`rollnumber`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `rollnumber` (`rollnumber`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `housekeeper`
--
ALTER TABLE `housekeeper`
  ADD PRIMARY KEY (`worker_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`rollnumber`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`suggestion_id`),
  ADD KEY `feedback_id` (`feedback_id`),
  ADD KEY `rollnumber` (`rollnumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cleanrequest`
--
ALTER TABLE `cleanrequest`
  MODIFY `request_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaint_id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `housekeeper`
--
ALTER TABLE `housekeeper`
  MODIFY `worker_id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `suggestion_id` int(12) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cleanrequest`
--
ALTER TABLE `cleanrequest`
  ADD CONSTRAINT `cleanrequest_ibfk_1` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`),
  ADD CONSTRAINT `cleanrequest_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `housekeeper` (`worker_id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`feedback_id`),
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `cleanrequest` (`request_id`);

--
-- Constraints for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD CONSTRAINT `suggestions_ibfk_1` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`feedback_id`),
  ADD CONSTRAINT `suggestions_ibfk_2` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
