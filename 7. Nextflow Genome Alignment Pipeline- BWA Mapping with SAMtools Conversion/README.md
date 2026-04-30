# Nextflow Genome Alignment Pipeline: BWA Mapping with SAMtools Conversion

This repository contains a simple Nextflow pipeline for mapping paired-end Illumina reads to a reference genome using `bwa mem` and converting the aligned output to BAM format with `samtools`.

## Project structure

- `pipeline.nf` - Nextflow workflow definition.
- `fastq/` - paired-end sequencing read files (not included in the GitHub repository due to size).
- `ref/` - reference FASTA file plus BWA index files.
- `bam/` - output directory for the resulting BAM file.
- `work/` - Nextflow work directory for intermediate files.

## Workflow overview

1. `params.fastq` reads paired files from `fastq/*_{1,2}.fastq.gz`.
2. `bwa mem` maps the reads to the reference genome `ref/Agy99.fasta`.
3. `samtools view` converts the SAM output from `bwa mem` into a BAM file.
4. The resulting BAM file is copied into `bam/`.

## Requirements

- Nextflow
- BWA
- SAMtools

## Run the pipeline

From the repository root:

```bash
nextflow run pipeline.nf
```

If you want to run on a single sample and use the existing repository layout, the pipeline will automatically find the paired FASTQ files in `fastq/`.

## Data download links

### Paired-end FASTQ files

The input FASTQ files are not stored in this repository due to file size limitation. Download them from the European Nucleotide Archive (ENA):

- `ERR3335404_1.fastq.gz`
  - `ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR333/004/ERR3335404/ERR3335404_1.fastq.gz`
- `ERR3335404_2.fastq.gz`
  - `ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR333/004/ERR3335404/ERR3335404_2.fastq.gz`

### Reference genome

Download the reference genome FASTA from NCBI:

- `Agy99.fasta`
  - `https://www.ncbi.nlm.nih.gov/nuccore/CP000325`

> Note: this repository already includes the `ref/` directory with the reference FASTA name and BWA index files needed by the pipeline.

### Result BAM file

The final mapped BAM output for sample `ERR3335404` should be in bam folder and work folder but due to file size limitation, it is noe included in this repository. Download the BAM file from my Google Drive:

- `ERR3335404.bam`
  - `https://drive.google.com/file/d/1ak929Gf_3EICAxpp2OlizjLCj__3shH9/view?usp=sharing`

## Notes

- The raw FASTQ files and large BAM outputs should be obtained via the links above rather than stored directly in GitHub.
- The pipeline is intentionally lightweight and demonstrates a simple mapping workflow with Nextflow.
