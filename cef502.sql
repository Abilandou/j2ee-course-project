-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2019 at 09:49 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cef502`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'godlove', 'godloveabilandou@gmail.com', 'godlovegoddy', 1, '2019-06-04 18:14:53', '2019-06-04 17:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(14, 'Single Bed Room', 'This is a single bed room and it is most at times good for a single person.', '2019-07-01 10:03:28', '2019-07-11 02:55:32'),
(15, 'Double Bed Room', 'This is a double bed room and most at times it is always good for couples who wants a great deal of rest.', '2019-07-01 10:05:01', '2019-07-01 09:05:01'),
(16, 'Single Bed Room VIP', 'This is just a single bed room but has additional facilities for VIP\'s', '2019-07-01 10:06:16', '2019-07-01 09:06:16'),
(17, 'Double Bed Room VIP', 'This is a double bed room but has additional facilities for VIP\'s.', '2019-07-01 10:07:15', '2019-07-01 09:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Godlove', 'godloveabilandou@gmail.com', 'Testing Contact Us page', 'This is a good site, just trying what the contact for m will say in senarios like this.', '2019-06-24 08:54:41', '0000-00-00 00:00:00'),
(2, 'Paoula paulinei', 'paoulapauline@gmail.com', 'This is really great way to test this contact form.', 'I just want to tell you guys that i like what you people do here because it makes me do great things thank you.', '2019-07-03 11:19:03', '0000-00-00 00:00:00'),
(3, 'Faculty Of Engineering And Technology', 'abilan@gmail.com', 'This is to test the contact us form', 'trying still', '2019-07-04 16:05:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_code` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(2, 'Albania', 'AL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(3, 'Algeria', 'DZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(4, 'American Samoa', 'DS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(5, 'Andorra', 'AD', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(6, 'Angola', 'AO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(7, 'Anguilla', 'AI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(8, 'Antarctica', 'AQ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(9, 'Antigua and Barbuda', 'AG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(10, 'Argentina', 'AR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(11, 'Armenia', 'AM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(12, 'Aruba', 'AW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(13, 'Australia', 'AU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(14, 'Austria', 'AT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(15, 'Azerbaijan', 'AZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(16, 'Bahamas', 'BS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(17, 'Bahrain', 'BH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(18, 'Bangladesh', 'BD', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(19, 'Barbados', 'BB', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(20, 'Belarus', 'BY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(21, 'Belgium', 'BE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(22, 'Belize', 'BZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(23, 'Benin', 'BJ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(24, 'Bermuda', 'BM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(25, 'Bhutan', 'BT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(26, 'Bolivia', 'BO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(27, 'Bosnia and Herzegovina', 'BA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(28, 'Botswana', 'BW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(29, 'Bouvet Island', 'BV', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(30, 'Brazil', 'BR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(31, 'British Indian Ocean Territory', 'IO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(32, 'Brunei Darussalam', 'BN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(33, 'Bulgaria', 'BG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(34, 'Burkina Faso', 'BF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(35, 'Burundi', 'BI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(36, 'Cambodia', 'KH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(37, 'Cameroon', 'CM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(38, 'Canada', 'CA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(39, 'Cape Verde', 'CV', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(40, 'Cayman Islands', 'KY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(41, 'Central African Republic', 'CF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(42, 'Chad', 'TD', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(43, 'Chile', 'CL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(44, 'China', 'CN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(45, 'Christmas Island', 'CX', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(46, 'Cocos (Keeling) Islands', 'CC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(47, 'Colombia', 'CO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(48, 'Comoros', 'KM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(49, 'Congo', 'CG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(50, 'Cook Islands', 'CK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(51, 'Costa Rica', 'CR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(52, 'Croatia (Hrvatska)', 'HR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(53, 'Cuba', 'CU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(54, 'Cyprus', 'CY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(55, 'Czech Republic', 'CZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(56, 'Denmark', 'DK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(57, 'Djibouti', 'DJ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(58, 'Dominica', 'DM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(59, 'Dominican Republic', 'DO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(60, 'East Timor', 'TP', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(61, 'Ecuador', 'EC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(62, 'Egypt', 'EG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(63, 'El Salvador', 'SV', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(64, 'Equatorial Guinea', 'GQ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(65, 'Eritrea', 'ER', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(66, 'Estonia', 'EE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(67, 'Ethiopia', 'ET', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(68, 'Falkland Islands (Malvinas)', 'FK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(69, 'Faroe Islands', 'FO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(70, 'Fiji', 'FJ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(71, 'Finland', 'FI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(72, 'France', 'FR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(73, 'France, Metropolitan', 'FX', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(74, 'French Guiana', 'GF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(75, 'French Polynesia', 'PF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(76, 'French Southern Territories', 'TF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(77, 'Gabon', 'GA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(78, 'Gambia', 'GM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(79, 'Georgia', 'GE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(80, 'Germany', 'DE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(81, 'Ghana', 'GH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(82, 'Gibraltar', 'GI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(83, 'Guernsey', 'GK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(84, 'Greece', 'GR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(85, 'Greenland', 'GL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(86, 'Grenada', 'GD', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(87, 'Guadeloupe', 'GP', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(88, 'Guam', 'GU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(89, 'Guatemala', 'GT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(90, 'Guinea', 'GN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(91, 'Guinea-Bissau', 'GW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(92, 'Guyana', 'GY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(93, 'Haiti', 'HT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(94, 'Heard and Mc Donald Islands', 'HM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(95, 'Honduras', 'HN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(96, 'Hong Kong', 'HK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(97, 'Hungary', 'HU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(98, 'Iceland', 'IS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(99, 'India', 'IN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(100, 'Isle of Man', 'IM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(101, 'Indonesia', 'ID', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(102, 'Iran (Islamic Republic of)', 'IR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(103, 'Iraq', 'IQ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(104, 'Ireland', 'IE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(105, 'Israel', 'IL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(106, 'Italy', 'IT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(107, 'Ivory Coast', 'CI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(108, 'Jersey', 'JE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(109, 'Jamaica', 'JM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(110, 'Japan', 'JP', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(111, 'Jordan', 'JO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(112, 'Kazakhstan', 'KZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(113, 'Kenya', 'KE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(114, 'Kiribati', 'KI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(115, 'Korea, Democratic People\'s Republic of', 'KP', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(116, 'Korea, Republic of', 'KR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(117, 'Kosovo', 'XK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(118, 'Kuwait', 'KW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(119, 'Kyrgyzstan', 'KG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(120, 'Lao People\'s Democratic Republic', 'LA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(121, 'Latvia', 'LV', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(122, 'Lebanon', 'LB', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(123, 'Lesotho', 'LS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(124, 'Liberia', 'LR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(125, 'Libyan Arab Jamahiriya', 'LY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(126, 'Liechtenstein', 'LI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(127, 'Lithuania', 'LT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(128, 'Luxembourg', 'LU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(129, 'Macau', 'MO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(130, 'Macedonia', 'MK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(131, 'Madagascar', 'MG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(132, 'Malawi', 'MW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(133, 'Malaysia', 'MY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(134, 'Maldives', 'MV', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(135, 'Mali', 'ML', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(136, 'Malta', 'MT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(137, 'Marshall Islands', 'MH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(138, 'Martinique', 'MQ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(139, 'Mauritania', 'MR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(140, 'Mauritius', 'MU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(141, 'Mayotte', 'TY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(142, 'Mexico', 'MX', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(143, 'Micronesia, Federated States of', 'FM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(144, 'Moldova, Republic of', 'MD', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(145, 'Monaco', 'MC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(146, 'Mongolia', 'MN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(147, 'Montenegro', 'ME', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(148, 'Montserrat', 'MS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(149, 'Morocco', 'MA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(150, 'Mozambique', 'MZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(151, 'Myanmar', 'MM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(152, 'Namibia', 'NA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(153, 'Nauru', 'NR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(154, 'Nepal', 'NP', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(155, 'Netherlands', 'NL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(156, 'Netherlands Antilles', 'AN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(157, 'New Caledonia', 'NC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(158, 'New Zealand', 'NZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(159, 'Nicaragua', 'NI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(160, 'Niger', 'NE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(161, 'Nigeria', 'NG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(162, 'Niue', 'NU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(163, 'Norfolk Island', 'NF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(164, 'Northern Mariana Islands', 'MP', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(165, 'Norway', 'NO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(166, 'Oman', 'OM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(167, 'Pakistan', 'PK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(168, 'Palau', 'PW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(169, 'Palestine', 'PS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(170, 'Panama', 'PA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(171, 'Papua New Guinea', 'PG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(172, 'Paraguay', 'PY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(173, 'Peru', 'PE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(174, 'Philippines', 'PH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(175, 'Pitcairn', 'PN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(176, 'Poland', 'PL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(177, 'Portugal', 'PT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(178, 'Puerto Rico', 'PR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(179, 'Qatar', 'QA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(180, 'Reunion', 'RE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(181, 'Romania', 'RO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(182, 'Russian Federation', 'RU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(183, 'Rwanda', 'RW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(184, 'Saint Kitts and Nevis', 'KN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(185, 'Saint Lucia', 'LC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(186, 'Saint Vincent and the Grenadines', 'VC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(187, 'Samoa', 'WS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(188, 'San Marino', 'SM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(189, 'Sao Tome and Principe', 'ST', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(190, 'Saudi Arabia', 'SA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(191, 'Senegal', 'SN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(192, 'Serbia', 'RS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(193, 'Seychelles', 'SC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(194, 'Sierra Leone', 'SL', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(195, 'Singapore', 'SG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(196, 'Slovakia', 'SK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(197, 'Slovenia', 'SI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(198, 'Solomon Islands', 'SB', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(199, 'Somalia', 'SO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(200, 'South Africa', 'ZA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(201, 'South Georgia South Sandwich Islands', 'GS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(202, 'South Sudan', 'SS', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(203, 'Spain', 'ES', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(204, 'Sri Lanka', 'LK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(205, 'St. Helena', 'SH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(206, 'St. Pierre and Miquelon', 'PM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(207, 'Sudan', 'SD', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(208, 'Suriname', 'SR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(209, 'Svalbard and Jan Mayen Islands', 'SJ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(210, 'Swaziland', 'SZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(211, 'Sweden', 'SE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(212, 'Switzerland', 'CH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(213, 'Syrian Arab Republic', 'SY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(214, 'Taiwan', 'TW', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(215, 'Tajikistan', 'TJ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(216, 'Tanzania, United Republic of', 'TZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(217, 'Thailand', 'TH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(218, 'Togo', 'TG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(219, 'Tokelau', 'TK', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(220, 'Tonga', 'TO', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(221, 'Trinidad and Tobago', 'TT', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(222, 'Tunisia', 'TN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(223, 'Turkey', 'TR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(224, 'Turkmenistan', 'TM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(225, 'Turks and Caicos Islands', 'TC', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(226, 'Tuvalu', 'TV', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(227, 'Uganda', 'UG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(228, 'Ukraine', 'UA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(229, 'United Arab Emirates', 'AE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(230, 'United Kingdom', 'GB', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(231, 'United States', 'US', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(232, 'United States minor outlying islands', 'UM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(233, 'Uruguay', 'UY', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(234, 'Uzbekistan', 'UZ', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(235, 'Vanuatu', 'VU', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(236, 'Vatican City State', 'VA', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(237, 'Venezuela', 'VE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(238, 'Vietnam', 'VN', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(239, 'Virgin Islands (British)', 'VG', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(240, 'Virgin Islands (U.S.)', 'VI', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(241, 'Wallis and Futuna Islands', 'WF', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(242, 'Western Sahara', 'EH', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(243, 'Yemen', 'YE', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(244, 'Zaire', 'ZR', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(245, 'Zambia', 'ZM', '2019-07-05 09:18:23', '0000-00-00 00:00:00'),
(246, 'Zimbabwe', 'ZW', '2019-07-05 09:18:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `has_room` int(11) NOT NULL DEFAULT '0',
  `has_order` int(11) NOT NULL DEFAULT '0',
  `seen` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `city`, `state`, `country`, `address`, `phone`, `password`, `has_room`, `has_order`, `seen`, `created_at`, `updated_at`) VALUES
(1, 'Godlove', 'Abilandou', 'godloveabilandou@gmail.com', 'Buea', 'South-Westest', 'Cameroon', 'Malingo', '672722945', 'godlove', 1, 1, 1, '2019-05-02 16:39:09', '2019-07-19 16:50:55'),
(2, 'Glenn', 'Fritz', 'gnhsglenn@gmail.com', 'Buea', 'South-Westest', 'Cameroon', 'Malingo', '672725433', 'godlove', 0, 0, 0, '2019-05-02 16:50:30', '2019-07-19 15:10:48'),
(3, 'Christian', 'Esendege', 'christ@gmail.com', 'Buea', 'South-Westest', 'Cameroon', 'Malingo', '6727234342', 'godlove', 0, 0, 0, '2019-05-02 16:59:21', '2019-07-19 14:49:08'),
(4, 'Engineer', 'Abilandou', 'abilandougodlove@gmail.com', 'Tala', 'Talam', 'United States Of America', 'Tala Street', '5639485848', 'godlove', 1, 1, 1, '2019-05-01 18:09:09', '2019-07-20 07:37:16'),
(5, 'Christian', 'talam', 'zakam@gmail.com', 'Buea', 'South-Westest', 'Cameroon', 'Malingo', '78565644', 'godlove', 0, 0, 0, '2019-05-17 06:59:07', '2019-07-19 14:49:17'),
(6, 'Dilon', 'Jaba', 'adulf@gmail.com', 'Buea', 'South-Westes', 'Cameroon', 'Malingo', '67849848', 'godlove', 0, 0, 0, '2019-05-17 07:00:30', '2019-07-19 14:49:21'),
(8, 'Perete', 'Pereta', 'peretata@gmail.com', 'Yaounde', 'Central', 'Cameroon', 'Tombel Street', '+237672722945', NULL, 0, 0, 0, '2019-07-18 18:14:48', '2019-07-19 14:49:25'),
(9, 'Bilares', 'Bilong', 'bilong@gmail.com', 'Yaounde', 'Central', 'Cameroon', 'Tombel Street', '+237672722945', NULL, 0, 0, 0, '2019-07-18 21:23:55', '2019-07-19 14:49:29'),
(10, 'Police', 'Poline', 'policepoline@gmail.com', 'Buea', 'South-Westest', 'Cameroon', 'Malingo street', '+237672722945', 'police', 0, 0, 0, '2019-07-19 15:54:25', '2019-07-19 14:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `id_number` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `id_number`, `name`, `email`, `position`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, '1234564', 'Iyiakod Godlove Abilandou', 'godloveabilandou@gmail.com', 'CEO', '+237672722945', 'Malingo street', '2019-07-03 18:00:30', '0000-00-00 00:00:00'),
(2, '152092004', 'Christian', 'christian@gmail.com', 'Manager', '+237672722945', 'Malingo street', '2019-07-03 17:34:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `country` varchar(255) NOT NULL,
  `adults` int(11) DEFAULT '1',
  `children` int(11) DEFAULT '0',
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `determinant` varchar(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `name`, `email`, `phone`, `country`, `adults`, `children`, `check_in`, `check_out`, `determinant`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Abilandou', 'abilandougodlove@gmail.com', '+237672722945', 'Cameroon', NULL, NULL, '2019-07-05', '2019-07-08', 'Friend', 0, '2019-07-07 18:26:36', '0000-00-00 00:00:00'),
(2, 'palens', 'godloveabilaniuydou@gmail.com', '+237672722945', 'Cameroon', 3, 2, '2019-07-06', '2019-07-12', 'Family', 0, '2019-07-18 11:16:47', '0000-00-00 00:00:00'),
(3, 'Abilandou', 'abilandougodlove@gmail.com', '+237672722945', 'Cameroon', 1, 2, '2019-07-05', '2019-07-09', 'Family', 0, '2019-07-05 10:29:16', '0000-00-00 00:00:00'),
(4, 'Abilandou', 'abilandougodlove@gmail.com', '+237672722945', 'Cameroon', NULL, NULL, '2019-07-06', '2019-07-04', 'Friend', 0, '2019-07-05 10:34:39', '0000-00-00 00:00:00'),
(5, 'Abilandou', 'godloveabilandou@gmail.com', '+237672722945', 'Cameroon', NULL, NULL, '2019-07-05', '2019-07-06', 'Friend', 0, '2019-07-07 18:27:16', '0000-00-00 00:00:00'),
(6, 'Abilandou', 'abilandougodlove@gmail.com', '+237672722945', 'Cameroon', NULL, NULL, '2019-07-05', '2019-07-06', 'Friend', 0, '2019-07-18 16:16:33', '0000-00-00 00:00:00'),
(7, 'Abilandou', 'abilandougodlove@gmail.com', '+237672722945', 'Cameroon', NULL, NULL, '2019-07-05', '2019-07-05', 'Friend', 0, '2019-07-05 10:45:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `meal_type` varchar(100) NOT NULL,
  `number_of_plates` int(11) DEFAULT NULL,
  `amount_per_plate` int(11) DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `received` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`id`, `room_id`, `guest_id`, `meal_type`, `number_of_plates`, `amount_per_plate`, `total_amount`, `received`, `created_at`, `updated_at`) VALUES
(3, 5, 1, 'Break Fast', 2, 1000, 2000, 0, '2019-07-19 16:49:58', '0000-00-00 00:00:00'),
(4, 9, 4, 'Break Fast', 3, 1000, 3000, 0, '2019-07-20 07:36:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CEO', '2019-07-03 12:52:03', '0000-00-00 00:00:00'),
(2, 'Manager', '2019-07-03 12:52:03', '0000-00-00 00:00:00'),
(3, 'Cleaner', '2019-07-03 12:52:48', '0000-00-00 00:00:00'),
(4, 'Receptionist', '2019-07-03 12:52:48', '0000-00-00 00:00:00'),
(5, 'Bar Tender', '2019-07-03 12:53:57', '0000-00-00 00:00:00'),
(6, 'Security Guard', '2019-07-03 12:53:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `check_in` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `adults` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `determinant` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`id`, `room_id`, `customer_id`, `check_in`, `from_time`, `check_out`, `to_time`, `adults`, `children`, `determinant`, `created_at`, `updated_at`) VALUES
(26, 5, 1, '2019-07-18', '09:09:00', '2019-07-19', '21:09:00', 1, 0, 0, '2019-07-18 20:09:11', '2019-07-18 20:09:11'),
(27, 9, 4, '2019-07-20', '14:02:00', '2019-07-26', '18:06:00', 1, 0, 1, '2019-07-20 06:43:00', '2019-07-20 06:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `date_free` date DEFAULT NULL,
  `time_free` time DEFAULT NULL,
  `image` longblob,
  `booked` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `number`, `category`, `description`, `price`, `date_free`, `time_free`, `image`, `booked`, `created_at`, `updated_at`) VALUES
(5, 'Home sweet home', '012', 'Double Bed Room', ' Perfect Room we have here.  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here  Perfect Room we have here.\r\n                            \r\n                            \r\n                            \r\n                            ', 450, '2019-07-20', '03:33:00', NULL, 1, '2019-06-07 02:40:14', '2019-07-20 07:15:52'),
(9, 'Best Ever', '013', 'Double Bed Room VIP', '                              This is a really interesting part of the rooms we gat here\r\n                            \r\n                            ', 3634, '2019-07-06', '03:03:00', NULL, 1, '2019-06-07 03:15:38', '2019-07-20 07:33:33'),
(10, 'Tight and all set up', '014', 'Double Bed Room VIP', '                                                            Very eloquent and free from stress\r\n                            \r\n                            \r\n                            ', 454, '2019-07-13', '05:05:00', NULL, 0, '2019-06-07 03:22:20', '2019-07-19 21:47:05'),
(11, 'Suitable For you here.', '021', 'Double Bed Room', '                                                                                          This is a nice room This is a nice room This is a nice room This is a nice room This is a nice room This is a nice room.\r\n                            \r\n                            \r\n                            \r\n                            \r\n                            ', 500, '2019-07-11', '17:05:00', NULL, 0, '2019-07-01 05:38:26', '2019-07-19 21:47:11'),
(12, 'VIP Sui', '023', 'Single Bed Room VIP', 'Awesome bath tub and other facilitites', 40000, '2019-07-17', '12:23:00', NULL, 0, '2019-07-11 09:16:24', '2019-07-20 03:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `try`
--

CREATE TABLE `try` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `myimg` blob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `try`
--

INSERT INTO `try` (`id`, `name`, `description`, `myimg`, `created_at`, `updated_at`) VALUES
(1, 'Abilandou', 'yiryisrtstjr ndghfg', '', '2019-07-09 13:18:45', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `try`
--
ALTER TABLE `try`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `try`
--
ALTER TABLE `try`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
