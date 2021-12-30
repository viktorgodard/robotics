20211223
Viktor Godard

Installing DOOM on Ubuntu Linux

I found 2 possibilities:

1- Using the DoomsDay Engine:
   https://www.addictivetips.com/ubuntu-linux-tips/play-classic-doom-linux-doomsday-engine/

2- Using the PRBoom Engine:
   https://securitronlinux.com/installing-and-playing-the-classic-pc-doom-game-on-linuxubuntu/

###

1- Using DoomsDay

Note: the article recommends to get it from the Dengine.net website with wget, but I prefer to use the version included on the Ubuntu repos even if it is a bit older (it is safer this way).

1.1- Search for the Engine package:
     sudo apt search doomsday

1.2- Install the Engine package:
     sudo apt install doomsday

1.3- Install the Shareware version of the game:
     sudo apt install doom-wad-shareware

1.4- On the GUI, open the Doomsday Engine via icon
     then look for DOOM Shareware and start it.

1.5- play the game, F1 = help, F2 = save, F3 = load, TAB = map, F7 = exit

1.6- Also try the Freedom phase 1 and 2 versions of the game! :)
     at the Doomsday Engine click on Other, then Freedom: Phase1 or Phase2

1.7- Heretic Shareware and Hexen demo are options too, but I have never
     played those games.

1.8- Lastly, TODO: Try installing the doomsday-server, so you can create a 
     LAN party 1990 Style ;)


####
NOTE: Since Option 1 worked, I did not bother to try option 2 (PRBoom)
      Also note that you cannot play Doom via Steam on Linux.
####

Enjoy!
