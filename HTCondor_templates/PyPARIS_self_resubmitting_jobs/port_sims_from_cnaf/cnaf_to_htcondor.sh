#!/usr/bin/env bash

set -euo pipefail

AFS_MIRROR_DIR='/afs/cern.ch/work/e/ekatrali/private/submit_mirror/'
BASE_DIR=$(pwd)

mkdir -p $AFS_MIRROR_DIR

# This script assumes that we are running from inside EOS
for chroma in $(seq -w 0 5 25); do
    echo $chroma
    for job in $(grep -oE "chroma_${chroma}_eldens_[0-9.]+e[+-][0-9]+" cnaf_running_sims); do
        echo "$job"
        job_dir=${BASE_DIR}/chroma_${chroma}/sims/${job}
        # echo $job_dir
        # We must submit from AFS, so we create a mirroring structure there
        JOB_MIRROR_DIR="${AFS_MIRROR_DIR}${job_dir}"
        cp $BASE_DIR/htcondor_template/* ${JOB_MIRROR_DIR}/
        cd ${MIRROR_DIR}
        
        # Improve monitoring by changing name
        mv workflow.dag ${job}.dag
        # Point executable to the correct eos path
        sed -i "\|^EOS_PATH=|c\EOS_PATH=${job_dir}" pyparis_executable.sh
        sed -i "s|^output_destination.*|output_destination      = root://eosproject-e.cern.ch/${job_dir}|" htcondor.sub

        cd - > /dev/null

        # Symlink to the mirror directory from the job directory
        ln -s ${JOB_MIRROR_DIR} ${job_dir}/submission_and_logs

        Create a submission script
        echo "cd ${JOB_MIRROR_DIR} && condor_submit_dag -batch-name ${job} ${job}.dag" >> $BASE_DIR/submit_all.sh'
    done
done