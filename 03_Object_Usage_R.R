#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### Seurat/scCustomize ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# Load Packages -------------------------------------------------------------------------------
library(tidyverse)
library(Seurat)
library(scCustomize)
library(qs)


# Load Main Object ---------------------------------------------------------------------------------
hammond_2019_seurat_v4 <- qread("data_objects/Hammond_et-al-2019_Seurat_Converted_v4.qs")

# Plotting ------------------------------------------------------------------------------------

# Plot with paper color scheme (e.g., Figure 1B)
# Hammond approximate colors are stored in OBJECT@misc$hammond_colors
DimPlot(hammond_2019_seurat_v4, cols = hammond_2019_seurat_v4@misc$hammond_colors, pt.size = 0.25, raster = F, label = T, label.size = 5) + NoLegend()


# Plot clusters highlighted (e.g., Figure 2A)
# cluster 9 is technically 13th cluster in the color string due to clusters 2a, 2b, 2c, 7a, 7b, 7c
Cluster_Highlight_Plot(seurat_object = hammond_2019_seurat_v4, cluster_name = 9, highlight_color = hammond_2019_seurat_v4@misc$hammond_colors[[13]])

# Plot gene expression with same color scheme as paper (e.g., Figure 1E-G)
# Hammond approximate gene expression gradient colors are stored in OBJECT@misc$hammond_gene_colors
hammond_markers <- c("Fcrls", "P2ry12", "Cx3cr1", "Trem2", "C1qa", "Arg1", "Rrm2", "Ube2c", "Cenpa", "Fabp5", "Spp1", "Hmox1", "Ms4a7", "Ccl4", "Ifi27l2a", "F13a1", "H2.Aa", "Ccr2", "Lyve1", "Mgl2")

FeaturePlot(object = hammond_2019_seurat_v4, features = hammond_markers, ncol = 5, raster = F, order = T, cols = hammond_2019_seurat_v4@misc$hammond_gene_colors)

# Meta Data -----------------------------------------------------------------------------------

# Create sample level meta data.frame
hammond_meta <- hammond_2019_seurat_v4@meta.data %>%
  group_by(GEO_ID_Number) %>%
  slice(1) %>%
  select(-c(orig.ident, nFeature_RNA, nCount_RNA, tsne_1, tsne_2, ICA_Cluster, Paper_Cluster))



#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### SingleCellExperiment ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

