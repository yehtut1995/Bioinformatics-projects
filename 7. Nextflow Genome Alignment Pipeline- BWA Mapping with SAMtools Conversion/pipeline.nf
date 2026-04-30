params.index_dir = "/home/yehtut1995/Genome_Mapping_project/ref"
params.ref ="Agy99.fasta"
params.fastq = "/home/yehtut1995/Genome_Mapping_project/fastq/*_{1,2}.fastq.gz"

params.bam_dir = "/home/yehtut1995/Genome_Mapping_project/bam"


process mapping {
    publishDir("${params.bam_dir}", mode:'copy')

    input: 
        tuple val(sample_id), path(fastq)

    output:
        path "*"
    
    script:
    """
        bwa mem ${params.index_dir}/${params.ref} ${fastq} | samtools view -h -b -o ${sample_id}.bam -
    """

}

workflow {
    fastq_ch = Channel.fromFilePairs(params.fastq)
    fastq_ch.view()
    mapping(fastq_ch)

}