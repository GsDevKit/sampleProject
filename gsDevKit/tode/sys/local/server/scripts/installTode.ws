"Fourth and final step in tODE installation process: install tODE."
"${$gitRoot} should be replaced by path to directory where local git clones are located."

Transcript cr; show: '---Step 4 of tODE bootstrap process: execute installTode.ws'.

GsUpgrader batchErrorHandlingDo: [

  Transcript
    cr;
    show: '-----Install tODE from local git clone'.

  GsDeployer bulkMigrate: [ 
    Metacello new
      baseline: 'Tode';
      repository: 'filetree://${gitRoot}/tode/repository';
      get;
      load: 'GemStone Dev' ] ]

