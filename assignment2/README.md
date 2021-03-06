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
### Setup
  1. Forked the https://github.com/torvalds/linux repo in personal repo
  2. Cloned that personal linux repo and checkout the most recent stable version 
  > git checkout v5.11
  3. Installed the necessary packages to build a kernel later using following command in terminal 
  > sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf
  4. Install more packages
  > apt-get install build-essential kernel-package fakeroot libncurses5-dev libssl-dev ccache bison flex libelf-dev 
  6. Got kernel version
  > uname -a
  7. Copied current kernel config into config for new kernel to be built in the linux source code tree
  > cd linux
  >  cp /boot/config-<KERNEL VERSION> ./.config
  8. Made updated configuration for linux source code tree, held down enter to confirm all defaults
  > make oldconfig
  9. Resolve certification error to compile kernel 
  > sed -ri '/CONFIG_SYSTEM_TRUSTED_KEYS/s/=.+/=""/g' .config 
  10. Made modules and kernel and install both, replaced X with max number of cpus allocated
  > make -j <X> modules && make -j <X> && sudo make modules_install && sudo make install
  11. Verify the new version with "uname -a" and then reboot
  ### Code
  13. Modify the linux/arch/x86/kvm/cpuid.c 
    - Under knvm_emulate_cpuid() inserted a condition for eax==0x4FFFFFF and implemented parsing for the reg values to be printed in kernel based on atomic variables
  14. Modify linux/arch/x86/kvm/kvm/kvm.c code to support the additional functions
    - added atomic variables and under the __vmx_handle_exit() add counters and time tracking
  15. Remake the code using the previous make commands and reboot
  ### Nested VM
  17. check virtualization capablity
  > $(grep -qE 'vmx|svm' /proc/cpuinfo) && echo "Virtualization IS supported" || echo "Virtualization is NOT supported"
  18. Install KVM https://help.ubuntu.com/community/KVM/Installation
  > sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
  19. Installed the virt-manager 
  > sudo apt-get install virt-manager
  20. Create nested VM installing ubuntu with the iso
  ![image](https://user-images.githubusercontent.com/23691164/116650943-01988400-a937-11eb-82cd-6ed6bea5c55a.png)

  22. install cpuid and make
  > sudo apt-get install make cpuid gcc
  23. Tested the code using "cpuid -l 0x4FFFFFFF" in terminal
  24. compile and run test code "gcc test.c" "./.a.out"
  -   eax =number of exits :  ebx =total cycle count of hi bit value: ecx =total cycle count of low bit value

### Comment on the frequency of exits – does the number of exits increase at a stable rate? 
The number of exits seem to increase at a stable rate if the test is ran every second we can see 
### Or are there more exits performed during certain VM operations? 
There may be other exit and operations performed like EPT_VIOLATION, RDRAND, I/O instruction, RDTSCP , MSR_WRITE or page fault. There are more exits performed when other apps or tasks are running as well
### Approximately how many exits does a full VM boot entail?
A full boot seems to be around 600,000 exits. 
![image](https://user-images.githubusercontent.com/23691164/117208258-c4eee180-ada9-11eb-80bc-75a44e10406a.png)

