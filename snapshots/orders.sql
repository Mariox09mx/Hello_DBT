{% snapshot orders_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='o_orderKey',

      strategy='timestamp',
      updated_at='o_orderDate',
    )
}}

select * from {{ source('TPCH_SF1', 'ORDERS') }}

{% endsnapshot %}