SELECT
  SUM(value) * POWER(10, -18) AS "ETH Revenue"
FROM
  linea.transactions
WHERE
  to = 0xc94aBf0292Ac04AAC18C251d9C8169a8dd2BBbDC