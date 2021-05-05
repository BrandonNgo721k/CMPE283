### Assignment 3
### Brandon Ngo 010646012

Redid assignment 2 before preceeding

For CPUID leaf node %eax=0x4FFFFFFE: Return the number of exits for the exit number provided (on input) in %ecx This value should be returned in %eax

For leaf nodes 0x4FFFFFFE, if %ecx (on input) contains a value not defined by the SDM, return 0 in all %eax, %ebx, %ecx registers and return 0xFFFFFFFF in %edx. For exit types not enabled in KVM, return 0s in all four registers.

## Questions

#### For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF

#### Describe in detail the steps you used to complete the assignment. 
### Setup
  1. Use same environment as assignment 2

### Comment on the frequency of exits – does the number of exits increase at a stable rate? Or are there more exits performed during certain VM operations? Approximately how many exits does a full VM boot entail?

### Of the exit types defined in the SDM, which are the most frequent? Least?
 
### 
