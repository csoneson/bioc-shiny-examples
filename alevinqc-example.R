suppressPackageStartupMessages({
    library(alevinQC)
})

## Set path to example data 
baseDir <- system.file("extdata/alevin_example_v0.14", package = "alevinQC")

## Launch app
alevinQCShiny(baseDir = baseDir, sampleId = "testSample")
