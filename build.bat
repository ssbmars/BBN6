@echo off
armips bbn6.asm -equ VERSION 1 -equ AM_DEBUGGING 0 -sym output\output_bn6f.sym
armips bbn6.asm -equ VERSION 2 -equ AM_DEBUGGING 0 -sym output\output_bn6g.sym

timeout 3