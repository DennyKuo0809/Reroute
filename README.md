### Usage

#### Step 1: import cycle detection project 
```sh=
git clone https://github.com/Ching-Chu-Lin/cycle.git
```

#### Step 2: generate routing result
* Arguments
  * $1: input file (network scenario)
  * $2: the type1 method
  * $3: the file contains route of type1
  * $4: output file
```sh=
bash cycle_finding.sh $1 $2 $3 $4
```

#### Step 3: generate ned & ini file
* Arguments
  * $1: input file (network scenario)
  * $2: the file contains route of type1
  * $3: the file contains route of type2
  * $4: output ini file path
  * $5: output ned file path
```sh=
bash generator.sh $1 $2 $3 $4 $5
```

#### Step 4: run simulation (in command line)
```sh=
$ cd {omnetpp directory} ; . setenv
$ cd {inet directory} ; . setenv

$ cd {directory with ini & ned}
$ inet {path to ini} -u Cmdenv
```

#### Step 5: export the result files to csv foramt
```sh=
$ opp_scavetool x {-f name=~meanBitLifeTimePerPacket:histogram
} -F CSV-R -o {path to output.csv}
```

#### Step 6: analysis the result
### Still in progress
- keep in mind
  - maybe : $ python3.9 {analysis.py} {path to csv} 
  - TSN_multipath.destination.app[0].sink
  - meanBitLifeTimePerPacket:histogram
  - https://inet.omnetpp.org/docs/showcases/measurement/endtoenddelay/doc/index.html


### TODO List
- warmup procedure
- deal with nodes not in stronly connected component
