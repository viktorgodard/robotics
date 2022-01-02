# Civilization on Linux

20210101 Viktor Godard

Search for Civilization on the Ubuntu Linux repos:

    apt search civilization

> freeciv/focal,focal 2.6.2-1 all
>  Civilization turn based strategy game

The version on the Ubuntu repo is 2.6.2, the one at the Freeciv website is 2.6.6, so we are going to stick with the repo one.

The recommendation is that unless the package on the repo is way behind, it is always preferable to stick to the Ubuntu repo.

Get info on the main Civilization package:

    apt info freeciv

> Homepage: http://www.freeciv.org/
> Download-Size: 1,240 B
> APT-Sources: http://us.archive.ubuntu.com/ubuntu focal/universe amd64 Packages
> Description: Civilization turn based strategy game
>  Freeciv is a free clone of the turn based strategy game Civilization.
>  In this game, each player becomes leader of a civilisation, fighting to
>  obtain the ultimate goal: the extinction of all other civilisations.
>
>  This metapackage will install the recommended client to play Freeciv.


Install Civilization:

    sudo apt install freeciv

On the Ubuntu GUI, search for the FreeCiv icon and start the game.

For more information and/or to participate on the project, go to: http://www.freeciv.org/


