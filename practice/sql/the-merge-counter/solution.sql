WITH create_tabel as(
  SELECT 'main' AS branch
  UNION ALL
  SELECT 'develop' 
  UNION ALL
  SELECT 'release'
),
group_branchs as(
  SELECT 
    branch,
    count(trigger) as build_count,
    CAST(count(trigger) AS DECIMAL(10, 2)) as build_count_decimal,
    AVG(dur_secs) as avg_duration
  FROM ci_builds
  WHERE 
    trigger != 'manual' AND 
    built_at >= '2026-01-01 00:00:00'
  GROUP BY branch
)
SELECT 
  t.branch,
  COALESCE(g.build_count, 0) AS build_count,
  COALESCE(g.build_count_decimal, 0.0) AS build_count_decimal,
  g.avg_duration
FROM 
  create_tabel t
LEFT JOIN 
  group_branchs g
ON g.branch=t.branch
