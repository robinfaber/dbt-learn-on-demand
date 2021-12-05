-- the last order date can never be before the first order date
-- Therefore return records where this isn't true to make the test fail.
select
  order_id,
	min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date
from {{ ref('stg_orders') }}
group by 1
having not(most_recent_order_date >= first_order_date)