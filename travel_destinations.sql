-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 03:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_destinations`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `activity_name` varchar(255) NOT NULL,
  `activity_description` text DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `destination_id`, `activity_name`, `activity_description`, `cost`, `duration`) VALUES
(1, 1, 'Eiffel Tower Visit', 'Visit the iconic Eiffel Tower.', 25.00, '2 hours'),
(2, 1, 'Louvre Museum', 'Explore world-famous art.', 15.00, '4 hours'),
(3, 2, 'Shibuya Crossing', 'Experience the busiest crossing in the world.', 0.00, '1 hour'),
(4, 2, 'Tsukiji Market', 'Visit the famous fish market.', 10.00, '3 hours'),
(5, 3, 'Statue of Liberty Tour', 'Take a ferry to see the Statue of Liberty.', 20.00, '3 hours'),
(6, 3, 'Central Park Walk', 'Stroll through the iconic Central Park.', 0.00, '2 hours'),
(7, 4, 'Colosseum Tour', 'Explore the ancient Roman Colosseum.', 30.00, '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int(11) NOT NULL,
  `destination_name` varchar(255) NOT NULL,
  `country` varchar(100) NOT NULL,
  `best_time_to_visit` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`destination_id`, `destination_name`, `country`, `best_time_to_visit`, `description`, `image_url`) VALUES
(1, 'Paris', 'France', 'Spring', 'The city of lights and love.', 'paris.jpg'),
(2, 'Tokyo', 'Japan', 'Autumn', 'A bustling metropolis with rich culture.', 'tokyo.jpg'),
(3, 'New York City', 'USA', 'Fall', 'The city that never sleeps, known for Times Square and Central Park.', 'nyc.jpg'),
(4, 'Rome', 'Italy', 'Spring', 'The Eternal City, home to the Colosseum and Vatican City.', 'rome.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
