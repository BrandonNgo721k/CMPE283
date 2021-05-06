### Assignment 4

#### Brandon Ngo

Your assignment is to modify the CPUID emulation code in KVM to report back additional information
when special CPUID leaf nodes are requested.
•
For CPUID leaf node %eax=0x4FFFFFFE:
◦ Return the number of exits for the exit number provided (on input) in %ecx
▪ This value should be returned in %eax

1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member
implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF
2. Include a sample of your print of exit count output from dmesg from “with ept” and “without ept”.
##### With EPT
![image](https://user-images.githubusercontent.com/23691164/117333735-1486e900-ae4e-11eb-9559-c67faceb6fbb.png)![image](https://user-images.githubusercontent.com/23691164/117333799-27012280-ae4e-11eb-9adb-9fdac0dc5aa4.png)
##### Without EPT

4. What did you learn from the count of exits? Was the count what you expected? If not, why not?
5. What changed between the two runs (ept vs no-ept)?
This disabled nested paging and forced KVM to use shadow paging instead, which greatly increased the number of exits
