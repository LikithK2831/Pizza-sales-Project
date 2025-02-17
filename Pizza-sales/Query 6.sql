-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    SUM(orders_details.quantity) AS total_quantity,
    pizza_types.category
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY total_quantity DESC;