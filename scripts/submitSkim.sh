#!/bin/bash
DATE=`date +%Y-%m-%d`
if [ "$1" == "" ]; then
    NAME="$DATE"_Skim_MuMuTauTau_80X_v1
else
    NAME="$1"
fi
NAME="2018-07-09_Skim_MuTau_80X_v1"
while read sample; do
    echo $sample
    if [[ $sample == *"Run2016H"* ]]; then
        #submit_job.py crabSubmit --filesPerJob 4 --numCores 4 --maxMemoryMB 8000 --samples $sample --publish --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=4 runH=1
        submit_job.py crabSubmit --filesPerJob 2 --samples $sample --publish --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=1 runH=1
    else
        #submit_job.py crabSubmit --filesPerJob 4 --numCores 4 --maxMemoryMB 8000 --samples $sample --publish --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=4 runH=0
        submit_job.py crabSubmit --filesPerJob 2 --samples $sample --publish --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=1 runH=0
    fi
done <DevTools/Ntuplizer/data/datasetList_Data_AOD.txt
while read sample; do
    echo $sample
    #submit_job.py crabSubmit --filesPerJob 4 --numCores 4 --maxMemoryMB 8000 --samples $sample --publish "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=1 crab=1 numThreads=4
    submit_job.py crabSubmit --filesPerJob 2 --samples $sample --publish "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=1 crab=1 numThreads=1
done <DevTools/Ntuplizer/data/datasetList_MC_AOD.txt
