WITH core_candidates AS (
  SELECT 
    ROW_NUMBER() OVER (ORDER BY user_id) AS cores_per_executor
  FROM users
  LIMIT 5
),
cluster_sizing AS (
  SELECT 
    cores_per_executor,
    FLOOR(31 / cores_per_executor) AS executors_per_node,
    FLOOR(127 / FLOOR(31 / cores_per_executor)) - 2 AS heap_gb,
    FLOOR(31 / cores_per_executor) * 50 AS total_executors
  FROM core_candidates
)
SELECT 
  cores_per_executor,
  executors_per_node,
  heap_gb,
  total_executors
FROM cluster_sizing
WHERE heap_gb >= 3 * 2.1
ORDER BY cores_per_executor;
