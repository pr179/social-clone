-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: shinkansen.proxy.rlwy.net:59178
-- Generation Time: Jul 12, 2025 at 06:48 PM
-- Server version: 9.3.0
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `post_id`, `content`, `created_at`) VALUES
(37, 116, 90, 'Here is another comment', '2025-07-07 13:59:34'),
(39, 116, 93, 'So there is my brand new comments', '2025-07-07 14:11:06'),
(40, 116, 93, 'And another comment ?', '2025-07-07 14:12:06'),
(41, 116, 94, 'Mon commentaire ici', '2025-07-07 14:24:22'),
(42, 116, 98, 'Let me leave a comment', '2025-07-07 14:40:49'),
(44, 116, 99, 'Hello guy', '2025-07-08 20:33:22'),
(45, 116, 102, 'Another comments ', '2025-07-09 08:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `user_id1` int NOT NULL,
  `user_id2` int NOT NULL,
  `state` enum('friend','waiting') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`user_id1`, `user_id2`, `state`, `created_at`) VALUES
(104, 106, 'waiting', '2025-07-07 19:40:40'),
(104, 107, 'waiting', '2025-07-07 19:40:41'),
(104, 108, 'waiting', '2025-07-07 19:40:42'),
(104, 109, 'waiting', '2025-07-07 19:40:43'),
(104, 110, 'waiting', '2025-07-07 19:40:44'),
(104, 111, 'waiting', '2025-07-07 19:40:46'),
(105, 104, 'friend', '2025-07-07 19:38:24'),
(105, 106, 'waiting', '2025-07-07 19:38:26'),
(105, 108, 'waiting', '2025-07-07 19:38:27'),
(105, 109, 'waiting', '2025-07-07 19:38:28'),
(105, 110, 'waiting', '2025-07-07 19:38:29'),
(105, 111, 'waiting', '2025-07-07 19:38:31'),
(107, 105, 'friend', '2025-07-07 04:06:30'),
(108, 116, 'friend', '2025-07-07 15:43:42'),
(109, 116, 'waiting', '2025-07-07 16:01:16'),
(110, 116, 'waiting', '2025-07-07 16:01:18'),
(116, 104, 'friend', '2025-07-07 15:47:18'),
(116, 106, 'waiting', '2025-07-07 15:43:41'),
(116, 118, 'waiting', '2025-07-12 08:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`post_id`, `user_id`) VALUES
(86, 113),
(86, 116),
(87, 114),
(89, 120),
(91, 116),
(93, 116),
(98, 116),
(100, 116),
(101, 116),
(102, 114),
(102, 115),
(102, 116),
(103, 114),
(103, 115),
(104, 114),
(104, 115);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `user_id1` int NOT NULL,
  `user_id2` int NOT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `type` enum('text','image','video','audio') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'text',
  `sendAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edited` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id1`, `user_id2`, `content`, `description`, `type`, `sendAt`, `edited`, `deleted`) VALUES
(136, 104, 116, 'yo', '', 'text', '2025-07-07 19:39:03', 0, 0),
(137, 105, 104, 'yo\r\n', '', 'text', '2025-07-07 19:41:25', 0, 0),
(138, 104, 116, 'comment vas tu\r\n', '', 'text', '2025-07-07 19:42:00', 0, 0),
(139, 116, 104, NULL, NULL, 'text', '2025-07-07 22:18:04', 0, 1),
(140, 116, 108, 'ok', '', 'text', '2025-07-07 22:31:02', 0, 0),
(141, 116, 104, NULL, NULL, 'audio', '2025-07-10 20:09:30', 0, 1),
(142, 116, 104, NULL, NULL, 'image', '2025-07-10 20:09:35', 0, 1),
(143, 116, 108, NULL, NULL, 'audio', '2025-07-12 08:45:04', 0, 1),
(144, 116, 108, NULL, NULL, 'video', '2025-07-12 08:44:48', 0, 1),
(145, 116, 108, 'Heyy', '', 'text', '2025-07-09 08:01:32', 0, 0),
(146, 116, 108, NULL, NULL, 'audio', '2025-07-12 08:45:09', 0, 1),
(147, 116, 108, 'Bonjour', '', 'text', '2025-07-12 08:45:27', 0, 0),
(148, 116, 104, NULL, NULL, 'image', '2025-07-12 08:46:04', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('text','video','image') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'text',
  `likes` int NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `description`, `type`, `likes`, `content`, `created_at`) VALUES
(86, 104, 'Yeahhhhhhhhhhhhhh', 'image', 0, 'https://social-network-6.onrender.com/upload/images/1751827155_WhatsApp_Image_2025-02-19_at_13.45.59_a02f17e1.jpg', '2025-07-06 18:39:19'),
(87, 104, 'Okay', 'image', 0, 'https://social-network-6.onrender.com/upload/images/1751828187_WhatsApp_Image_2025-02-19_at_13.45.59_86028da8.jpg', '2025-07-06 18:56:30'),
(89, 104, 'I\nN 2001, RESEARCHERS in Great Britain began working with 248 people\nto build better exercise habits over the course of two weeks. The\nsubjects were divided into three groups.\nThe first group was the control group. They were simply asked to\ntrack how often they exercised.\nThe second group was the “motivation” group. They were asked not\nonly to track their workouts but also to read some material on the\nbenefits of exercise. The researchers also explained to the group how\nexercise could reduce the risk of coronary heart disease and improve\nheart health.\nFinally, there was the third group. These subjects received the same\npresentation as the second group, which ensured that they had equal\nlevels of motivation. However, they were also asked to formulate a plan\nfor when and where they would exercise over the following week.\nSpecifically, each member of the third group completed the following\nsentence: “During the next week, I will partake in at least 20 minutes\nof vigorous exercise on [DAY] at [TIME] in [PLACE].”\nIn the first and second groups, 35 to 38 percent of people exercised\nat least once per week. (Interestingly, the motivational presentation\ngiven to the second group seemed to have no meaningful impact on\nbehavior.) But 91 percent of the third group exercised at least once per\nweek—more than double the normal rate.\nThe sentence they filled out is what researchers refer to as an\nimplementation intention, which is a plan you make beforehand aboutwhen and where to act. That is, how you intend to implement a\nparticular habit.\nThe cues that can trigger a habit come in a wide range of forms—the\nfeel of your phone buzzing in your pocket, the smell of chocolate chip\ncookies, the sound of ambulance sirens—but the two most common\ncues are time and location. Implementation intentions leverage both of\nthese cues.', 'text', 0, '', '2025-07-07 03:34:39'),
(90, 104, 'On désire mettre en place une plateforme de gestion des offres et des\r\ndemandes d’emploi. L’objectif principal est de permettre aux entreprises de\r\nposter des offres d’emploi ou de trouver les profils qu’elles recherchent et\r\naux demandeurs d’emploi de poster leur curriculum vitae ou de rechercher\r\ndes offres d’emploi. Vous êtes chargés dans l’équipe de développement de\r\nmettre en place la structure de la base de données de ce projet à partir des\r\nrègles de gestion suivantes', 'image', 0, 'https://social-network-6.onrender.com/upload/images/1750983950_Ken-Kaneki-Tokyo-Ghoul-scaled.jpg\r\n', '2025-07-07 03:55:21'),
(91, 104, '', 'video', 0, 'https://social-network-6.onrender.com/upload/videos/1750810671_vokoscreenNG-2024-10-21_08-06-18.mov\r\n', '2025-07-07 03:56:45'),
(99, 116, 'Let me add my own photo yeah..', 'image', 0, 'http://localhost:8080/upload/images/1751899843_stranger-things-3840x2160-season-2-tv-series-finn-wolfhard-gaten-15284.jpg', '2025-07-07 14:50:55'),
(102, 116, 'Okay my guyyy', 'text', 0, '', '2025-07-09 07:58:55'),
(103, 116, 'Yeah it\'s Damsoooo', 'image', 0, 'http://social-network-6.onrender.com/upload/images/1752048032_20250708_031356.jpg', '2025-07-09 08:00:33'),
(104, 116, 'I\'am posting something else bruhh', 'text', 0, '', '2025-07-12 08:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstname` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('M','F') COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `password` text COLLATE utf8mb4_general_ci NOT NULL,
  `is_online` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `picture` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/api/upload/images/noprofile.jpg',
  `role` enum('0','1','2') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed_email` int DEFAULT '0',
  `reset_token` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `birthday`, `gender`, `email`, `password`, `is_online`, `picture`, `role`, `createdAt`, `confirmed_email`, `reset_token`) VALUES
(104, 'Karmel', 'Keke', '2006-04-10', 'M', 'karmelkeke@gmail.com', '$2y$10$Qt/qp12oRLEP4ajr8heSNefcFG0m1xTG9yJ81p9md88/YFC1A8ZJ.', '1', 'https://social-network-6.onrender.com/upload/images/1751502015_anime-anime-girls-kamado-nezuko-kamado-tanjirō-kimetsu-no-yaiba-hd-wallpaper-preview.jpg', '0', '2025-07-06 19:28:40', 0, ''),
(105, 'KEKE', 'kerane', '2025-07-17', 'M', 'kekekerane17@gmail.com', '$2y$10$CqXjszwve4RMkkfn6/icv.dM7kY/k1wqXwlwgnX5PzrRYjZEDofDi', '0', 'https://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-06 18:29:54', 1, ''),
(106, 'Prosper', 'Prosper', '2005-08-08', 'M', 'azaprosper19@gmail.com', '$2y$10$lT3lmYOeNLqv2hPcZvUiTOgdre0MEaozAb/dIjMfP4yCzLrZB8vEi', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-07 04:05:03', 0, ''),
(107, 'John', 'Doe', '2005-05-05', 'M', 'azaprosper19@yahoo.com', '$2y$10$dlua.yyrn5xWcV9zoUXid.epmWzieE6eWVH/i7fdOBREg.aSvqvqm', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-07 04:06:10', 0, ''),
(108, 'Repsorp', 'Repsorp', '2005-05-05', 'M', 'repsorpwinner@gmail.com', '$2y$10$6Zefi0EHtMd7fuD0EnN.IuWWBlTlVQfRejF5gcNodQxd1vdnq9O3y', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '1', '2025-07-07 04:07:42', 0, ''),
(109, 'Utilisatrice', 'Numero1', '2050-02-02', 'F', 'azaprosper29@gmail.com', '$2y$10$1Q1pDt85sdBcS.uKUR.dJO6BDeez0m260T//oWoJTB615PH56LSJ6', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-07 04:09:10', 0, ''),
(110, 'Utilisateur', 'v.2.0', '2005-01-01', 'M', 'azaprosper15@gmail.com', '$2y$10$eM0wjw/f5aVSIBmZS.XbX.YQWFxFg8QRxlYfVtSww1IhQmd8fWOEq', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-07 04:10:04', 0, ''),
(112, 'User5', 'Yeah', '2005-05-05', 'M', 'azaprosper89@gmail.com', '$2y$10$LQzNs5NyPdUQGGup.KqhruZaLyI/mTQyODRCZmIPJziz6QKKdEJsS', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-07 04:11:59', 0, ''),
(113, 'Prosper', 'Doe', '2005-01-01', 'M', 'azaprosper75@gmail.com', '$2y$10$KFFJ4k9d8uFehgfS.8toweDTzWZ8vYTmY.sHKC8ANr0XcOKmkDASi', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-07 04:12:55', 0, ''),
(114, 'Monsieur', 'L\'admin', '2005-05-05', 'M', 'admin@admin.com', '$2y$10$ZALz2G7tDvTAuGEDv/r/H.KwUCU2Z.0tU62PEdc0onZW83walj8zq', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '2', '2025-07-07 04:14:46', 1, ''),
(115, 'Moderator  ', 'Moderator', '2005-05-05', 'M', 'moderator@moderator.com', '$2y$10$0SqVLAJj0yYjX3a3JmGMn.h5Woh0fz.brzPUP1NzJhDQ/X7BHurSq', '1', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '1', '2025-07-07 04:15:38', 0, ''),
(116, 'Simple', 'User', '2005-08-08', 'M', 'user@user.com', '$2y$10$S2Mg9N0LXGTy5E.8VLkL6.9YFL3p48KoqAdBYUTj04M5.YhBKDIGO', '0', 'https://social-network-6.onrender.com/upload/images/1751502015_anime-anime-girls-kamado-nezuko-kamado-tanjirō-kimetsu-no-yaiba-hd-wallpaper-preview.jpg', '0', '2025-07-07 05:21:25', 0, ''),
(118, 'Kerane', 'doe', '2025-07-17', 'M', 'jojo@gmail.com', '$2y$10$xe.aufExCkcMbY6TneYh1ubzVCJuZ4dmVpunDQ6P6pgewZyukSPg.', '0', 'http://localhost:8080/upload/images/1752004213_1350478.jpeg', '0', '2025-07-08 19:47:31', 0, ''),
(119, 'Second', 'Second', '2005-05-05', 'M', 'azaprosper070@gmail.com', '$2y$10$yHLXqZ7GXfFOfNj0qPeDd.v1UfF0bNkgwwTjC52j6gCAnnxYdUr6W', '0', 'https://social-network-6.onrender.com/upload/images/1751502015_anime-anime-girls-kamado-nezuko-kamado-tanjirō-kimetsu-no-yaiba-hd-wallpaper-preview.jpg', '0', '2025-07-08 19:58:52', 0, ''),
(120, 'Brother', 'Bro', '2002-05-05', 'F', 'prosper@prosper.com', '$2y$10$/q.ubFrWgoaXMWx2c5ZJ6etp70Yt.oOSS2bgbb6foabdT5NfCmmNi', '0', 'http://social-network-6.onrender.com/upload/images/noprofile.jpg', '0', '2025-07-12 10:29:17', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`user_id1`,`user_id2`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD UNIQUE KEY `post_id` (`post_id`,`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
