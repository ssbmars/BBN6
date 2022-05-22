# BBN6
 
Build environment for researching and implementing improvements and fixes to the pvp mode in Battle Network 6  
This is designed to be used with the Tango netplay solution over at <https://github.com/tangobattle/tango>  

Compatible with BN6 and EXE6  
Supported md5 hashes:  
BN6 Falzar `1e8c774ba210d1c55113531c7360c737`  
BN6 Gregar `5acc75848bb1ffd3d6d8705554ee333d`  
EXE6 Falzar `0e3ed3a6cc2f201897c58cb31d43a35f`  
EXE6 Gregar `053cf73404dcc39be7cbd77c8e833150`  

## Features
Fixed a bug in which every hitbox that collides with a target on the same frame is made to completely overwrite the decross flag, which causes only the last hitbox that's processed on a frame to decide whether a player gets decrossed.  

When Windrack is used point-blank against someone who is protected by a barrier, the gusts from the windrack will always have a chance to move the player. This is accomplished by having the wind gust linger at its original position for 2 frames when it's first spawned.  

When Thunder or BugDeathThunder is on the same panel as the character that it's targeting, it will no longer move in a hardcoded direction irrespective of which side spawned it. Instead it will now move in the direction regarded as "forward" by the player who spawned the thunder.

  
## Clarification
The extra B in BBN6 stands for Bingus  
