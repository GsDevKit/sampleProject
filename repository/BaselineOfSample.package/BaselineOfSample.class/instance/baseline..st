baselines
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
          with: [ 
              spec
                repository: 'github://GsDevKit/Seaside31:3.1.?/repository'
                loads: #('Development' 'Zinc' 'Examples') ];
        baseline: 'ZincHTTPComponents'
          with: [ 
              spec
                repository: 'github://GsDevKit/zinc:2.4.3.?/repository';
                loads: #('Core') ];
        yourself.
      spec
        package: 'Sample-Core'
          with: [ spec requires: #('Seaside3' 'ZincHTTPComponents') ];
        package: 'Sample-Tests' with: [ spec requires: 'Sample-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Sample-Core');
        group: 'Tests' with: #('Sample-Tests');
        yourself ]