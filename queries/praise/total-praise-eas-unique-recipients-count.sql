WITH
  all_recipients AS (
    SELECT
      recipient
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x6435dCABb62Cb46c9fB94De763CD19a40Ff6Ce23
  )
SELECT
  COUNT(DISTINCT recipient) AS "Total Recipients"
FROM
  all_recipients