#!/bin/bash

func_path=`jq -r '.func_path' config.json`
fsaverage_path='./fsaverage'
outpath=${func_path}/niftis

files=(`find ${func_path} -name *.func.gii`)

for i in ${files[*]}
do
    filename=${i#*/func/}
    filename=${filename%.func.gii}
    hemi=${filename%.*}
    [ ! -f ${outpath}/${filename}.nii.gz ] && mri_surf2vol --o ${outpath}/${filename}.nii.gz --subject ./ --so ${fsaverage_path}/surf/${hemi}.pial ${i}
done

