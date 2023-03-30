{{ config(materialized='table') }}

select a.O_ORDERKEY,
a.O_CUSTKEY,
b.N_NAME,
a.O_ORDERSTATUS,
a.O_TOTALPRICE,
a.O_ORDERDATE,
a.O_ORDERPRIORITY
from {{ref('orders')}} a
left join {{ref('dim_customers')}} b
where a.O_CUSTKEY = b.C_CUSTKEY