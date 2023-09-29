#!/bin/bash

frame_count=1000
cpu=30
z=0
x=$cpu
while [ $x -le $frame_count ]; do
	for i in $( seq $z $x ) ;do
		input_file="structure_$i-gridgen.in"
		echo $i
		echo $input_file
		line=$(grep "GRID_CENTER" "$input_file")
		data=$(echo "$line" | awk '{for (i=2; i<=NF; i++) printf $i " "}')
		GRID_DATA="$data"
		echo "$GRID_DATA"
		/opt/schrodinger2018-4/utilities/epharmacophores -rec_file structure_$i-out_recep.maegz -lig_file structure_$i-out_lig.maegz "-site_center= $GRID_DATA" -in_place -j Hypothesis_$i -fd "" -f 7 -site_dist 2.0 -pair_dist 4.0 -xvol -scale 0.5 -buff 2.0 -limit 5.0 -HOST "localhost:30"
	done
	z=$((x+1))
	x=$((x+cpu))
	sleep 3m


done
