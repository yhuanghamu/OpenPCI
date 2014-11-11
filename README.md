OpenPCI
=======

OpenPcI:A Fast and User Friendly Open Source Software for Grating Based Phase-contrast Imaging Tomography.
OpenPcI
****************************************************************
OpenPcI: A Fast and User Friendly Open Source Software for Grating Based Phase-contrast Imaging Tomography.

This is a software to do 3D Phase contrast Imaging Tomography reconstruction.

At initial phase, only parallel beam geometry will be added. Although parallel beam geometry is simple, 
it is common seen in Synchrontron radiation source application. In the cone-beam geometry, while the 
dimension of object is small compared to the source-to-axis distance, it can be considered as parallel beam 
reconstruction. 

TODO:

1: fan-beam geometry

2: cone-beam geometry


main function flowchart structure.

    Read projection data from  .dat format data, and save as .mat projection data.
    
    	1. Downsample %TODO
    	
        2. FOV: corp projection to save memory usuage.

file description:
project_1.m: Create projection for any image.
Demo:
    PMMA_experiment
        PMMA_recon.m    reconstructed PMMA rod.
        PMMA_Preprocess.m    PMMA data preprocessing.
    CreateProjDemo.m  Create projection from any image.
    SLvsRL.m          Compare Shepp-Logan and Ram-Lak filter
    add_poisson_noise.m TODO. Show the result of different level of poisson noise. 
    phase_contrast_simu.m   phase contrast simulation.
data:
    proj2d.mat  mid-transverse plane  of experiment data.
src:
    set_filter: TODO.
        it should be a function, that can realize different filter.
    set_window: TODO.
        it should be a function, that can realize different window function.
    projPrepare.m   Read projection data from  .dat format data, and save as .mat projection data.
    add_poisson.m   Add poisson noise.
    phasePhantom.m  TODO.
        set physical meaning for this phantom.
    evalMemUse.m Give hint to user about Ram memory usuage
    evalTimeElap.m Elapse time need for data processing and reconstruction. It may displayed in wait-bar.
test:
    test.m  Temp test file.
Appendix:
    firstOrderDiffProjSimu.m

****************************************************************

SoftWare Flowchart Diagram

****************************************************************
Information Extraction.(Parallel implementaion)
    Read Raw interferograms.

    Data Preprocession
        Image rotation and ROI selection.
            set rotation angle.
            set ROI range.
            Rotation axis Calibration.
        Dark field Correction.
            load dark field image.
        Rotation axis Calibration. (final ROI)
    Information extraction.
        Attenuation signal;
        Differential phase signal;
        Drak-field signal.
Reconstruction.        
    Filter-Selection.
    Parallel Beam Reconstruction.

Export Slice images.
    .dcm
    .tif

---------------------------------------------------
Data Structure
raw_info
    num_of_proj
    img_width
    img_height
    data_type
    proj_ang_range
preproc_info    
    rotate_angle
    ROI_xmin
    ROI_xmax
    ROI_ymin
    ROI_ymax
    axis_cali
   
dir_info
    dir_raw
    dir_dark
    dir_refer
    dir_preproc
    dir_extract
data_info
    first_image
    rotate_image
    
Reference:
    http://www.mathworks.cn/help/signal/examples/signal-generation-and-visualization.html
21 huang 60 1200
9 pan  1000 9000
20 gebu  40  800
53 mm  80   4000
3 dan  1500 4500
1 fa   16500 16500







