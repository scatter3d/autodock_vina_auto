#!/bin/bash

## split sdf structure library file [change file name]
obabel -isdf *.sdf -osdf -O *.sdf --split

## apply MMFF94 forcefield 
obminimize -ff MMFF94 -n 1000 *.sdf

## convert to pdbqt format
obabel -isdf *.sdf -opdbqt -O*.pdbqt

## delete all sdf files in folder
find . -type f -name '*.sdf' -delete

## create docking ligand list
ls >ligand.txt

## run perl script to perform calculations
perl *.pl

## compile results to one file
tail -n11 *.log>results.txt

## 
