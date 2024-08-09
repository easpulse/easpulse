SELECT
  SUM(value) * POWER(10, -18) AS "ETH Revenue"
FROM
  arbitrum.transactions
WHERE
  to = 0xc4858e4d177bf0d14571f91401492d62aa608047