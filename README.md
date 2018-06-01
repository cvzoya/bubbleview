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
The names of the files match the dataset and image set (the image sets are in the `targets_[datasetname]` directories). For instance, run `fiwi.m` to plot the side-by-side comparisons of ground truth fixation data (stored in `fiwi_eyetrack.mat`) and BubbleView clicks collected with different parameter settings (`fiwi[param1]x[param2].mat`). The fixations and clicks will be plotted on top of the images stored in `targets_fiwi`.

In the following table we indicate which experiment from the paper corresponds to which file:

Experiment | Demo file | Data files | Image files
--- | --- | --- | ---
1.1 | massvis.m | massvis_exp1*.mat | targets_massvis
1.2 | massvis.m | massvis_exp2*.mat | targets_massvis
1.3 | massvis.m | massvis_exp3_40x32.mat | targets_massvis



For completeness, in the following table we include the BubbleView parameters with which each data file was collected.