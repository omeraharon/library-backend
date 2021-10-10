-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 09:17 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL,
  `bookName` varchar(50) NOT NULL,
  `uuid` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `genreId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `bookName`, `uuid`, `description`, `genreId`) VALUES
(1, 'The Gunslinger (Revised Edition): The Dark Tower I', 'e7465945-9c8d-42dc-a150-abc1cb1910d1', 'This description may be from another edition of this product. Now a major motion picture starring Matthew McConaughey and Idris Elba \"An impressive work of mythic magnitude that may turn out to be Stephen King\'s greatest literary achievement\" ( The Atlanta Journal-Constitution ), The Gunslinger is the first volume in the epic Dark Tower Series. A #1 national bestseller, The Gunslinger introduces readers to one of Stephen King\'s most powerful creations', 2),
(2, 'A Game of Thrones', '5f99f830-7511-4ef2-bc75-3ac825a57727', 'This description may be from another edition of this product. NOW THE ACCLAIMED HBO SERIES GAME OF THRONES --THE MASTERPIECE THAT BECAME A CULTURAL PHENOMENON Winter is coming. Such is the stern motto of House Stark, the northernmost of the fiefdoms that owe allegiance to King Robert Baratheon in far-off King\'s Landing. There Eddard Stark of Winterfell rules in Robert\'s name. There his family dwells in peace and comfort: his proud wife, Catelyn;', 2),
(3, 'The Lord Of The Rings', 'fda24716-8586-4313-9b22-d2a667195c40', 'Tolkien\'s seminal three-volume epic chronicles the War of the Ring, in which Frodo the hobbit and his companions set out to destroy the evil Ring of Power and restore peace to Middle-earth. The beloved trilogy still casts a long shadow, having established some of the most familiar and enduring tropes in fantasy literature.', 1),
(4, 'The Hitchhiker\'s Guide To The Galaxy', '5325ec33-bf86-4468-aea5-885855161537', 'In the first, hilarious volume of Adams\' Hitchhiker\'s series, reluctant galactic traveler Arthur Dent gets swept up in some literally Earth-shattering events involving aliens, sperm whales, a depressed robot, mice who are more than they seem, and some really, really bad poetry.', 1),
(5, 'Wallbanger', '75a476f3-1929-41ce-b566-000fd0ec49d4', 'he first night after Caroline moves into her fantastic new San Francisco apartment, she realizes she\'s gaining an intimate knowledge of her new neighbor\'s nocturnal adventures. Thanks to paper-thin walls and the guy\'s athletic prowess, she can hear not just his bed banging against the wall but the ecstatic response of what seems (as loud night after loud night goes by)', 3),
(6, 'The Fault in Our Stars', 'dccc5f4c-2646-4ff5-a8c3-0ad45a505bb9', 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel\'s story is about to be completely rewritten.', 3),
(7, 'THE GREAT GATSBY', '0043ac88-de76-45f1-837c-3ca7adfdcbd0', 'Set in the Jazz Age, The Great Gatsby tells the story of the mysterious millionaire Jay Gatsby, his decadent parties, and his love for the alluring Daisy Buchanan. Dismissed as “no more than a glorified anecdote, and not too probable at that” (The Chicago Tribune), The Great Gatsby is now considered a contender for “the Great American Novel.”', 4),
(8, 'LOLITA', '2688f821-9ce1-4b7c-abf2-d07489c1297a', 'Lolita tells the story of middle-aged Humbert Humbert’s love for twelve-year-old Dolores Haze. The concept is troubling, but the novel defies any kind of label, though it has been heralded as a hilarious satire, a bitter tragedy, and even an allegory for U.S.-European relations. In Reading Lolita in Tehran, Azar Nafisi summarized the book as “hopeful, beautiful even, a defense not just of beauty but of life . . . ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genreId` int(11) NOT NULL,
  `genreName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genreId`, `genreName`) VALUES
(1, 'Science Fiction'),
(2, 'Fantasy'),
(3, 'Tension'),
(4, 'Novel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`),
  ADD UNIQUE KEY `bookName` (`bookName`),
  ADD KEY `bookId` (`bookId`),
  ADD KEY `genreId` (`genreId`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreId`),
  ADD KEY `genreId` (`genreId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genreId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`genreId`) REFERENCES `genre` (`genreId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
