# Psoriasiscapitis_WMS

This repo contains the codebase and pipelines that were used to conduct the analyses presented in our paper titled "**Comparative whole metagenome sequencing analysis in lesional and non-lesional scalp areas of psoriasis capitis patients and healthy individuals**". To perform the (pre)processing of the Psoriasis capitis metagenomics data, we used the Biobakery pipelines (qc, taxonomic, and functional profiling). In addition, the rmd file is provided that was used to create barcharts, perform diversity analyses, differential abundance analyses ([MaAsLin2](https://github.com/biobakery/biobakery/wiki/maaslin2)) on the metagenomics data, and analyse the 16S qPCR data. 

# About the paper

In the paper, "**Comparative whole metagenome sequencing analysis in lesional and non-lesional scalp areas of psoriasis capitis patients and healthy individuals**", we investigated how changes in the homeostatic cutaneous microbiome correlate with the condition of psoriasis capitis and identified metagenomic biomarkers (taxonomic, functional, virulence factors, antimicrobial resistance genes) that partly explain the emergence of the condition. Within this study, 83 top and back scalp samples from healthy individuals and 64 lesional and non-lesional scalp samples from untreated psoriasis capitis subjects were analysed using whole metagenome sequencing (12 M reads) to map their scalp microbiome.

# Methodology

## Quality Control - [Kneaddata](https://github.com/biobakery/kneaddata)
[Kneaddata](https://github.com/biobakery/kneaddata) was used within the [Biobakery workflows](https://github.com/biobakery/biobakery/wiki/biobakery_workflows) to perform the quality control, removal of adapters/indices/barcodes, low complexity reads/TRF, low quality bases/reads, human host contamination.

## Taxonomic Profiling - [Metaphlan v4.0](https://github.com/biobakery/MetaPhlAn/wiki/MetaPhlAn-4)
Adapted parameters from default 
--q_stat 0.1

## Functional profiling - [Humann v3.6](https://github.com/biobakery/biobakery/wiki/humann3)
Adapted parameters from default
--nucleotide-subject-coverage-threshold 0 
--translated-subject-coverage-threshold 0

## [Annotation of the virulence factors and antimicrobial resistance genes](https://github.com/stefftaelman/metagenomics-functional-annotation/tree/main)
For the annotation of virulence factors (VFs) and antimicrobial resistance (AMR) genes to whole genome metagenomic sequencing data, we refer to the following [repo](https://github.com/stefftaelman/metagenomics-functional-annotation.git).


## Statistical data analysis
Statistical data-analysis is given in the Data_analysis_Psoriasis_study.Rmd file
