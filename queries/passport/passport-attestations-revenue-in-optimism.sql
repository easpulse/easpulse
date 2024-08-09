SELECT
  SUM(value) * POWER(10, -18) AS "ETH Revenue"
FROM
  optimism.transactions
WHERE
  to = 0xa8eD4d2C3f6f98A55cdDEd97C5aE9B932B0633A4