#!/bin/bash 

set -uo pipefail

ROOT_URL="root://eosproject-e.cern.ch/"
EOS_PATH="/eos/project/e/ecloud-simulations/ekatrali/test_resubmit/"

xrdcp -f "${ROOT_URL}${EOS_PATH}counter.txt" ./
xrdcp_exit=$?
if [ "$xrdcp_exit" -ne 0 ]; then
   exit "$xrdcp_exit"
fi

./increment.sh ./counter.txt
script_exit=$?

xrdcp -f ./counter.txt "${ROOT_URL}${EOS_PATH}" 
xrdcp_exit=$?

if [ "$xrdcp_exit" -ne 0 ]; then
    echo "xrdcp failed with status $xrdcp_status" >&2
    exit "$xrdcp_exit"
fi

exit "$script_exit"
