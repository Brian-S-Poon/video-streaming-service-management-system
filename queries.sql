-- This query returns stream_id, content_id, title, stream_date, and stream_duration.
-- This query is useful because it shows most recent streamed titles in DESC order and the titles that have never been streamed.
-- This information is important because we can remove unpopular titles from our content list.
USE video_streaming_service;
SELECT DISTINCT  s.stream_id, c.content_id, c.title, s.stream_date, s.stream_duration
FROM content c
LEFT JOIN stream s ON c.content_id = s.content_id
ORDER BY stream_date DESC


-- This query returns customers that have not yet streamed a video.
-- This query is useful because it allows us to send a newsletter to the inactive customer.
USE video_streaming_service;
SELECT c.customer_id, c.first_name, c.last_name, c.email_address, s.stream_id, s.stream_date
FROM customers c
LEFT JOIN stream s ON c.customer_id = s.customer_id
WHERE stream_id IS NULL
ORDER BY stream_date DESC


-- This query returns the custoemrs that have not listed a phone number.
-- This query is important because it allows us to send an email to them for 2FA registration.
USE video_streaming_service;
SELECT *
FROM customers
WHERE phone_number IS NULL


-- This query returns customers who are able to upgrade their plan. This is important because we can send newsletters.
SELECT c.customer_id, c.first_name, c.last_name, c.email_address, sp.subscription_name, sp.subscription_price
FROM customers c
JOIN subscription_plans sp ON c.subscription_id = sp.subscription_id
WHERE c.subscription_id != 3