-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2017 at 06:41 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `myProc` (`in_employee_id` INT)  BEGIN
         IF myFunction(in_employee_id) > 0 THEN
               select 'greater than 0';
         ELSE
               select 'less or equals than 0';
         END IF;
     END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hello` (`s` CHAR(20)) RETURNS CHAR(50) CHARSET latin1 RETURN CONCAT('Hello, ',s,'!')$$

CREATE DEFINER=`root`@`localhost` FUNCTION `myFunction` (`in_rep_id` INT) RETURNS INT(11) READS SQL DATA
BEGIN
          DECLARE customer_count INT;
    
          SELECT COUNT(*)
               INTO customer_count
           FROM employee
           WHERE id=in_rep_id;
    
          RETURN(customer_count);
    
     END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `currency_converter`
--

CREATE TABLE `currency_converter` (
  `id` int(11) UNSIGNED NOT NULL,
  `from` varchar(5) NOT NULL,
  `to` varchar(5) NOT NULL,
  `rates` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency_converter`
--

INSERT INTO `currency_converter` (`id`, `from`, `to`, `rates`, `created`, `modified`) VALUES
(1, 'USD', 'INR', '64.497', '2017-12-03 21:18:21', '2017-12-03 21:18:21'),
(2, 'INR', 'USD', '0.015525', '2017-12-03 21:19:25', '2017-12-12 06:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `salary` float(8,2) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `description` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `start_date`, `end_date`, `salary`, `city`, `description`) VALUES
(1, 'Jason', 'Martin', '1996-07-25', '2006-07-25', 1234.56, 'Toronto', 'Programmer'),
(2, 'Alison', 'Mathews', '1976-03-21', '1986-02-21', 6661.78, 'Vancouver', 'Tester'),
(3, 'James', 'Smith', '1978-12-12', '1990-03-15', 6544.78, 'Vancouver', 'Tester'),
(4, 'Celia', 'Rice', '1982-10-24', '1999-04-21', 2344.78, 'Vancouver', 'Manager'),
(5, 'Robert', 'Black', '1984-01-15', '1998-08-08', 2334.78, 'Vancouver', 'Tester'),
(6, 'Linda', 'Green', '1987-07-30', '1996-01-04', 4322.78, 'New York', 'Tester'),
(7, 'David', 'Larry', '1990-12-31', '1998-02-12', 7897.78, 'New York', 'Manager'),
(8, 'James', 'Cat', '1996-09-17', '2002-04-15', 1232.78, 'Vancouver', 'Tester');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `title`, `emp_id`) VALUES
(1, 'Tester', 1),
(2, 'Accountant', 2),
(3, 'Developer', 3),
(4, 'Coder', 4),
(5, 'Director', 5),
(6, 'Mediator', 6),
(7, 'Proffessor', 7),
(8, 'Programmer', 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myview`
-- (See below for the actual view)
--
CREATE TABLE `myview` (
`id` int(11)
,`first_name` varchar(15)
,`title` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `page_description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_slug`, `page_description`, `user_id`, `created_by`, `modified_by`, `created_date`, `modified_date`, `is_active`) VALUES
(1, 'Gufran Hasan', 'gufran-hasan', 'Hi,\r\n\r\nGufran Hasan Your first user to creating your account on it. \r\nThanks', 1, 1, 1, '2017-11-22 21:00:00', '0000-00-00 00:00:00', '1'),
(2, 'Huma Naz', 'huma-naz', 'Hi,\r\n\r\nHuma naaz Your seconduser to creating your account on it. \r\nThanks', 1, 1, 1, '2017-11-22 21:00:00', '0000-00-00 00:00:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `postjobs`
-- (See below for the actual view)
--
CREATE TABLE `postjobs` (
`JobId` int(11)
,`JobTitle` varchar(255)
,`JobDesc` varchar(255)
,`JobFile` varchar(255)
,`Status` int(11)
,`Order` int(11)
,`CreatedAt` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created`, `modified`, `status`) VALUES
(1, 'post one', 'post testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1),
(2, 'post two', 'post two testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1),
(3, 'post three', 'post three testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1),
(4, 'post four', 'post four testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1),
(5, 'post five', 'post five testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1),
(6, 'post six', 'post six testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1),
(7, 'post seven', 'post seven testing data', '2017-12-03 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `postsjobs`
-- (See below for the actual view)
--
CREATE TABLE `postsjobs` (
`JobTitle` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `status`) VALUES
(1, 'Product one', 'img-1.jpg', 1.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbjobs`
--

CREATE TABLE `tbjobs` (
  `JobId` int(11) NOT NULL,
  `JobTitle` varchar(255) NOT NULL,
  `JobDesc` varchar(255) NOT NULL,
  `JobFile` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL,
  `Order` int(11) NOT NULL,
  `CreatedAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbjobs`
--

INSERT INTO `tbjobs` (`JobId`, `JobTitle`, `JobDesc`, `JobFile`, `Status`, `Order`, `CreatedAt`) VALUES
(1, 'doctor', 'simple dec', 'cv.pdf', 1, 1, 1484231349),
(2, 'developer', 'simple dec', 'cv2.doxc', 1, 2, 1484481322),
(3, 'lawer', 'simple dec', 'mycv.docx', 1, 3, 1484481862),
(4, 'Designer', 'simple Description', 'mycv.docx', 1, 3, 1484481862);

-- --------------------------------------------------------

--
-- Table structure for table `tbposts`
--

CREATE TABLE `tbposts` (
  `PostId` int(11) NOT NULL,
  `PostTitle` varchar(300) NOT NULL,
  `PostSlug` varchar(255) NOT NULL,
  `PostDesc` text NOT NULL,
  `PostSubject` longtext NOT NULL,
  `PostType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=news 2-articles ',
  `CreatedAt` int(11) NOT NULL,
  `CountVisit` int(11) NOT NULL,
  `PostImage` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbposts`
--

INSERT INTO `tbposts` (`PostId`, `PostTitle`, `PostSlug`, `PostDesc`, `PostSubject`, `PostType`, `CreatedAt`, `CountVisit`, `PostImage`, `status`, `order`) VALUES
(81, 'first article', '', 'article desc demo', '', 2, 1484044582, 50, 'image.jpg', 1, 4),
(82, 'first new post', '', 'new desc demo', '', 1, 1484044582, 40, 'image.png', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbvideos`
--

CREATE TABLE `tbvideos` (
  `VideoId` int(11) NOT NULL,
  `VideoName` varchar(150) NOT NULL,
  `PhotoUrl` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `CountVisit` int(11) NOT NULL,
  `Order` int(11) NOT NULL,
  `CreatedAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='videos table';

--
-- Dumping data for table `tbvideos`
--

INSERT INTO `tbvideos` (`VideoId`, `VideoName`, `PhotoUrl`, `status`, `CountVisit`, `Order`, `CreatedAt`) VALUES
(30, 'HYBRID-CAR WASH TUNNEL', 'apJnxEIItXE', 1, 0, 0, 1454837954),
(31, 'Hoppy\'s Handwash Cafe', 'Nb6rIIDg9OI', 1, 0, 0, 1454837977);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `picture_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_provider`, `oauth_uid`, `first_name`, `last_name`, `email`, `gender`, `locale`, `picture_url`, `profile_url`, `created`, `modified`) VALUES
(1, '', '', 'gufran', 'hasan', 'gufran@gmail.com', 'male', '', '', '', '2017-12-02 00:00:00', '0000-00-00 00:00:00'),
(2, '', '', 'Kamran', 'hasan', 'kamran@gmail.com', 'male', '', '', '', '2017-12-02 00:00:00', '0000-00-00 00:00:00'),
(3, '', '', 'Imran', 'hasan', 'Imran@gmail.com', 'male', '', '', '', '2017-12-02 00:00:00', '0000-00-00 00:00:00'),
(4, '', '', 'Shamsul', 'hasan', 'Shamsul@gmail.com', 'male', '', '', '', '2017-12-02 00:00:00', '0000-00-00 00:00:00'),
(5, '', '', 'Ayan', 'hasan', 'ayan@gmail.com', 'male', '', '', '', '2017-12-02 00:00:00', '0000-00-00 00:00:00'),
(6, '', '', 'Awan', 'hasan', 'awan@gmail.com', 'male', '', '', '', '2017-12-02 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure for view `myview`
--
DROP TABLE IF EXISTS `myview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myview`  AS  select `employee`.`id` AS `id`,`employee`.`first_name` AS `first_name`,`job`.`title` AS `title` from (`employee` join `job` on((`employee`.`id` = `job`.`emp_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `postjobs`
--
DROP TABLE IF EXISTS `postjobs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `postjobs`  AS  select `tbjobs`.`JobId` AS `JobId`,`tbjobs`.`JobTitle` AS `JobTitle`,`tbjobs`.`JobDesc` AS `JobDesc`,`tbjobs`.`JobFile` AS `JobFile`,`tbjobs`.`Status` AS `Status`,`tbjobs`.`Order` AS `Order`,`tbjobs`.`CreatedAt` AS `CreatedAt` from `tbjobs` WITH CASCADED CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `postsjobs`
--
DROP TABLE IF EXISTS `postsjobs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `postsjobs`  AS  select `tbjobs`.`JobTitle` AS `JobTitle` from `tbjobs` where (`tbjobs`.`Status` = 1) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency_converter`
--
ALTER TABLE `currency_converter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD KEY `id_idx` (`emp_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbjobs`
--
ALTER TABLE `tbjobs`
  ADD PRIMARY KEY (`JobId`);

--
-- Indexes for table `tbposts`
--
ALTER TABLE `tbposts`
  ADD PRIMARY KEY (`PostId`);

--
-- Indexes for table `tbvideos`
--
ALTER TABLE `tbvideos`
  ADD PRIMARY KEY (`VideoId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currency_converter`
--
ALTER TABLE `currency_converter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbjobs`
--
ALTER TABLE `tbjobs`
  MODIFY `JobId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbposts`
--
ALTER TABLE `tbposts`
  MODIFY `PostId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `tbvideos`
--
ALTER TABLE `tbvideos`
  MODIFY `VideoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
