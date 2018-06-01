# BubbleView: an alternative methodology for eye tracking using discrete mouse clicks
This repository contains the BubbleView click data associated with our [BubbleView TOCHI paper](http://bubbleview.namwkim.org/).

If you use any of this data, please consider citing:
```
@article{kim2017bubbleview,
  title={BubbleView: an interface for crowdsourcing image importance maps and tracking visual attention},
  author={Kim, Nam Wook and Bylinskii, Zoya and Borkin, Michelle A and Gajos, Krzysztof Z and Oliva, Aude and Durand, Fredo and Pfister, Hanspeter},
  journal={ACM Transactions on Computer-Human Interaction (TOCHI)},
  volume={24},
  number={5},
  pages={36},
  year={2017},
  publisher={ACM}
}
```

We include `.m` files to demonstrate how to plot the ground truth fixations and collected BubbleView clicks side-by-side for comparison. The comments in these files indicate which experiments from the paper each of the data files correspond to. 
The names of the files match the dataset and image set (the image sets are in the `targets_[datasetname]` directories). For instance, run `fiwi.m` to plot the side-by-side comparisons of ground truth fixation data (stored in `fiwi_eyetrack.mat`) and BubbleView clicks collected with different parameter settings (`fiwi*x*.mat`). The fixations and clicks will be plotted on top of the images stored in `targets_fiwi`.

In the following table we indicate which experiment from the paper corresponds to which files:

Experiment | Demo file | Data files | Image files
--- | --- | --- | ---
1.1 | massvis.m | massvis_exp1*.mat | targets_massvis
1.2 | massvis.m | massvis_exp2*.mat | targets_massvis
1.3 | massvis.m | massvis_exp3_40x32.mat | targets_massvis
2.1 | osie.m | osie30x30.mat | targets_osie
2.2 | osie.m | osieMM30.mat | targets_osie
3.1 | fiwi.m | fiwi*x*.mat | targets_fiwi
3.2 | fiwi.m | fiwiDx30.mat | targets_fiwi
4   | gdi.m | gdi30x50.mat | targets_gdi
5.1 | salicon.m | salicon*x*.mat | targets_salicons
5.2 | salicon.m | saliconMM*.mat | targets_salicon
addendum | massvis30_addendum.m | massvis_fv_40x32.mat | targets_massvis30

Note that `addendum` corresponds to an extra experiment that was run post-publication, the results of which are written up in [bubbleview-addendum.pdf](https://github.com/cvzoya/bubbleview/blob/master/bubbleview-addendum.pdf).

In the following table we indicate the corresponding ground truth files that BubbleView clicks were compared against (taken from the original datasets):
Experiment | Dataset | Ground truth data file | Type of data
--- | --- | --- | --- 
1 | MASSVIS: information visualizations | massvis_eyetrack.mat | eye fixations
2 | OSIE: natural images | osie-eye-official.mat | eye fixations
2 | OSIE: natural images | osie-amt-official.mat | SALICON mouse movements collected on MTurk
2 | OSIE: natural images | osie-lab-official.mat | SALICON mouse movements collected in-lab
3 | FiWI: static webpages | fiwi_eyetrack.mat | eye fixations
4 | GDI: graphic designs | gdi-official | importance annotations (heatmaps)
5 | SALICON: natural images | salicon_gt.mat | SALICON mouse movements collected on MTurk

For completeness, in the following table we include the BubbleView parameters with which each data file was collected.