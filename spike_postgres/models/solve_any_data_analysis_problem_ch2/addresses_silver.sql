{{ config(schema='silver')}}

-- upper case address
-- cast total_spend to decimal
-- match the address to a city from the cities table
-- remove rows with no address
-- use OTHER when no match for city

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


