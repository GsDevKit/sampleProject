"Second step in tODE installation process: lock Metacello if you want to use a non-standard repository.
 Install Metacello from local git clone."
Transcript cr; show: '---Step 2 of tODE bootstrap process: execute installMetacello.ws'.
Object bootstrapGsDevKitHandlingErrorsDuring: [
  Transcript 
    cr; 
    show: 'Lock Metacello: filetree://${gitRoot}/metacello-work/repository'.
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Metacello';
      repository: 'filetree://${gitRoot}/metacello-work/repository';
      lock ] ].
