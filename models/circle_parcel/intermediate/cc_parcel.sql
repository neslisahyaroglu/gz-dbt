WITH nb_products_parcel AS (
  SELECT
    parcel_id
    ,SUM(quantity) AS qty
    ,COUNT(DISTINCT model_name) AS nb_products
    from {{ref("stg_cc_parcel_product")}}
  --FROM `course15.cc_parcel_product`
  GROUP BY parcel_id
)
SELECT
parcel_id
-- paket bilgileri --
,parcel_tracking
,transporter
,priority
-- tarih --
,date_purchase
,date_shipping
,date_delivery
,date_cancelled
-- ay --
,EXTRACT(MONTH FROM date_purchase) AS month_purchase
-- durum --
,CASE
WHEN date_cancelled IS NOT NULL THEN 'İptal Edildi'
WHEN date_shipping IS NULL THEN 'Devam Ediyor'
WHEN date_delivery IS NULL THEN 'Taşınıyor'
WHEN date_delivery IS NOT NULL THEN 'Teslim Edildi'
ELSE NULL
END AS status
-- zaman --
,DATE_DIFF(date_shipping , date_purchase , DAY) AS expedition_time
,DATE_DIFF(date_delivery , date_shipping , DAY) AS transport_time
,DATE_DIFF(date_delivery , date_purchase , DAY) AS delivery_time
-- gecikme --
,IF(date_delivery IS NULL,NULL,IF(DATE_DIFF(date_delivery , date_purchase , DAY)>5,1,0)) AS delay
-- Metrikler --
,qty
,nb_products as nb_models
from {{ref("stg_cc_parcel")}}
--FROM `course15.cc_parcel`
LEFT JOIN nb_products_parcel 
USING (parcel_id)