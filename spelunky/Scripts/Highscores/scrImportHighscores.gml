// scrImportHighscores()
// Copy highscores from registry to Spelunky Portable data file

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

scoreFile = file_text_open_write(global.dataFile)

file_text_write_string(scoreFile, scrXORScores(tMoney, 1))
file_text_writeln(scoreFile)

// convert time from 1000/sec to sec to prevent overflow
global.time = floor(global.time / 1000);
file_text_write_string(scoreFile, scrXORScores(tTime, 2))
file_text_writeln(scoreFile)
    
file_text_write_string(scoreFile, scrXORScores(tKills, 3))
file_text_writeln(scoreFile)
    
file_text_write_string(scoreFile, scrXORScores(tSaves, 4))
file_text_writeln(scoreFile)
    
file_text_write_string(scoreFile, scrXORScores(tPlays, 5))
file_text_writeln(scoreFile)

file_text_write_string(scoreFile, scrXORScores(tWins, 6))
file_text_writeln(scoreFile)

file_text_write_string(scoreFile, scrXORScores(tDeaths, 7))
file_text_writeln(scoreFile)

file_text_write_string(scoreFile, scrXORScores(tTunnel1, 8))
global.tunnel1 = tTunnel1
file_text_writeln(scoreFile)

file_text_write_string(scoreFile, scrXORScores(tTunnel2, 9))
global.tunnel2 = tTunnel2
file_text_writeln(scoreFile)

file_text_write_string(scoreFile, scrXORScores((tMini1*10000)+(tMini2*100)+tMini3, 10));

file_text_close(scoreFile)
