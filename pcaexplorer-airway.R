suppressPackageStartupMessages({
    library(airway)
    library(DESeq2)
    library(org.Hs.eg.db)
    library(pcaExplorer)
})

## Prepare the data (code from the vignette of the pcaExplorer package)
data(airway)
dds_airway <- DESeqDataSet(airway, design = ~ cell + dex)
rld_airway <- rlogTransformation(dds_airway)
genenames_airway <- mapIds(org.Hs.eg.db, keys = rownames(dds_airway), 
                           column = "SYMBOL", keytype = "ENSEMBL")
annotation_airway <- data.frame(
    gene_id = rownames(dds_airway),
    gene_name = genenames_airway,
    row.names = rownames(dds_airway),
    stringsAsFactors = FALSE
)

## Launch the app
pcaExplorer(dds = dds_airway,
            dst = rld_airway,
            annotation = annotation_airway)
