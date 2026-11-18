WITH calc_minimum_prices as (
SELECT product_id, MIN(total_amount) AS base_price 
FROM transactions 
GROUP BY product_id )

SELECT product_id,
base_price
from calc_minimum_prices 
WHERE base_price > (SELECT AVG(base_price) from calc_minimum_prices)
ORDER BY product_id;
