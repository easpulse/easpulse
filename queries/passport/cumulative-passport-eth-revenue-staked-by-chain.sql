WITH
  optimism_daily_revenue AS (
    SELECT
      DATE_TRUNC('day', block_time) AS "Day",
      SUM(value) * POWER(10, -18) AS "Optimism revenue",
      TRY_CAST(0 AS DECIMAL) AS "Linea revenue",
      TRY_CAST(0 AS DECIMAL) AS "Arbitrum revenue",
      TRY_CAST(0 AS DECIMAL) AS "Scroll revenue",
      TRY_CAST(0 AS DECIMAL) AS "zkSync revenue"
    FROM
      optimism.transactions
    WHERE
      to = 0xa8eD4d2C3f6f98A55cdDEd97C5aE9B932B0633A4
    GROUP BY
      1
  ),
  linea_daily_revenue AS (
    SELECT
      DATE_TRUNC('day', block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "Optimism revenue",
      SUM(value) * POWER(10, -18) AS "Linea revenue",
      TRY_CAST(0 AS DECIMAL) AS "Arbitrum revenue",
      TRY_CAST(0 AS DECIMAL) AS "Scroll revenue",
      TRY_CAST(0 AS DECIMAL) AS "zkSync revenue"
    FROM
      linea.transactions
    WHERE
      to = 0xc94aBf0292Ac04AAC18C251d9C8169a8dd2BBbDC
    GROUP BY
      1
  ),
  arbitrum_daily_revenue AS (
    SELECT
      DATE_TRUNC('day', block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "Optimism revenue",
      TRY_CAST(0 AS DECIMAL) AS "Linea revenue",
      SUM(value) * POWER(10, -18) AS "Arbitrum revenue",
      TRY_CAST(0 AS DECIMAL) AS "Scroll revenue",
      TRY_CAST(0 AS DECIMAL) AS "zkSync revenue"
    FROM
      arbitrum.transactions
    WHERE
      to = 0xc4858e4d177bf0d14571f91401492d62aa608047
    GROUP BY
      1
  ),
  scroll_daily_revenue AS (
    SELECT
      DATE_TRUNC('day', block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "Optimism revenue",
      TRY_CAST(0 AS DECIMAL) AS "Linea revenue",
      TRY_CAST(0 AS DECIMAL) AS "Arbitrum revenue",
      SUM(value) * POWER(10, -18) AS "Scroll revenue",
      TRY_CAST(0 AS DECIMAL) AS "zkSync revenue"
    FROM
      scroll.transactions
    WHERE
      to = 0x16db23c4b99bbC9A6Bf55dF7a787C9AEFD261185
    GROUP BY
      1
  ),
  zksync_daily_revenue AS (
    SELECT
      DATE_TRUNC('day', block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "Optimism revenue",
      TRY_CAST(0 AS DECIMAL) AS "Linea revenue",
      TRY_CAST(0 AS DECIMAL) AS "Arbitrum revenue",
      TRY_CAST(0 AS DECIMAL) AS "Scroll revenue",
      SUM(value) * POWER(10, -18) AS "zkSync revenue"
    FROM
      zksync.transactions
    WHERE
      to = 0xfCC2d308FD4De098D08f056c424C969d728912bF
    GROUP BY
      1
  ),
  daily_revenue AS (
    SELECT
      *
    FROM
      optimism_daily_revenue
    UNION ALL
    SELECT
      *
    FROM
      linea_daily_revenue
    UNION ALL
    SELECT
      *
    FROM
      arbitrum_daily_revenue
    UNION ALL
    SELECT
      *
    FROM
      scroll_daily_revenue
    UNION ALL
    SELECT
      *
    FROM
      zksync_daily_revenue
  ),
  agg_daily_revenue AS (
    SELECT
      day,
      SUM("Optimism revenue") AS "Optimism revenue",
      SUM("Linea revenue") AS "Linea revenue",
      SUM("Arbitrum revenue") AS "Arbitrum revenue",
      SUM("Scroll revenue") AS "Scroll revenue",
      SUM("zkSync revenue") AS "zkSync revenue"
    FROM
      daily_revenue
    GROUP BY
      1
  )
SELECT
  day,
  SUM("Optimism revenue") OVER (
    ORDER BY
      day
  ) as "Optimism ac. revenue",
  SUM("Linea revenue") OVER (
    ORDER BY
      day
  ) as "Linea ac. revenue",
  SUM("Arbitrum revenue") OVER (
    ORDER BY
      day
  ) as "Arbitrum ac. revenue",
  SUM("Scroll revenue") OVER (
    ORDER BY
      day
  ) as "Scroll ac. revenue",
  SUM("zkSync revenue") OVER (
    ORDER BY
      day
  ) as "zkSync ac. revenue"
FROM
  agg_daily_revenue