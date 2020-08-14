-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2020 at 06:18 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edubee`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `name`, `email`, `address`, `phone_number`) VALUES
(8, 'mugdho', 'mugdho@edubee.com', 'kollyanpur', 5218415);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_ID` varchar(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `section` varchar(10) NOT NULL,
  `instructor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_ID`, `course_name`, `section`, `instructor`) VALUES
('cs101', 'introduction to programming', 'A', 'showren'),
('cs101', 'introduction to programming', 'B', 'Showren'),
('cs102', 'Introduction to programmin 2', 'A', 'mugdho'),
('mat101', 'differential calculus and ordinate geometry', 'A', 'monim'),
('mat101', 'differential calculus and ordinate geometry', 'B', 'monim'),
('eee101', 'Direct Circuit', 'B', 'naruto');

-- --------------------------------------------------------

--
-- Table structure for table `course_files`
--

CREATE TABLE `course_files` (
  `course_ID` varchar(10) NOT NULL,
  `file_link` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course_videos`
--

CREATE TABLE `course_videos` (
  `course_ID` varchar(10) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `courses` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `email`, `phone_number`, `courses`) VALUES
(7, 'showren', 'showren@edubee.com', 175488541, '');

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `ID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moderator`
--

INSERT INTO `moderator` (`ID`, `name`, `email`, `address`, `phone_number`) VALUES
(9, 'sadia', 'sadia@edubee.com', 'mirpur 11', 154778542);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `pid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `title` varchar(24) NOT NULL,
  `details` varchar(128) NOT NULL,
  `time` datetime(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`pid`, `id`, `name`, `title`, `details`, `time`) VALUES
(1, 1, 'superadmin', '1st post title', 'the post', '0000-00-00 00:00:00.00'),
(2, 1, 'superadmin', '1st post title', 'the post', '0000-00-00 00:00:00.00'),
(3, 0, 'superadmin', '2nd', 'dfdf', '2020-08-14 09:29:08.02');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `program` varchar(50) NOT NULL,
  `courses` varchar(100) NOT NULL,
  `CGPA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `name`, `email`, `phone_number`, `program`, `courses`, `CGPA`) VALUES
(6, 'sajid', 'sajid@edubee.com', 154784451, 'Bsc. CSE', '', 3.99);

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `aid` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `details` varchar(128) NOT NULL,
  `time` datetime(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`aid`, `name`, `title`, `details`, `time`) VALUES
(1, 'admin', '1st announsment title', '1st announsment title for test not title', '0000-00-00 00:00:00.00'),
(2, 'admin', '1st announsment title', '1st announsment title for test not title', '0000-00-00 00:00:00.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `role`) VALUES
(1, 'superadmin', '123456789', 1),
(2, 'admin', '234567891', 2),
(3, 'moderator', '345678912', 3),
(4, 'instructor', '456789123', 4),
(5, 'student', '567891234', 5),
(6, 'sajid', 'sajid', 5),
(7, 'showren', 'showren', 4),
(8, 'mugdho', 'mugdho', 2),
(9, 'sadia', 'sadia', 3),
(11, 'sasuke', 'sasuke', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
