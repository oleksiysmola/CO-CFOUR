#!/bin/csh
#
# Generation of the input file for MOLPRO
#


set pwd = `pwd`

set point = $1        
set directory = /scratch/vol1/asmola/CO/Iso28/DIPOLES
set fname_pve = cfour_CO28_DBOC_AUG-PCVQZ_${point}_pve

cat<<endb> ZMAT
Carbon Monoxide DBOC calculation                                              
C 
O 1 r                                                                   
                                                                                
r=$point                                                         
                                                                                
                                                                                
*CFOUR(CALC=CCSD,BASIS=AUG-PCVQZ,SCF_CONV=10                                    
CC_CONV=14,DBOC=ON,MEMORY=500000000                                             
ZFIELD=200)                                                                   

%isotopes                                                                       
12                                                                              
18
endb

xclean
xcfour > ${directory}/${fname_pve}.out
rm ZMAT

set fname_nve = cfour_CO28_DBOC_AUG-PCVQZ_${point}_nve

cat<<endb> ZMAT
Carbon Monoxide DBOC calculation                                              
C 
O 1 r                                                                   
                                                                                
r=$point                                                         
                                                                                
                                                                                
*CFOUR(CALC=CCSD,BASIS=AUG-PCVQZ,SCF_CONV=10                                    
CC_CONV=14,DBOC=ON,MEMORY=500000000                                             
ZFIELD=-200)                                                                   

%isotopes                                                                       
12                                                                              
18
endb

xclean
xcfour > ${directory}/${fname_nve}.out
rm ZMAT