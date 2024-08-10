WITH
  optimism_daily_revenue AS (
    SELECT
      DATE_TRUNC('day', block_time) AS "Day",
      SUM(value) AS "Revenue"
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
      SUM(value) AS "Revenue"
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
      SUM(value) AS "Revenue"
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
      SUM(value) AS "Revenue"
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
      SUM(value) AS "Revenue"
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
      SUM("Revenue") * POWER(10, -18) AS "Cumulative Revenue"
    FROM
      daily_revenue
    GROUP BY
      1
  )
SELECT
  day,
  SUM("Cumulative Revenue") OVER (
    ORDER BY
      day
  ) as "Cumulative Revenue"
FROM
  agg_daily_revenue