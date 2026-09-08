-- Business Question 2: How many quotations are stuck in "draft" status, 
-- what's their combined value, and how long have they been unconfirmed?

SELECT 
    so.name AS order_number,
    rp.name AS customer_name,
    so.amount_total,
    so.date_order,
    CURRENT_DATE - so.date_order::date AS days_unconfirmed
FROM sale_order so
JOIN res_partner rp ON so.partner_id = rp.id
WHERE so.state = 'draft'
ORDER BY days_unconfirmed DESC;