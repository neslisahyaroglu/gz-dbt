with 

source as (

    select * from {{ source('raw_circle_parcel', 'raw_cc_parcel') }}

),

renamed as (

    select
        Parcel_id as parcel_id,
        Parcel_tracking as parcel_tracking,
        Transporter as transporter,
        Priority as priority,
        parse_date ("%B %d , %Y" , Date_purCHase) as date_purchase,
        parse_date ("%B %d , %Y" , Date_shIpping) as date_shipping,
        parse_date ("%B %d , %Y" , DATE_delivery) as date_delivery,
        parse_date ("%B %d , %Y" , DaTeCANcelled) as date_cancelled

    from`ny-project-480109.raw_data_circle.raw_cc_parcel`

)

select * from renamed