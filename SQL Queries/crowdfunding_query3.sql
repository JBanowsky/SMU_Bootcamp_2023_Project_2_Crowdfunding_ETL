-- Find which U.S. music (cat2) subcategory collected the most pledge funds.

SELECT
	sub.subcategory,
	SUM(cam.pledged) as ttl_pledged
FROM
	campaign as cam
	join category as cat on cam.category_id = cat.category_id
	join subcategory as sub on cam.subcategory_id = sub.subcategory_id
WHERE
	category = 'music' AND
	country = 'US'
GROUP BY
	sub.subcategory
ORDER BY
	ttl_pledged desc;