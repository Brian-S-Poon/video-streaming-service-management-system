-- This query returns stream_id, content_id, title, stream_date, and stream_duration.
-- This query is useful because it shows most recent streamed titles in DESC order and the titles that have never been streamed.
-- This information is important because we can remove unpopular titles from our content list.
SELECT DISTINCT  s.stream_id, c.content_id, c.title, s.stream_date, s.stream_duration
FROM content c
LEFT JOIN stream s ON c.content_id = s.content_id
ORDER BY stream_date DESC


-- This query returns the customers that have not yet streamed a video.
-- This query is useful because it allows us to send a newsletter to the inactive customer.

SELECT c.customer_id, c.first_name, c.last_name, c.email_address, s.stream_id, s.stream_date
FROM customers c
LEFT JOIN stream s ON c.customer_id = s.customer_id
WHERE stream_id IS NULL
ORDER BY stream_date DESC