#!/bin/bash


echo Are you tired of your boring static pharmacophore models? Welcome to the dynamic pharmacophore generator!

echo  " ____                _             _ _          _"
echo  "|  _ \ _   _ _ __ __| | __ _  __ _(_) |    __ _| |__"
echo  "| | | | | | |  __/ _  |/ _  |/ _  | | |   / _  |  _ "
echo  "| |_| | |_| | | | (_| | (_| | (_| | | |__| (_| | |_) |"
echo  "|____/ \__,_|_|  \__,_|\__,_|\__, |_|_____\__,_|_.__ /"
echo  "                             |___/"


for f in *.mae;
do
	base=${f%.mae}
	cd $base
	mkdir aligned
	cd ..
	cp align_backbone.sh $base
	cp ePharm.sh trajectory_write.sh split_pv.sh $base/aligned
	cd $base
	echo Processing $base ...
	sed -i "s/hello/$base/g" align_backbone.sh
	./align_backbone.sh
	echo Aligning trajectory backbone ...
	mv desmond_md_$base-aligned_backbone* aligned
	cd aligned
	sed -i "s/hello/$base/g" trajectory_write.sh
	echo Extracting trajectory ...
	./trajectory_write.sh
	echo Generating e-Pharmacophores ...
	./split_pv.sh
	./ePharm.sh
	cd
done

