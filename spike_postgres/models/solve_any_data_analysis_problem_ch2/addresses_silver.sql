{{ config(schema='silver')}}

SELECT
    company_id,
    upper(address) as address,
    cast (total_spend as decimal) AS total_spend,
    coalesce(
        (select city from {{ ref('cities_silver') }} where UPPER(address) like '%'||chr(10)||city||',%' order by city desc limit 1),
         'OTHER'
    ) as city

FROM {{ ref('addresses_bronze') }}

where address is not null


