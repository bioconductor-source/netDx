#!/bin/bash
# run on mac, remotely tarballs results and downloads
# random results for KIRC

VM1=spai@192.168.81.125
VM3=spai@192.168.81.249
VM4=netdx@192.168.81.206
VM5=spai@192.168.81.122

localDir=/Users/shraddhapai/Documents/Research/BaderLab/2017_TCGA_KIRC/output/KIRC_oneClinNet_pathway_random_170508

mkdir -p $localDir

# VM1
indir=/mnt/data2/BaderLab/PanCancer_KIRC/output/
outF=KIRC_featSelPath_VM1_170508.tar.gz
ssh $VM1 "cd $indir; tar cvfz ~/${outF} randomNets_forceClin*_170508/predictions"
scp $VM1:~/${outF} .

# VM3
indir=/home/spai/BaderLab/PanCancer_KIRC/output/
outF=KIRC_featSelPath_VM3_170508.tar.gz
ssh $VM3 "cd $indir; tar cvfz ~/${outF} randomNets_forceClin*_170508/predictions"
scp $VM3:~/${outF} .

# VM4
indir=/home/netdx/BaderLab/PanCancer_KIRC/output/
outF=KIRC_featSelPath_VM4_170508.tar.gz
ssh $VM4 "cd $indir; tar cvfz ~/${outF} randomNets_forceClin*_170508/predictions"
scp $VM4:~/${outF} .

# VM5
indir=/home/spai/BaderLab/PanCancer_KIRC/output/
outF=KIRC_featSelPath_VM5_170508.tar.gz
ssh $VM5 "cd $indir; tar cvfz ~/${outF} randomNets_forceClin*_170508/predictions"
scp $VM5:~/${outF} .

mv *gz ${localDir}/.
cd $localDir
tar xvfz KIRC_featSelPath_VM1_170508.tar.gz
tar xvfz KIRC_featSelPath_VM4_170508.tar.gz
tar xvfz KIRC_featSelPath_VM3_170508.tar.gz
tar xvfz KIRC_featSelPath_VM5_170508.tar.gz

