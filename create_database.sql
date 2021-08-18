CREATE DATABASE IF NOT EXISTS video_streaming_service;
USE video_streaming_service;


CREATE TABLE IF NOT EXISTS subscription_plans (
	subscription_id INT AUTO_INCREMENT,
    subscription_name VARCHAR(100) NOT NULL,
    subscription_price VARCHAR(100) NOT NULL,
    number_of_devices INT NOT NULL,
    PRIMARY KEY (subscription_id)
);
INSERT INTO subscription_plans (subscription_name, subscription_price, number_of_devices)
VALUES ('Basic', '9.99', 1),
('Standard', '14.99', 2),
('Premium', '19.99', 4);


CREATE TABLE IF NOT EXISTS customers (
	customer_id INT AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone_number VARCHAR(100),
    street_address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state CHAR(2) NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id)
);
INSERT INTO customers (
	first_name, 
    last_name, 
    date_of_birth, 
    phone_number, 
    street_address, 
    city, 
    state, 
    email_address
)
VALUES ('Michael', 'Somb', '1995-05-11', '1-115-195-1565', '14 Fidle St', 'Diana', 'WI', 'hunter000@gmail.com'),
('Lily', 'Jenkin', '1952-01-21', '1-946-211-5211', '195 Gaus Circle', 'Atersia', 'AK', 'JustALake@gmail.com'),
('Hank', 'Poshom', '1988-12-25', NULL, '1541 Hendricks Lane', 'Bakerfille', 'CA', 'fighter44@gmail.com'),
('Henry', 'Lee', '1969-10-16', '1-714-122-1123', '95425 Pottta Street', 'Three Rivers', 'NM', 'bunnystar@gmail.com'),
('Justin', 'Ghulman', '2001-09-12', '1-818-511-5633', '4541 Wafule Strt', 'Saint John', 'AR', 'HopeLiveLove@gmail.com'),
('Enrique', 'Diaz', '1988-06-25', '1-626-666-8452', '98111 Atarly Lane', 'Zion Forest', 'NY', 'CoderHacker41@gmail.com'),
('Natalia', 'Schmill', '1979-07-13', NULL, '941 Centerville St', 'Spring Lakes', 'CO', '1bigjohnny@gmail.com'),
('Johnson', 'Overeem', '1996-04-07', '1-131-695-6412', '1415 Neastrum Street', 'Hundle', 'FL', 'bestartisteva@gmail.com'),
('Jane', 'Fredo', '1992-06-05', '1-221-692-4213', '6541 Yolas Circle', 'Cherry', 'OR', 'anotherbumyum@gmail.com'),
('Peter', 'Bakers', '1989-03-15', NULL, '98541 Temopra Street', 'Menesine', 'WA', 'icecreamlover00@gmail.com');


CREATE TABLE IF NOT EXISTS distributors (
	distributor_id INT AUTO_INCREMENT NOT NULL,
    distributor_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (distributor_id)
);
INSERT INTO distributors (distributor_name)
VALUES ('Columbia Pictures'),
('ViacomCBS Domestic Media Networks'),
('New Line Cinema'),
('Warner Bros. Pictures'),
('United Artists'),
('Universal Pictures'),
('Paramount Pictures Studios'),
('Warner Bros. Television Studios'),
('Miramax');


CREATE TABLE IF NOT EXISTS content (
	content_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(100) NOT NULL,
    episode VARCHAR(100),
    genre VARCHAR(100) NOT NULL,
    running_time TIME NOT NULL,
    release_year INT NOT NULL,
    distributor_id INT NOT NULL,
    PRIMARY KEY (content_id),
    FOREIGN KEY (distributor_id) REFERENCES distributors(distributor_id)
);
INSERT INTO content (title, genre, episode, running_time, release_year, distributor_id)
VALUES ('The Shawshank Redemption', 'Drama', NULL, '2:22', 1994, 1), 
('The Godfather','Crime', NULL, '2:55',1972, 7),
('Avatar: The Last Airbender','Animation', 'S1.E2', '0:25', 2005, 2),
('The Dark Knight','Action', NULL, '2:32',2008, 4),
('12 Angry Men','Crime', NULL, '1:36',1957, 5),
('Schindler''s List','Biography', NULL, '3:15',1993, 6),
('Game of Thrones','Action', 'S6.E9', '1:00', 2016, 8),
('Pulp Fiction','Crime', NULL, '2:34',1994, 9),
('The Good, the Bad and the Ugly','Western', NULL, '2:58',1966, 5),
('The Lord of the Rings: The Fellowship of the Ring','Action', NULL, '2:58',2001, 3);


CREATE TABLE IF NOT EXISTS stream (
	stream_id INT AUTO_INCREMENT NOT NULL,
    customer_id INT NOT NULL,
    content_id INT NOT NULL,
    stream_date DATE NOT NULL,
    stream_time TIME NOT NULL,
    stream_duration TIME NOT NULL,
    PRIMARY KEY (stream_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (content_id) REFERENCES content(content_id)
);
INSERT INTO stream (customer_id, content_id, stream_date, stream_time, stream_duration)
VALUES (1,1,'2021-08-16','22:34:12','0:32:12'),
(3,10,'2021-08-05','22:20:52','1:24:16'),
(9,10,'2021-08-15','12:45:13','0:52:15'),
(2,7,'2021-08-25','20:11:02','0:27:33'),
(10,5,'2021-08-12','02:16:16','1:02:12'),
(1,2,'2021-08-19','19:07:12','0:42:50'),
(4,6,'2021-08-28','12:56:19','1:22:01'),
(7,9,'2021-08-15','14:43:32','0:52:09'),
(5,1,'2021-08-17','12:16:17','0:32:46'),
(6,3,'2021-08-01','13:02:11','1:12:44');