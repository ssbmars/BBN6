@echo off
armips build.asm -strequ GameName bn6f -equ AM_DEBUGGING 0 -sym out/output_bn6f.sym
armips build.asm -strequ GameName bn6g -equ AM_DEBUGGING 0 -sym out/output_bn6g.sym
armips build.asm -strequ GameName exe6f -equ AM_DEBUGGING 0 -sym out/output_exe6f.sym
armips build.asm -strequ GameName exe6g -equ AM_DEBUGGING 0 -sym out/output_exe6g.sym

armips buildsound.asm -strequ GameName bn6f -equ AM_DEBUGGING 0 -sym out/output_bn6fsound.sym
armips buildsound.asm -strequ GameName bn6g -equ AM_DEBUGGING 0 -sym out/output_bn6gsound.sym
armips buildsound.asm -strequ GameName exe6f -equ AM_DEBUGGING 0 -sym out/output_exe6fsound.sym
armips buildsound.asm -strequ GameName exe6g -equ AM_DEBUGGING 0 -sym out/output_exe6gsound.sym

flips -c -b "rom/bn6f.gba" "out/output_bn6f.gba" "out/patch/bn6/BR6E_00.bps"
flips -c -b "rom/bn6g.gba" "out/output_bn6g.gba" "out/patch/bn6/BR5E_00.bps"
flips -c -b "rom/exe6f.gba" "out/output_exe6f.gba" "out/patch/exe6/BR6J_00.bps"
flips -c -b "rom/exe6g.gba" "out/output_exe6g.gba" "out/patch/exe6/BR5J_00.bps"

flips -c -b "rom/bn6f.gba" "out/output_bn6fsound.gba" "out/patch/bn6_soundmod/BR6E_00.bps"
flips -c -b "rom/bn6g.gba" "out/output_bn6gsound.gba" "out/patch/bn6_soundmod/BR5E_00.bps"
flips -c -b "rom/exe6f.gba" "out/output_exe6fsound.gba" "out/patch/exe6_soundmod/BR6J_00.bps"
flips -c -b "rom/exe6g.gba" "out/output_exe6gsound.gba" "out/patch/exe6_soundmod/BR5J_00.bps"

timeout 3