-- ******************************************
-- Database dump of "Insurence Management"
-- Author : Ankit Gupta 
-- email  : ankit.gnu@rediffmail.com
-- URL    : http://sourceforge.net/projects/insurencemgmt/
-- ******************************************
-- phpMyAdmin SQL Dump
-- version 2.10.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Apr 26, 2009 at 07:03 AM
-- Server version: 5.0.41
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `insure`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `admin`
-- 

CREATE TABLE `admin` (
  `admin_id` varchar(35) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `admin`
-- 

INSERT INTO `admin` (`admin_id`, `password`) VALUES 
('admin', 'admin');

-- --------------------------------------------------------

-- 
-- Table structure for table `agent_info`
-- 

CREATE TABLE `agent_info` (
  `agent_id` varchar(35) NOT NULL,
  `password` varchar(35) default NULL,
  `first_name` varchar(20) default NULL,
  `middle_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `gender` varchar(6) default NULL,
  `Address_line_1` varchar(20) default NULL,
  `Address_line_2` varchar(20) default NULL,
  `city` varchar(35) default NULL,
  `state` varchar(35) default NULL,
  `country` varchar(20) default NULL,
  `pincode` varchar(6) default NULL,
  `phone` varchar(10) default NULL,
  `mobile` varchar(12) default NULL,
  `email` varchar(40) default NULL,
  `date_of_birth` date default NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY  (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `agent_info`
-- 

INSERT INTO `agent_info` (`agent_id`, `password`, `first_name`, `middle_name`, `last_name`, `gender`, `Address_line_1`, `Address_line_2`, `city`, `state`, `country`, `pincode`, `phone`, `mobile`, `email`, `date_of_birth`, `branch_id`) VALUES 
('Ankur', '123456', 'Ankur', '', 'Bankur', 'Male', 'street-229 ', 'Yahveer Gali', 'Ludhiyana', 'Punjab', 'India', '223001', '9983848885', '888949394994', 'ankur@gmail.com', '1986-03-16', 1),
('Saurabh', '12345', 'Saurabh', '', 'Mishra', 'Male', 'Talukdar Miya', 'Aishbagh', 'Lucknow', 'Uttar Pradesh', 'India', '226001', '052273847', '9293848374', 'saur@gmail.com', '1969-12-31', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `branch_info`
-- 

CREATE TABLE `branch_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `Address` varchar(80) NOT NULL,
  `city` varchar(35) NOT NULL,
  `state` varchar(35) NOT NULL,
  `country` varchar(35) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `manager_name` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `branch_info`
-- 

INSERT INTO `branch_info` (`id`, `name`, `Address`, `city`, `state`, `country`, `pin`, `manager_name`) VALUES 
(1, 'Insurence corp. Tiwariganj', '234 Faizabad Road ', 'Lucknow', 'Uttar Pradesh', 'India', '226001', 'Gurveer Khakh'),
(2, 'Insurence corp. ', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', 'India', '226001', ''),
(3, 'Insurance corp.', 'Mahanager Branch', 'Ludhiyana', 'Punjab', 'India', '223001', 'Rarbhit Singh');

-- --------------------------------------------------------

-- 
-- Table structure for table `life_insurence_info`
-- 

CREATE TABLE `life_insurence_info` (
  `policy_id` int(11) NOT NULL,
  `insured_person` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `life_insurence_info`
-- 

INSERT INTO `life_insurence_info` (`policy_id`, `insured_person`, `date_of_birth`, `address`) VALUES 
(1, 'Ankit', '2009-00-01', 'ljsflj'),
(2, '', '2009-00-01', ''),
(5, '', '2009-00-01', ''),
(6, '', '2009-00-01', ''),
(7, '', '2009-00-01', ''),
(8, '', '2009-00-01', ''),
(9, 'Patveer', '1900-02-01', '266/119\r\nklsjf\r\nksjdf\r\n');

-- --------------------------------------------------------

-- 
-- Table structure for table `plan_info`
-- 

CREATE TABLE `plan_info` (
  `plan_id` int(11) NOT NULL auto_increment,
  `plan_name` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  PRIMARY KEY  (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `plan_info`
-- 

INSERT INTO `plan_info` (`plan_id`, `plan_name`, `description`) VALUES 
(1, 'Health Insurance', 'The rising cost of medical care and the resulting pressure on health insurance premiums makes health insurance top priority if you want to have your health expenses covered at a reasonable cost. The current health insurance system is quite complex and constantly changing. '),
(2, 'Life Insurance', 'If people depend on your income, life insurance can replace that income for them if you die. The most commonly recognized case of this is parents with young children. However, it can also apply to couples in which the survivor would be financially stricken by the income lost through the death of a partner, and to dependent adults, such as parents, siblings or adult children who continue to rely on you financially. Insurance to replace your income can be especially useful if the government- or employer-sponsored benefits of your surviving spouse or domestic partner will be reduced after your death.'),
(3, 'Children Plans', 'Children plans are profits plan specifically designed to take care of the educational needs of children. The plan can be taken by a parent on his or her own life. Benefits under the plan are payable at prespecified durations   irrespective of whether the Life Assured survives to the end of the policy term   or dies during the term of the policy. In addition, this plan also provides for   an immediate payment of Basic Sum Assured amount on death of the Life Assured   during the term of the policy. These are a Children''s Plan that provides financial protection against death during the term of plan with periodic payments on survival at specified durations. This plan can be purchased by any of the parent or grand parent for a child aged 0 to 10 years.');

-- --------------------------------------------------------

-- 
-- Table structure for table `policy_taken`
-- 

CREATE TABLE `policy_taken` (
  `policy_id` int(11) NOT NULL auto_increment,
  `user_id` varchar(35) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `duration` int(2) NOT NULL,
  `payment_duration` varchar(15) NOT NULL,
  `amount_insured` bigint(20) NOT NULL,
  PRIMARY KEY  (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `policy_taken`
-- 

INSERT INTO `policy_taken` (`policy_id`, `user_id`, `plan_id`, `start_date`, `duration`, `payment_duration`, `amount_insured`) VALUES 
(1, 'ankigupt', 2, '2009-03-23', 5, 'yearly', 50000),
(9, 'gurveer', 2, '2009-04-05', 5, 'yearly', 50000);

-- --------------------------------------------------------

-- 
-- Table structure for table `premium_history`
-- 

CREATE TABLE `premium_history` (
  `premium_id` bigint(20) NOT NULL auto_increment,
  `policy_id` int(11) NOT NULL,
  `premium_amount` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `mode_payment` varchar(20) NOT NULL,
  `agent_id` varchar(35) NOT NULL,
  PRIMARY KEY  (`premium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `premium_history`
-- 

INSERT INTO `premium_history` (`premium_id`, `policy_id`, `premium_amount`, `date`, `status`, `mode_payment`, `agent_id`) VALUES 
(1, 1, 10000, '2009-04-05', 'Payment Done', 'hjgjgh', ''),
(2, 9, 1000, '2009-04-05', 'Payment Done', 'Cash', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `user_info`
-- 

CREATE TABLE `user_info` (
  `user_id` varchar(35) NOT NULL,
  `password` varchar(35) default NULL,
  `first_name` varchar(20) default NULL,
  `middle_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `gender` varchar(6) default NULL,
  `Address_line_1` varchar(20) default NULL,
  `Address_line_2` varchar(20) default NULL,
  `city` varchar(35) default NULL,
  `state` varchar(35) default NULL,
  `country` varchar(20) default NULL,
  `pincode` varchar(6) default NULL,
  `phone` varchar(10) default NULL,
  `mobile` varchar(12) default NULL,
  `email` varchar(40) default NULL,
  `date_of_birth` date default NULL,
  `occupation` varchar(20) default NULL,
  `annual_incom` int(11) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `user_info`
-- 

INSERT INTO `user_info` (`user_id`, `password`, `first_name`, `middle_name`, `last_name`, `gender`, `Address_line_1`, `Address_line_2`, `city`, `state`, `country`, `pincode`, `phone`, `mobile`, `email`, `date_of_birth`, `occupation`, `annual_incom`) VALUES 
('ankigupt', 'NOKIAN72', 'Ankit', '', 'Gupta', 'Male', 'abcd', 'abcd', 'Lucknow', 'Uttar Pradesh', 'India', '226004', '0934358499', '2039393940', 'alks@lkgj.com', '1978-01-28', 'Engineer', 1500),
('gurveer', '12345', 'Gurveer', '', 'Khak', 'Female', 'slkdf', 'lksjfd', 'lkjs', 'lkj', 'lksdf', '293939', '9349494', '3943494339', 'saur@gmail.com', '1993-01-03', 'lsjflsjsfskl', 39494);