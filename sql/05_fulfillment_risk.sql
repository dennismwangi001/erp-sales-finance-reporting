-- Business Question 5: Are there confirmed sales orders at risk of delay 
-- due to low stock on the ordered products? (stockable products only)

SELECT 
    pt.name->>'en_US' AS product_name,
    SUM(sol.product_uom_qty) AS total_ordered_qty,
    COALESCE(sq.total_on_hand, 0) AS stock_on_hand,
    SUM(sol.product_uom_qty) - COALESCE(sq.total_on_hand, 0) AS shortfall
FROM sale_order_line sol
JOIN sale_order so ON sol.order_id = so.id
JOIN product_product pp ON sol.product_id = pp.id
JOIN product_template pt ON pp.product_tmpl_id = pt.id
LEFT JOIN (
    SELECT product_id, SUM(quantity) AS total_on_hand
    FROM stock_quant
    GROUP BY product_id
) sq ON pp.id = sq.product_id
WHERE so.state = 'sale'
  AND pt.type = 'product'
GROUP BY pt.name, sq.total_on_hand
HAVING SUM(sol.product_uom_qty) > COALESCE(sq.total_on_hand, 0)
ORDER BY shortfall DESC;