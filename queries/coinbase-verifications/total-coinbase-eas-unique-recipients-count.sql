WITH
  all_recipients AS (
    SELECT
      recipient
    FROM
      attestationstation_v1_base.EAS_evt_Attested
    WHERE
      attester = 0x357458739F90461b99789350868CD7CF330Dd7EE
  )
SELECT
  COUNT(DISTINCT recipient) AS "Total Recipients"
FROM
  all_recipients