@echo off
armips build.asm -strequ GameName bn6f -equ AM_DEBUGGING 0 -sym out\output_bn6f.sym
armips build.asm -strequ GameName bn6g -equ AM_DEBUGGING 0 -sym out\output_bn6g.sym
armips build.asm -strequ GameName exe6f -equ AM_DEBUGGING 0 -sym out\output_exe6f.sym
armips build.asm -strequ GameName exe6g -equ AM_DEBUGGING 0 -sym out\output_exe6g.sym

flips -c -b "rom\bn6f.gba" "out\output_bn6f.gba" "out/patch/bbn6f.bps"
flips -c -b "rom\bn6g.gba" "out\output_bn6g.gba" "out/patch/bbn6g.bps"
flips -c -b "rom\exe6f.gba" "out\output_exe6f.gba" "out/patch/bexe6f.bps"
flips -c -b "rom\exe6g.gba" "out\output_exe6g.gba" "out/patch/bexe6g.bps"

timeout 3