# Load Packages -----------------------------------------------------------
library(tidyverse)
library(Seurat)
library(Matrix)
library(scCustomize)
library(beepr)
library(qs)


# Load GEO Data & Sample Prefixes Data -----------------------------------------------
     # *********BEFORE LOADING DATA BE SURE TO REMOVE NON-OBJECT SAMPLES*********
     # ***Remove 6 samples from GEO record directory before running downstream code ***
     # Remove 3 no percoll samples
     # Remove 3 percoll samples

# Path to directory containing remaining 41 GEO records
hammond_data_dir <- "PATH/GSE121654_RAW/Paper_Samples/"

# Read in all dge files from GEO record
hammond_full <- Read_GEO_Delim(data_dir = hammond_data_dir, file_suffix = ".dge.txt.gz", barcode_suffix_period = TRUE)

beep(sound = 2)

# Pull Barcode Prefixes and Merge Matrices --------------------------------
# Pull barcode prefix file names from meta data file
hammond_barcode_prefixes <- read.csv("PATH/Hammond-et-al-2019_Meta-Data_FINAL2.csv", row.names = 1, stringsAsFactors = F)
hammond_barcode_prefixes <- unique(hammond_barcode_prefixes$Sample_Barcode_Prefix)


# Merge into single matrix and rename cell barcodes
hammond_comb <- Merge_Sparse_Data_All(matrix_list = hammond_full, add_cell_ids = hammond_barcode_prefixes)

beep(sound = 2)

# Create & Subset Seurat --------------------------------------------------
# Create Seurat Object
hammond_seurat <- CreateSeuratObject(counts = hammond_comb, project = "Hammond et al., 2019", names.delim = NULL, names.field = NULL)
# View(hammond_seurat@meta.data)

beep(sound = 2)

# Read in meta data and move barcodes to column
hammond_meta <- read.csv("PATH/Hammond-et-al-2019_Meta-Data_FINAL2.csv", row.names = 1)

# Pull cell names of final object from meta data
hammond_final_cells <- hammond_meta %>%
  rownames_to_column(var = "barcodes") %>%
  pull(barcodes)

# Subset object to only contain cells in meta data
hammond_final_object <- subset(hammond_seurat, cells = hammond_final_cells)

# Check number of cells correct.  Should be 76,149
# If number of cells not equal please let me know.
ncol(hammond_final_object)

beep(sound = 2)

# Add Meta Data to Seurat Object ------------------------------------------
# move barcodes to column
hammond_meta_barcodes_column <- hammond_meta %>%
  rownames_to_column("barcodes")

# Pull Seurat@meta.data slot and move barcodes to column
seurat_meta <- hammond_final_object@meta.data
seurat_meta <- seurat_meta %>%
  rownames_to_column("barcodes")

# Join dataframes (should join by "barcodes" by default)
joined_meta <- inner_join(seurat_meta, hammond_meta_barcodes_column)

# move barcodes back to rownames and remove redundant meta data columns
joined_meta <- joined_meta %>%
  column_to_rownames("barcodes") %>%
  select(-c("orig.ident", "nCount_RNA", "nFeature_RNA"))

# Add back to Seurat
hammond_final_object <- AddMetaData(object = hammond_final_object, metadata = joined_meta)
# View(hammond_final_object@meta.data)


# Add tSNE Dim Reduc to Object --------------------------------------------
# pull tsne coordinates
tSNE_coordinates <- hammond_final_object@meta.data %>%
  rownames_to_column("barcodes") %>%
  select(barcodes, tsne_1, tsne_2) %>%
  column_to_rownames("barcodes")

# format as matrix
tSNE_coordinates_mat <- as(tSNE_coordinates, "matrix")

# Create DimReduc
hammond_final_object[['tsne']] <- CreateDimReducObject(embeddings = tSNE_coordinates_mat, key = "tSNE_", global = T, assay = "RNA")

# Add Idents to Object & Normalize Data -----------------------------------
Idents(hammond_final_object) <- "Paper_Cluster"

# Normalize Dats to allow for plotting of gene expression
hammond_final_object <- NormalizeData(object = hammond_final_object)

beep(sound = 5)


# Save Object -------------------------------------------------------------
qsave(x = hammond_final_object, file = "Hammond_et-al-2019_Seurat_Converted_v4.qs")



#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#################### Young vs. Old Object ####################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Create Aged Object --------------------------------------------------------------------------
# Read Aged Meta Data
hammond_aged_meta <- qread("PATH/hammond_aged_meta.qs")

# subset all cells by aged meta data
hammond_aged_object <- subset(hammond_seurat, cells = rownames(hammond_aged_meta))


# Add Aged Meta Data to Object ----------------------------------------------------------------
hammond_aged_meta_barcodes_column <- hammond_aged_meta %>%
  rownames_to_column("barcodes")

# Pull Seurat@meta.data slot and move barcodes to column
seurat_aged_meta <- hammond_aged_object@meta.data
seurat_aged_meta <- seurat_aged_meta %>%
  rownames_to_column("barcodes")

# Join dataframes (should join by "barcodes" by default)
joined_meta_aged <- inner_join(seurat_aged_meta, hammond_aged_meta_barcodes_column)

# move barcodes back to rownames and remove redundant meta data columns
joined_meta_aged <- joined_meta_aged %>%
  column_to_rownames("barcodes") %>%
  select(-c("orig.ident", "nCount_RNA", "nFeature_RNA"))

# Add back to Seurat
hammond_final_aged_object <- AddMetaData(object = hammond_aged_object, metadata = joined_meta_aged)

hammond_final_aged_object@meta.data$orig.ident <- hammond_final_aged_object@meta.data$All_names

hammond_final_aged_object@meta.data <- hammond_final_aged_object@meta.data %>%
  select(-All_names)

# Add Aged tSNE Dim Reduc to Object --------------------------------------------
# pull tsne coordinates
tSNE_coordinates_aged <- hammond_final_aged_object@meta.data %>%
  rownames_to_column("barcodes") %>%
  select(barcodes, tsne_1, tsne_2) %>%
  column_to_rownames("barcodes")

# format as matrix
tSNE_coordinates_mat_aged <- as(tSNE_coordinates, "matrix")

# Create DimReduc
hammond_final_aged_object[['tsne']] <- CreateDimReducObject(embeddings = tSNE_coordinates_mat_aged, key = "tSNE_", global = T, assay = "RNA")

# Add Idents to Object & Normalize Data -----------------------------------
Idents(hammond_final_aged_object) <- "cluster_name"

# Normalize Data to allow for plotting of gene expression
hammond_final_aged_object <- NormalizeData(object = hammond_final_aged_object)

beep(sound = 5)


# Save Object -------------------------------------------------------------
qsave(x = hammond_final_aged_object, file = "Hammond_et-al-2019_Aged_Seurat_Converted_v4.qs")
