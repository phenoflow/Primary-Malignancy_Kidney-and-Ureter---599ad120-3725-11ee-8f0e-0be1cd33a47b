cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  renal-primary-malignancy_kidney-and-ureter---primary:
    run: renal-primary-malignancy_kidney-and-ureter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  primary-malignancy_kidney-and-ureter-neoplasm---primary:
    run: primary-malignancy_kidney-and-ureter-neoplasm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: renal-primary-malignancy_kidney-and-ureter---primary/output
  primary-malignancy_kidney-and-ureter-hypernephroma---primary:
    run: primary-malignancy_kidney-and-ureter-hypernephroma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-neoplasm---primary/output
  primary-malignancy_kidney-and-ureter-pelvi---primary:
    run: primary-malignancy_kidney-and-ureter-pelvi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-hypernephroma---primary/output
  primary-malignancy_kidney-and-ureter---primary:
    run: primary-malignancy_kidney-and-ureter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-pelvi---primary/output
  primary-malignancy_kidney-and-ureter-[m]hypernephroma---primary:
    run: primary-malignancy_kidney-and-ureter-[m]hypernephroma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter---primary/output
  primary-malignancy_kidney-and-ureter-history---primary:
    run: primary-malignancy_kidney-and-ureter-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-[m]hypernephroma---primary/output
  kidney---primary:
    run: kidney---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-history---primary/output
  primary-malignancy_kidney-and-ureter-pelvi---secondary:
    run: primary-malignancy_kidney-and-ureter-pelvi---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: kidney---primary/output
  primary-malignancy_kidney-and-ureter-neoplasm---secondary:
    run: primary-malignancy_kidney-and-ureter-neoplasm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-pelvi---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: primary-malignancy_kidney-and-ureter-neoplasm---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
