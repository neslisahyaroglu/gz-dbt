with 

source as (

    select * from {{ source('raw_circle_parcel', 'raw_cc_parcel_product') }}

),

renamed as (

    select
        ParCEL_id as parcel_id,
        Model_mAME as model_name,
        QUANTITY as quantity

    from`ny-project-480109.raw_data_circle.raw_cc_parcel_product`

)

select * from renamed