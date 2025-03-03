Masses=(250 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1800 2000 3000)

# Masses=(250)

for mX in ${Masses[*]}
 do


#step3: collect toys and plot
python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_postfit_withbands --loadSnapshot MultiDimFit --doBands --doToyVeto --doResonantBackground
# python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX${mX}_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX${mX}_MH125_postfit_withbands_withSH --loadSnapshot MultiDimFit --doBands --doToyVeto --doResonantBackground
done

# # plot as combined category
# ####### throw toys wo SH #######
# python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX1000_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX1000_MH125_postfit_withbands --loadSnapshot MultiDimFit --doBands --doToyVeto --doSumCategories --skipIndividualCatPlots --doCatWeights --doResonantBackground
# ####### throw toys with SH #######
# python3 makeSplusBModelPlot.py --inputWSFile ../../Combine/runFits_MX1000_MH125_plots/higgsCombine_bestfit_syst_obs_r.MultiDimFit.mH125.38.root --cats all --unblind --doZeroes --ext _MX1000_MH125_postfit_withbands_withSH --loadSnapshot MultiDimFit --doBands --doToyVeto --doSumCategories --skipIndividualCatPlots --doCatWeights --doResonantBackground

