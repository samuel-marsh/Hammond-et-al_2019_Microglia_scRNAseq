#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### SingleCellExperiment ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Load Packages & Data ------------------------------------------------------------------------
# R 4.1.2
library(Seurat) #v4.1.0
library(SingleCellExperiment) #v1.16.0
library(qs) #v0.25.3

hammond_main <- qread("data_objects/Hammond_et-al-2019_Seurat_Converted_v4.qs")

hammond_aged <- qread("data_objects/Hammond_et-al-2019_Aged_Seurat_Converted_v4.qs")

# Convert & Save ------------------------------------------------------------------------------
# Convert
hammond_main_sce <- as.SingleCellExperiment(x = hammond_main)
hammond_aged_sce <- as.SingleCellExperiment(x = hammond_aged)

# Save
qsave(x = hammond_main_sce, file = "data_objects/Hammond_et-al-2019_SCE_Converted_v1-16-0.qs")
qsave(x = hammond_aged_sce, file = "data_objects/Hammond_et-al-2019_Aged_SCE_Converted_v1-16-0.qs")



#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### anndata ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Load Packages & Data ------------------------------------------------------------------------
# R 4.1.2
library(Seurat) #v4.1.0
library(sceasy) #v0.0.7
library(qs) #v0.25.3

hammond_main <- qread("data_objects/Hammond_et-al-2019_Seurat_Converted_v4.qs")

hammond_aged <- qread("data_objects/Hammond_et-al-2019_Aged_Seurat_Converted_v4.qs")

# Convert Objects -----------------------------------------------------------------------------
# Main Object

convertFormat(obj = hammond_main, from = "seurat", to = "anndata", outFile = "data_objects/Hammond_et-al-2019_anndata_Converted_v0-8-0.h5ad")

# Aged Object
convertFormat(obj = hammond_aged, from = "seurat", to = "anndata", outFile = "data_objects/Hammond_et-al-2019_Aged_anndata_Converted_v0-8-0.h5ad")
