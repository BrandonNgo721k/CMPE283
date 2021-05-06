### Assignment 3
### Brandon Ngo 010646012

Redid assignment 2 before proceeding, switched to my AMD computer due to some issues. 

For CPUID leaf node %eax=0x4FFFFFFE: Return the number of exits for the exit number provided (on input) in %ecx This value should be returned in %eax

For leaf nodes 0x4FFFFFFE, if %ecx (on input) contains a value not defined by the SDM, return 0 in all %eax, %ebx, %ecx registers and return 0xFFFFFFFF in %edx. For exit types not enabled in KVM, return 0s in all four registers.

## Questions

#### For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF

#### Describe in detail the steps you used to complete the assignment. 
### Setup
  1. Use same setup as assignment 2
  2. In linux/arch/x86/kvm/svm/svm.c added an atomic exit array in line the the svm exit code and supported. 
  3. In linux/arch/x86/kvm/cpuid.c Added conditional eax=0x4ffffffe to cpuid and extracted counter from exit array

### Comment on the frequency of exits – does the number of exits increase at a stable rate? Or are there more exits performed during certain VM operations? Approximately how many exits does a full VM boot entail?!
The number of exits seem to increase at a stable rate if the test is ran every second when the nested VM is on idle. However when a browser or another process is executed, the exits jump up and do not increase at a stable rate. A full boot for my nested VM is about 570k after logging in and running the test program.
[image](https://user-images.githubusercontent.com/23691164/117241951-17032780-ade9-11eb-98bf-83264f0b7de1.png)

### Of the exit types defined in the SDM, which are the most frequent? Least?

 
