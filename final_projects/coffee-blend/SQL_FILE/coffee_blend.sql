-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 12:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_blend`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `adminname`, `email`, `password`, `created_at`) VALUES
(4, 'kimlyjr', 'admin@gmail.com', '$2y$10$u9y2vBJWg5P482tvZ.MT1OGPx8bgAkF4nl6ojDacFTX7y4nRYncKq', '2024-11-27 11:16:34'),
(5, 'user2', 'admin2@gmail.com', '$2y$10$ztXs40l6PmMHgFf1OHU/m.rLuq.Ujca36aPDXkf8Q9iJNU2potGdi', '2024-11-27 11:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `date` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Pending',
  `user_id` int(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `first_name`, `last_name`, `date`, `time`, `phone`, `message`, `status`, `user_id`, `created_at`) VALUES
(22, 'khon', 'kimly', '11/30/2024', '1:00am', '70923129', 'hello im ly i want to booking table today', 'Done', 5, '2024-11-27 11:11:17'),
(23, 'user', '2', '11/30/2024', '1:00am', '12345678', 'hi im new client', 'Done', 6, '2024-11-27 11:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` varchar(10) NOT NULL,
  `pro_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `name`, `image`, `price`, `pro_id`, `description`, `quantity`, `user_id`, `created_at`) VALUES
(19, 'ice', 'menu-3.jpg', '3', 13, 'nono', 2, 5, '2024-11-27 11:12:30'),
(20, 'sting', 'drink-7.jpg', '2', 16, 'lorem', 2, 5, '2024-11-27 11:12:42'),
(21, 'sting', 'drink-7.jpg', '2', 16, 'lorem', 1, 6, '2024-11-27 11:33:17'),
(22, 'caake', 'burger-3.jpg', '4', 12, 'no', 1, 6, '2024-11-27 11:33:28');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `street_address` varchar(200) NOT NULL,
  `town` varchar(200) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` varchar(200) NOT NULL,
  `total_price` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `first_name`, `last_name`, `state`, `street_address`, `town`, `zip_code`, `phone`, `user_id`, `status`, `total_price`, `created_at`) VALUES
(10, 'khon', 'kimly', 'France', '168 b1', 'borey piphob tmey', '10201', '70923129', 5, 'Delivered', 17, '2024-11-27 11:13:45'),
(11, 'user', '2', 'Italy', '168', 'phnom penh', '10201', '12345678', 6, 'Delivered', 13, '2024-11-27 11:34:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(10) NOT NULL,
  `type` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `description`, `price`, `type`, `created_at`) VALUES
(12, 'caake', 'burger-3.jpg', 'no', '4', 'dessert', '2024-11-27 09:48:07'),
(13, 'ice', 'menu-3.jpg', 'nono', '3', 'drink', '2024-11-27 09:48:33'),
(14, 'coffee', 'menu-2.jpg', 'yes', '2', 'dessert', '2024-11-27 09:49:05'),
(15, 'hot coca', 'dessert-2.jpg', 'cocaaa', '1', 'drink', '2024-11-27 09:49:39'),
(16, 'sting', 'drink-7.jpg', 'lorem', '2', 'drink', '2024-11-27 09:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) NOT NULL,
  `review` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `review`, `username`, `created_at`) VALUES
(3, 'food and drink so good', 'Khon kimly', '2024-11-27 11:18:08'),
(4, 'your place so good and so interesting', 'Khon kimly', '2024-11-27 11:19:05'),
(5, 'good product', 'user2', '2024-11-27 11:37:21'),
(6, 'good place', 'user2', '2024-11-27 11:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(5, 'Khon kimly', 'user@gmail.com', '$2y$10$u9y2vBJWg5P482tvZ.MT1OGPx8bgAkF4nl6ojDacFTX7y4nRYncKq', '2024-11-27 11:10:09'),
(6, 'user2', 'user2@gmail.com', '$2y$10$ztXs40l6PmMHgFf1OHU/m.rLuq.Ujca36aPDXkf8Q9iJNU2potGdi', '2024-11-27 11:31:48'),
(7, 'usr3', 'user3@gmail.com', '$2y$10$Lm89MKASvDhGO0J/RQiwtODmrt1idRyckD64jZcuadqx7kwMGeehe', '2024-12-02 23:13:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
