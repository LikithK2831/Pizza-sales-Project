-- Analyze the cumulative revenue generated over time.

SELECT order_date, SUM(revenue) OVER (ORDER BY order_date) as cum_revenue FROM(SELECT orders.order_date, SUM(orders_details.quantity * pizzas.price) as revenue
FROM orders
JOIN orders_details
ON orders.order_id = orders_details.order_id
JOIN pizzas
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY orders.order_date) as sales;