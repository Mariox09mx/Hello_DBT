{{ 
    config(
        materialized='incremental',
        unique_key='sales_id'
    ) 
}}

SELECT
  sale_id,
  transaction_date,
  product_sku,
  quantity,
  unit_amount,
  status,
  update_src_date,
  CURRENT_TIMESTAMP() as audit_update_date
FROM {{source('src_sales')}}
{% if is_incremental() %}