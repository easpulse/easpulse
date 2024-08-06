WITH
  coinbase_attestations AS (
    SELECT
      COUNT(*) AS "# Coinbase Attestations"
    FROM
      attestationstation_v1_base.EAS_evt_Attested
    WHERE
      attester = 0x357458739F90461b99789350868CD7CF330Dd7EE
  )
SELECT
  SUM("# Coinbase Attestations") AS "Coinbase Attestations Count"
FROM
  coinbase_attestations