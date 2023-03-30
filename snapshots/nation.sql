{% snapshot nation %}

{{
    config(
      unique_key='N_NATIONKEY',

      strategy='check',
      check_cols=['N_NAME'],
    )
}}

select * from {{ source('TPCH_SF1', 'NATION') }}

{% endsnapshot %}