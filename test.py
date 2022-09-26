#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import anndata as ad #v0.8.0
import scanpy as sc #v1.9.1


# In[ ]:


sc.set_figure_params(dpi=100, color_map = 'plasma_r')
sc.settings.verbosity = 1
sc.logging.print_header()


# In[ ]:


hammond_all_samples = sc.read_h5ad("Hammond_et-al-2019_anndata_Converted_v0-8-0.h5ad")
hammond_young_vs_old = sc.read_h5ad("Hammond_et-al-2019_Aged_anndata_Converted_v0-8-0.h5ad")


# In[ ]:


hammond_all_sample_idents = ["#00ACFF", "#FFD6FF", "#FFACFE", "#FF7EFF", "#009B23", "#001C96", "#00F1A5", "#C83FF4", "#C0C0C0", "#D5D5D5", "#A8A8A8", "#FFAE00", "#FF0000", "#000000"]

hammond_young_vs_old_idents = ["#CCCCCC", "#B3B3B3", "#0000CD", "#00CDCD", "#000000"]


# In[ ]:


# NOTE: The label for cluster 8 (orange) is misplaced due to cluster split on tSNE
sc.pl.tsne(hammond_all_samples, color='Paper_Cluster', add_outline=False, legend_loc='on data',
               legend_fontsize=12, legend_fontoutline=2,frameon=False,
               title='All Samples', palette = hammond_all_sample_idents)



# In[ ]:


sc.pl.tsne(hammond_young_vs_old, color='cluster_name', add_outline=False, legend_loc='on data',
               legend_fontsize=12, legend_fontoutline=2,frameon=False,
               title='Young vs. Old', palette = hammond_young_vs_old_idents)


# In[ ]:


sc.pl.tsne(hammond_all_samples, color=["Fcrls", "P2ry12", "Cx3cr1", "Trem2", "C1qa",
                                       "Arg1", "Rrm2", "Ube2c", "Cenpa", "Fabp5", "Spp1",
                                       "Hmox1", "Ms4a7", "Ccl4", "Ifi27l2a", "F13a1", "H2.Aa",
                                       "Ccr2", "Lyve1", "Mgl2"],
           add_outline=False, legend_fontsize=12, legend_fontoutline=2,frameon=False)


# In[ ]:




