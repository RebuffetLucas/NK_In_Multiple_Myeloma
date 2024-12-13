#Create a list of Seurat Objects from the Cell ranger Outputs

#Set the data path
dataPath=PATH_CELLRANGERFILE

#Extract file names
List_Names_Files = dir(PATH_CELLRANGERFILE)
List_Rds = list()

#Build the list of Seurat Objects
for (NAME_FILE in  List_Names_Files){
NK.data <- Read10X(file.path(dataPath, NAME_FILE , "/outs/filtered_feature_bc_matrix"))
myObjectSeurat <- CreateSeuratObject(counts = NK.data, min.cells = MIN.CELLS, min.features = MIN.FEATURES, 
                                     project = NAME_FILE)
List_Rds = list.append (List_Rds , myObjectSeurat )
}


#Name the list
names(List_Rds) = List_Names_Files

#Save the list of Seurat Objects
saveRDS(List_Rds , file.path(PATH_ANALYSIS_OUTPUT, "List_Seurat_Objects_Before_QC.rds"))
