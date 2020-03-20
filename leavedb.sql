-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2020 at 12:58 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leavedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `COMPID` int(11) NOT NULL,
  `COMPANY` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`COMPID`, `COMPANY`) VALUES
(1, 'eMobilis');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepts`
--

CREATE TABLE `tbldepts` (
  `DEPTID` int(11) NOT NULL,
  `DEPTNAME` text NOT NULL,
  `DEPTSHORTNAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepts`
--

INSERT INTO `tbldepts` (`DEPTID`, `DEPTNAME`, `DEPTSHORTNAME`) VALUES
(1, 'Lecture', 'IT'),
(2, 'Management ', 'MN'),
(3, 'Technical Support', 'TD'),
(4, 'Digital Skills', 'DS'),
(5, 'Ajira ', 'AJ');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `EMPID` int(11) NOT NULL,
  `EMPNAME` varchar(60) NOT NULL,
  `EMPPOSITION` varchar(30) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWRD` text NOT NULL,
  `ACCSTATUS` varchar(5) NOT NULL DEFAULT 'NO',
  `EMPSEX` varchar(10) CHARACTER SET macce COLLATE macce_bin NOT NULL DEFAULT 'MALE',
  `COMPANY` varchar(30) NOT NULL,
  `DEPARTMENT` varchar(30) NOT NULL,
  `EMPLOYID` varchar(30) NOT NULL,
  `AVELEAVE` int(11) NOT NULL DEFAULT '18'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`EMPID`, `EMPNAME`, `EMPPOSITION`, `USERNAME`, `PASSWRD`, `ACCSTATUS`, `EMPSEX`, `COMPANY`, `DEPARTMENT`, `EMPLOYID`, `AVELEAVE`) VALUES
(1, 'Lucy Karanja', 'Administrator', 'lucy@emobilis.org', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Female', 'eMobilis', 'HR Department', '001', 18),
(2, 'Mr. Sambo', 'Manager user', 'sambo@gmail.com', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Male', 'eMobilis', 'Technical Support', '002', 18),
(3, 'Beautiful Fracia', 'Supervisor user', 'fraciah@emobilis.org', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Female', 'eMobilis', 'Management ', '005', 2),
(4, 'Clare Jean', 'Normal user', 'clare@emobilis.org', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Female', 'eMobilis', 'Digital Skills', '006', 12),
(15, 'Antony Injila', 'Normal user', 'injila@mail.com', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Male', 'eMobilis', 'Lecture', '003', 16),
(16, 'Meg Nyakeno', 'Normal user', 'onyangomeg@gmail.com', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Female', 'eMobilis', 'Lecture', '004', 17),
(17, 'Keith Juma', 'Normal user', 'keith@emobilis.org', '5c2dd944dde9e08881bef0894fe7b22a5c9c4b06', 'YES', 'Male', 'eMobilis', 'Ajira ', '007', 17);

-- --------------------------------------------------------

--
-- Table structure for table `tblleave`
--

CREATE TABLE `tblleave` (
  `LEAVEID` int(11) NOT NULL,
  `EMPLOYID` varchar(30) NOT NULL,
  `DATESTART` date NOT NULL,
  `DATEEND` date NOT NULL,
  `NODAYS` double NOT NULL,
  `SHIFTTIME` varchar(10) NOT NULL,
  `TYPEOFLEAVE` varchar(30) NOT NULL,
  `REASON` text NOT NULL,
  `LEAVESTATUS` varchar(30) NOT NULL,
  `ADMINREMARKS` text NOT NULL,
  `DATEPOSTED` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleave`
--

INSERT INTO `tblleave` (`LEAVEID`, `EMPLOYID`, `DATESTART`, `DATEEND`, `NODAYS`, `SHIFTTIME`, `TYPEOFLEAVE`, `REASON`, `LEAVESTATUS`, `ADMINREMARKS`, `DATEPOSTED`) VALUES
(1, '34', '2020-03-19', '2020-03-21', 3, 'All Day', 'Casual Leave', 'Hello. I need to self quarantine', 'REJECTED', 'We understand that; but everyone should come to work. alright', '2020-03-18'),
(2, '555', '2020-04-10', '2020-03-17', 25, 'All Day', 'Casual Leave', 'I need to go for holiday', 'REJECTED', 'Noted, your leave days are little so kindly re-apply', '2020-03-18'),
(3, '555', '2020-03-19', '2020-03-19', 1, 'All Day', 'Sick Leave', 'emergency', 'APPROVED', 'Okay Jean. Pole', '2020-03-18'),
(4, '003', '2020-03-19', '2020-03-19', 0.5, 'AM', 'Emergency Leave', 'Emergency', 'APPROVED', 'Noted', '2020-03-18'),
(5, '004', '2020-03-20', '2020-03-20', 1, 'All Day', 'Casual Leave', '', 'REJECTED', 'N/A', '2020-03-19'),
(6, '1004', '2020-03-20', '2020-03-27', 8, 'All Day', 'Emergency Leave', 'I need to self quarantine', 'APPROVED', 'Please do not come until you feel better', '2020-03-19'),
(7, '1004', '2020-05-07', '2020-03-27', 42, 'All Day', 'Casual Leave', 'i need a holiday', 'REJECTED', 'N/A', '2020-03-19'),
(8, '007', '2020-03-20', '2020-03-20', 1, 'All Day', 'Sick Leave', 'I need to see a physician', 'APPROVED', 'N/A', '2020-03-19'),
(9, '003', '2020-03-20', '2020-03-20', 1, 'All Day', 'Sick Leave', 'I need to quarantine', 'APPROVED', 'Usikuje mpaka upone', '2020-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `LEAVTID` int(11) NOT NULL,
  `LEAVETYPE` varchar(30) NOT NULL,
  `DESCRIPTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`LEAVTID`, `LEAVETYPE`, `DESCRIPTION`) VALUES
(1, 'Sick Leave', 'Sick Leave'),
(2, 'Casual Leave', 'Casual Leave'),
(3, 'Unpaid Leave', 'Unpaid Leave'),
(4, 'Maternity Leave', 'Maternity Leave'),
(5, 'Pertanity Leave', 'Pertanity Leave'),
(6, 'Emergency Leave', 'Emergency Leave');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`COMPID`);

--
-- Indexes for table `tbldepts`
--
ALTER TABLE `tbldepts`
  ADD PRIMARY KEY (`DEPTID`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`EMPID`);

--
-- Indexes for table `tblleave`
--
ALTER TABLE `tblleave`
  ADD PRIMARY KEY (`LEAVEID`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`LEAVTID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `COMPID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepts`
--
ALTER TABLE `tbldepts`
  MODIFY `DEPTID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `EMPID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblleave`
--
ALTER TABLE `tblleave`
  MODIFY `LEAVEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `LEAVTID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
