#!/bin/bash

cd /afs/cern.ch/user/s/shsong/CMSSW_14_1_0_pre4/src/flashggFinalFit/Combine

eval `scramv1 runtime -sh`

text2workspace.py Datacard_MX800_MH125.txt -o Datacard_MX800_MH125_plots.root -m 125 higgsMassRange=122,128 -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel   --PO "map=.*/gghhwwgg.*:r[1,0,10]"   --PO "map=.*/gghhbbgg.*:r[1,0,10]"   --PO "map=.*/gghhttgg.*:r[1,0,10]"   --PO "map=.*/gghhzzgg.*:r[1,0,10]"   --PO "map=.*/gghhVH*.*:r_singleHiggs[1,0,2]"   --PO "map=.*/gghhTTH*.*:r_singleHiggs[1,0,2]"   --PO "map=.*/gghhGGH*.*:r_singleHiggs[1,0,2]"   --PO "map=.*/gghhVBF*.*:r_singleHiggs[1,0,2]"