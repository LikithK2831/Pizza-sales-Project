-- Identify the most common pizza size ordered.

SELECT 
    COUNT(orders_details.quantity) AS order_count, pizzas.size
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;