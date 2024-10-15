WITH
  optimism_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  base_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      attestationstation_v1_base.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  linea_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      attestationstation_v1_linea.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  arbitrum_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  polygon_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      polygon_eas_polygon.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  ethereum_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Ethereum Attestations"
    FROM
      ethereum_attestation_service_ethereum.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  scroll_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      eas_scroll.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  zksync_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      attestationstation_v1_zksync.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  nova_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
    FROM
      eas_nova.EAS_evt_Attested
    GROUP BY
      1
    
  ),
  celo_daily_attestations AS (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS "Day",
      COUNT(uid) AS "# Attestations"
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

 