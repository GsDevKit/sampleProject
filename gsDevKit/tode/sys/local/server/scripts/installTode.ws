"Fourth and final step in tODE installation process: install tODE."
"${$gitRoot} should be replaced by path to directory where local git clones are located."

Transcript cr; show: '---Step 4 of tODE bootstrap process: execute installTode.ws'.

GsUpgrader batchErrorHandlingDo: [

  Transcript 
    cr; 
    show: 'Lock RB: filetree://${gitRoot}/rb/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'RB';
      repository: 'filetree://${gitRoot}/rb/repository';
      lock ].

  Transcript 
    cr; 
    show: 'Lock Ston: filetree://${gitRoot}/stone/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Ston';
      repository: 'filetree://${gitRoot}/ston/repository';
      lock ].

  Transcript 
    cr; 
    show: 'Lock Grease: filetree://${gitRoot}/Grease/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Grease';
      repository: 'filetree://${gitRoot}/Grease/repository';
      lock ].

  Transcript
    cr;
    show: '-----Install tODE from local git clone'.
  GsDeployer bulkMigrate: [ 
    Metacello new
      baseline: 'Tode';
      repository: 'filetree://${gitRoot}/tode/repository';
      get;
      load: 'GemStone Dev' ] ]

