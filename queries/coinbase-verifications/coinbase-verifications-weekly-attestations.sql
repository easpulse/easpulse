SELECT
  DATE_TRUNC('week', evt_block_time) AS "Day",
  COUNT(uid) AS "# Attestations"
FROM
  attestationstation_v1_base.EAS_evt_Attested
WHERE
  attester = 0x357458739F90461b99789350868CD7CF330Dd7EE
GROUP BY
  1
