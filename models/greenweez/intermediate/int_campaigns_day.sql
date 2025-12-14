select
date_date,
sum(ads_cost) as total_cost,
sum(click) as total_click,
sum(impression) as total_impression
from {{ref( "int_campaigns" )}}
group by date_date
order by date_date desc