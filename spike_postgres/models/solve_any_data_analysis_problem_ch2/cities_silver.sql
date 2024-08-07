{{ config(schema='silver')}}
-- trim and uppercase city
-- remove '*'
-- remove rows where city is empty
-- remove rows where city is in specified list

SELECT
    distinct trim(upper(
        replace(city, '*', '')
    )) as city
FROM {{ ref('cities_bronze') }}
where city is not null
and not city in ('England', 'Scotland', 'Wales', 'Northern Ireland')
