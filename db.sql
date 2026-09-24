-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Сен 21 2026 г., 12:37
-- Версия сервера: 8.0.46
-- Версия PHP: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restaurant_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `id` int UNSIGNED NOT NULL,
  `fio_guest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_date` date NOT NULL,
  `booking_time_start` time NOT NULL,
  `booking_time_end` time NOT NULL COMMENT 'по умол +2 часа от старта / пользватель указываеть если больше',
  `status_id` int UNSIGNED NOT NULL,
  `count_guest` int NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `booking_table`
--

CREATE TABLE `booking_table` (
  `id` int UNSIGNED NOT NULL,
  `booking_id` int UNSIGNED NOT NULL,
  `table_id` int UNSIGNED NOT NULL,
  `delete_started_at` datetime DEFAULT NULL,
  `status_id` int UNSIGNED NOT NULL COMMENT 'заблокировано или свободно или забронировано и сразу '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dish`
--

CREATE TABLE `dish` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `weight` int NOT NULL,
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `dish`
--

INSERT INTO `dish` (`id`, `title`, `description`, `price`, `weight`, `status_id`) VALUES
(1, 'Цезарь с курицей', 'Салат с курицей, листьями салата и соусом Цезарь', 350, 220, 9),
(2, 'Борщ со сметаной', 'Традиционный украинский суп с капустой и свеклой', 250, 300, 9),
(3, 'Пицца Маргарита', 'Классическая пицца с томатами и моцареллой', 450, 500, 9),
(4, 'Паста Карбонара', 'Паста со сливочным соусом, беконом и пармезаном', 400, 350, 9),
(5, 'Стейк из говядины', 'Среднепрожаренный стейк с гарниром', 850, 300, 9),
(6, 'Чизкейк', 'Нежный десерт из сливочного сыра на основе из печенья', 270, 150, 9),
(7, 'Лимонад домашний', 'Освежающий напиток с лимоном и мятой', 150, 250, 9),
(8, 'Американо', 'Кофе средней крепости', 120, 200, 9),
(9, 'Плов с говядиной', 'Рассыпчатый рис с сочной говядиной и морковью', 420, 300, 1),
(10, 'Куриные котлеты', 'Домашние котлеты из куриного фарша с гарниром', 380, 250, 1),
(11, 'Говяжий стейк', 'Среднепрожаренный стейк из говядины, подается с соусом', 590, 250, 1),
(12, 'Овощной суп', 'Лёгкий суп из сезонных овощей', 240, 300, 1),
(13, 'Курица с картофелем', 'Запечённая куриная грудка с картофельным пюре', 410, 280, 1),
(14, 'Гречка с тушёной говядиной', 'Классическое блюдо — гречневая каша с мясом', 360, 300, 1),
(15, 'Салат \"Овощной\"', 'Свежие огурцы, помидоры, зелень, масло', 180, 150, 1),
(16, 'Салат с курицей', 'Салат с отварной курицей, яйцом и майонезом', 220, 180, 1),
(17, 'Рис с овощами', 'Отварной рис с тушёными овощами', 270, 250, 1),
(18, 'Компот из сухофруктов', 'Традиционный сладкий напиток', 90, 200, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int UNSIGNED NOT NULL,
  `table_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type` int UNSIGNED NOT NULL COMMENT 'с собой или на месте',
  `order_status` int UNSIGNED NOT NULL COMMENT 'готов ил нет',
  `waiter_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_dish`
--

CREATE TABLE `order_dish` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `count` int NOT NULL COMMENT 'количество борща',
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `title`) VALUES
(1, 'user'),
(2, 'admin'),
(3, 'manager'),
(4, 'cook'),
(5, 'waiter');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `title`) VALUES
(1, 'Забронировано'),
(2, 'Заблокировано'),
(3, 'Завершено'),
(4, 'Отменён'),
(5, 'готовится'),
(6, 'готов к выдаче'),
(7, 'Свободно'),
(9, 'Новый'),
(10, 'На месте'),
(11, 'С собой'),
(14, 'Выдано'),
(15, 'Завершена');

-- --------------------------------------------------------

--
-- Структура таблицы `table`
--

CREATE TABLE `table` (
  `id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `table`
--

INSERT INTO `table` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `fio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `created_by_id`, `fio`, `email`, `gender`, `phone`, `password`, `role_id`, `auth_key`) VALUES
(1, NULL, 'в', 'user@u.ru', 'Мужской', '+7 (999)-999-99-99', '$2y$13$hxAdbQCCYidvGGfpPBtt/uI00uUEFqYj/tUq/QfAYD4hJ44dfqtqq', 1, 'EocG33jibvBjhaqaVihn6y5JVrHrcHAr'),
(2, NULL, 'ыыы', 'cook@u.ru', 'Мужской', '+7 (999)-999-99-99', '$2y$13$YidieECv71WrKKbF5i1sm.PPvocJ6tQVlbilbt3mA8RS537/ucrBm', 4, '1Ukldb7WBJvcQx5cBDij8dKEnGfrfibT'),
(3, NULL, 'в', 'waiter@u.ru', 'Мужской', '+7 (999)-999-99-99', '$2y$13$IMumLxUUrgVv0I5GUuwROOq38IbjSB1WTQkjrz8KVeafNz5Z.EjWy', 5, 'xnAk2YIDRA4YrjPMeEhi2cwM1Ey5f0hk'),
(4, NULL, 'а', 'manager@u.ru', 'Мужской', '+7 (999)-999-99-99', '$2y$13$qTwJHLGYjdHEQ5B0H9X0UOTV7.bKrVPq3pNbWDKp9FJT3Av8HF85u', 3, '4DCM0bWXJ6cPgxyZRLV5dDzS7lRUPOA4'),
(5, NULL, 'а', 'admin@u.ru', 'Мужской', '+7 (888)-888-88-88', '$2y$13$xeR3rXdnwVQVAKFWpooEH.PFSTa9FpUaEk43Mmth4L1uCPUIrHz8O', 2, '17Uzq3a-SdT0BrCsGPVgTkn1M6SmysQB'),
(11, 4, 'ффф', 'hackAdmin@gmail.com', 'Мужской', '+7 (111)-111-11-11', '$2y$13$qj.ZuuxD//nrcqh1ONiXkudSZcrZ0b3KeTscg4JCOe4kVTl57n4Hm', 2, 'o6JuR8GkNsI4S1uhEz3iA_WxK_0HQXby'),
(12, NULL, 'ф', 'a@gmail.com', 'Мужской', '+7 (111)-111-11-11', '$2y$13$0PKQjYx4I8UNa2DF12YuVug5x2RDx7bXwqVKoEK.umIE0RL1rMtHu', 1, '2y3n5bsySZ0wzNAOIn_mmmSjbIuV7dst'),
(13, NULL, 'ыйфыф', 'a@A.ru', 'Мужской', '+7 (212)-121-11-11', '$2y$13$Tl9SGwdckPPkvz.uOKcxM.uoSge81iCBRR3BZbW3xYbesX9NFFP0C', 1, 'ivQSLZAKFnvLeVzNnhmyC5hVlSt6DOFV'),
(14, NULL, 's', 'ss@a.ru', 'Мужской', '+7 (212)-212-12-12', '$2y$13$qqFgHb2r0ZCWOKyT3sEm5u7JEFjh8taP.kqWToe2.7z1hraf1QTr2', 1, 'YViPj4W7UBYiWk3TNdd0MnQmFsVgIFOM'),
(15, 4, 'ыы', 'ss@s.ru', 'Женский', '+7 (121)-212-12-21', '$2y$13$KITtV.JS4bSYVXZK.qkDQO44RbYrjf2W9OFPn0.fI6IRTZgwg7NDa', 5, 'V_Ryd_FoTrGyvBvCAhisRfUsY8UZ7xgO'),
(16, 4, 'a', 'aa@a.ru', 'Мужской', '+7 (121)-212-12-12', '$2y$13$dRJRlXlMJdEDYqwEO3zDUORjD//D183cq1bTdrr4wScn19bT4ZS7O', 4, 't6sdWBusGX2f_yGKrNaGikcN7gSWxt1e'),
(17, 4, 'фыфы', 'aaa@a.ru', 'Мужской', '+7 (111)-111-11-11', '$2y$13$JigTcQxhak0gnO0zXTNm0OOJ3BM46AY.BNLM9fXWg3LyN732LskoW', 5, 'Z9gqnEnAwwZ89WA8WriA4tEk7hVJDvPt'),
(20, 4, 'asa', 'aaaaa@a.ru', 'Женский', '+7 (121)-212-12-12', '$2y$13$6szDzxIKIIeNrmXOWC7xV.5hKFdBIBLSsMWNUDbya4XS0Lo.w6j/y', 3, 'lnHRoW6ce892oXkvGayHr-NV9lcTP5Qy'),
(21, 5, 'asasa', 'aaaaaa@a.ru', 'Мужской', '+7 (121)-212-12-12', '$2y$13$Kku5EbMrfSmTeBX/fppcF.UEnkpbnZNjLETocKx/LYcLgnu49D7Xa', 2, 'yN4LhuodHoyE_eONdGGy_D2_54bUesIp');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `booking_table`
--
ALTER TABLE `booking_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `table_id` (`table_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_id` (`table_id`),
  ADD KEY `waiter_id` (`waiter_id`);

--
-- Индексы таблицы `order_dish`
--
ALTER TABLE `order_dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100165721;

--
-- AUTO_INCREMENT для таблицы `booking_table`
--
ALTER TABLE `booking_table`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10011781;

--
-- AUTO_INCREMENT для таблицы `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `order_dish`
--
ALTER TABLE `order_dish`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `table`
--
ALTER TABLE `table`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `booking_table`
--
ALTER TABLE `booking_table`
  ADD CONSTRAINT `booking_table_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_table_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_table_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`waiter_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_dish`
--
ALTER TABLE `order_dish`
  ADD CONSTRAINT `order_dish_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_dish_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_dish_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
