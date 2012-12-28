// scrUpdateHighscores(type)
// type: 0 = game over, 1 = win, 2 = minigame
// Spelunky Portable

if (global.keepScore)
{
    
    // retrieve highscore values from highscore list
    tMoney = scrGetScore(1);
    tTime = scrGetScore(2);
    tKills = scrGetScore(3);
    tSaves = scrGetScore(4);
    tPlays = scrGetScore(5);
    tWins = scrGetScore(6);
    tDeaths = scrGetScore(7);
    tTunnel1 = scrGetScore(8);
    tTunnel2 = scrGetScore(9);
    tMini1 = floor(scrGetScore(10) / 10000);
    tMini2 = floor((scrGetScore(10)-(tMini1*10000)) / 100);
    tMini3 = floor(scrGetScore(10)-(tMini1*10000)-(tMini2*100));
    
    scoreFile = file_text_open_write(global.dataFile);
        
    if (global.money > tMoney)
    {
        file_text_write_string(scoreFile, scrXORScores(global.money,1));
        global.newMoney = true;
    }
    else file_text_write_string(scoreFile, scrXORScores(tMoney,1));
    
    file_text_writeln(scoreFile);
    
    // convert time from 1000/sec to sec to prevent overflow
    global.time = floor(global.time / 1000);
    
    if (argument0 == 1 and (global.time < tTime or tTime == 0) and not global.usedShortcut)
    {
        file_text_write_string(scoreFile, scrXORScores(global.time,2));
        global.newTime = true;
    }
    else file_text_write_string(scoreFile, scrXORScores(tTime,2));
    
    file_text_writeln(scoreFile);
        
    if (global.kills > tKills)
    {
        file_text_write_string(scoreFile, scrXORScores(global.kills,3));
        global.newKills = true;
    }
    else file_text_write_string(scoreFile, scrXORScores(tKills,3));
    
    file_text_writeln(scoreFile);
        
    if (global.damsels > tSaves)
    {
        file_text_write_string(scoreFile, scrXORScores(global.damsels,4));
        global.newSaves = true;
    }
    else file_text_write_string(scoreFile, scrXORScores(tSaves,4));
    
    file_text_writeln(scoreFile);
        
    if (argument0 == 2) file_text_write_string(scoreFile, scrXORScores(tPlays,5));
    else file_text_write_string(scoreFile, scrXORScores(tPlays + 1,5));
    
    file_text_writeln(scoreFile);
    
    if (argument0 == 1)
    {
        file_text_write_string(scoreFile, scrXORScores(tWins + 1,6));
        file_text_writeln(scoreFile);
        file_text_write_string(scoreFile, scrXORScores(tDeaths,7));
    }
    else if (argument0 == 2)
    {
        file_text_write_string(scoreFile, scrXORScores(tWins,6));
        file_text_writeln(scoreFile);
        file_text_write_string(scoreFile, scrXORScores(tDeaths,7));
    }
    else
    {
        file_text_write_string(scoreFile, scrXORScores(tWins,6));
        file_text_writeln(scoreFile);
        file_text_write_string(scoreFile, scrXORScores(tDeaths + 1,7));
    }
    
    file_text_writeln(scoreFile);
    
    file_text_write_string(scoreFile, scrXORScores(global.tunnel1,8)); // This is how much you 'owe' the tunnel man before he builds the first shortcut
    file_text_writeln(scoreFile);
    
    file_text_write_string(scoreFile, scrXORScores(global.tunnel2,9));
    file_text_writeln(scoreFile);
    
    if (global.mini1 > tMini1)
    {
        tMini1 = global.mini1;
        with oSunRoom { highscore = true; }
    }
    if (global.mini2 > tMini2)
    {
        tMini2 = global.mini2;
        with oMoonRoom { highscore = true; }
    }
    if (global.mini3 > tMini3)
    {
        tMini3 = global.mini3;
        with oStarsRoom { highscore = true; }
    }
    
    file_text_write_string(scoreFile, scrXORScores((tMini1*10000)+(tMini2*100)+tMini3,10));
    
    file_text_close(scoreFile);
}


//
// scrUpdateHighscores(type)
//
// type: 0 = game over, 1 = win, 2 = minigame
//
// Update "highscores".  Spelunky uses Game Maker's built-in highscore system to
// keep track of various data.  To ensure that each value is added to the right
// slot, we add a high number (some multiple of a million) to the value.
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

/*
if (global.keepScore)
{

// retrieve highscore values from highscore list
tMoney = highscore_value(1) - 9000000;
tTime = highscore_value(2) - 8000000;
tKills = highscore_value(3) - 7000000;
tSaves = highscore_value(4) - 6000000;
tPlays = highscore_value(5) - 5000000;
tWins = highscore_value(6) - 4000000;
tDeaths = highscore_value(7) - 3000000;
tTunnel1 = highscore_value(8) - 2000000;
tTunnel2 = highscore_value(9) - 1000000;
tMini1 = floor(highscore_value(10) / 10000);
tMini2 = floor((highscore_value(10)-(tMini1*10000)) / 100);
tMini3 = floor(highscore_value(10)-(tMini1*10000)-(tMini2*100));
    
highscore_clear();
    
if (global.money > tMoney)
{
    highscore_add("MONEY", global.money + 9000000);
    global.newMoney = true;
}
else highscore_add("MONEY", tMoney + 9000000);

// convert time from 1000/sec to sec to prevent overflow
global.time = floor(global.time / 1000);

if (argument0 == 1 and (global.time < tTime or tTime == 0) and not global.usedShortcut)
{
    highscore_add("TIME", global.time + 8000000);
    global.newTime = true;
}
else highscore_add("TIME", tTime + 8000000);
    
if (global.kills > tKills)
{
    highscore_add("KILLS", global.kills + 7000000);
    global.newKills = true;
}
else highscore_add("KILLS", tKills + 7000000);
    
if (global.damsels > tSaves)
{
    highscore_add("SAVES", global.damsels + 6000000);
    global.newSaves = true;
}
else highscore_add("SAVES", tSaves + 6000000);
    
if (argument0 == 2) highscore_add("PLAYS", tPlays + 5000000);
else highscore_add("PLAYS", tPlays + 1 + 5000000);

if (argument0 == 1)
{
    highscore_add("WINS", tWins + 1 + 4000000);
    highscore_add("DEATHS", tDeaths + 3000000);
}
else if (argument0 == 2)
{
    highscore_add("WINS", tWins + 4000000);
    highscore_add("DEATHS", tDeaths + 3000000);
}
else
{
    highscore_add("WINS", tWins + 4000000);
    highscore_add("DEATHS", tDeaths + 1 + 3000000);
}

highscore_add("TUNNEL1", global.tunnel1 + 2000000);

highscore_add("TUNNEL2", global.tunnel2 + 1000000);

if (global.mini1 > tMini1)
{
    tMini1 = global.mini1;
    with oSunRoom { highscore = true; }
}
if (global.mini2 > tMini2)
{
    tMini2 = global.mini2;
    with oMoonRoom { highscore = true; }
}
if (global.mini3 > tMini3)
{
    tMini3 = global.mini3;
    with oStarsRoom { highscore = true; }
}

highscore_add("MINIGAMES", (tMini1*10000)+(tMini2*100)+tMini3);
}
*/
