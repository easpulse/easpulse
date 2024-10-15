SELECT
  (
    SELECT
      COUNT(*)
    FROM
      attestationstation_v1_optimism.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      attestationstation_v1_base.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      attestationstation_v1_linea.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      polygon_eas_polygon.EAS_evt_Revoked
  ) + 
  (
    SELECT
      COUNT(*)
    FROM
      ethereum_attestation_service_ethereum.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      eas_scroll.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      attestationstation_v1_zksync.EAS_evt_Revoked
  ) + (
    SELECT
      COUNT(*)
    FROM
      eas_celo.EAS_evt_Revoked
  ) AS "Total Revocations"