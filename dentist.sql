-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2020 at 07:25 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dentist`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointID` varchar(5) NOT NULL,
  `PatientID` varchar(5) NOT NULL,
  `AppointDate` date NOT NULL,
  `AppointTime` text NOT NULL,
  `Cancel` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointID`, `PatientID`, `AppointDate`, `AppointTime`, `Cancel`) VALUES
('A764', '54863', '2020-01-02', '11:00', NULL),
('A774', '59795', '2020-01-06', '10:00', NULL),
('A805', '59304', '2020-01-20', '11:00', NULL),
('A826', '55183', '2020-02-02', '12:00', NULL),
('A838', '51873', '2020-02-08', '14:00', NULL),
('A855', '57173', '2020-02-18', '15:00', NULL),
('A895', '52859', '2020-02-22', '14:00', 'Yes'),
('A996', '53818', '2020-03-12', '15:00', NULL),
('A997', '58610', '2020-03-12', '16:00', 'Yes'),
('B011', '59511', '2020-03-15', '10:00', NULL),
('B026', '52859', '2020-03-17', '14:00', NULL),
('B044', '58610', '2020-03-20', '11:00', NULL),
('B045', '57173', '2020-03-20', '14:00', NULL),
('B048', '59602', '2020-04-01', '10:00', NULL),
('B049', '56181', '2020-04-01', '11:00', NULL),
('B055', '52859', '2020-04-03', '15:00', NULL),
('B056', '58610', '2020-04-03', '16:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_ID` varchar(5) NOT NULL,
  `AppointID` varchar(5) NOT NULL,
  `AmountDue` decimal(5,2) DEFAULT NULL,
  `CancelFee` decimal(4,2) DEFAULT 0.00,
  `TotalDue` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_ID`, `AppointID`, `AmountDue`, `CancelFee`, `TotalDue`) VALUES
('B4983', 'A764', '60.00', '0.00', '60.00'),
('B5108', 'A774', '100.00', '0.00', '100.00'),
('B5121', 'A805', '80.00', '0.00', '80.00'),
('B5131', 'A826', '220.00', '0.00', '220.00'),
('B5160', 'A838', '60.00', '0.00', '60.00'),
('B5170', 'A855', '110.00', '0.00', '110.00'),
('B5189', 'A996', '600.00', '0.00', '600.00'),
('B5192', 'B011', '80.00', '0.00', '80.00'),
('B5201', 'B026', '270.00', '10.00', '280.00'),
('B5222', 'B044', '260.00', '10.00', '270.00'),
('B5224', 'B045', '600.00', '0.00', '600.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `bills_in_progress`
-- (See below for the actual view)
--
CREATE TABLE `bills_in_progress` (
`Bill_ID` varchar(5)
,`AppointDate` date
,`PatientID` varchar(5)
,`PatientName` mediumtext
,`TotalDue` decimal(5,2)
,`AmountRemaining` decimal(28,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bills_paid`
-- (See below for the actual view)
--
CREATE TABLE `bills_paid` (
`Bill_ID` varchar(5)
,`AppointDate` date
,`PatientID` varchar(5)
,`PatientName` mediumtext
,`TotalDue` decimal(5,2)
,`AmountRemaining` decimal(28,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bills_unpaid`
-- (See below for the actual view)
--
CREATE TABLE `bills_unpaid` (
`Bill_ID` varchar(5)
,`AppointDate` date
,`PatientID` varchar(5)
,`PatientName` mediumtext
,`TotalDue` decimal(5,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `new_appointment`
-- (See below for the actual view)
--
CREATE TABLE `new_appointment` (
`AppointDate` date
,`AppointTime` text
,`PatientID` varchar(5)
,`PatientName` mediumtext
,`PatientAddress` text
,`TreatmentName` text
,`CompleteDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` varchar(5) NOT NULL,
  `PatientFName` text NOT NULL,
  `PatientLName` text NOT NULL,
  `PatientAddress` text DEFAULT NULL,
  `AddDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `PatientFName`, `PatientLName`, `PatientAddress`, `AddDate`) VALUES
('51873', 'Linda', 'Bruton', '99 Sea Road', '2006-10-22'),
('52859', 'Shauna', 'Murphy', '45 Lakeland Meadows', '2006-11-20'),
('53818', 'Gary', 'Brennan', 'Tara, Oldcastle', '2007-02-11'),
('54518', 'Mark', 'O Driscoll', '189 Talbot Gardens', '2007-04-03'),
('54863', 'Colin', 'Masterson', '85 Glen Oaks, Straide', '2008-03-19'),
('55183', 'Susan', 'Collins', '63 Hazel Crescent', '2008-06-12'),
('56181', 'Jennifer', 'Donnellan', '17 Market Square', '2008-10-30'),
('57173', 'Denis', 'O Rourke', '35 Arch Mews', '2008-12-01'),
('58610', 'Paula', 'Martin', 'Iveagh, Whitehall ', '2009-07-17'),
('59304', 'Fiona', 'Costigan', '101 Lakeview Park', '2010-09-28'),
('59511', 'Ronan', 'Murtagh', '8 New Road', '2011-02-02'),
('59602', 'Mary', 'Gargan', 'Horseleap,Moate', '2012-01-05'),
('59795', 'Philip', 'Thompson', '50 North Greens', '2012-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(7) NOT NULL,
  `Bill_ID` varchar(5) NOT NULL,
  `PaymentType` text DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `AmountPaid` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `Bill_ID`, `PaymentType`, `PaymentDate`, `AmountPaid`) VALUES
('MM-H132', 'B4983', 'Credit Card', '2020-01-02', '60.00'),
('MM-H144', 'B5108', 'Cheque', '2020-01-10', '50.00'),
('MM-H151', 'B5121', 'Cheque', '2020-01-25', '50.00'),
('MM-H163', 'B5131', 'Cash', '2020-02-02', '220.00'),
('MM-H166', 'B5160', 'Cash', '2020-02-08', '60.00'),
('MM-H168', 'B5170', 'Cash', '2020-02-20', '110.00'),
('MM-H172', 'B5192', 'Debit Card', '2020-03-17', '80.00'),
('MM-H176', 'B5201', 'Cash', '2020-03-20', '40.00'),
('MM-H177', 'B5189', 'Credit Card', '2020-03-20', '300.00'),
('MM-H182', 'B5189', 'Credit Card', '2020-03-25', '100.00'),
('MM-H183', 'B5189', 'Cash', '2020-03-26', '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `Referral_ID` varchar(5) NOT NULL,
  `SpecialistID` varchar(3) NOT NULL,
  `ReferralDate` date DEFAULT NULL,
  `ReportDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`Referral_ID`, `SpecialistID`, `ReferralDate`, `ReportDate`) VALUES
('R1016', 'S15', '2020-01-02', '2020-03-02'),
('R1019', 'S19', '2020-01-06', '2020-03-12'),
('R1024', 'S19', '2020-02-08', '2020-03-16'),
('R1028', 'S17', '2020-02-18', '2020-04-01'),
('R1039', 'S20', '2020-03-20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `SpecialistID` varchar(3) NOT NULL,
  `SpecialistFName` text NOT NULL,
  `SpecialistLName` text NOT NULL,
  `SpecialistAddress` text DEFAULT NULL,
  `SpecialistType` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`SpecialistID`, `SpecialistFName`, `SpecialistLName`, `SpecialistAddress`, `SpecialistType`) VALUES
('S15', 'James', 'Murray', '3 Lwr. Abbey Street', 'Orthodontic'),
('S16', 'Fiona', 'Cosgrove', '25 South Mall', 'Prosthodontic'),
('S17', 'Brian', 'Hoey', 'Churchfield Garden', 'Maxillofacial'),
('S18', 'Alma', 'Leonard', 'Castletown Primary Care', 'Endodontic'),
('S19', 'Caroline', 'Costello', '88 Mount Street', 'Periodontic'),
('S20', 'Paul', 'Grimes', '54 Castle Street', 'Endodontic');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `AppointID` varchar(5) NOT NULL,
  `TreatmentID` varchar(3) NOT NULL,
  `Quantity` int(2) DEFAULT NULL,
  `CompleteDate` date DEFAULT NULL,
  `FollowUp` text DEFAULT NULL,
  `ReferralID` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`AppointID`, `TreatmentID`, `Quantity`, `CompleteDate`, `FollowUp`, `ReferralID`) VALUES
('A764', 'C01', 1, '2020-01-02', NULL, 'R1016'),
('A774', 'C15', 1, '2020-01-06', NULL, 'R1019'),
('A805', 'C02', 1, '2020-01-20', NULL, NULL),
('A826', 'C14', 2, '2020-02-02', NULL, NULL),
('A838', 'C01', 1, '2020-02-08', NULL, 'R1024'),
('A855', 'C14', 1, '2020-02-18', NULL, 'R1028'),
('A996', 'C18', 1, '2020-03-12', NULL, NULL),
('B011', 'C02', 1, '2020-03-15', NULL, NULL),
('B026', 'C13', 3, '2020-03-17', 'C13', NULL),
('B044', 'C01', 1, '2020-03-20', NULL, NULL),
('B044', 'C04', 1, '2020-03-20', 'C03', NULL),
('B045', 'C18', 1, '2020-03-20', NULL, 'R1039'),
('B048', 'C06', NULL, NULL, NULL, NULL),
('B049', 'C15', NULL, NULL, NULL, NULL),
('B055', 'C13', NULL, NULL, NULL, NULL),
('B056', 'C03', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `treatmentbook`
--

CREATE TABLE `treatmentbook` (
  `TreatmentID` varchar(3) NOT NULL,
  `TreatmentName` text DEFAULT NULL,
  `TreatmentCost` decimal(5,2) DEFAULT NULL,
  `LastUpdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatmentbook`
--

INSERT INTO `treatmentbook` (`TreatmentID`, `TreatmentName`, `TreatmentCost`, `LastUpdate`) VALUES
('C01', 'Cleaning', '60.00', '2020-01-01'),
('C02', 'Whitening', '80.00', '2020-01-01'),
('C03', 'Extraction', '100.00', '2020-01-01'),
('C04', 'X-Ray (bite)', '200.00', '2020-01-01'),
('C05', 'X-Ray (peri)', '250.00', '2020-01-01'),
('C06', 'X-Ray (ortho)', '300.00', '2020-01-01'),
('C13', 'Filling (amalgam)', '90.00', '2020-01-01'),
('C14', 'Filling (composite)', '110.00', '2020-01-01'),
('C15', 'Filling (ceramic)', '100.00', '2020-01-01'),
('C18', 'Root Canal', '600.00', '2020-01-01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `treatment_history`
-- (See below for the actual view)
--
CREATE TABLE `treatment_history` (
`PatientID` varchar(5)
,`PatientName` mediumtext
,`AppointmentDate` varchar(40)
,`TreatmentName` text
,`Quantity` int(2)
);

-- --------------------------------------------------------

--
-- Structure for view `bills_in_progress`
--
DROP TABLE IF EXISTS `bills_in_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bills_in_progress`  AS  select `bill`.`Bill_ID` AS `Bill_ID`,`appointment`.`AppointDate` AS `AppointDate`,`patient`.`PatientID` AS `PatientID`,concat(`patient`.`PatientFName`,' ',`patient`.`PatientLName`) AS `PatientName`,`bill`.`TotalDue` AS `TotalDue`,`bill`.`TotalDue` - sum(`payment`.`AmountPaid`) AS `AmountRemaining` from (((`bill` join `appointment` on(`bill`.`AppointID` = `appointment`.`AppointID`)) join `payment` on(`bill`.`Bill_ID` = `payment`.`Bill_ID`)) join `patient` on(`patient`.`PatientID` = `appointment`.`PatientID`)) group by `bill`.`Bill_ID` having `bill`.`TotalDue` - sum(`payment`.`AmountPaid`) > 0 ;

-- --------------------------------------------------------

--
-- Structure for view `bills_paid`
--
DROP TABLE IF EXISTS `bills_paid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bills_paid`  AS  select `bill`.`Bill_ID` AS `Bill_ID`,`appointment`.`AppointDate` AS `AppointDate`,`patient`.`PatientID` AS `PatientID`,concat(`patient`.`PatientFName`,' ',`patient`.`PatientLName`) AS `PatientName`,`bill`.`TotalDue` AS `TotalDue`,`bill`.`TotalDue` - sum(`payment`.`AmountPaid`) AS `AmountRemaining` from (((`bill` join `appointment` on(`bill`.`AppointID` = `appointment`.`AppointID`)) join `payment` on(`bill`.`Bill_ID` = `payment`.`Bill_ID`)) join `patient` on(`patient`.`PatientID` = `appointment`.`PatientID`)) group by `bill`.`Bill_ID` having `bill`.`TotalDue` - sum(`payment`.`AmountPaid`) = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `bills_unpaid`
--
DROP TABLE IF EXISTS `bills_unpaid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bills_unpaid`  AS  select `bill`.`Bill_ID` AS `Bill_ID`,`appointment`.`AppointDate` AS `AppointDate`,`appointment`.`PatientID` AS `PatientID`,concat(`patient`.`PatientFName`,' ',`patient`.`PatientLName`) AS `PatientName`,`bill`.`TotalDue` AS `TotalDue` from ((`bill` join `patient`) join `appointment`) where `appointment`.`PatientID` = `patient`.`PatientID` and `bill`.`AppointID` = `appointment`.`AppointID` and !(`bill`.`Bill_ID` in (select `payment`.`Bill_ID` from `payment`)) group by `bill`.`Bill_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `new_appointment`
--
DROP TABLE IF EXISTS `new_appointment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `new_appointment`  AS  select `appointment`.`AppointDate` AS `AppointDate`,`appointment`.`AppointTime` AS `AppointTime`,`appointment`.`PatientID` AS `PatientID`,concat(`patient`.`PatientFName`,' ',`patient`.`PatientLName`) AS `PatientName`,`patient`.`PatientAddress` AS `PatientAddress`,`treatmentbook`.`TreatmentName` AS `TreatmentName`,`treatment`.`CompleteDate` AS `CompleteDate` from (((`appointment` join `patient` on(`appointment`.`PatientID` = `patient`.`PatientID`)) join `treatment` on(`treatment`.`AppointID` = `appointment`.`AppointID`)) join `treatmentbook` on(`treatment`.`TreatmentID` = `treatmentbook`.`TreatmentID`)) having `treatment`.`CompleteDate` is null order by `appointment`.`AppointDate` ;

-- --------------------------------------------------------

--
-- Structure for view `treatment_history`
--
DROP TABLE IF EXISTS `treatment_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `treatment_history`  AS  select `appointment`.`PatientID` AS `PatientID`,concat(`patient`.`PatientFName`,' ',`patient`.`PatientLName`) AS `PatientName`,date_format(`appointment`.`AppointDate`,'%d-%b-%Y') AS `AppointmentDate`,`treatmentbook`.`TreatmentName` AS `TreatmentName`,`treatment`.`Quantity` AS `Quantity` from (((`appointment` join `treatmentbook`) join `treatment`) join `patient`) where `appointment`.`PatientID` = `patient`.`PatientID` and `appointment`.`AppointID` = `treatment`.`AppointID` and `treatmentbook`.`TreatmentID` = `treatment`.`TreatmentID` having `treatment`.`Quantity` is not null order by `appointment`.`AppointDate` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointID`),
  ADD UNIQUE KEY `AppointDate` (`AppointDate`,`AppointTime`) USING HASH,
  ADD KEY `FK_PatientID` (`PatientID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_ID`),
  ADD KEY `FK_AppointID` (`AppointID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`) USING BTREE;

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `FK_Bill_ID` (`Bill_ID`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`Referral_ID`),
  ADD KEY `FK_SpecialistID` (`SpecialistID`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`SpecialistID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`AppointID`,`TreatmentID`),
  ADD KEY `FK_TreatmentID` (`TreatmentID`);

--
-- Indexes for table `treatmentbook`
--
ALTER TABLE `treatmentbook`
  ADD PRIMARY KEY (`TreatmentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_PatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_AppointID` FOREIGN KEY (`AppointID`) REFERENCES `appointment` (`AppointID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_Bill_ID` FOREIGN KEY (`Bill_ID`) REFERENCES `bill` (`Bill_ID`);

--
-- Constraints for table `referral`
--
ALTER TABLE `referral`
  ADD CONSTRAINT `FK_SpecialistID` FOREIGN KEY (`SpecialistID`) REFERENCES `specialist` (`SpecialistID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `FK_TreatmentID` FOREIGN KEY (`TreatmentID`) REFERENCES `treatmentbook` (`TreatmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
