-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2019 at 05:27 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enered_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `value`) VALUES
(1, 'random'),
(2, 'random2');

-- --------------------------------------------------------

--
-- Table structure for table `category_facts`
--

CREATE TABLE `category_facts` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `value` varchar(2000) NOT NULL,
  `user` int(11) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `factId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facts`
--

CREATE TABLE `facts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `textArea` varchar(4000) NOT NULL,
  `categoryPointerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facts`
--

INSERT INTO `facts` (`id`, `title`, `image`, `textArea`, `categoryPointerID`) VALUES
(1, 'This is a title', 'https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?cs=srgb&dl=clouds-country-daylight-371633.jpg&fm=jpg', 'This is the description of the article', 1),
(3, 'This is a title3', 'https://cdn.pixabay.com/photo/2015/03/22/18/18/question-685060_960_720.jpg', 'This is the description of the article3', 3),
(4, 'Title', 'https://ichef.bbci.co.uk/news/660/cpsprodpb/E9DF/production/_96317895_gettyimages-164067218.jpg', 'Monkeys are the desecdents of humans.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `correctAnswer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `category`, `text`, `answer1`, `answer2`, `answer3`, `answer4`, `correctAnswer`) VALUES
(1, 1, 'Cine era zeul cifrelor in egiptul antic?', 'SOKAR', 'THOT', 'GANDA', 'BAHMUD', 'GANDA'),
(2, 1, 'Cine era zeul cifrelor in egiptul antic?', 'SOKAR', 'THOT', 'GANDA', 'BAHMUD', 'SOKAR'),
(3, 2, 'Cine era zeul cifrelor in egiptul antic?????', 'SOKAR', 'THOT12', 'SOKARARA', 'BANANA', 'THOT12'),
(4, 2, 'Cine era zeul cifrelor in Romania?', 'SOKAR', 'THOT12', 'SOKARARA', 'BANANA', 'BANANA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(266) NOT NULL,
  `loginToken` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `loginToken`) VALUES
(1, 'ccossti', 'costy_ciobanu98@yahoo.com', '12345', ''),
(2, 'dsa', '', '', ''),
(3, 'test', 'test@email.com', 'test', ''),
(4, 'test1', 'test1@test.com', 'test', ''),
(5, 'fsd', 'dsf', 'av', ''),
(6, 'fsg', 'dsadas', 'qwe', ''),
(7, 'qweasd', 'qweasd', 'qweasd', ''),
(8, '', 'sadsadas', '', ''),
(9, 'Costel', 'costel@domain.com', 'test', ''),
(10, 'Codrin1234', 'codrin1234@email.com', 'test', 'U4u4Z7mnVt5h4CK1hvWiSBMlITPS8Qd6ZpuKB4N2QMGG22gT2M');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_facts`
--
ALTER TABLE `category_facts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facts`
--
ALTER TABLE `facts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_facts`
--
ALTER TABLE `category_facts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facts`
--
ALTER TABLE `facts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
