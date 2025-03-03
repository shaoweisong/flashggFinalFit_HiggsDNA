# Masses=(250 500 1000 1500 2000 3000)
Masses=(250 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1800 2000 3000)

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