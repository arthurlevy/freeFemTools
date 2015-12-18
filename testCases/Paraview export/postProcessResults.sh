#!/bin/sh

resultfile="resultsWrapper.pvd"

cd Results
#### clean folder
rm results_*.vtu
rm $resultfile

####  finds last time iter
#get last line
string=`tail -n 1 timeHistory.txt`
#get first integer in this line
lastiter=`echo $string |cut -d" " -f-1`


#### converts vtk to vtu
echo "convert vtk to vtu"
#temporary paraview script
PVSCRIPTFILE=`mktemp -t bibXXXXXXX.pvs`
echo 'from paraview import simple' >> $PVSCRIPTFILE

for (( i=0; i<=$lastiter; i++ ))
do
echo 'reader = simple.OpenDataFile("results'$i'.vtk")
writer = simple.CreateWriter("results_'$i'.vtu",reader)
writer.UpdatePipeline()' >> $PVSCRIPTFILE
done
#send these command to paraview python
cat $PVSCRIPTFILE | /Applications/paraview.app/Contents/bin/pvpython

rm $PVSCRIPTFILE

#### create paraview vtk collection
echo "create pvd wrapper"

#intro
echo '<?xml version="1.0"?>
<VTKFile type="Collection" version="0.1" byte_order="LittleEndian">
  <Collection>' >> $resultfile

#main
for (( i=0; i<=$lastiter; i++ ))
do
#find line in time history
time=`grep ^\$i timeHistory.txt -m1 |cut -d" " -f2-`

echo '    <DataSet timestep="'$time'" group="" part="0" file="results_'$i'.vtu"/>' >> $resultfile
done

#close file
echo '  </Collection>
</VTKFile> ' >> $resultfile