Spelunky Community Update Project
================================

Community bug fixing and updates to the original Spelunky for PC

Editing
-------
Use [Gmk-Splitter](http://medo42.github.io/Gmk-Splitter/) to turn the repo back into a `.gmk`

Something along the lines of:

    java -jar gmksplit.jar /spelunky/ spelunky.gmk
    java -jar gmksplit.jar /config/ config.gmk


Edit the gmk files with Game Maker 8 (not 8.1!)


Then use:

    java -jar gmksplit.jar  spelunky.gmk spelunky
    java -jar gmksplit.jar  config.gmk config

to export your changes back to the repo format.


Changes should always be made in Game Maker 8 for compatibility reasons.
Current windows builds for players should be compiled with Game Maker 8.1 however.
