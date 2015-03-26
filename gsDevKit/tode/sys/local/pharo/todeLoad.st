[ 
  "Sample project pharo todeLoad.st, lock and load Metacello using local git clone"
  " ${$gitRoot} should be replaced by path to directory where local git clones are located."
  | gs_home |
  Metacello new
    baseline: 'Metacello';
    repository: 'filetree://${gitRoot}/metacello-work/repository';
    get.
  Metacello new
    baseline: 'Metacello';
    repository: 'filetree://${gitRoot}/metacello-work/repository';
    lock.
  Metacello new
    baseline: 'Metacello';
    repository: 'filetree://${gitRoot}/metacello-work/repository';
    onConflict: [:ex | ex allow];
    load.
  gs_home := Smalltalk os environment at: 'GS_HOME'.
  Metacello new
    baseline: 'Tode';
    repository: 'filetree://${gitRoot}/tode/repository';
    get;
    load: 'GemStone Dev';
    lock.
  Metacello new
    configuration: 'TodeClient';
    version: #dev;
    repository: 'filetree://', gs_home, '/repository';
    get;
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

