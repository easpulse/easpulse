WITH
  praise_attestations AS (
    SELECT
      COUNT(*) AS "# Praise Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x6435dCABb62Cb46c9fB94De763CD19a40Ff6Ce23
  )
SELECT
  SUM("# Praise Attestations") AS "Praise Attestations Count"
FROM
  praise_attestations