{{ config(schema='gold')}}

select city, sum(total_spend) from {{ ref('addresses_silver') }} group by city
