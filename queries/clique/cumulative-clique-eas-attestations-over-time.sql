WITH
  optimism_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x38e9ef91f1a96aca71e2c5f7abfea45536b995a2
    GROUP BY
      1
  ),
  daily_attestations AS (
    SELECT
      *
    FROM
      optimism_daily_attestations
  ),
  agg_daily_attestations AS (
    SELECT
      day,
      SUM("# Attestations") AS "Cumulative Attestations"
    FROM
      daily_attestations
    GROUP BY
      1
  )
SELECT
  day,
  SUM("Cumulative Attestations") OVER (
    ORDER BY
      day
  ) as "Cumulative Attestations"
FROM
  agg_daily_attestations