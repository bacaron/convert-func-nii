#!/bin/bash

func_path=`jq -r '.func_path' config.json`
fsaverage_path='./fsaverage'
outpath=${func_path}/niftis
[ ! -d ${outpath} ] && mkdir $outpath

files=(`find ${func_path} -name *.func.gii`)

export SUBJECTS_DIR=./

for i in ${files[*]}
do
    filename=${i#*/func/}
    filename=${filename%.func.gii}
    hemi=${filename%%.*}
    echo $filename $hemi
    [ ! -f ${outpath}/${filename}.nii.gz ] && mri_surf2vol --o ${outpath}/${filename}.nii.gz --subject $fsaverage_path --so ${fsaverage_path}/surf/${hemi}.pial ${i} && mri_vol2vol --mov ${outpath}/${filename}.nii.gz --targ MNI152_T1_1mm.nii.gz --regheader --interp nearest --o ${outpath}/${filename}.nii.gz
done

