# Hammond-et-al_2019_Microglia_scRNAseq

#### Analysis Objects to Download for:  
### [**Single-Cell RNA Sequencing of Microglia throughout the Mouse Lifespan and in the Injured Brain Reveals Complex Cell-State Changes (*Immunity*)**](https://doi.org/10.1016/j.immuni.2018.11.004)  
Timothy R. Hammond<sup>1,\* </sup>, Connor Dufort, Lasse Dissing-Olesen, Stefanie Giera, Adam Young, Alec Wysoker, Alec J. Walker, Frederick Gergits, Michael Segel, James Nemesh, Samuel E. Marsh<sup>2,\# </sup>, Arpiar Saunders,, Evan Macosko, Florent Ginhoux, Jinmiao Chen, Robin J.M. Franklin, Xianhua Piao, Steven A. McCarroll, and Beth Stevens.

<sup><sup>1</sup>Performed analysis</sup>   
<sup><sup>2</sup>Created Objects/Repo</sup>  
<sup><sup>\*</sup>Analysis Contact (contact: timothy.hammond@sanofi.com)</sup>  
<sup><sup>\*</sup>Repo/Object Contact (contact: samuel.marsh@childrens.harvard.edu)</sup>  

##  About the Datasets  
Analysis was perfomred in paper as described without use of bespoke object/file format.  However, to facilitate easier use of data in analyzed/annotated form we have created pseudo-objects.  
The objects contain:
- Raw & Normalized expression data.
- tSNE coordinates of analysis shown in paper.
- Cell level meta data (age, sex, batch, etc)

They do not contain:
- Variable genes
- ICA factor loadings
- Scaled Data (removed to keep object size small, can be added using package functions)




### Downloading Datasets  
#### Download via browser  
Datasets can be downloaded through browser using the following links:  

| Dataset | Figures | Type | Link |
| :-----: | :-----: | :------: | :------------: |
| All Samples | Figure 1 | [Seurat](https://github.com/satijalab/seurat/wiki/Seurat) | [All Sample Seurat](https://figshare.com/ndownloader/files/37590094) |
| All Samples | Figure 1 | [SCE](https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html) | [All Sample SCE](https://figshare.com/ndownloader/files/37590553) |
| All Samples | Figure 1 | [anndata](https://anndata.readthedocs.io/en/latest/) | [All Sample SCE](https://figshare.com/ndownloader/files/37590442) |
| Young vs. Old | Figure 5 | [Seurat](https://github.com/satijalab/seurat/wiki/Seurat) | [Young vs. Old Seurat](https://figshare.com/ndownloader/files/37590091) |
| Young vs. Old | Figure 5 | [SCE](https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html) | [Young vs. Old SCE](https://figshare.com/ndownloader/files/37590430) |
| Young vs. Old | Figure 5 | [anndata](https://anndata.readthedocs.io/en/latest/) | [Young vs. Old anndata](https://figshare.com/ndownloader/files/37590544) |

#### Download via command line
**Seurat Objects**
```
# Download both objects in .zip
wget -O hammond_seurat.zip https://figshare.com/ndownloader/articles/21201463/versions/2

# Download All Samples Object
wget -O Hammond_et-al-2019_Seurat_Converted_v4.qs https://figshare.com/ndownloader/files/37590094

# Download Young vs. Old Samples Object
wget -O Hammond_et-al-2019_Aged_Seurat_Converted_v4.qs https://figshare.com/ndownloader/files/37590091
```

**SCE Objects**
```
# Download both objects in .zip
wget -O hammond_SCE.zip https://figshare.com/ndownloader/articles/21201472/versions/1

# Download All Samples Object
wget -O Hammond_et-al-2019_SCE_Converted_v1-16-0.qs https://figshare.com/ndownloader/files/37590442

# Download Young vs. Old Samples Object
wget -O Hammond_et-al-2019_Aged_SCE_Converted_v1-16-0.qs https://figshare.com/ndownloader/files/37590430
```

**anndata Objects**
```
# Download both objects in .zip
wget -O hammond_anndata.zip https://figshare.com/ndownloader/articles/21201616/versions/1

# Download All Samples Object
wget -O Hammond_et-al-2019_anndata_Converted_v0-8-0.h5ad https://figshare.com/ndownloader/files/37590553

# Download Young vs. Old Samples Object
wget -O Hammond_et-al-2019_Aged_anndata_Converted_v0-8-0.h5ad https://figshare.com/ndownloader/files/37590544
```

### Using Datasets  
See scripts for basic usage information and some recreation of paper figures.
