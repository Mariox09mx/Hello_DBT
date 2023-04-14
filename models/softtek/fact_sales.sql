{{ 
    config(
        materialized='incremental',
        unique_key='sales_id'
    ) 
}}

-- depends_on: {{ ref('fact_sales') }}

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
WHERE update_src_date > (SELECT update_src_date FROM {{source('sales', 'fact_sales')}})
{% endif %}