@echo off
armips bbn6.asm -equ VERSION 1 -equ AM_DEBUGGING 0 -sym out\output_bn6f.sym
armips bbn6.asm -equ VERSION 2 -equ AM_DEBUGGING 0 -sym out\output_bn6g.sym

flips -c -b "rom\bn6f.gba" "out\output_bn6f.gba" "out/patch/bbn6f.bps"
flips -c -b "rom\bn6g.gba" "out\output_bn6g.gba" "out/patch/bbn6g.bps"

timeout 3