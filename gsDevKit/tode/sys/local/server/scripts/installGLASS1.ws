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
    show: '-----Upgrade GLASS1 using gsUpgrader'.

  GsUpgrader upgradeGLASS1  ].
