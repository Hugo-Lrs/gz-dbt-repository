SELECT 
    ordersmargin.orders_id
    , ordersmargin.date_date
    , ROUND (ordersmargin.margin + ship.shipping_fee - (ship.logcost + ship.ship_cost), 2) AS operational_margin
    , ordersmargin.quantity
    , ordersmargin.revenue
    , ordersmargin.purchase_cost
    , ordersmargin.margin
    , ship.shipping_fee
    , ship.logcost
    , ship.ship_cost
FROM {{ ref('int_orders_margin') }} AS ordersmargin 
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship 
USING (orders_id)
ORDER BY orders_id DESC