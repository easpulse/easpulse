WITH
  clique_attestations AS (
    SELECT
      COUNT(*) AS "# Clique Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x38e9ef91f1a96aca71e2c5f7abfea45536b995a2
  )
SELECT
  SUM("# Clique Attestations") AS "Clique Attestations Count"
FROM
  clique_attestations