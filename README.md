# BBN6
 
Build environment for researching and implementing improvements and fixes to the pvp mode in Battle Network 6  
This is designed to be used with the Tango netplay solution over at <https://github.com/murkland/tango>  

Compatible with BN6 Falzar and BN6 Gregar  
Support for EXE6 Falzar and Gregar is also planned

## Features
When Windrack is used point-blank against someone who is protected by a barrier, the gusts from the windrack will always have a chance to move the player. (The spawning of Windrack's gusts have been delayed by 1 frame.)  

When Thunder or BugDeathThunder is on the same panel as the character that it's targeting, it will no longer move in a hardcoded direction irrespective of which side spawned it. Instead it will now move in the direction regarded as "forward" by the player who spawned the thunder.




## Clarification
The extra B in BBN6 stands for Bingus  

Unlike the old version of BBN3 netcode, the new implementation of rollback netcode does not require any changes on the part of the rom, so BN6 Tango netplay can be played without this romhack.
