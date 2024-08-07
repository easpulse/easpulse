SELECT
  DATE_TRUNC('day', evt_block_time) AS "Day",
  COUNT(uid) AS "# Attestations"
FROM
  attestationstation_v1_optimism.EAS_evt_Attested
WHERE
  attester = 0xd8dA8766431366E9aD63eA6D16d9199cece2aA08
GROUP BY
  1