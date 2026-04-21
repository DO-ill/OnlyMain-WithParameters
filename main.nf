nextflow.enable.dsl = 2

// Parameters are explicitly defined in main.nf
params.outdir   = 'results'
params.repeat   = 3
params.greeting = 'Hello'
params.name     = 'World'

process SAY_HELLO {
  publishDir params.outdir, mode: 'copy'

  output:
    path "message.txt"

  script:
  """
  for i in \$(seq 1 ${params.repeat}); do
    echo "${params.greeting}, ${params.name}! (\$i/${params.repeat})"
  done > message.txt
  """
}

workflow {
  SAY_HELLO()
}
