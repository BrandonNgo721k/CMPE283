# Assignment 2 
### Brandon Ngo 010646012

Modify the CPUID emulation code in KVM to report back additional information when a special CPUID “leaf function” is called

    For CPUID leaf function %eax=0x4FFFFFFF:
        Return the total number of exits (all types) in %eax
        Return the high 32 bits of the total time spent processing all exits in %ebx
        Return the low 32 bits of the total time spent processing all exits in %ecx
            %ebx and %ecx return values are measured in processor cycles

## Questions

#### For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF

#### Describe in detail the steps you used to complete the assignment. 
  1. Forked the https://github.com/torvalds/linux repo in personal repo
  2. Cloned that perosnal linux repo
  3. Installed the necessary packages to build a kernel later using following command in terminal 
  > sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf
  4. 

#### Comment on the frequency of exits – does the number of exits increase at a stable rate? 
Or are there more exits performed during certain VM operations? Approximately how many exits does a full VM boot entail?
