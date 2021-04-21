# Assignment 1

Brandon Ngo 010646012

1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member
implemented / researched.   SELF

2. Describe in detail the steps you used to complete the assignment

### Environment 
1. I created a partition on my Macbook drive and installed Ubuntu 20.04 LTS with a USB boot drive
  (https://www.youtube.com/watch?v=kRgKlcm1XPI&t=629s) 
- The Linux partition has 170GB storage and a 17.7GB SWAP space
2. In terminal, installed all kernel building dependencies and packages
> sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf make gcc
### Deployment
3. Downloaded the cmpe283-1.c and Makefile for Intel Processors
4. Ran the make command after adding additional functions and implementations for the 5 MSRs
> $ make
5. Executed the command below to inject the kernel object into the kernel
> $ sudo insmod ./cmpe283-1.ko
6. Executed the command below to view the kernel output
> $ dmesg
- This is the output for the 5 MSRs for my Macbook Pro 2014 i7:

![CMPE281-Lab1Terminal](https://user-images.githubusercontent.com/23691164/115492610-f054c680-a216-11eb-815e-778b318375b1.png)


7. Executed the command below to unload the module from the kernel
> $ sudo rmmod cmpe283-1

