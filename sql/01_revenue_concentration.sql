-- Business Question 1: What percentage of total revenue comes from our 
-- top customers, and is the business overly dependent on any single customer?

SELECT 
    rp.name AS customer_name,
    SUM(so.amount_total) AS total_revenue,
    ROUND(
        100.0 * SUM(so.amount_total) / SUM(SUM(so.amount_total)) OVER (),
        1
    ) AS pct_of_total_revenue
FROM sale_order so
JOIN res_partner rp ON so.partner_id = rp.id
GROUP BY rp.name
ORDER BY total_revenue DESC;