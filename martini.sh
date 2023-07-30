#!/bin/bash

which gmx
tar xvzf test.tar.gz
mv test/* $PWD
export GMX_MAXCONSTRWARN=-1
#gmx --version
#gmx mdrun -h
#gmx grompp -h
gmx_d grompp -f prod.mdp -c eq.gro -p topol.top -o prod.$1.tpr -maxwarn 5
gmx_d mdrun -deffnm prod.$1 -v

if [ ! -e prod.$1.xtc ]; then
echo "Creating emtpy prod.$1.xtc to indicate failure and make file transfers work"
touch prod.$1.xtc
fi
