-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2017 at 06:13 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` int(11) UNSIGNED NOT NULL,
  `Customer_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cast_crew_name`
--

CREATE TABLE `cast_crew_name` (
  `Name_ID` int(11) UNSIGNED NOT NULL,
  `First` varchar(100) NOT NULL,
  `Last` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) UNSIGNED NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `film_format`
--

CREATE TABLE `film_format` (
  `Format_ID` int(11) UNSIGNED NOT NULL,
  `Format_Name` varchar(50) NOT NULL,
  `Projection_Gauge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `Genre_ID` int(11) UNSIGNED NOT NULL,
  `Genre_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Movie_ID` int(11) UNSIGNED NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Rating_ID` int(11) UNSIGNED NOT NULL,
  `Length` varchar(50) NOT NULL,
  `Description` varchar(150) NOT NULL,
  `Release_Date` date NOT NULL,
  `Closed_Caption` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Format_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movies_cast_crew`
--

CREATE TABLE `movies_cast_crew` (
  `Movie_ID` int(11) UNSIGNED NOT NULL,
  `Name_ID` int(11) UNSIGNED NOT NULL,
  `Job_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movies_customer_reviews`
--

CREATE TABLE `movies_customer_reviews` (
  `Movie_ID` int(11) UNSIGNED NOT NULL,
  `Customer_ID` int(11) UNSIGNED NOT NULL,
  `Score_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movies_genres`
--

CREATE TABLE `movies_genres` (
  `Genre_ID` int(11) UNSIGNED NOT NULL,
  `Movie_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movies_rating_reasons`
--

CREATE TABLE `movies_rating_reasons` (
  `Movie_ID` int(11) UNSIGNED NOT NULL,
  `Reason_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_job`
--

CREATE TABLE `movie_job` (
  `Job_ID` int(11) UNSIGNED NOT NULL,
  `Job_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_room`
--

CREATE TABLE `movie_room` (
  `Room_ID` int(11) UNSIGNED NOT NULL,
  `Capacity` int(11) UNSIGNED NOT NULL,
  `Room_Type_ID` int(11) UNSIGNED NOT NULL,
  `Theater_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_room_type`
--

CREATE TABLE `movie_room_type` (
  `Room_Type_ID` int(11) UNSIGNED NOT NULL,
  `Room_Description` varchar(50) NOT NULL DEFAULT 'Standard'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `Price_ID` int(11) UNSIGNED NOT NULL,
  `Time_ID` int(11) UNSIGNED NOT NULL,
  `Theater_ID` int(11) UNSIGNED NOT NULL,
  `Age_Category` enum('Adult','Senior','Child') NOT NULL DEFAULT 'Adult',
  `Day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `Price` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Rating_ID` int(11) UNSIGNED NOT NULL,
  `Rating_Symbol` varchar(50) NOT NULL,
  `Symbol_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating_reason`
--

CREATE TABLE `rating_reason` (
  `Reason_ID` int(11) UNSIGNED NOT NULL,
  `Reason_Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review_star_score`
--

CREATE TABLE `review_star_score` (
  `Score_ID` int(11) UNSIGNED NOT NULL,
  `Number_Star` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `Seat_ID` int(11) UNSIGNED NOT NULL,
  `Row` int(11) UNSIGNED NOT NULL,
  `Number` int(11) UNSIGNED NOT NULL,
  `Room_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `showtime`
--

CREATE TABLE `showtime` (
  `Showtime_ID` int(11) UNSIGNED NOT NULL,
  `Room_ID` int(11) UNSIGNED NOT NULL,
  `Movie_ID` int(11) UNSIGNED NOT NULL,
  `Time_ID` int(11) UNSIGNED NOT NULL,
  `Day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE `theater` (
  `Theater_ID` int(11) UNSIGNED NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Capacity` int(11) UNSIGNED NOT NULL,
  `Phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_ID` int(11) UNSIGNED NOT NULL,
  `Seat_ID` int(11) UNSIGNED NOT NULL,
  `Booking_ID` int(11) UNSIGNED NOT NULL,
  `Showtime_ID` int(11) UNSIGNED NOT NULL,
  `Price_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `Time_ID` int(11) UNSIGNED NOT NULL,
  `Time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `FK_booking_customer_Customer_ID` (`Customer_ID`);

--
-- Indexes for table `cast_crew_name`
--
ALTER TABLE `cast_crew_name`
  ADD PRIMARY KEY (`Name_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `film_format`
--
ALTER TABLE `film_format`
  ADD PRIMARY KEY (`Format_ID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`Genre_ID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`Movie_ID`),
  ADD KEY `FK_movie_rating_Rating_ID` (`Rating_ID`),
  ADD KEY `FK_movie_film_format_Format_ID` (`Format_ID`);

--
-- Indexes for table `movies_cast_crew`
--
ALTER TABLE `movies_cast_crew`
  ADD KEY `FK_movie_cast_crew_movie_Movie_ID` (`Movie_ID`),
  ADD KEY `FK_movie_cast_crew_cast_crew_name_Name_ID` (`Name_ID`),
  ADD KEY `FK_movie_cast_crew_movie_job_Job_ID` (`Job_ID`);

--
-- Indexes for table `movies_customer_reviews`
--
ALTER TABLE `movies_customer_reviews`
  ADD KEY `FK_movies_customer_reviews_movie_Movie_ID` (`Movie_ID`),
  ADD KEY `FK_movies_customer_reviews_review_star_score_Score_ID` (`Score_ID`),
  ADD KEY `FK_movies_customer_reviews_customer_Customer_ID` (`Customer_ID`);

--
-- Indexes for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD KEY `FK_movies_genres_genre_Genre_ID` (`Genre_ID`),
  ADD KEY `FK_movies_genres_movie_Movie_ID` (`Movie_ID`);

--
-- Indexes for table `movies_rating_reasons`
--
ALTER TABLE `movies_rating_reasons`
  ADD KEY `FK_movies_rating_reasons_movie_Movie_ID` (`Movie_ID`),
  ADD KEY `FK_movies_rating_reasons_rating_reason_Reason_ID` (`Reason_ID`);

--
-- Indexes for table `movie_job`
--
ALTER TABLE `movie_job`
  ADD PRIMARY KEY (`Job_ID`);

--
-- Indexes for table `movie_room`
--
ALTER TABLE `movie_room`
  ADD PRIMARY KEY (`Room_ID`),
  ADD KEY `FK_movie_room_movie_room_type_Room_Type_ID` (`Room_Type_ID`),
  ADD KEY `FK_movie_room_theater_Theater_ID` (`Theater_ID`);

--
-- Indexes for table `movie_room_type`
--
ALTER TABLE `movie_room_type`
  ADD PRIMARY KEY (`Room_Type_ID`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`Price_ID`),
  ADD KEY `FK_pricing_week_DayID` (`Day`),
  ADD KEY `FK_pricing_time_Time_ID` (`Time_ID`),
  ADD KEY `FK_pricing_theater_Theater_ID` (`Theater_ID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`Rating_ID`);

--
-- Indexes for table `rating_reason`
--
ALTER TABLE `rating_reason`
  ADD PRIMARY KEY (`Reason_ID`);

--
-- Indexes for table `review_star_score`
--
ALTER TABLE `review_star_score`
  ADD PRIMARY KEY (`Score_ID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`Seat_ID`),
  ADD KEY `FK_seat_movie_room_Room_ID` (`Room_ID`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`Showtime_ID`),
  ADD KEY `FK_showtime_week_DayID` (`Day`),
  ADD KEY `FK_showtime_time_Time_ID` (`Time_ID`),
  ADD KEY `FK_showtime_movie_room_Room_ID` (`Room_ID`),
  ADD KEY `FK_showtime_movie_Movie_ID` (`Movie_ID`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
  ADD PRIMARY KEY (`Theater_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `FK_ticket_seat_Seat_ID` (`Seat_ID`),
  ADD KEY `FK_ticket_booking_Booking_ID` (`Booking_ID`),
  ADD KEY `FK_ticket_showtime_Showtime_ID` (`Showtime_ID`),
  ADD KEY `FK_ticket_pricing_Price_ID` (`Price_ID`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`Time_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `film_format`
--
ALTER TABLE `film_format`
  MODIFY `Format_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `Genre_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `movie_job`
--
ALTER TABLE `movie_job`
  MODIFY `Job_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `movie_room`
--
ALTER TABLE `movie_room`
  MODIFY `Room_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `movie_room_type`
--
ALTER TABLE `movie_room_type`
  MODIFY `Room_Type_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `Price_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `Rating_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rating_reason`
--
ALTER TABLE `rating_reason`
  MODIFY `Reason_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `review_star_score`
--
ALTER TABLE `review_star_score`
  MODIFY `Score_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `Seat_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `Showtime_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `theater`
--
ALTER TABLE `theater`
  MODIFY `Theater_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Ticket_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `Time_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_booking_customer_Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_movie_film_format_Format_ID` FOREIGN KEY (`Format_ID`) REFERENCES `film_format` (`Format_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movie_rating_Rating_ID` FOREIGN KEY (`Rating_ID`) REFERENCES `rating` (`Rating_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_cast_crew`
--
ALTER TABLE `movies_cast_crew`
  ADD CONSTRAINT `FK_movie_cast_crew_cast_crew_name_Name_ID` FOREIGN KEY (`Name_ID`) REFERENCES `cast_crew_name` (`Name_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movie_cast_crew_movie_Movie_ID` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movie_cast_crew_movie_job_Job_ID` FOREIGN KEY (`Job_ID`) REFERENCES `movie_job` (`Job_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_customer_reviews`
--
ALTER TABLE `movies_customer_reviews`
  ADD CONSTRAINT `FK_movies_customer_reviews_customer_Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movies_customer_reviews_movie_Movie_ID` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movies_customer_reviews_review_star_score_Score_ID` FOREIGN KEY (`Score_ID`) REFERENCES `review_star_score` (`Score_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD CONSTRAINT `FK_movies_genres_genre_Genre_ID` FOREIGN KEY (`Genre_ID`) REFERENCES `genre` (`Genre_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movies_genres_movie_Movie_ID` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_rating_reasons`
--
ALTER TABLE `movies_rating_reasons`
  ADD CONSTRAINT `FK_movies_rating_reasons_movie_Movie_ID` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movies_rating_reasons_rating_reason_Reason_ID` FOREIGN KEY (`Reason_ID`) REFERENCES `rating_reason` (`Reason_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie_room`
--
ALTER TABLE `movie_room`
  ADD CONSTRAINT `FK_movie_room_movie_room_type_Room_Type_ID` FOREIGN KEY (`Room_Type_ID`) REFERENCES `movie_room_type` (`Room_Type_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movie_room_theater_Theater_ID` FOREIGN KEY (`Theater_ID`) REFERENCES `theater` (`Theater_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pricing`
--
ALTER TABLE `pricing`
  ADD CONSTRAINT `FK_pricing_theater_Theater_ID` FOREIGN KEY (`Theater_ID`) REFERENCES `theater` (`Theater_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_pricing_time_Time_ID` FOREIGN KEY (`Time_ID`) REFERENCES `time` (`Time_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `FK_seat_movie_room_Room_ID` FOREIGN KEY (`Room_ID`) REFERENCES `movie_room` (`Room_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `FK_showtime_movie_Movie_ID` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_showtime_movie_room_Room_ID` FOREIGN KEY (`Room_ID`) REFERENCES `movie_room` (`Room_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_showtime_time_Time_ID` FOREIGN KEY (`Time_ID`) REFERENCES `time` (`Time_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_ticket_booking_Booking_ID` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ticket_pricing_Price_ID` FOREIGN KEY (`Price_ID`) REFERENCES `pricing` (`Price_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ticket_seat_Seat_ID` FOREIGN KEY (`Seat_ID`) REFERENCES `seat` (`Seat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ticket_showtime_Showtime_ID` FOREIGN KEY (`Showtime_ID`) REFERENCES `showtime` (`Showtime_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
