-- Basic SELECT statements to retrieve data from our database tables.
SELECT * FROM content
SELECT * FROM customers
SELECT * FROM distributors
SELECT * FROM stream
SELECT * FROM subscription_plans


-- This query is useful because it returns the most recent streamed titles in DESC order and the titles that have never been streamed.
-- This information is important because we can remove unpopular titles from our content list.
USE video_streaming_service;
SELECT 
	s.stream_id AS 'Stream ID', 
	c.content_id AS 'Content ID', 
	c.title AS 'Title', 
	s.stream_date AS 'Stream Date', 
	s.stream_duration AS 'Stream Duration'
FROM content c
LEFT JOIN stream s ON c.content_id = s.content_id
ORDER BY s.stream_date DESC


-- This query returns customers that have not yet streamed a video.
-- This query is useful because it allows us to send a newsletter to the inactive customer.
USE video_streaming_service;
SELECT 
	c.customer_id AS 'Customer ID', 
	c.first_name AS 'First Name', 
	c.last_name AS 'Last Name', 
	c.email_address AS 'Email Address', 
	s.stream_id AS 'Stream ID', 
	s.stream_date AS 'Stream Date'
FROM customers c
LEFT JOIN stream s ON c.customer_id = s.customer_id
WHERE s.stream_id IS NULL
ORDER BY s.stream_date DESC


-- This query returns the customers that have not listed a phone number.
-- This query is important because it allows us to send an email to them for 2FA registration.
USE video_streaming_service;
SELECT 
	c.customer_id AS 'Customer ID', 
	c.first_name AS 'First Name', 
	c.last_name AS 'Last Name', 
	c.phone_number AS 'Phone Number', 
	c.email_address AS 'Email Address'
FROM customers c
WHERE c.phone_number IS NULL


-- This query returns the email address' of customers who are able to upgrade their subscription plan. 
-- The purpose of this query is to send a newsletter about the benefits of upgrading their subscription plan.
USE video_streaming_service;
SELECT 
	c.customer_id AS 'Customer ID',
	c.first_name AS 'First Name', 
	c.last_name AS 'Last Name', 
	c.email_address AS 'Email Address', 
	sp.subscription_name AS 'Subscription Plan', 
	sp.subscription_price AS 'Subscription Price'
FROM customers c
JOIN subscription_plans sp ON c.subscription_id = sp.subscription_id
WHERE c.subscription_id != 3


