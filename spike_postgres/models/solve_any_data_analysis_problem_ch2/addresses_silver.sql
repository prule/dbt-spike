{{ config(schema='silver')}}

SELECT
    company_id,
    upper(address) as address,
    cast (total_spend as decimal) AS total_spend,
    (select city from {{ ref('cities_silver') }} where UPPER(address) like '%'||chr(10)||city||',%' limit 1) as city

FROM {{ ref('addresses_bronze') }}

where address is not null


