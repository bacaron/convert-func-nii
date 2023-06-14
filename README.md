# convert files from func gii to nifti

First thing to do is update the config.json to point directly to the file path where your func gii files are stored.

Once done, then:

1. if singularity installed:
```
. main
```

2. If singularity NOT installed, but freesurfer installed:
```
. convert-func-to-nii.sh
```

3. if neither are installed, ask Brad and he'll convert for you (or you can install either singularity/apptainer or freesurfer, whichever is easier)
