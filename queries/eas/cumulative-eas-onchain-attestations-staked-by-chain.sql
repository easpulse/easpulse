WITH
  optimism_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    GROUP BY
      1
  ),
  base_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      COUNT(uid) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      attestationstation_v1_base.EAS_evt_Attested
    GROUP BY
      1
  ),
  linea_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      COUNT(uid) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      attestationstation_v1_linea.EAS_evt_Attested
    GROUP BY
      1
  ),
  arbitrum_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      COUNT(uid) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
    GROUP BY
      1
  ),
  polygon_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      COUNT(uid) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      polygon_eas_polygon.EAS_evt_Attested
    GROUP BY
      1
  ),
  ethereum_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      COUNT(uid) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      ethereum_attestation_service_ethereum.EAS_evt_Attested
    GROUP BY
      1
  ),
  scroll_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      COUNT(uid) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      eas_scroll.EAS_evt_Attested
    GROUP BY
      1
  ),
  zksync_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      COUNT(uid) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      attestationstation_v1_zksync.EAS_evt_Attested
    GROUP BY
      1
  ),
  nova_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      COUNT(uid) AS "# Arbitrum Nova Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Celo Attestations"
    FROM
      eas_nova.EAS_evt_Attested
    GROUP BY
      1
  ),
  celo_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      TRY_CAST(0 AS DECIMAL) AS "# Optimism Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Base Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Linea Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Polygon Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Ethereum Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Scroll Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# zkSync Attestations",
      TRY_CAST(0 AS DECIMAL) AS "# Arbitrum Nova Attestations",
      COUNT(uid) AS "# Celo Attestations"
    FROM
      eas_celo.EAS_evt_Attested
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
      base_daily_attestations
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
      polygon_daily_attestations
    UNION ALL
    SELECT
      *
    FROM
      ethereum_daily_attestations
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
    UNION ALL
    SELECT
      *
    FROM
      nova_daily_attestations
    UNION ALL
    SELECT
      *
    FROM
      celo_daily_attestations
  ),
  agg_daily_attestations AS (
    SELECT
      day,
      SUM("# Optimism Attestations") AS "# Optimism Attestations",
      SUM("# Base Attestations") AS "# Base Attestations",
      SUM("# Linea Attestations") AS "# Linea Attestations",
      SUM("# Arbitrum Attestations") AS "# Arbitrum Attestations",
      SUM("# Polygon Attestations") AS "# Polygon Attestations",
      SUM("# Ethereum Attestations") AS "# Ethereum Attestations",
      SUM("# Scroll Attestations") AS "# Scroll Attestations",
      SUM("# zkSync Attestations") AS "# zkSync Attestations",
      SUM("# Arbitrum Nova Attestations") AS "# Arbitrum Nova Attestations",
      SUM("# Celo Attestations") AS "# Celo Attestations"
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
  SUM("# Base Attestations") OVER (
    ORDER BY
      day
  ) as "Base",
  SUM("# Linea Attestations") OVER (
    ORDER BY
      day
  ) as "Linea",
  SUM("# Arbitrum Attestations") OVER (
    ORDER BY
      day
  ) as "Arbitrum",
  SUM("# Polygon Attestations") OVER (
    ORDER BY
      day
  ) as "Polygon",
  SUM("# Ethereum Attestations") OVER (
    ORDER BY
      day
  ) as "Ethereum",
  SUM("# Scroll Attestations") OVER (
    ORDER BY
      day
  ) as "Scroll",
  SUM("# zkSync Attestations") OVER (
    ORDER BY
      day
  ) as "zkSync",
  SUM("# Arbitrum Nova Attestations") OVER (
    ORDER BY
      day
  ) as "Nova",
  SUM("# Celo Attestations") OVER (
    ORDER BY
      day
  ) as "Celo"
FROM
  agg_daily_attestations