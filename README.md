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
1.1 | [massvis.m](massvis.m) | `massvis_exp1*.mat` | [targets_massvis](targets_massvis)
1.2 | [massvis.m](massvis.m) | `massvis_exp2*.mat` | [targets_massvis](targets_massvis)
1.3 | [massvis.m](massvis.m) | [massvis_exp3_40x32.mat](massvis_exp3_40x32.mat) | [targets_massvis](targets_massvis)
2.1 | [osie.m](osie.m) | [osie30x30.mat](osie30x30.mat) | [targets_osie](targets_osie)
2.2 | [osie.m](osie.m) | [osieMM30.mat](osieMM30.mat) | [targets_osie](targets_osie)
3.1 | [fiwi.m](fiwi.m) | `fiwi*x*.mat` | [targets_fiwi](targets_fiwi)
3.2 | [fiwi.m](fiwi.m) | [fiwiDx30.mat](fiwiDx30.mat) | [targets_fiwi](targets_fiwi)
4   | [gdi.m](gdi.m) | [gdi30x50.mat](gdi30x50.mat) | [targets_gdi](targets_gdi)
5.1 | [salicon.m](salicon.m) | `salicon*x*.mat` | [targets_salicon](targets_salicon)
5.2 | [salicon.m](salicon.m) | `saliconMM*.mat` | [targets_salicon](targets_salicon)
addendum | [massvis30_addendum.m](massvis30_addendum.m) | [massvis_fv_40x32.mat](massvis_fv_40x32.mat) | [targets_massvis30](targets_massvis30)

Note that `addendum` corresponds to an extra experiment that was run post-publication, the results of which are written up in [bubbleview-addendum.pdf](https://github.com/cvzoya/bubbleview/blob/master/bubbleview-addendum.pdf).

In the following table we indicate the corresponding ground truth files that BubbleView clicks were compared against (taken from the original datasets):

Experiment | Dataset | Ground truth data file | Type of data
--- | --- | --- | --- 
1 | [MASSVIS](http://massvis.mit.edu/): information visualizations | [massvis_eyetrack.mat](massvis_eyetrack.mat) | eye fixations
2 | [OSIE](http://www-users.cs.umn.edu/~qzhao/predicting.html): natural images | [osie-eye-official.mat](osie-eye-official.mat) | eye fixations
2 | [OSIE](http://www-users.cs.umn.edu/~qzhao/predicting.html): natural images | [osie-amt-official.mat](osie-amt-official.mat) | SALICON mouse movements collected on MTurk
2 | [OSIE](http://www-users.cs.umn.edu/~qzhao/predicting.html): natural images | [osie-lab-official.mat](osie-lab-official.mat) | SALICON mouse movements collected in-lab
3 | [FiWI](http://www-users.cs.umn.edu/~qzhao/webpage_saliency.html): static webpages | [fiwi_eyetrack.mat](fiwi_eyetrack.mat) | eye fixations
4 | [GDI](http://www.dgp.toronto.edu/~donovan/layout/index.html): graphic designs | [gdi-official](gdi-official) | importance annotations (heatmaps)
5 | [SALICON](http://salicon.net/): natural images | [salicon_gt.mat](salicon_gt.mat) | SALICON mouse movements collected on MTurk

For completeness, in the following table we include the BubbleView parameters with which each data file was collected.

Data file | Exp | Task type | Time | Blur sigma | Bubble radius | Mouse modality
--- | --- | --- | --- | --- | --- | ---
[massvis_exp1_40x16.mat](massvis_exp1_40x16.mat) | 1.1 | description | unlimited | 40 pix | 16 pix | mouse clicks
[massvis_exp1_40x24.mat](massvis_exp1_40x24.mat) | 1.1 | description | unlimited | 40 pix | 24 pix | mouse clicks
[massvis_exp1_40x32.mat](massvis_exp1_40x32.mat) | 1.1 | description | unlimited | 40 pix | 32 pix | mouse clicks
[massvis_exp2_40x24.mat](massvis_exp2_40x24.mat) | 1.2 | description | unlimited | 40 pix | 24 pix | mouse clicks
[massvis_exp2_40x32.mat](massvis_exp2_40x32.mat) | 1.2 | description | unlimited | 40 pix | 32 pix | mouse clicks
[massvis_exp2_40x40.mat](massvis_exp2_40x40.mat) | 1.2 | description | unlimited | 40 pix | 40 pix | mouse clicks
[massvis_exp3_40x32.mat](massvis_exp3_40x32.mat) | 1.3 | description | unlimited | 40 pix | 32 pix | mouse clicks
[massvis_fv_40x32.mat](massvis_fv_40x32.mat) | add | free-viewing | 10 sec | 40 pix | 32 pix | mouse clicks
[osie30x30.mat](osie30x30.mat) | 2.1 | free-viewing | 10 sec | 30 pix | 30 pix | mouse clicks
[osieMM30.mat](osieMM30.mat) | 2.2 | free-viewing | 5 sec | 30 pix | 30 pix | mouse movements
[fiwi10x30.mat](fiwi10x30.mat) | 3.1 | free-viewing | 10 sec | 50 pix | 30 pix | mouse clicks
[fiwi10x50.mat](fiwi10x50.mat) | 3.1 | free-viewing | 10 sec | 50 pix | 50 pix | mouse clicks
[fiwi10x70.mat](fiwi10x70.mat) | 3.1 | free-viewing | 10 sec | 50 pix | 70 pix | mouse clicks
[fiwi30x30.mat](fiwi30x30.mat) | 3.1 | free-viewing | 30 sec | 50 pix | 30 pix | mouse clicks
[fiwi30x50.mat](fiwi30x50.mat) | 3.1 | free-viewing | 30 sec | 50 pix | 50 pix | mouse clicks
[fiwi30x70.mat](fiwi30x70.mat) | 3.1 | free-viewing | 30 sec | 50 pix | 70 pix | mouse clicks
[fiwiDx30.mat](fiwiDx30.mat) | 3.2 | description | unlimited | 50 pix | 30 pix | mouse clicks
[gdi30x50.mat](gdi30x50.mat) | 4 | free-viewing | 10 sec | 30 pix | 50 pix | mouse clicks
[salicon30x30.mat](salicon30x30.mat) | 5.1 | free-viewing | 10 sec | 30 pix | 30 pix | mouse clicks
[salicon30x50.mat](salicon30x50.mat) | 5.1 | free-viewing | 10 sec | 30 pix | 50 pix | mouse clicks
[salicon30x70.mat](salicon30x70.mat) | 5.1 | free-viewing | 10 sec | 30 pix | 70 pix | mouse clicks
[salicon50x30.mat](salicon50x30.mat) | 5.1 | free-viewing | 10 sec | 50 pix | 30 pix | mouse clicks
[salicon50x50.mat](salicon50x50.mat) | 5.1 | free-viewing | 10 sec | 50 pix | 50 pix | mouse clicks
[salicon50x70.mat](salicon50x70.mat) | 5.1 | free-viewing | 10 sec | 50 pix | 70 pix | mouse clicks
[salicon70x30.mat](salicon70x30.mat) | 5.1 | free-viewing | 10 sec | 70 pix | 30 pix | mouse clicks
[salicon70x50.mat](salicon70x50.mat) | 5.1 | free-viewing | 10 sec | 70 pix | 50 pix | mouse clicks
[salicon70x70.mat](salicon70x70.mat) | 5.1 | free-viewing | 10 sec | 70 pix | 70 pix | mouse clicks
[saliconMM30.mat](saliconMM30.mat) | 5.2 | free-viewing | 5 sec | 30 pix | 30 pix | mouse movements
[saliconMM50.mat](saliconMM50.mat) | 5.2 | free-viewing | 5 sec | 30 pix | 50 pix | mouse movements
