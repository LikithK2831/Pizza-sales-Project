-- Calculate the total revenue gnertaed from pizza sales.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price)) AS total_revenue
FROM
    pizzas
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id; 