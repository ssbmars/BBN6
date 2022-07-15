@echo off
armips build.asm -strequ GameName bn6f -equ AM_DEBUGGING 0 -sym out/output_bn6f.sym
armips build.asm -strequ GameName bn6g -equ AM_DEBUGGING 0 -sym out/output_bn6g.sym
armips build.asm -strequ GameName exe6f -equ AM_DEBUGGING 0 -sym out/output_exe6f.sym
armips build.asm -strequ GameName exe6g -equ AM_DEBUGGING 0 -sym out/output_exe6g.sym

flips -c -b "rom/bn6f.gba" "out/output_bn6f.gba" "out/patch/MEGAMAN6_FXXBR6E_00.bps"
flips -c -b "rom/bn6g.gba" "out/output_bn6g.gba" "out/patch/MEGAMAN6_GXXBR5E_00.bps"
flips -c -b "rom/exe6f.gba" "out/output_exe6f.gba" "out/patch/ROCKEXE6_RXXBR6J_00.bps"
flips -c -b "rom/exe6g.gba" "out/output_exe6g.gba" "out/patch/ROCKEXE6_GXXBR5J_00.bps"

timeout 3