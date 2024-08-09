SELECT
  SUM(value) * POWER(10, -18) AS "ETH Revenue"
FROM
  zksync.transactions
WHERE
  to = 0xfCC2d308FD4De098D08f056c424C969d728912bF