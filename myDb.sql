-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Июн 02 2022 г., 19:44
-- Версия сервера: 5.7.13
-- Версия PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `myDb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `military_enlistment_list`
--

CREATE TABLE `military_enlistment_list` (
  `phone_number` int(12) NOT NULL,
  `surname` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Person`
--

CREATE TABLE `Person` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(10) NOT NULL,
  `phone_number` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Person`
--

INSERT INTO `Person` (`id`, `name`, `surname`, `phone_number`) VALUES
(1, 'William', '', 0),
(2, 'Marc', '', 0),
(3, 'John', '', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `military_enlistment_list`
--
ALTER TABLE `military_enlistment_list`
  ADD KEY `phone_number` (`phone_number`);

--
-- Индексы таблицы `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `military_enlistment_list`
--
ALTER TABLE `military_enlistment_list`
  ADD CONSTRAINT `military_enlistment_list_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `Person` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
