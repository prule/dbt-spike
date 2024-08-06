{{ config(schema='silver')}}

SELECT
    trim(upper(
        replace(city, '*', '')
    )) as city
FROM {{ ref('cities_bronze') }}
where city is not null
and not city in ('England', 'Scotland', 'Wales', 'Northern Ireland')
