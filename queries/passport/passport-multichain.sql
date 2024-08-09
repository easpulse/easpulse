WITH
  optimism_counts AS (
    SELECT
      COUNT(DISTINCT recipient) AS op_recipient_count,
      COUNT(*) AS op_attestation_count
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x843829986e895facd330486a61ebee9e1f1adb1a
  ),
  arbitrum_counts AS (
    SELECT
      COUNT(DISTINCT recipient) AS arbitrum_recipient_count,
      COUNT(*) AS arbitrum_attestation_count
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
    WHERE
      attester = 0x7848a3578Ff2E1F134659a23f64A404a4D710475
  ),
  linea_counts AS (
    SELECT
      COUNT(DISTINCT recipient) AS linea_recipient_count,
      COUNT(*) AS linea_attestation_count
    FROM
      attestationstation_v1_linea.EAS_evt_Attested
    WHERE
      attester = 0xbc778313e52b1184a15d163b5d3a72aef8d510a2
  ),
  scroll_counts AS (
    SELECT
      COUNT(DISTINCT recipient) AS scroll_recipient_count,
      COUNT(*) AS scroll_attestation_count
    FROM
      eas_scroll.EAS_evt_Attested
    WHERE
      attester = 0xCc90105D4A2aa067ee768120AdA19886021dF422
  ),
  zksync_counts AS (
    SELECT
      COUNT(DISTINCT recipient) AS zksync_recipient_count,
      COUNT(*) AS zksync_attestation_count
    FROM
      attestationstation_v1_zksync.EAS_evt_Attested
    WHERE
      attester = 0x2B5D97CBE50eA9bf809CbE18A2003E4Cb4D283cC
  )
SELECT
  'Optimism' AS Chain,
  op_attestation_count AS "# Attestations",
  op_recipient_count AS "# Unique Recipients"
FROM
  optimism_counts
UNION
SELECT
  'Linea' AS Chain,
  linea_attestation_count,
  linea_recipient_count
FROM
  linea_counts
UNION
SELECT
  'Arbitrum' AS Chain,
  arbitrum_attestation_count,
  arbitrum_recipient_count
FROM
  arbitrum_counts
UNION
SELECT
  'Scroll' AS Chain,
  scroll_attestation_count,
  scroll_recipient_count
FROM
  scroll_counts
UNION
SELECT
  'zkSync' AS Chain,
  zksync_attestation_count,
  zksync_recipient_count
FROM
  zksync_counts
ORDER BY
  "# Attestations" DESC