SELECT
  SUM(value) * POWER(10, -18) AS "ETH Revenue"
FROM
  scroll.transactions
WHERE
  to = 0x16db23c4b99bbC9A6Bf55dF7a787C9AEFD261185