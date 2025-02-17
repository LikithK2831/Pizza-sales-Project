-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT name,revenue FROM(SELECT category,name,revenue, rank() over(partition by category order by revenue DESC) as RK FROM(SELECT pizza_types.name, pizza_types.category, round(SUM((orders_details.quantity)* pizzas.price)) as revenue
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name, pizza_types.category) as A) as V
WHERE RK <=3;