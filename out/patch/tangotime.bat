@echo off
set /p name="version name [x.y.z] : "

xcopy /v /y "MEGAMAN6_FXXBR6E_00.bps" tango_patches\bn6_bingus\v%name%\
xcopy /v /y "MEGAMAN6_GXXBR5E_00.bps" tango_patches\bn6_bingus\v%name%\
xcopy /v /y "ROCKEXE6_RXXBR6J_00.bps" tango_patches\exe6_bingus\v%name%\
xcopy /v /y "ROCKEXE6_GXXBR5J_00.bps" tango_patches\exe6_bingus\v%name%\


timeout 3