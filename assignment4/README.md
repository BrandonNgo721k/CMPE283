## Assignment 4

#### Brandon Ngo

Remove the ‘kvm-amd’ module from your running kernel:
◦ rmmod kvm_amd
5. Reload the kvm-amd module with the parameter ept=0 (this will disable nested paging and force
KVM to use shadow paging instead)
◦ The module you want is usually found in /lib/modules/XXX/kernel/arch/x86/kvm , where
XXX is the version of the kernel you build for assignment 3 – don’t make a mistake and
use the one that came with the stock Linux installation.
◦ insmod /lib/modules/XXX/kernel/arch/x86/kvm/kvm-amd.ko ept=0

1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member
implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF
2. Include a sample of your print of exit count output from dmesg from “with ept” and “without ept”.
### With EPT

![image](https://user-images.githubusercontent.com/23691164/117338737-c543b700-ae53-11eb-92e7-9fd8d6cb66c3.png)![image](https://user-images.githubusercontent.com/23691164/117338769-cecd1f00-ae53-11eb-858b-53eaaca337e1.png)![image](https://user-images.githubusercontent.com/23691164/117338964-09cf5280-ae54-11eb-89bf-22be3894245f.png)

### Without EPT

![image](https://user-images.githubusercontent.com/23691164/117339533-b1e51b80-ae54-11eb-89ce-2d5f2019c0c6.png)![image](https://user-images.githubusercontent.com/23691164/117339582-bf020a80-ae54-11eb-8f89-58409f510962.png)



3. What did you learn from the count of exits? Was the count what you expected? If not, why not?
The number of exits doubled exactly for most except for MSR exits which quadrupled. I expected it to since shadow paging has to do twice as many exits in general
4. What changed between the two runs (ept vs no-ept)?
This disabled nested paging and forced KVM to use shadow paging instead, which greatly increased the number of exits.
