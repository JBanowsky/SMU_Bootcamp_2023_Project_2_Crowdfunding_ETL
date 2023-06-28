-- Which U.S. category with a significant number of campaigns was the most successful?

SELECT
	x.*,
	round(100*x.cat_success/x.cat_count, 2) as perc_success
FROM
	(
SELECT
	cat.category,
	cast(COUNT(cam.category_id) as numeric) as cat_count,
	cast(COUNT(cam.outcome) filter(WHERE cam.outcome='successful') as numeric) as cat_success,
	cast(COUNT(cam.outcome) filter(WHERE cam.outcome='canceled') as numeric)as cat_canceled,
	cast(COUNT(cam.outcome) filter(WHERE cam.outcome='failed') as numeric)as cat_failed
FROM
	campaign as cam
	join category as cat on cam.category_id = cat.category_id
WHERE
	cam.country = 'US'
GROUP BY
	cat.category) as x
WHERE
	cat_count >= 35
ORDER BY
	perc_success desc;