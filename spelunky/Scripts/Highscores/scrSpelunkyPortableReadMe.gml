/*
=================
Spelunky Portable
by Moloch
=================

This is a Spelunky modification. For the original version, please visit www.spelunkyworld.com.
See "Game Information" for user license and copyright information.

    
    This Spelunky Portable source has not been modified from the original v1.1 source code in any way other    
    than what is listed in the details below in order to provide people starting new mods with a base to
    build on. The changes listed below are also intended to provide modders with existing mod projects with
    what they need to make their mod portable by exporting/importing the resources or copy/pasting.
    
    This Spelunky Portable source differs from the released compiled version:
        - There are no bug fixes.
        - The score file is not encrypted.

            

LIST OF CHANGES:
----------------

    Added: scrSpelunkyPortableReadMe
        - This documentation
        
    Added: scrGetScore
        - Replaces Game Maker's built in highscore_value function
  
    Changed: scrUpdateHighscores
        - Rewritten, original code in comments at bottom
    
    Changed: oGlobals
        Create Event
            - See lines 38-43
            - See lines 76-80
            - global.dataFile (line 41) is the path/filename used to store the scores
                referenced in scrGetScore, scrUpdateHighscores, scrResetHighscores
                    
    Changed: oTitle
        Create Event
            - See lines 25-34
    
    Changed: oHighscores
        Create Event
            - See lines 19-29
        Draw Event
            - Any line where "scrGetScore" appears has been changed
 
            

CHANGES TO ALLOW IMPORTING:            
---------------------------

In addition the the list above, these changes only deal with adding the option to import old scores from the
registry. Depending on what kind of mod you are making you may not need to do this.

    Added: scrImportHighScores
        - Reads scores from registry and writes them to Spelunky Portable data file
        - See oImportButton Left Mouse Button Released Event
        
    Added: scrResetRegistryScores
        - This is the old scrUpdateHighscores

    Added: oImport, oImportButton, oCompare
        - Objects for the import menu
        
    Added: sCompare, sImportButton, sImportButtonPressed
        - Sprites for the objects above

    Added: rImport
        - Room for import menu

    Changed: oScreen
        Create Event
            - Last block of code, line 36
            
    Change: oGlobals
        Create Event
            - See lines 61-74
            
    Changed: oTitle
        Press F1 Event
            - Added
        Alarm 3 Event
            - See line 4
        Draw Event
            - See lines 29-37
        Create Event
            - See line 11
            - See lines 96-100                    

                         
*/
