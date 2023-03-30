{{ config(materialized='table') }}

select a.C_CUSTKEY,
a.C_NAME,
C_ADDRESS,
b.N_NAME,
b.N_REGIONKEY,
a.C_PHONE,
a.C_ACCTBAL,
a.C_MKTSEGMENT
from {{ref('customer')}} a
left join {{ref('nation')}} b
where a.C_NATIONKEY = b.N_NATIONKEY
