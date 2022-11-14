library("GeneTonic")

# gtl_mydataset <- GeneTonicList(
#   dds = dds_mydataset,
#   res_de = res_de_mydataset,
#   res_enrich = res_enrich_mydataset,
#   annotation_obj = anno_df_mydataset
# )
# GeneTonic(gtl = gtl_mydataset)

# if running it "as a server", without input data specified:
GeneTonic(size_gtl = 300)   # for fairly large gtl objects, up to 300 Mb
