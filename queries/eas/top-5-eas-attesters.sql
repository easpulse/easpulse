WITH
  addr AS (
    SELECT
      attester AS "Address",
      COUNT(contract_address) AS "Attestations"
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
    GROUP BY
      1
    ORDER BY
      2 DESC
  ),
  addr_ens AS (
    SELECT DISTINCT
      a."Address",
      a."Attestations",
      b.name
    FROM
      addr AS a
      LEFT JOIN ens.reverse_latest AS b ON a."Address" = b.address
  ),
  combined_results AS (
    SELECT
      a.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT a.recipient) AS recipient_count,
      'Optimism' AS data_source
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested a
    GROUP BY
      a.attester
    UNION ALL
    SELECT
      b.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT b.recipient) AS recipient_count,
      'Base' AS data_source
    FROM
      attestationstation_v1_base.EAS_evt_Attested b
    GROUP BY
      b.attester
    UNION ALL
    SELECT
      c.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT c.recipient) AS recipient_count,
      'Ethereum' AS data_source
    FROM
      ethereum_attestation_service_ethereum.EAS_evt_Attested c
    GROUP BY
      c.attester
    UNION ALL
    SELECT
      d.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT d.recipient) AS recipient_count,
      'Arbitrum' AS data_source
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested d
    GROUP BY
      d.attester
    UNION ALL
    SELECT
      e.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT e.recipient) AS recipient_count,
      'Linea' AS data_source
    FROM
      attestationstation_v1_linea.EAS_evt_Attested e
    GROUP BY
      e.attester
    UNION ALL
    SELECT
      f.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT f.recipient) AS recipient_count,
      'Polygon' AS data_source
    FROM
      polygon_eas_polygon.EAS_evt_Attested f
    GROUP BY
      f.attester
    UNION ALL
    SELECT
      g.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT g.recipient) AS recipient_count,
      'Arbitrum Nova' AS data_source
    FROM
      eas_nova.EAS_evt_Attested g
    GROUP BY
      g.attester
    UNION ALL
    SELECT
      h.attester,
      COUNT(*) AS attest_count,
      COUNT(DISTINCT h.recipient) AS recipient_count,
      'Scroll' AS data_source
    FROM
      eas_scroll.EAS_evt_Attested h
    GROUP BY
      h.attester
  )
SELECT
  cr.attester AS "Attester",
  cr.attest_count AS "# Attestations",
  cr.recipient_count AS "# Recipients",
  cr.data_source AS "Chain",
  CASE
    WHEN cr.attester = 0x357458739f90461b99789350868cd7cf330dd7ee THEN 'Coinbase Verifications'
    WHEN cr.attester = 0x2a0eb7cae52b68e94ff6ab0bfcf0df8eeeb624be THEN 'Optimism Grants'
    WHEN cr.attester = 0x843829986e895facd330486a61ebee9e1f1adb1a THEN 'Gitcoin Passport'
    WHEN cr.attester = 0x38e9ef91f1a96aca71e2c5f7abfea45536b995a2 THEN 'Clique Oracle'
    WHEN cr.attester = 0xBC778313E52b1184A15D163b5d3a72AEF8d510A2 THEN 'Gitcoin Passport'
    WHEN cr.attester = 0x39fb5e85c7713657c2d9e869e974ff1e0b06f20c THEN 'Scroll Canvas Badge'
    WHEN cr.attester = 0x7673f45e6e95373ba22651a4f5f594edec3006bc THEN 'Scroll Canvas Badge'
    WHEN cr.attester = 0xf61b5dae16948f0f1ed9141634e4647bbaaa4a81 THEN 'Scroll Canvas Badge'
    WHEN cr.attester = 0x65ab4b5f30aef8b29858ea2cbd6b0d0e68010206 THEN 'Scroll Canvas Badge'
    ELSE COALESCE(ae.name, 'N/A')
  END AS "Name"
FROM
  combined_results cr
  LEFT JOIN addr_ens ae ON cr.attester = ae."Address"
ORDER BY
  cr.attest_count DESC
LIMIT
  5;