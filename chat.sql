-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 juin 2021 à 12:05
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chat`
--

-- --------------------------------------------------------

--
-- Structure de la table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 2, 1, 'salut mon vieux', '2021-06-10 10:23:21', 0),
(2, 2, 1, 'Salut la famille', '2021-06-10 10:23:57', 0),
(3, 2, 1, 'Comment tu vas ?', '2021-06-10 10:24:14', 0),
(4, 1, 2, 'Heo', '2021-06-10 10:24:33', 0),
(5, 1, 2, 'Je vais très bien et toi', '2021-06-10 10:24:44', 0),
(6, 1, 2, 'Tu es marié ?', '2021-06-11 08:51:47', 0),
(7, 1, 2, 'Parle moi un peu de la famille', '2021-06-11 08:52:07', 0),
(8, 2, 1, 'Je ne sais pas pourquoi tu es là', '2021-06-11 08:53:24', 0),
(9, 2, 1, 'Ici je marche très bien mais là-bas ça ne fonctionne pas pourquoi ?', '2021-06-11 08:53:48', 0),
(10, 1, 2, 'Messagerie en temps réel', '2021-06-11 08:54:02', 0),
(11, 2, 1, 'Salut mon vieux', '2021-06-11 09:08:38', 0),
(12, 1, 2, 'Je ne sais pas ce que je ferai sans toi', '2021-06-11 09:28:41', 0),
(13, 1, 2, 'Tu peux me dire ce que tu penses', '2021-06-11 09:28:51', 0),
(14, 2, 1, 'Bonjour comment tu vas ?\n', '2021-06-11 09:36:09', 0),
(15, 1, 2, 'Je vais très bien merci et de ton coté ?', '2021-06-11 09:36:38', 0),
(16, 2, 1, 'Ceci est un système de messagerie instantané avec Php + Ajax, avec plusieurs modules tels que Typing Notification system without refresh page', '2021-06-11 09:37:35', 0),
(17, 1, 2, 'J\'aime beaucoup l\'application très bien joué...\nAllons y faire la suivante', '2021-06-11 09:37:56', 0);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`) VALUES
(1, 'johnsmith', '$2y$10$jZKkrDgg4yMXCIBQyEds3eF8QMPoQ6lwp/.cmdN/oNnZcBe32wewC'),
(2, 'peterParker', '$2y$10$jZKkrDgg4yMXCIBQyEds3eF8QMPoQ6lwp/.cmdN/oNnZcBe32wewC'),
(3, 'davidMoore', '$2y$10$jZKkrDgg4yMXCIBQyEds3eF8QMPoQ6lwp/.cmdN/oNnZcBe32wewC');

-- --------------------------------------------------------

--
-- Structure de la table `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 1, '2021-06-10 00:17:12', 'no'),
(2, 1, '2021-06-10 00:39:02', 'no'),
(3, 2, '2021-06-10 09:04:26', 'no'),
(4, 2, '2021-06-10 09:15:28', 'no'),
(5, 1, '2021-06-10 09:07:06', 'no'),
(6, 1, '2021-06-10 09:10:44', 'no'),
(7, 1, '2021-06-10 12:17:29', 'no'),
(8, 2, '2021-06-10 14:20:02', 'no'),
(9, 1, '2021-06-11 09:33:03', 'no'),
(10, 2, '2021-06-11 09:32:52', 'no'),
(11, 2, '2021-06-11 09:33:13', 'no'),
(12, 1, '2021-06-11 09:38:04', 'no'),
(13, 2, '2021-06-11 09:38:13', 'no');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
