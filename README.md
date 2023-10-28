# Psoriasiscapitis_WMS

This repo contains the codebase and references to the pipelines that were used to conduct the analyses presented in our paper titled "**Comparative whole metagenome sequencing analysis in lesional and non-lesional scalp areas of psoriasis capitis patients and healthy individuals**". To perform the (pre)processing of the Psoriasis capitis metagenomics data, we used the Biobakery pipelines (qc, taxonomic, and functional profiling). In addition, the rmd file is provided that was used to create barcharts, perform diversity analyses, differential abundance analyses ([MaAsLin2](https://github.com/biobakery/biobakery/wiki/maaslin2)) on the metagenomics data, and analyse the 16S qPCR data. 

# Information about the paper

In the paper, "**Comparative whole metagenome sequencing analysis in lesional and non-lesional scalp areas of psoriasis capitis patients and healthy individuals**", we investigated how changes in the homeostatic cutaneous microbiome correlate with the condition of psoriasis capitis and identified metagenomic biomarkers (taxonomic, functional, virulence factors, antimicrobial resistance genes) that partly explain the emergence of the condition. Within this study, 83 top and back scalp samples from healthy individuals and 64 lesional and non-lesional scalp samples from untreated psoriasis capitis subjects were analysed using whole metagenome sequencing (12 M reads) to map their scalp microbiome.



# Methodology
The datasets generated during the current study are available in the European Nucleotide Archive (ENA) at EMBL-EBI under accession number PRJEB67362 [https://www.ebi.ac.uk/ena/browser/view/PRJEB67362]. 
## Quality Control - [Kneaddata](https://github.com/biobakery/kneaddata)
The generated raw metagenomes were processed with KneadData by removing Illumina adapters provided in the Nextera-PE.fa file. Initially, Trimmomatic looked for seed matches (16 bases) allowing a maximum of 2 mismatches. These seeds were extended and clipped if in the case of paired end reads, a score of 30 was reached (approximately 50 bases). The reads were scanned with a 4-base wide sliding window, cutting when the average quality per base dropped below the trimming position with a Phred score <20 and discarding reads shorter than 50 nt. Human DNA was removed by using BowTie2 to map the reads against the reference genomes (Homo sapiens hg37 reference database). 

The "Hostreads_kneaddata.csv" file, located within the "datasets" directory, stores the outcomes of quality control procedure.

## Taxonomic Profiling - [Metaphlan v4.0](https://github.com/biobakery/MetaPhlAn/wiki/MetaPhlAn-4)
Metagenomic profiles were taxonomically profiled using MetaPhlAn 4, a tool that maps shotgun reads to a database of unique clade-specific markers (mpa_vOct22_CHOCOPhlAnSGB_202212) and is capable of producing species-level resolution and the relative abundances of each species/clade in a sample. We adjusted one parameter from the default parameter settings; the quantile value for the robust average (stat_q) was set to 0.1 to perform a more sensitive profiling. This parameter is used when MetaPhlAn calculates the robust average coverage of a species and defines the trimming of the marker distribution at both ends. The profiling results are based on the fraction of reads mapping against the taxonomically unique species-specific MetaPhlAn 4 markers (+-5.1 M unique clade-specific marker genes). 

In addition, we have performed taxonomic profiling using [Metaphlan v3.0](https://github.com/biobakery/biobakery/wiki/metaphlan3) and [Metaphlan v3.1](https://github.com/biobakery/biobakery/wiki/metaphlan3) and adapted the quantile value for robust average (stat_q) to 0.1. 



## Functional profiling - [Humann v3.6](https://github.com/biobakery/biobakery/wiki/humann3)
To functionally profile the metagenomes, we used HUMAnN v3.6 (using the database mpa_vJan21_CHOCOPhlAnSGB_202103). Nucleotide subject coverage and translated subject coverage thresholds were set to 0 to turn off the coverage filtering and increase the number of reads that hit the pangenome. 

## [Annotation of the virulence factors and antimicrobial resistance genes](https://github.com/stefftaelman/metagenomics-functional-annotation/tree/main)
Specialised gene family alignments were conducted using Diamond BLASTX to annotate virulence factors (VFs) and antimicrobial resistance (AMR) elements. The BLASTx searches were run against the 2022 virulence factor database (VFDB) and the comprehensive antibiotic resistance database (CARD). The E-value thresholds to call a hit were based on the median E-value of BLASTX searches of 10 samples whose reads were shuffled (to retain nucleotide proportions but randomise order) (Fig. S1). The lowest E-value per read was retained, and sequence variants within gene families were aggregated to result in VF and AMR element abundance tables.
For the annotation of virulence factors (VFs) and antimicrobial resistance (AMR) genes to whole genome metagenomic sequencing data, we refer to the following [repo](https://github.com/stefftaelman/metagenomics-functional-annotation.git).

## Data analysis of processed metagenomics data and 16S qPCR data
Statistical data-analysis is given in the Data_analysis_Psoriasis_study.Rmd file. 

# Reference

If you intend to utilize or expand upon this code, please refer to De Pessemier _et al._, (2023) Comparative whole metagenome sequencing analysis in lesional and non-lesional scalp areas of psoriasis capitis patients and healthy individuals. voL. X, pp. XX
