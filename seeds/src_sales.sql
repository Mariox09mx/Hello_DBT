{{ config(materialized='seed') }}

select *
from {{ source('fuente1.csv') }}