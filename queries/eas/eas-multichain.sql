WITH
  optimism_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS op_attester_count,
      COUNT(DISTINCT recipient) AS op_recipient_count,
      COUNT(*) AS op_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          attestationstation_v1_optimism.EAS_evt_Revoked
      ) AS op_revoked_count
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
  ),
  base_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS base_attester_count,
      COUNT(DISTINCT recipient) AS base_recipient_count,
      COUNT(*) AS base_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          attestationstation_v1_base.EAS_evt_Revoked
      ) AS base_revoked_count
    FROM
      attestationstation_v1_base.EAS_evt_Attested
  ),
  linea_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS linea_attester_count,
      COUNT(DISTINCT recipient) AS linea_recipient_count,
      COUNT(*) AS linea_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          attestationstation_v1_linea.EAS_evt_Revoked
      ) AS linea_revoked_count
    FROM
      attestationstation_v1_linea.EAS_evt_Attested
  ),
  arbitrum_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS arb_attester_count,
      COUNT(DISTINCT recipient) AS arb_recipient_count,
      COUNT(*) AS arb_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          arbitrum_eas_arbitrum.EAS_evt_Revoked
      ) AS arb_revoked_count
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
  ),
  polygon_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS pol_attester_count,
      COUNT(DISTINCT recipient) AS pol_recipient_count,
      COUNT(*) AS pol_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          polygon_eas_polygon.EAS_evt_Revoked
      ) AS pol_revoked_count
    FROM
      polygon_eas_polygon.EAS_evt_Attested
  ),
  nova_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS nova_attester_count,
      COUNT(DISTINCT recipient) AS nova_recipient_count,
      COUNT(*) AS nova_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          attestationstation_v1_zksync.EAS_evt_Revoked
      ) AS nova_revoked_count
    FROM
      eas_nova.EAS_evt_Attested
  ),
  celo_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS celo_attester_count,
      COUNT(DISTINCT recipient) AS celo_recipient_count,
      COUNT(*) AS celo_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          eas_celo.EAS_evt_Revoked
      ) AS celo_revoked_count
    FROM
      eas_celo.EAS_evt_Attested
  ),
  ethereum_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS eth_attester_count,
      COUNT(DISTINCT recipient) AS eth_recipient_count,
      COUNT(*) AS eth_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          ethereum_attestation_service_ethereum.EAS_evt_Revoked
      ) AS eth_revoked_count
    FROM
      ethereum_attestation_service_ethereum.EAS_evt_Attested
  ),
  scroll_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS scroll_attester_count,
      COUNT(DISTINCT recipient) AS scroll_recipient_count,
      COUNT(*) AS scroll_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          eas_scroll.EAS_evt_Revoked
      ) AS scroll_revoked_count
    FROM
      eas_scroll.EAS_evt_Attested
  ),
  zksync_counts AS (
    SELECT
      COUNT(DISTINCT attester) AS zksync_attester_count,
      COUNT(DISTINCT recipient) AS zksync_recipient_count,
      COUNT(*) AS zksync_attestation_count,
      (
        SELECT
          COUNT(*)
        FROM
          attestationstation_v1_zksync.EAS_evt_Revoked
      ) AS zksync_revoked_count
    FROM
      attestationstation_v1_zksync.EAS_evt_Attested
  )
SELECT
  'Base' AS Chain,
  base_attestation_count AS "# Attestations",
  base_revoked_count AS "# Revocations",
  base_recipient_count AS "# Unique Recipients",
  base_attester_count AS "# Unique Attesters"
FROM
  base_counts
UNION
SELECT
  'Arbitrum' AS Chain,
  arb_attestation_count,
  arb_revoked_count,
  arb_recipient_count,
  arb_attester_count
FROM
  arbitrum_counts
UNION
SELECT
  'Polygon' AS Chain,
  pol_attestation_count,
  pol_revoked_count,
  pol_recipient_count,
  pol_attester_count
FROM
  polygon_counts
UNION
SELECT
  'Arbitrum Nova' AS Chain,
  nova_attestation_count,
  nova_revoked_count,
  nova_recipient_count,
  nova_attester_count
FROM
  nova_counts
UNION
SELECT
  'Ethereum' AS Chain,
  eth_attestation_count,
  eth_revoked_count,
  eth_recipient_count,
  eth_attester_count
FROM
  ethereum_counts
UNION
SELECT
  'Optimism' AS Chain,
  op_attestation_count,
  op_revoked_count,
  op_recipient_count,
  op_attester_count
FROM
  optimism_counts
UNION
SELECT
  'Linea' AS Chain,
  linea_attestation_count,
  linea_revoked_count,
  linea_recipient_count,
  linea_attester_count
FROM
  linea_counts
UNION
SELECT
  'Scroll' AS Chain,
  scroll_attestation_count,
  scroll_revoked_count,
  scroll_recipient_count,
  scroll_attester_count
FROM
  scroll_counts
UNION
SELECT
  'zkSync' AS Chain,
  zksync_attestation_count,
  zksync_revoked_count,
  zksync_recipient_count,
  zksync_attester_count
FROM
  zksync_counts
UNION
SELECT
  'Celo' AS Chain,
  celo_attestation_count,
  celo_revoked_count,
  celo_recipient_count,
  celo_attester_count
FROM
  celo_counts
ORDER BY
  "# Attestations" DESC;