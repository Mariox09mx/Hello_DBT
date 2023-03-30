{{ config(materialized='view') }}

select SUM(O_TOTALPRICE) as S_TOTALPRICE
from {{ref('fact_order')}}
group by O_ORDERDATE