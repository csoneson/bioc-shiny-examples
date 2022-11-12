suppressPackageStartupMessages({
    library(proDA)
    library(MatrixQCvis)
    library(matrixStats)
})

## Generate synthetic data (code from the vignette of the MatrixQCvis package, 
## with minor modifications)
n_samples <- 40
n_feat <- 1000
data <- generate_synthetic_data(n_feat, n_conditions = n_samples / 10, 
                                n_replicates = n_samples / 4, frac_changed = 0.1)
a <- data$Y
colnames(a) <- gsub(colnames(a), pattern = "Condition", replacement = "Sample")
set.seed(1)
a[, 1:5] <- a[, 1:5] + rnorm(5000, mean = 1.0, sd = 0.5)
a[, 11:15] <- a[, 11:15] + rnorm(5000, mean = 0.8, sd = 0.5)
a[, 21:25] <- a[, 21:25] + rnorm(5000, mean = 1.2, sd = 0.5)
a[, 31:35] <- a[, 31:35] + rnorm(5000, mean = 0.7, sd = 0.5)
type_sample <- gsub(data$groups, pattern = "Condition", replacement = "Type")
trmt_sample <- paste(
    c(rep("1", 10), rep("2", 10), rep("3", 10), rep("4", 10)),
    c(rep("A", 5), rep("B", 5)), sep = "_")
cD <- data.frame(name = colnames(a), type = type_sample, 
                 treatment = trmt_sample)
rD <- data.frame(spectra = rownames(a))
se <- SummarizedExperiment(assay = a, rowData = rD, colData = cD)
se <- se[!is.na(matrixStats::rowVars(assay(se), na.rm = TRUE)), ]

## Launch the app
qc <- shinyQC(se)
