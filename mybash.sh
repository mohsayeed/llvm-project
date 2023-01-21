#! /bin/bash
pwd
echo "We are starting a script for generating the LLVM IR's"
~/llvm-project/build/bin/clang ~/llvm-project/c-programs/program1/program1.c -S -emit-llvm  -o ~/llvm-project/c-programs/program1/program1.ll
~/llvm-project/build/bin/clang ~/llvm-project/c-programs/program2/program2.c -S -emit-llvm -o ~/llvm-project/c-programs/program2/program2.ll
~/llvm-project/build/bin/clang ~/llvm-project/c-programs/program3/program3.c -S -emit-llvm -o ~/llvm-project/c-programs/program3/program3.ll
~/llvm-project/build/bin/clang ~/llvm-project/c-programs/program4/program4.c -S -emit-llvm -o ~/llvm-project/c-programs/program4/program4.ll
~/llvm-project/build/bin/clang ~/llvm-project/c-programs/program5/program5.c -S -emit-llvm -o ~/llvm-project/c-programs/program5/program5.ll

echo "We are starting a script for generating the Assembly Codes"
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program1/program1.ll  -o ~/llvm-project/c-programs/program1/program1.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program2/program2.ll  -o ~/llvm-project/c-programs/program2/program2.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program3/program3.ll  -o ~/llvm-project/c-programs/program3/program3.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program4/program4.ll  -o ~/llvm-project/c-programs/program4/program4.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program5/program5.ll  -o ~/llvm-project/c-programs/program5/program5.s

echo "We are starting a script for generating various optimizations on llvm ir"
~/llvm-project/build/bin/opt -O3 ~/llvm-project/c-programs/program1/program1.ll  -o ~/llvm-project/c-programs/program1/program1_opt_o3.ll
~/llvm-project/build/bin/opt -O3 ~/llvm-project/c-programs/program2/program2.ll  -o ~/llvm-project/c-programs/program2/program2_opt_o3.ll
~/llvm-project/build/bin/opt -O3 ~/llvm-project/c-programs/program3/program3.ll  -o ~/llvm-project/c-programs/program3/program3_opt_o3.ll
~/llvm-project/build/bin/opt -O3 ~/llvm-project/c-programs/program4/program4.ll  -o ~/llvm-project/c-programs/program4/program4_opt_o3.ll
~/llvm-project/build/bin/opt -O3 ~/llvm-project/c-programs/program5/program5.ll  -o ~/llvm-project/c-programs/program5/program5_opt_o3.ll

echo "We are starting a script for generating assembly code after  optimizations on llvm ir"
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program1/program1_opt_o3.ll  -o ~/llvm-project/c-programs/program1/program1_after_opt.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program2/program2_opt_o3.ll  -o ~/llvm-project/c-programs/program2/program2_after_opt.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program3/program3_opt_o3.ll  -o ~/llvm-project/c-programs/program3/program3_after_opt.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program4/program4_opt_o3.ll  -o ~/llvm-project/c-programs/program4/program4_after_opt.s
~/llvm-project/build/bin/llc ~/llvm-project/c-programs/program5/program5_opt_o3.ll  -o ~/llvm-project/c-programs/program5/program5_after_opt.s

echo "We are starting a script for generating constant propagation optimizations on llvm ir"
~/llvm-project/build/bin/opt  -sccp -dot-cfg -dot-dom ~/llvm-project/c-programs/program1/program1.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program1/program1_opt_const_prop.ll
~/llvm-project/build/bin/opt  -sccp -dot-cfg -dot-dom ~/llvm-project/c-programs/program2/program2.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program2/program2_opt_const_prop.ll
~/llvm-project/build/bin/opt  -sccp -dot-cfg -dot-dom ~/llvm-project/c-programs/program3/program3.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program3/program3_opt_const_prop.ll
~/llvm-project/build/bin/opt  -sccp -dot-cfg -dot-dom ~/llvm-project/c-programs/program4/program4.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program4/program4_opt_const_prop.ll
~/llvm-project/build/bin/opt  -sccp -dot-cfg -dot-dom ~/llvm-project/c-programs/program5/program5.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program5/program5_opt_const_prop.ll

echo "We are starting a script for generating dce optimizations on llvm ir"
cd ~/llvm-project/c-programs/program1
~/llvm-project/build/bin/opt  -dot-cfg -dot-dom -dce  ~/llvm-project/c-programs/program1/program1.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program1/program1_opt_dce.ll
cd ~/llvm-project/c-programs/program2
~/llvm-project/build/bin/opt  -dot-cfg -dot-dom -dce  ~/llvm-project/c-programs/program2/program2.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program2/program2_opt_dce.ll
cd ~/llvm-project/c-programs/program3
~/llvm-project/build/bin/opt  -dot-cfg -dot-dom -dce  ~/llvm-project/c-programs/program3/program3.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program3/program3_opt_dce.ll
cd ~/llvm-project/c-programs/program4
~/llvm-project/build/bin/opt  -dot-cfg -dot-dom -dce  ~/llvm-project/c-programs/program4/program4.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program4/program4_opt_dce.ll
cd ~/llvm-project/c-programs/program5
~/llvm-project/build/bin/opt  -dot-cfg -dot-dom -dce  ~/llvm-project/c-programs/program5/program5.ll -enable-new-pm=0 -o ~/llvm-project/c-programs/program5/program5_opt_dce.ll

cd ~/llvm-project
echo "We are starting a script for generating outputs with relevant tools in LLVM - llvm-as, llvm-dis, llc, lli,"
echo "For llvm-as"

~/llvm-project/build/bin/llvm-as ~/llvm-project/c-programs/program1/program1.ll  -o ~/llvm-project/c-programs/program1/program1.bc
~/llvm-project/build/bin/llvm-as ~/llvm-project/c-programs/program2/program2.ll  -o ~/llvm-project/c-programs/program2/program2.bc
~/llvm-project/build/bin/llvm-as ~/llvm-project/c-programs/program3/program3.ll  -o ~/llvm-project/c-programs/program3/program3.bc
~/llvm-project/build/bin/llvm-as ~/llvm-project/c-programs/program4/program4.ll  -o ~/llvm-project/c-programs/program4/program4.bc
~/llvm-project/build/bin/llvm-as ~/llvm-project/c-programs/program5/program5.ll  -o ~/llvm-project/c-programs/program5/program5.bc



echo "For llvm-dis"

~/llvm-project/build/bin/llvm-dis ~/llvm-project/c-programs/program1/program1.bc  -o ~/llvm-project/c-programs/program1/program1_ll_using_dis.ll
~/llvm-project/build/bin/llvm-dis ~/llvm-project/c-programs/program2/program2.bc  -o ~/llvm-project/c-programs/program2/program2_ll_using_dis.ll
~/llvm-project/build/bin/llvm-dis ~/llvm-project/c-programs/program3/program3.bc  -o ~/llvm-project/c-programs/program3/program3_ll_using_dis.ll
~/llvm-project/build/bin/llvm-dis ~/llvm-project/c-programs/program4/program4.bc  -o ~/llvm-project/c-programs/program4/program4_ll_using_dis.ll
~/llvm-project/build/bin/llvm-dis ~/llvm-project/c-programs/program5/program5.bc  -o ~/llvm-project/c-programs/program5/program5_ll_using_dis.ll


# echo "Script for printing the LLVM IR"

# printf "\n\nprogram 1 \n\n"
# cat ~/llvm-project/c-programs/program1/program1_ll_using_dis.ll
# printf "\n\nprogram 2 \n\n"
# cat ~/llvm-project/c-programs/program2/program2_ll_using_dis.ll
# printf "\n\nprogram 3 \n\n"
# cat ~/llvm-project/c-programs/program3/program3_ll_using_dis.ll
# printf "\n\nprogram 4 \n\n"
# cat ~/llvm-project/c-programs/program4/program4_ll_using_dis.ll
# printf "\n\nprogram 5 \n\n"
# cat ~/llvm-project/c-programs/program5/program5_ll_using_dis.ll
