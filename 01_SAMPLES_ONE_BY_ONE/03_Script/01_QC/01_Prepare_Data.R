## @knitr Prepare_Data

#Run a Full diagnostic for each sample
#Load the list of Seurat unfiltered objects

#Create the data list
LIST_RDS_UNFILTERED =  readRDS(file.path(PATH_EXPERIMENT_OUTPUT, "00_Create_List_Objects/List_Seurat_Objects_Before_QC.rds"))
LIST_NAMES_SAMPLES = names(LIST_RDS_UNFILTERED)

METADATA_TABLE = read.xlsx(file.path(PATH_EXPERIMENT_REFERENCE, "/metadata_samples/scRNAseq_MM_info_NK.xlsx"))
#Keep Only Metadata of interest
METADATA_TABLE= METADATA_TABLE[,c("Cell.RS#", "Live.count", "%.Viable", "cells.per.uL.for.loading", "Estimated.Number.of.Cells", "Mean.Reads.per.Cell" ,  "Median.Genes.per.Cell" ,   "%.recovery"    ,  "X1"  ,  "X2" , "Healthy", "X20" )]

#Change some colnames
names(METADATA_TABLE)[names(METADATA_TABLE) == 'X1'] <- 'CellType'
names(METADATA_TABLE)[names(METADATA_TABLE) == 'X2'] <- 'Tissue'
names(METADATA_TABLE)[names(METADATA_TABLE) == 'X20'] <- 'Patient.Status'
names(METADATA_TABLE)[names(METADATA_TABLE) == 'Cell.RS#'] <- 'Cell.RS'
names(METADATA_TABLE)[names(METADATA_TABLE) == '%.Viable'] <- 'pct.Viable'
names(METADATA_TABLE)[names(METADATA_TABLE) == '%.recovery'] <- 'pct.recovery'

#Replace all "." by "_"
names(METADATA_TABLE) =  gsub("\\.", "_", names(METADATA_TABLE))


LIST_RDS_UNFILTERED_WITH_METADATA = LIST_RDS_UNFILTERED

# Add metadata to all individual dataframes
for (cell_id in LIST_NAMES_SAMPLES) {
  
  #Add pct ribo and pct mito
  LIST_RDS_UNFILTERED_WITH_METADATA[[cell_id]][["percent.mito"]] <- PercentageFeatureSet(LIST_RDS_UNFILTERED_WITH_METADATA[[cell_id]], pattern = "^MT-")
  LIST_RDS_UNFILTERED_WITH_METADATA[[cell_id]][['percent.ribo']] <- PercentageFeatureSet(object = LIST_RDS_UNFILTERED_WITH_METADATA[[cell_id]], pattern = "^RP[SL][[:digit:]]")
  
  for (meta_data_to_add in colnames(METADATA_TABLE)){
    LIST_RDS_UNFILTERED_WITH_METADATA[[cell_id]]  <- AddMetaData(
      object = LIST_RDS_UNFILTERED_WITH_METADATA[[cell_id]] ,
      metadata = METADATA_TABLE[METADATA_TABLE$Cell_RS == cell_id,meta_data_to_add],
      col.name = meta_data_to_add
    )
  }
}



#Save the list of Seurat objects with Metadata if it does not already exist
if(file.exists(file.path(PATH_EXPERIMENT_OUTPUT, "00_Create_List_Objects/List_Seurat_Objects_Before_QC_With_Metadata.rds")) == FALSE){
  saveRDS(LIST_RDS_UNFILTERED_WITH_METADATA , file.path(PATH_EXPERIMENT_OUTPUT, "00_Create_List_Objects/List_Seurat_Objects_Before_QC_With_Metadata.rds"))
}


