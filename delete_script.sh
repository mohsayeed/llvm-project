#! /bin/bash
cd ~/llvm-project/c-programs/program1
ls
shopt -s extglob
rm -v !("program1.c")
cd ~/llvm-project/c-programs/program2
rm -v !("program2.c")
cd ~/llvm-project/c-programs/program3
rm -v !("program3.c")
cd ~/llvm-project/c-programs/program4
rm -v !("program4.c")
cd ~/llvm-project/c-programs/program5
rm -v !("program5.c")

 shopt -u extglob