WITH
  all_recipients AS (
    SELECT
      recipient
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x38e9ef91f1a96aca71e2c5f7abfea45536b995a2
  )
SELECT
  COUNT(DISTINCT recipient) AS "Total Recipients"
FROM
  all_recipients