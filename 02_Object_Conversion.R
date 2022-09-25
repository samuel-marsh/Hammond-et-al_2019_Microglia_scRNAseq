#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### SingleCellExperiment ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Load Packages & Data ------------------------------------------------------------------------
# R 4.1.2
library(Seurat) #v4.1.0
library(SingleCellExperiment) #v1.16.0
library(qs) #v0.25.3

hammond_main <- qread("~/Dropbox (BCH)/Hammond_2019_Immunity/Seurat_Objects/Hammond_et-al-2019_Seurat_Converted_v4.qs")

hammond_aged <- qread("~/Dropbox (BCH)/Hammond_2019_Immunity/Seurat_Objects/Hammond_et-al-2019_Aged_Seurat_Converted_v4.qs")

# Convert & Save ------------------------------------------------------------------------------
# Convert
hammond_main_sce <- as.SingleCellExperiment(x = hammond_main)
hammond_aged_sce <- as.SingleCellExperiment(x = hammond_aged)

# Save
qsave(x = hammond_main_sce, file = "Hammond_et-al-2019_SCE_Converted_v1-16-0.qs")
qsave(x = hammond_aged_sce, file = "Hammond_et-al-2019_Aged_SCE_Converted_v1-16-0.qs")



#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### anndata ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Load Packages & Data ------------------------------------------------------------------------
# R 4.1.2
library(Seurat) #v4.1.0
library(SeuratDisk) #v0.0.0.9020
library(qs) #v0.25.3

hammond_main <- qread("~/Dropbox (BCH)/Hammond_2019_Immunity/Seurat_Objects/Hammond_et-al-2019_Seurat_Converted_v4.qs")

hammond_aged <- qread("~/Dropbox (BCH)/Hammond_2019_Immunity/Seurat_Objects/Hammond_et-al-2019_Aged_Seurat_Converted_v4.qs")


# Convert Objects -----------------------------------------------------------------------------
# Main Object
SaveH5Seurat(object = hammond_main, filename = "Hammond_et-al-2019_anndata_Converted_v0-8-0.h5Seurat", verbose = T)
Convert(source = "Hammond_et-al-2019_anndata_Converted_v0-8-0.h5Seurat", dest = "h5ad", verbose = T)

# Aged Object
SaveH5Seurat(object = hammond_aged, filename = "Hammond_et-al-2019_Aged_anndata_Converted_v0-8-0.h5Seurat", verbose = T)
Convert(source = "Hammond_et-al-2019_Aged_anndata_Converted_v0-8-0.h5Seurat", dest = "h5ad", verbose = T)
