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
  12. Modify the linux/arch/x86/kvm/cpuid.c 
    - Under knvm_emulate_cpuid() inserted a condition for eax==0x4FFFFFF and implemented parsing for the reg values to be printed in kernel based on atomic variables
  10. Modify linux/arch/x86/kvm/vmx/vmx.c code to support the additional functions
    - added atomic variables and under the __vmx_handle_exit() add counters and time tracking
  11. Remake the code using the previous make commands and reboot
  12. check virtualization capablity
  > $(grep -qE 'vmx|svm' /proc/cpuinfo) && echo "Virtualization IS supported" || echo "Virtualization is NOT supported"
  14. Install KVM https://help.ubuntu.com/community/KVM/Installation
  > sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
  15. Installed the virt-manager 
  > sudo apt-get install virt-manager
  16. Create nested VM
  17. install cpui and make
  > sudo apt-get install make
  19. Tested the code using cpuid -l 0x4FFFFFE
  20. compile and run test code

#### Comment on the frequency of exits – does the number of exits increase at a stable rate? 
No, the number of exits increase is not at stable rate. 
#### Or are there more exits performed during certain VM operations? 
There may be other exit and operations performed like EPT_VIOLATION, RDRAND, I/O instruction, RDTSCP , MSR_WRITE or page fault.
#### Approximately how many exits does a full VM boot entail?
A full boot seems to be around 300,000 exits. 
