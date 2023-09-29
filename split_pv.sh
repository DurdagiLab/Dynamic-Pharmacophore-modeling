#!/bin/bash

for z in structure_*.maegz;do
        st=${z%.maegz}
	/opt/schrodinger2018-4/run pv_convert.py -mode split_receptor $st.maegz -o structure-$st.maegz
        /opt/schrodinger2018-4/run pv_convert.py -mode split_ligand $st.maegz -o ligand-$st.maegz
done


for i in *.maegz;do
        name=${i%.maegz}
        /opt/schrodinger2018-4/utilities/generate_glide_grids -rec_file $name.maegz -lig_asl "res.ptype UNK" -j $name -write_in
done


