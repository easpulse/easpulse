WITH
  all_recipients AS (
    SELECT
      recipient
    FROM
      attestationstation_v1_optimism.EAS_evt_Attested
    WHERE
      attester = 0x843829986e895facd330486a61ebee9e1f1adb1a
    UNION
    SELECT
      recipient
    FROM
      arbitrum_eas_arbitrum.EAS_evt_Attested
    WHERE
      attester = 0x7848a3578Ff2E1F134659a23f64A404a4D710475
    UNION
    SELECT
      recipient
    FROM
      attestationstation_v1_linea.EAS_evt_Attested
    WHERE
      attester = 0xbc778313e52b1184a15d163b5d3a72aef8d510a2
    UNION
    SELECT
      recipient
    FROM
      eas_scroll.EAS_evt_Attested
    WHERE
      attester = 0xCc90105D4A2aa067ee768120AdA19886021dF422
    UNION
    SELECT
      recipient
    FROM
      attestationstation_v1_zksync.EAS_evt_Attested
    WHERE
      attester = 0x2B5D97CBE50eA9bf809CbE18A2003E4Cb4D283cC
  )
SELECT
  COUNT(DISTINCT recipient) AS "Total Recipients"
FROM
  all_recipients