Masses=(250 500 1000 1500 2000 3000)
# Masses=(250)

for mX in ${Masses[*]}
 do

# step1: compile the datacard and get the best fit ws
cd ../../Combine/
cp MX${mX}_MH125.txt Datacard_MX${mX}_MH125.txt
echo "r_singleHiggs rateParam * gghhGGH*_hgg 1" >> Datacard_MX${mX}_MH125.txt
echo "r_singleHiggs rateParam * gghhVH*_hgg 1" >> Datacard_MX${mX}_MH125.txt
echo "r_singleHiggs rateParam * gghhTTH*_hgg 1" >> Datacard_MX${mX}_MH125.txt
echo "r_singleHiggs rateParam * gghhVBF*_hgg 1" >> Datacard_MX${mX}_MH125.txt
echo "nuisance edit freeze r_singleHiggs" >> Datacard_MX${mX}_MH125.txt
python3 RunText2Workspace.py --mode plots --ext _MX${mX}_MH125 --batch local
python3 RunFits.py --inputJson inputjson/inputs_tutorial_bestfit_syst.json --mode plots --ext _MX${mX}_MH125 --mass 125.38 --doObserved --batch condor --queue espresso 
done

# step2: do prefit and postfit plots, throw toys
# #HH plot
cd ../Plots/HH/
for mX in ${Masses[*]}
 do
# # prefit
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/Datacard_MX${mX}_MH125_plots.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_prefit --doResonantBackground
# postfit
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_postfit --loadSnapshot MultiDimFit --doResonantBackground
python3 makeToys.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --ext _MX${mX}_MH125_postfit_withbands --nToys 500 --batch condor --dropResonantBkg --queue longlunch 
python3 makeToys.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --ext _MX${mX}_MH125_postfit_withbands_withSH --nToys 500 --batch condor --queue longlunch 

#step3: collect toys and plot
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_postfit_withbands --loadSnapshot MultiDimFit --doBands --doToyVeto --doResonantBackground
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_postfit_withbands_withSH --loadSnapshot MultiDimFit --doBands --doToyVeto --doResonantBackground


# # plot as combined category
# ####### throw toys wo SH #######
# python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX1000_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX1000_MH125_postfit_withbands --loadSnapshot MultiDimFit --doBands --doToyVeto --doSumCategories --skipIndividualCatPlots --doCatWeights --doResonantBackground
# ####### throw toys with SH #######
# python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX1000_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX1000_MH125_postfit_withbands_withSH --loadSnapshot MultiDimFit --doBands --doToyVeto --doSumCategories --skipIndividualCatPlots --doCatWeights --doResonantBackground

