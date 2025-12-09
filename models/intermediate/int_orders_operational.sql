select
om.orders_id,
om.date_date,
round((om.sum_margin + s.shipping_fee - (s.logcost + s.ship_cost)),2) AS operational_margin,
om.sum_revenue,
om.sum_quantity,
om.sum_purchase_cost,
om.sum_margin,
s.shipping_fee,
s.logcost,
s.ship_cost
FROM {{ref('int_orders_margin')}} AS om
left join {{ref('stg_raw_ship')}} AS s
using(orders_id)
order by orders_id desc