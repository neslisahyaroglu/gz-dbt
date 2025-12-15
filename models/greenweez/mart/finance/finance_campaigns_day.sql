select
date_date,
revenue,
margin,
operational_margin,
purchase_cost,
shipping_fee,
log_cost,
ship_cost,
quantity,
average_basket,

total_cost,
total_impression,
total_click,

(COALESCE(operational_margin, 0) - COALESCE(total_cost, 0)) as ads_margin
--(operational_margin-total_cost) as ads_margin

from {{ref("int_campaigns_day")}}
full outer join {{ref("finance_days")}}
using (date_date)
order by date_date desc