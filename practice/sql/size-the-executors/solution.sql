WITH cores_candidates as (
  SELECT ROW_NUMBER() OVER(order by user_id) as cores_per_executor from users limit 5 
),
 executer_calc as (
  SELECT
    cores_per_executor, 
    FLOOR(31 / cores_per_executor) as executors_per_node,
    FLOOR(127 / FLOOR(31 / cores_per_executor)) - 2 AS heap_gb,
    FLOOR(31 / cores_per_executor) * 50 AS total_executors
  FROM cores_candidates 
)
SELECT 
  *
FROM executer_calc
WHERE
  heap_gb >= 3*2.1
order by cores_per_executor;
