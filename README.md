# Analysis of NK cells in the multiple Myeloma environment

## Project Overview

This project focuses on understanding the transcriptional and functional diversity of NK cells in human multiple myeloma samples. It employs single-cell RNA sequencing (scRNA-seq) and computational methods to:

1. Identify the composition of the immune populations identified in multiple myeloma and extract NK cells.
2. Map them to some of the current NK cell classification, using methods such as Transfer mapping or evaluation of the overlap in the signatures



---

## Key Analyses

### 1. **Data Preprocessing and Integration**
- **Preprocessing:**
  - Normalized and scaled datasets for FL, BM, and small intestine (SI).
  - Identified variable features using `Seurat`
- **Automatic identification of NK cells and other immune cells:**
  - With SingleR
  - With Azimuth ( a reference based approach). Here we use a Bone Marrow reference.

### 2. **NK Subset Mapping**
- We try to map the NK1, NK2, NKint and NK3 populations using transfer mapping approach:
- We verify subset-specific signatures using DotPlots and FeaturePlots.


### 3. **Visualization**
- PCA and UMAP for dimensionality reduction.
- DotPlots and FeaturePlots for gene expression.
- Heatmaps for regulon activity and pseudotime-ordered gene expression.
- Barplots for proportional comparisons across tissues and clusters.

---

## How to Reproduce the Analysis

1. **Install Dependencies:**
   - R packages: `Seurat`, `Harmony`, `SCENIC`, `ggplot2`, `ComplexHeatmap`, `SingleR`, `Azimuth` etc.
   - Ensure all required scripts and raw data are available in the repository.

2. **Run Scripts:**
   - Follow the order in the `03_Scripts/` directory to reproduce each step of the analysis.

3. **Generate Figures:**
   - Visualization scripts automatically save outputs to the `Figures/` directory.

---

## Acknowledgments

For questions or issues, contact [rebuffet@ciml.univ-mrs.fr]


