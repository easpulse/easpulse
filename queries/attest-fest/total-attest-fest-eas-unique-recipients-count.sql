WITH
  all_recipients AS (
    SELECT
      recipient
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0xd8dA8766431366E9aD63eA6D16d9199cece2aA08
  )
SELECT
  COUNT(DISTINCT recipient) AS "Total Recipients"
FROM
  all_recipients