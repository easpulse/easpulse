WITH
  base_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      attestationstation_v1_base.EAS_evt_Attested
    WHERE
      attester = 0x357458739F90461b99789350868CD7CF330Dd7EE
    GROUP BY
      1
  ),
  daily_attestations AS (
    SELECT
      *
    FROM
      base_daily_attestations
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
