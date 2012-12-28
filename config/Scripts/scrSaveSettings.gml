//
// scrSaveSettings()
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

file = file_text_open_write("settings.cfg");
if (global.fullscreen) file_text_write_string(file, "1");
else file_text_write_string(file, "0");
file_text_writeln(file);
if (global.graphicsHigh) file_text_write_string(file, "1");
else file_text_write_string(file, "0");
file_text_writeln(file);
if (global.downToRun) file_text_write_string(file, "1");
else file_text_write_string(file, "0");
file_text_writeln(file);
if (global.gamepadOn) file_text_write_string(file, "1");
else file_text_write_string(file, "0");
file_text_writeln(file);
file_text_write_string(file, string(global.screenScale));
file_text_writeln(file);
file_text_write_string(file, string(global.musicVol));
file_text_writeln(file);
file_text_write_string(file, string(global.soundVol));
file_text_close(file);
