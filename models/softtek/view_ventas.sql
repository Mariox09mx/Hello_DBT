{{ config(materialized='view') }}

select SUM(O_TOTALPRICE) as S_TOTALPRICE
from {{ref('fact_orders')}}
group by O_ORDERDATE