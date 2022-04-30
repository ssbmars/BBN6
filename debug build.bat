@echo off
armips bbn6.asm -equ VERSION 1 -equ AM_DEBUGGING 1 -sym out\output_bn6f.sym
armips bbn6.asm -equ VERSION 2 -equ AM_DEBUGGING 1 -sym out\output_bn6g.sym

timeout 2