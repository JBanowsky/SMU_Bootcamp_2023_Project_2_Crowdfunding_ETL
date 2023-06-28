-- List the contact id, contact last name, contact first name, company_name, goal, pledged, outcome;
-- grouped by outcome, ordered by percentage of goal reached

SELECT distinct
	con.contact_id,
	con.last_name,
	con.first_name,
	cam.company_name,
	cam.outcome,
	cam.goal,
	cam.pledged,
	ROUND((cam.pledged/cam.goal)::numeric * 100, 2) AS perc_pledged
FROM
	contacts as con
	join campaign as cam on con.contact_id = cam.contact_id
GROUP BY
	cam.outcome,
	con.contact_id,
	con.last_name,
	con.first_name,
	cam.company_name,
	cam.goal,
	cam.pledged
ORDER BY
	cam.outcome desc,
	perc_pledged desc;