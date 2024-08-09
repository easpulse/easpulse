WITH
  revenue AS (
    SELECT
      SUM(value) * POWER(10, -18) AS "ETH Revenue"
    FROM
      optimism.transactions
    WHERE
      to = 0xa8eD4d2C3f6f98A55cdDEd97C5aE9B932B0633A4
    UNION ALL
    SELECT
      SUM(value) * POWER(10, -18) AS "ETH Revenue"
    FROM
      linea.transactions
    WHERE
      to = 0xc94aBf0292Ac04AAC18C251d9C8169a8dd2BBbDC
    UNION ALL
    SELECT
      SUM(value) * POWER(10, -18) AS "ETH Revenue"
    FROM
      arbitrum.transactions
    WHERE
      to = 0xc4858e4d177bf0d14571f91401492d62aa608047
    UNION ALL
    SELECT
      SUM(value) * POWER(10, -18) AS "ETH Revenue"
    FROM
      scroll.transactions
    WHERE
      to = 0x16db23c4b99bbC9A6Bf55dF7a787C9AEFD261185
    UNION ALL
    SELECT
      SUM(value) * POWER(10, -18) AS "ETH Revenue"
    FROM
      zksync.transactions
    WHERE
      to = 0xfCC2d308FD4De098D08f056c424C969d728912bF
  )
SELECT
  SUM("ETH Revenue") AS "ETH Revenue"
FROM
  revenue