{% snapshot orders %}

{{
    config(
      target_database='ANALYTICS',
      target_schema='SNAPSHOTS',
      unique_key='O_ORDERKEY',

      strategy='timestamp',
      updated_at='O_ORDERDATE',
    )
}}

select * from {{ source('TPCH_SF1', 'ORDERS') }}

{% endsnapshot %}