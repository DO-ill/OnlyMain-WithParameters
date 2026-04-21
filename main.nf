nextflow.enable.dsl = 2

// Additional parameter defined ONLY in main.nf (not in nextflow.config)
params.suffix = params.suffix ?: 'Have a nice day!'

process SAY_HELLO {
  publishDir "${params.outdir}", mode: 'copy'

  output:
    path "message.txt"

  script:
  """
  for i in \$(seq 1 ${params.repeat}); do
    echo "${params.greeting}, ${params.name}! (\$i/${params.repeat}) ${params.suffix}"
  done > message

  """
}
