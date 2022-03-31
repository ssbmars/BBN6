@echo off
armips bbn6.asm -equ IS_BN6F 1 -equ IS_BN6G 0 -equ IS_EXE6F 0 -equ IS_EXE6G 0 -sym output\output_bn6f.sym
armips bbn6.asm -equ IS_BN6F 0 -equ IS_BN6G 1 -equ IS_EXE6F 0 -equ IS_EXE6G 0 -sym output\output_bn6g.sym

timeout 3