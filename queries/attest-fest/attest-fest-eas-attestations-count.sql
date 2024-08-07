WITH
  attest_attestations AS (
    SELECT
      COUNT(*) AS "# Attest Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0xd8dA8766431366E9aD63eA6D16d9199cece2aA08
  )
SELECT
  SUM("# Attest Attestations") AS "Attest Attestations Count"
FROM
  attest_attestations