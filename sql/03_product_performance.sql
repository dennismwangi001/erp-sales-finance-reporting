-- Business Question 3: Which products generate the most revenue vs. the 
-- most units sold, and where do these two rankings diverge?

SELECT 
    pt.name->>'en_US' AS product_name,
    SUM(sol.product_uom_qty) AS total_units_sold,
    SUM(sol.price_subtotal) AS total_revenue,
    RANK() OVER (ORDER BY SUM(sol.product_uom_qty) DESC) AS rank_by_units,
    RANK() OVER (ORDER BY SUM(sol.price_subtotal) DESC) AS rank_by_revenue
FROM sale_order_line sol
JOIN product_product pp ON sol.product_id = pp.id
JOIN product_template pt ON pp.product_tmpl_id = pt.id
GROUP BY pt.name
ORDER BY total_revenue DESC;