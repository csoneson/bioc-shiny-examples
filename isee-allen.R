suppressPackageStartupMessages({
    library(iSEE)
    library(iSEEu)
    library(scRNAseq)
    library(scater)
    library(shiny)
})

## Prepare the data (code from the example of the iSEE function)
sce <- ReprocessedAllenData(assays = "tophat_counts")
sce <- logNormCounts(sce, exprs_values = "tophat_counts")
sce <- runPCA(sce, ncomponents = 4)
sce <- runTSNE(sce)
rowData(sce)$ave_count <- rowMeans(assay(sce, "tophat_counts"))
rowData(sce)$n_cells <- rowSums(assay(sce, "tophat_counts") > 0)

## Launch the app
app <- iSEE(sce)
shiny::runApp(app)
