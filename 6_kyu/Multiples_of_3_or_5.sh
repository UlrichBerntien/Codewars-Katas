#!/bin/bash
N3=$(( ($1-1)/3 ))
N5=$(( ($1-1)/5 ))
N15=$(( ($1-1)/15 ))
echo $(( 3*N3*(N3+1)/2 + 5*N5*(N5+1)/2 - 15*N15*(N15+1)/2 ))