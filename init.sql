CREATE TABLE IF NOT EXISTS `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `done` int(1)  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;