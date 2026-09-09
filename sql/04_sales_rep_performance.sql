-- Business Question 4: Which salespeople are closing the most confirmed 
-- orders vs. leaving the most unconfirmed?

SELECT 
    rp.name AS salesperson,
    COUNT(*) FILTER (WHERE so.state = 'sale') AS confirmed_orders,
    COUNT(*) FILTER (WHERE so.state = 'draft') AS unconfirmed_orders,
    SUM(so.amount_total) FILTER (WHERE so.state = 'sale') AS confirmed_revenue
FROM sale_order so
JOIN res_users ru ON so.user_id = ru.id
JOIN res_partner rp ON ru.partner_id = rp.id
GROUP BY rp.name
ORDER BY confirmed_revenue DESC NULLS LAST;