Masses=(250 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1800 2000 3000)

# step2: do prefit and postfit plots, throw toys
#HH plot
for mX in ${Masses[*]}
 do
# # prefit
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/Datacard_MX${mX}_MH125_plots.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_prefit --doResonantBackground
# # postfit
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_postfit --loadSnapshot MultiDimFit --doResonantBackground
# when plotting the bands, only use the continuum background
python3 makeToys.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --ext _MX${mX}_MH125_postfit_withbands --nToys 500 --batch condor --dropResonantBkg --queue workday 

done