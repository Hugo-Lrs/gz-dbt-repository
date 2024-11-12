SELECT 
    salesmargin.orders_id
    , salesmargin.date_date
    , ROUND (salesmargin.margin + ship.shipping_fee - (ship.logcost + ship.ship_cost), 2) AS operational_margin
    , salesmargin.quantity
    , salesmargin.revenue
    , salesmargin.purchase_cost
    , salesmargin.margin
    , ship.shipping_fee
    , ship.logcost
    , ship.ship_cost
FROM {{ ref('int_sales_margin') }} AS salesmargin 
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship 
USING (orders_id)
ORDER BY orders_id DESC