#!/bin/sh

KSS2VGM=../../../dsa/kss2vgm/build/kss2vgm

for MML in mml/*.mml ; do
  N=${MML#mml/}
  N=${N%.mml}
  MGS=mgs/$N.mgs
  VGM=vgm/$N.vgm
  VGZ=vgm/$N.vgz
  mgsc-js -o $MGS $MML
  ${KSS2VGM} -p180 -l2 -o$VGM $MGS
  gzip -n --stdout $VGM > $VGZ
  rm $VGM
done