CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `faceimage` blob,
  `role` varchar(45) DEFAULT 'customer',
  `macaddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

CREATE TABLE `cars` (
  `carid` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(100) DEFAULT NULL,
  `bodytype` varchar(50) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `costperhour` decimal(5,2) DEFAULT NULL,
  `isavailable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`carid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


select * from users;CREATE TABLE `bookings` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `carid` int(11) NOT NULL,
  `fromdate` datetime DEFAULT NULL,
  `todate` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '0',
  `caleventid` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `FK_userid` (`userid`),
  KEY `FK_carid` (`carid`),
  CONSTRAINT `FK_carid` FOREIGN KEY (`carid`) REFERENCES `cars` (`carid`),
  CONSTRAINT `FK_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

CREATE TABLE `reportcars` (
  `reportid` int(11) NOT NULL AUTO_INCREMENT,
  `carid` int(11) DEFAULT NULL,
  `issue` varchar(225) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'faulty',
  `reportdate` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`reportid`),
  KEY `carid` (`carid`),
  KEY `userid` (`userid`),
  CONSTRAINT `reportcars_ibfk_1` FOREIGN KEY (`carid`) REFERENCES `cars` (`carid`),
  CONSTRAINT `reportcars_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

