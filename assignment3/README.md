### Assignment 3
### Brandon Ngo 010646012

Redid assignment 2 before proceeding, switched to my AMD computer due to some issues. 

For CPUID leaf node %eax=0x4FFFFFFE: Return the number of exits for the exit number provided (on input) in %ecx This value should be returned in %eax

For leaf nodes 0x4FFFFFFE, if %ecx (on input) contains a value not defined by the AMD64 APM, return 0 in all %eax, %ebx, %ecx registers and return 0xFFFFFFFF in %edx. For exit types not enabled in KVM, return 0s in all four registers.

## Questions

#### For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF

#### Describe in detail the steps you used to complete the assignment. 
### Setup
  1. Use same setup as assignment 2
  2. In linux/arch/x86/kvm/svm/svm.c added an atomic exit array in line the the svm exit code and supported. 
  3. In linux/arch/x86/kvm/cpuid.c Added conditional eax=0x4ffffffe to cpuid and extracted counter from exit array
  4. Ran shell script plus 1024-1027 manually with "cpuid -l 0x4FFFFFFE -1 -s $i"

### Comment on the frequency of exits – does the number of exits increase at a stable rate? Or are there more exits performed during certain VM operations? Approximately how many exits does a full VM boot entail?!
The number of exits seem to increase at a stable rate if the test is ran every second when the nested VM is on idle. However when a browser or another process is executed, the exits jump up and do not increase at a stable rate. A full boot for my nested VM is about 570k after logging in and running the test program.

![image](https://user-images.githubusercontent.com/23691164/117241951-17032780-ade9-11eb-98bf-83264f0b7de1.png)

### Of the exit types defined in the SDM, which are the most frequent? Least?
The most frequent:
-  Exit 96 0x60: eax=0x00014b6f (INTERRUPT)
-  Exit 114 0x72: eax=0x000236eb (CPUID)
-  Exit 120 0x78: eax=0x0002bbb8 (HLT)
-  Exit 123 0x7b: eax=0x0002afab (IOIO)
-  Exit 124 0x7c: eax=0x00087059 (MSR)
-  Exit 1024 0x400: eax=0x00014db9 (NPF)

The least frequent were the rest in general, most had 0 exits
![image](https://user-images.githubusercontent.com/23691164/117243741-a52cdd00-adec-11eb-80d6-288a23168be6.png)

![image](https://user-images.githubusercontent.com/23691164/117243645-7e6ea680-adec-11eb-8971-33a86b06e8f4.png)


