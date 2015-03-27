"Second step in tODE installation process: lock Metacello if you want to use a non-standard repository.
 Install Metacello from local git clone. The lock will be honored by GsUpgrader in step 3."
"${$gitRoot} should be replaced by path to directory where local git clones are located."

Transcript cr; show: '---Step 2 of tODE bootstrap process: execute installMetacello.ws'.

GsUpgrader batchErrorHandlingDo: [

  Transcript 
    cr; 
    show: 'Lock Metacello: filetree://${gitRoot}/metacello-work/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Metacello';
      repository: 'filetree://${gitRoot}/metacello-work/repository';
      lock ].

  Transcript 
    cr; 
    show: 'Lock Grease: filetree://${gitRoot}/Grease/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Grease';
      repository: 'filetree://${gitRoot}/Grease/repository';
      lock ].
 ].
