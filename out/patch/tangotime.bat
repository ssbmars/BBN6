@echo off
set /p name="version name [x.y.z] : "
@echo PRESS F
xcopy /v /y "bbn6f.bps" tango_patches\bn6f_bingus\v%name%.bps
xcopy /v /y "bbn6g.bps" tango_patches\bn6g_bingus\v%name%.bps
xcopy /v /y "bexe6f.bps" tango_patches\exe6f_bingus\v%name%.bps
xcopy /v /y "bexe6g.bps" tango_patches\exe6g_bingus\v%name%.bps
timeout 2