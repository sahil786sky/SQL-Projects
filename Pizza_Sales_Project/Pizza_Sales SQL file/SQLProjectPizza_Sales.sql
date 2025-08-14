select * from order_details
select * from orders
select * from pizza_types
select * from pizzas

/* Q1 */
select max(order_id) as orders from order_details

/* Q2 */
SELECT top 5(pc.name),sum(od.quantity) AS total_quantity
FROM order_details od
JOIN 
pizzas p 
ON od.pizza_id = p.pizza_id
JOIN 
pizza_types pc 
ON p.pizza_type_id = pc.pizza_type_id
GROUP BY 
pc.name
order by 
total_quantity desc

/* Q3 */

SELECT pc.category,SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN 
pizzas p 
ON od.pizza_id = p.pizza_id
JOIN 
pizza_types pc 
ON p.pizza_type_id = pc.pizza_type_id
GROUP BY 
pc.category
order by 
total_quantity desc

/* Q4 */

select category, count(name) as count_name from pizza_types
group by  category

/* Q5  */

with result as
(
select count(ode.order_id) as per_day_order
from pizza_types as pt
inner join
pizzas as pz
on pt.pizza_type_id = pz.pizza_type_id
inner join
order_details as ods
on pz.pizza_id = ods.pizza_id
inner join
orders as ode
on ods.order_id = ode.order_id
group by ode.date
)
select avg(per_day_order) as avg_order from result;

/* Q6 */

select pt.category, (sum(price)/(select sum(price) from pizzas)*100) as percentage
from pizza_types as pt
inner join
pizzas as pz
on pt.pizza_type_id=pz.pizza_type_id
group by pt.category

/* Q7  */
select pz.size, count(od.quantity) as [sized ordered]
from pizzas as pz
inner join
order_details as od
on pz.pizza_id=od.pizza_id
group by pz.size

/* Q8 */

select top 1 pt.name,max(pz.price) as [max price] 
from pizzas as pz
inner join
pizza_types as pt
on pz.pizza_type_id=pt.pizza_type_id
group by pt.name
order by [max price] desc;


/* Q9 */
select sum(od.quantity*pz.price) as total_sales
from order_details as od
inner join
pizzas as pz
on od.pizza_id=pz.pizza_id


/* Q10 */
select date as order_hour, count(order_id) as order_count
from orders
group by date
order by order_hour