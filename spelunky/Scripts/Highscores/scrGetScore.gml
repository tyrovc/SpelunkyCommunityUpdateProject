// This script was added for Spelunky Portable
// Please see scrSpelunkyPortable for detailed information

// scrGetScore(entry)
// Returns a specific score value
// This replaces the highscore_value() function
// Called by oGlobals > Create Event

/*
argument0:
1 = Money
2 = Time
3 = Kills
4 = Saves
5 = Plays
6 = Wins
7 = Deaths
8 = Tunnel 1
9 = Tunnel 2
10 = Mini games
*/

if argument0 < 1 or argument0 > 10 return 0

var myScore;
myScore = argument0

scoreFile = file_text_open_read(global.dataFile)
if scoreFile
{
    var i, scoreValue;
    i = 1
    while (i != myScore)
    {
        file_text_readln(scoreFile)
        if file_text_eof(scoreFile)
        {
            file_text_close(scoreFile)
            if myScore == 8 return global.tunnel1Max+1
            else if myScore == 9 return global.tunnel2Max+1
            else return 0
        }
        i += 1
    }
    scoreValue = real(scrXORScores(file_text_read_string(scoreFile),real(argument0)));
    file_text_close(scoreFile)
    return scoreValue;
}
else
{
    if myScore == 8 return global.tunnel1Max+1 // default 'new game' values
    else if myScore == 9 return global.tunnel2Max+1
    else return 0
}
