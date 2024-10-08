WITH orders_by_state AS (
SELECT o.order_id,
        s.seller_id,
        c.customer_id,
        c.customer_zip_code,
        s.seller_zip_code,
        1 AS order_count
    FROM {{ref("stg_orders")}} AS o
   JOIN {{ref("stg_order_items")}} AS oi ON oi.order_id = o.order_id
   JOIN {{ref("stg_customers")}} AS c ON c.customer_order_id = o.customer_order_id
   JOIN {{ref("stg_sellers")}} AS s ON s.seller_id = oi.seller_id
)



SELECT * FROM orders_by_state