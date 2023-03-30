{% snapshot customer %}

{{
    config(
      unique_key='C_CUSTKEY',

      strategy='check',
      check_cols=['C_NAME','C_ADDRESS','C_NATIONKEY','C_PHONE'],
    )
}}

select * from {{ source('TPCH_SF1', 'CUSTOMER') }}

{% endsnapshot %}