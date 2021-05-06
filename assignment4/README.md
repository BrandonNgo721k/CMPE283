### Assignment 4

#### Brandon Ngo

1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member
implemented / researched. (You may skip this question if you are doing the lab by yourself).
SELF
2. Include a sample of your print of exit count output from dmesg from “with ept” and “without ept”.
3. What did you learn from the count of exits? Was the count what you expected? If not, why not?
4. What changed between the two runs (ept vs no-ept)?
This disabled nested paging and forced KVM to use shadow paging instead, which greatly increased the number of exits
