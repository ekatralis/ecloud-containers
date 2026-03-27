#!/usr/bin/env bash
set -euxo pipefail

git clone https://github.com/ekatralis/PyECLOUD
git clone https://github.com/ekatralis/PyPIC
git clone https://github.com/ekatralis/PyHEADTAIL
git clone https://github.com/ekatralis/PyPARIS
git clone https://github.com/ekatralis/PyPARIS_sim_class
git clone https://github.com/pycomplete/PyPARIS_CoupledBunch_sim_class

cd PyECLOUD
./setup_pyecloud
rm -rf ./testing
cd ..

cd PyPIC
git switch replace_bool_idx
make
cd ..

cd PyHEADTAIL
git switch fix_installation_scripts
make
rm -rf ./examples
cd ..

cd PyPARIS
git switch prevent_infinite_hangs_in_multiproc
cd ..

cd PyPARIS_sim_class
git switch resubmit_from_container
cd ..