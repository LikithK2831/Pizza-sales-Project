-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(orders_details.quantity * pizzas.price)) AS total_revenue
                FROM
                    pizzas
                        JOIN
                    orders_details ON orders_details.pizza_id = pizzas.pizza_id) * 100,
            2) AS revenue,
    pizza_types.category
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;