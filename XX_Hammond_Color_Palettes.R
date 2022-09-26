#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### Color Palettes in R ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Color Palettes in Seurat -----------------------------------------------------------------
# Incorporated in Seurat objects
     # When using Seurat Objects the color palettes are already stored in the @misc slots of Seurat Objects
     # These palettes can either be called directly or by pulling them out to their own variable

# Call directly
DimPlot_scCustom(seurat_object = hammond_all_samples, colors_use = hammond_all_samples@misc$hammond_colors)

# Pull out and provide separate variable
all_sample_colors <- hammond_all_samples@misc$hammond_colors

DimPlot_scCustom(seurat_object = hammond_all_samples, colors_use = all_sample_colors)

# Color Palettes in Seurat or SCE or Other ----------------------------------------------------
# There is also a qs object stored in this repo which contains all color palettes for easy loading
library(qs)
hammond_palettes <- qread("Hammond_et-al-2019_Color_Palettes.qs")


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### Color Palettes in Python ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Python Palette Vectors ----------------------------------------------------------------------
# For use in python we provide palette vectors that can be copied and pasted into local script.
hammond_all_sample_idents = ["#00ACFF", "#FFD6FF", "#FFACFE", "#FF7EFF", "#009B23", "#001C96", "#00F1A5", "#C83FF4", "#C0C0C0", "#D5D5D5", "#A8A8A8", "#FFAE00", "#FF0000", "#000000"]

hammond_young_vs_old_idents = ["#CCCCCC", "#B3B3B3", "#0000CD", "#00CDCD", "#000000"]

hammond_expression_colors = ["#FBFBCD", "#FF0000"]
