#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2230,SC2009,SC2206,SC2062,SC2059
# Replace YOUR-USERNAME and YOUR-PING-ID below. You need a Healthcheck.io Account
# In line 14 you can customize the max Seconds which the TIP might differ from the reference TIP

export CARDANO_NODE_SOCKET_PATH=/opt/cardano/cnode/sockets/node0.socket

customCurrentSlotNoString=$(/home/YOUR-USERNAME/.cabal/bin/cardano-cli shelley query tip --mainnet | grep -Po '\"slot\": \K[0-9]+')
customCurrentSlotNo=$(expr $customCurrentSlotNoString + 0)

customRefSlotNo=$(expr $(printf '%(%s)T\n' -1) - 1591566291)
customDiff=$(expr $customRefSlotNo - $customCurrentSlotNo)

if [[ $customDiff -le 60 ]]
then
  echo "all good sending ping"
  curl -m 10 --retry 5 https://hc-ping.com/YOUR-PING-ID
exit
fi
