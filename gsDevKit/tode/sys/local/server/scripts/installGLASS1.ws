"Third step in tODE installation process: install GLASS1.
 Install GLASS1 from local git clone."
"${$gitRoot} should be replaced by path to directory where local git clones are located."

Transcript cr; show: '---Step 3 of tODE bootstrap process: execute installGLASS1.ws'.

GsUpgrader batchErrorHandlingDo: [

  Transcript
    cr;
    show: 'Lock GLASS1: filetree://${gitRoot}/glass/repository'.
  GsDeployer
    bulkMigrate: [ 
      Metacello new
        baseline: 'GLASS1';
        repository: 'filetree://${gitRoot}/glass/repository';
        lock ].

  Transcript 
    cr; 
    show: 'Lock FileTree: filetree://${gitRoot}/filetree/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'FileTree';
      repository: 'filetree://${gitRoot}/filetree/repository';
      lock ].

  Transcript
    cr;
    show: '-----Upgrade GLASS1 using gsUpgrader'.

  GsUpgrader upgradeGLASS1.

  Transcript
    cr;
    show: '-----Lock and Load Grease: filetree://${gitRoot}/Grease/repository'.

  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Grease';
      repository: 'filetree://${gitRoot}/Grease/repository';
      onLock: [:ex | ex break ];
      load: 'Grease-Core' ] ].
