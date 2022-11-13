suppressPackageStartupMessages({
    library(iCOBRA)
})

## Get example data
data(cobradata_example)
cobradata_example <- calculate_adjp(cobradata_example)

## Launch app
COBRAapp(cobradata_example)
