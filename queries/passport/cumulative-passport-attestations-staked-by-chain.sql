WITH
  optimism_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x843829986e895facd330486a61ebee9e1f1adb1a
    GROUP BY
      1
  ),
  linea_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      COUNT(uid) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations"
    FROM
      attestationstation_v1_linea.EAS_evt_Attested
    WHERE
      attester = 0xbc778313e52b1184a15d163b5d3a72aef8d510a2
    GROUP BY
      1
  ),
  arbitrum_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      COUNT(uid) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations"
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
    WHERE
      attester = 0x7848a3578Ff2E1F134659a23f64A404a4D710475
    GROUP BY
      1
  ),
  scroll_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      COUNT(uid) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations"
    FROM
      eas_scroll.EAS_evt_Attested
    WHERE
      attester = 0xCc90105D4A2aa067ee768120AdA19886021dF422
    GROUP BY
      1
  ),
  zksync_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      COUNT(uid) AS "# zkSync Attestations"
    FROM
      attestationstation_v1_zksync.EAS_evt_Attested
    WHERE
      attester = 0x2B5D97CBE50eA9bf809CbE18A2003E4Cb4D283cC
    GROUP BY
      1
  ),
  daily_attestations AS (
    SELECT
      *
    FROM
      optimism_daily_attestations
    UNION ALL
    SELECT
      *
    FROM
      linea_daily_attestations
    UNION ALL
    SELECT
      *
    FROM
      arbitrum_daily_attestations
    UNION ALL
    SELECT
      *
    FROM
      scroll_daily_attestations
    UNION ALL
    SELECT
      *
    FROM
      zksync_daily_attestations
  ),
  agg_daily_attestations AS (
    SELECT
      day,
      SUM("# Optimism Attestations") AS "# Optimism Attestations",
      SUM("# Linea Attestations") AS "# Linea Attestations",
      SUM("# Arbitrum Attestations") AS "# Arbitrum Attestations",
      SUM("# Scroll Attestations") AS "# Scroll Attestations",
      SUM("# zkSync Attestations") AS "# zkSync Attestations"
    FROM
      daily_attestations
    GROUP BY
      1
  )
SELECT
  day,
  SUM("# Optimism Attestations") OVER (
    ORDER BY
      day
  ) as "Optimism",
  SUM("# Linea Attestations") OVER (
    ORDER BY
      day
  ) as "Linea",
  SUM("# Arbitrum Attestations") OVER (
    ORDER BY
      day
  ) as "Arbitrum",
  SUM("# Scroll Attestations") OVER (
    ORDER BY
      day
  ) as "Scroll",
  SUM("# zkSync Attestations") OVER (
    ORDER BY
      day
  ) as "zkSync"
FROM
  agg_daily_attestations