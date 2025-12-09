select
  orders_id,
  date_date,
  round(sum(revenue), 2) as sum_revenue,
  round(sum(quantity), 2) as sum_quantity,
  round(sum(purchase_cost), 2) as sum_purchase_cost,
  round(sum(margin), 2) as sum_margin
from {{ ref('int_sales_margin') }}
group by orders_id, date_date
order by orders_id desc