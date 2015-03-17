"Fourth and final step in tODE installation process: install tODE."
Transcript cr; show: '---Step 2 of tODE bootstrap process: execute installTode.ws'.
Object bootstrapGsDevKitHandlingErrorsDuring: [
  Transcript
    cr;
    show: '-----Upgrade tODE from local git clone'.
  GsDeployer bulkMigrate: [ 
    Metacello new
      baseline: 'Tode';
      repository: 'filetree://${gitRoot}/tode/repository';
      get;
      load: 'GemStone Dev'.
  Object class removeSelector: #bootstrapGsDevKitHandlingErrorsDuring: ]

