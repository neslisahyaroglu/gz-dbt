select
extract (month from date_date) as month_date,
sum (revenue) as revenue,
sum (margin) as margin,
sum (operational_margin) as operational_margin,
sum (purchase_cost) as purchase_cost,
sum (shipping_fee) as shipping_fee,
sum (log_cost) as log_cost,
sum (ship_cost) as ship_cost,
sum (quantity) as quantity,
round(sum (average_basket),2) as average_basket,

sum (total_cost) as total_cost,
sum (total_impression) as total_impression,
sum (total_click) as total_click,

sum (operational_margin-total_cost) as ads_margin

from {{ref("finance_campaigns_day")}}
group by month_date
order by month_date desc

