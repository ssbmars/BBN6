@echo off
echo BODY
armips BODY.asm -strequ GameName bn6f -equ AM_DEBUGGING 0 -sym out/output_bn6frek.sym
armips BODY.asm -strequ GameName bn6g -equ AM_DEBUGGING 0 -sym out/output_bn6grek.sym

flips -c -b "rom/bn6f.gba" "out/output_bn6frek.gba" "out/patch/toldme/BR6E_00.bps"
flips -c -b "rom/bn6g.gba" "out/output_bn6grek.gba" "out/patch/toldme/BR5E_00.bps"

echo I said yep, what a concept
timeout 3