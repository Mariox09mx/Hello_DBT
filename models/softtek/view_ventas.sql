{{ config(materialized='view') }}

select N_NAME as S_COUNTRY,
SUM(O_TOTALPRICE) as S_TOTALPRICE,
O_ORDERDATE as S_DATE
from {{ref('fact_orders')}}
group by O_ORDERDATE,
N_NAME