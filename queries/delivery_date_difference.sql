
SELECT
    olist_customers.customer_state AS State,
    ROUND(AVG(julianday(olist_orders.order_delivered_customer_date) - julianday(olist_orders.order_estimated_delivery_date)), 6) AS Delivery_Difference
FROM
    olist_orders
JOIN
    olist_customers ON olist_orders.customer_id = olist_customers.customer_id
WHERE
    olist_orders.order_status = 'delivered'
    AND olist_orders.order_delivered_customer_date IS NOT NULL
GROUP BY
    olist_customers.customer_state
ORDER BY
    Delivery_Difference;