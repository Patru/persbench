## run on a MacBookAir on battery
(featuring MRI-1.9.3 with ActiveRecord 3.2.13 saving to SQLite3

|Benchmark                      |   user  |  system  |   total  |      real  |
|-------------------------------|---------|----------|----------|------------|
|just create some objects       |1.620000 | 0.010000 | 1.630000 |  1.628136  |
|add objects to ruby array      |1.950000 | 0.020000 | 1.970000 |  1.990658  |
|one transaction to save all    |11.590000| 0.230000 |11.820000 | 11.900282  |
|save the random objects        |16.820000| 5.130000 |21.950000 | 28.420928  |
##Remarks
Generally speaking ActiveRecord objects take a little more time than plain Maglev objects without
storing. As with Maglev, saving all objects in one transaction was considerably faster than storing
each in its own transaction, but this mostly increased the user- and the system-time while elapsed time
only rose little more. Storing the objects in one transaction was more than 5 times slower than storing
them in a Maglev array, but storing each in its own transaction was about 3 times faster than doing the same
in Maglev (but only if you look at elapsed time). System load for Maglev is considerably lower as can be seen
in user and system time usage.