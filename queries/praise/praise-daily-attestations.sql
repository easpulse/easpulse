SELECT
  DATE_TRUNC('day', evt_block_time) AS "Day",
  COUNT(uid) AS "# Attestations"
FROM
  attestationstation_v1_optimism.EAS_evt_Attested
WHERE
  attester = 0x6435dCABb62Cb46c9fB94De763CD19a40Ff6Ce23
GROUP BY
  1