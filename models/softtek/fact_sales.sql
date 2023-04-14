{{ 
    config(
        materialized='incremental',
        unique_key='sale_id',
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
FROM {{source('sales', 'src_sales')}}
{% if is_incremental() %}
WHERE update_src_date > (select max(update_src_date) from {{this}})
{% endif %}