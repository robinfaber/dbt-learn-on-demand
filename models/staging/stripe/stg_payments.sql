with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        {{ cents_to_dollars('payment_method', 4) }} as amount,
        created as created_at,
        status
        
    from {{ source('stripe', 'payment') }}
)

select * from payments