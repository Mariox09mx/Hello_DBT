CREATE TABLE {{ ref('src_sales') }} (
  sale_id INTEGER,
  transaction_date DATE,
  product_sku INTEGER,
  quantity INTEGER,
  unit_amount DECIMAL(10,2),
  status VARCHAR(2),
  update_src_date TIMESTAMP WITHOUT TIME ZONE
);

-- Carga los datos del archivo fuente1.csv en la tabla src_sales
COPY {{ ref('src_sales') }} FROM '{{ seed_path('fuente1.csv') }}' WITH (FORMAT csv, HEADER true);