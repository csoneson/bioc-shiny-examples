suppressPackageStartupMessages({
    library(airway)
    library(DESeq2)
    library(org.Hs.eg.db)
    library(ideal)
})

## Prepare the data (code from the vignette of the ideal package)
data(airway)
dds_airway <- DESeqDataSet(airway, design = ~ cell + dex)
dds_airway <- DESeq(dds_airway)
res_airway <- results(dds_airway, contrast = c("dex", "trt", "untrt"), alpha = 0.05)
genenames_airway <- mapIds(org.Hs.eg.db, keys = rownames(dds_airway), 
                           column = "SYMBOL", keytype = "ENSEMBL")
annotation_airway <- data.frame(
    gene_id = rownames(dds_airway),
    gene_name = genenames_airway,
    row.names = rownames(dds_airway),
    stringsAsFactors = FALSE
)

## Launch the app
ideal(dds_obj = dds_airway, res_obj = res_airway,
      annotation_obj = annotation_airway)
