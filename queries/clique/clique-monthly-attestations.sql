SELECT
  DATE_TRUNC('month', evt_block_time) AS "Day",
  COUNT(uid) AS "# Attestations"
FROM
  attestationstation_v1_optimism.EAS_evt_Attested
WHERE
  attester = 0x38e9ef91f1a96aca71e2c5f7abfea45536b995a2
GROUP BY
  1