

Flow B
======

Two options via Config file to import data from SUN:

 - Manual (define a range): set variables "sDataReversaleDa" & "sDataReversaleA" with format "'dd-mm-yyyy hh:mi:ss AM'" with a valid range
 - Automatic: set BOTH variables ("sDataReversaleDa" & "sDataReversaleA") equals to '01-01-1899 12:00:00 AM' 

WARNING: 
please remember to set BOTH variables in any case 
i.e. BOTH '01-01-1899 12:00:00 AM' for automatic mode or A VALID range

EXAMPLES
...
 <ConfiguredValue>'28-03-2017 12:00:00 AM'</ConfiguredValue>
...

Description:

Data are imported via SQL to table "_oraAccentramenti", successively "normalization" phase starts.
Data are grouped and appended to "_ProvvAccentramenti" 



Oracle Datetime Format Used

"'dd-mm-yyyy hh:mi:ss AM'"
