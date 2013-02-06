## run on a MacBookAir on battery
|Benchmark                     |   user  |  system  |   total  |      real  |
|-------------------------------|---------|----------|----------|------------|
|create                         |1.000000 | 0.010000 | 1.010000 |(  1.050916)|
|Array                          |0.890000 | 0.000000 | 0.890000 |(  0.897647)|
|Maglev Array one commit        |1.020000 | 0.040000 | 1.060000 |(  1.769727)|
|Maglev Array one commit search |1.190000 | 0.020000 | 1.210000 |(  1.849698)|
|Maglev Array each commit       |3.690000 | 0.540000 | 4.230000 |( 89.125763)|
## Remarks
The real strange stuff here is the last line. If you ```Maglev.commit_transaction``` after every record,
the benchmark suddenly takes a *lot* of real time, without even maxing out one processor core (this