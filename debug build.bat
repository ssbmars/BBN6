@echo off
armips build.asm -strequ GameName bn6f -equ AM_DEBUGGING 1 -sym out\output_bn6f.sym
armips build.asm -strequ GameName bn6g -equ AM_DEBUGGING 1 -sym out\output_bn6g.sym

timeout 2