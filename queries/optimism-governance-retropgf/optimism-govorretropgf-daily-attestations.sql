SELECT
  DATE_TRUNC('day', evt_block_time) AS "Day",
  COUNT(uid) AS "# Attestations"
FROM
  attestationstation_v1_optimism.EAS_evt_Attested
WHERE
  attester = 0x2a0eb7cae52b68e94ff6ab0bfcf0df8eeeb624be -- Optimism Governance Season 4 Co-Grant Participant
  OR attester = 0x3C7820f2874b665AC7471f84f5cbd6E12871F4cC -- Optimism Governance Season 4 Co-Grant Participant
  OR attester = 0x621477dBA416E12df7FF0d48E14c4D20DC85D7D9 -- RetroPGF Badgeholder | RetroPGF Contribution | RetroPGF project
  OR attester = 0xE4553b743E74dA3424Ac51f8C1E586fd43aE226F -- Retro Funding Application Approval/Rejection | Retro Funding rewards
  OR attester = 0xF6872D315CC2E1AfF6abae5dd814fd54755fE97C -- Retro funding sign up
GROUP BY
  1