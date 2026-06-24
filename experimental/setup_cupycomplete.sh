#!/usr/bin/env bash
# This version is meant for use in HTCondor using resubmission exit codes.
set -euxo pipefail

git clone https://github.com/ekatralis/PyECLOUD
git clone https://github.com/ekatralis/PyPIC
git clone https://github.com/ekatralis/PyHEADTAIL
git clone https://github.com/ekatralis/PyPARIS
git clone https://github.com/ekatralis/PyPARIS_sim_class
git clone https://github.com/pycomplete/PyPARIS_CoupledBunch_sim_class

cd PyECLOUD
git switch CodexPeriment
./setup_pyecloud
rm -rf ./testing
cd ..

cd PyPIC
git switch CodexPeriment
make
cd ..

cd PyHEADTAIL
git switch fix_installation_scripts
make
rm -rf ./examples
cd ..

cd PyPARIS
git switch prevent_infinite_hangs_in_multiproc
# prev commit 8a894ccb08b929ca926a618cbb7a576dc7ee7e47
git checkout 8157a5fbc020f69fd0db84a720f94c2b34157768
cd ..

cd PyPARIS_sim_class
git switch multi_gpu_support
git checkout 2147672157f971a91fa763987da6425a5de47c7e
cd ..