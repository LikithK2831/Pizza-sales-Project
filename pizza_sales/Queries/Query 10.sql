-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price)) AS revenue,
    pizza_types.name
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;