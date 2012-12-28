//
// scrDrawHUD()
//
// Draw the HUD.  This is called in the Draw Event of oGame.
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

if (global.drawHUD and instance_exists(oPlayer1))
{
    lifeX = 8;
    bombX = 64;
    ropeX = 120;
    moneyX = 176;
    draw_set_font(global.myFont);
    draw_set_color(c_white);
    draw_sprite(sHeart, -1, lifeX, 8);
    life = global.plife;
    if (life < 0) life = 0;
    draw_text(lifeX+16, 8, life);
    if (global.hasStickyBombs) draw_sprite(sStickyBombIcon, -1, bombX, 8);
    else draw_sprite(sBombIcon, -1, bombX, 8);
    draw_text(bombX+16, 8, global.bombs);
    draw_sprite(sRopeIcon, -1, ropeX, 8);
    draw_text(ropeX+16, 8, global.rope);
    draw_sprite(sDollarSign, -1, moneyX, 8);
    draw_text(moneyX+16, 8, global.money);

    if (isRoom("rOlmec")) { global.exitX = 640; global.exitY = 544; }
    
    if (global.hasCompass)
    {
        if (global.exitY > view_yview[0] + 240)
        {
            if (global.exitX < view_xview[0])
            {
                if (global.messageTimer > 0) draw_sprite(sCompassSmallLL, -1, 0, 224);
                else draw_sprite(sCompassLL, -1, 0, 224);
            }
            else if (global.exitX > view_xview[0]+320-16)
            {
                if (global.messageTimer > 0) draw_sprite(sCompassSmallLR, -1, 304, 224);
                else draw_sprite(sCompassLR, -1, 304, 224);
            }
            else
            {
                if (global.messageTimer > 0) draw_sprite(sCompassSmallDown, -1, global.exitX-view_xview[0], 224);
                else draw_sprite(sCompassDown, -1, global.exitX-view_xview[0], 224);
            }
        }
        else if (global.exitX < view_xview[0])
        {
            if (global.messageTimer > 0) draw_sprite(sCompassSmallLeft, -1, 0, global.exitY-view_yview[0]);
            else draw_sprite(sCompassLeft, -1, 0, global.exitY-view_yview[0]);
        }
        else if (global.exitX > view_xview[0]+320-16)
        {
            if (global.messageTimer > 0) draw_sprite(sCompassSmallRight, -1, 304, global.exitY-view_yview[0]);
            else draw_sprite(sCompassRight, -1, 304, global.exitY-view_yview[0]);
        }
    }
    
    draw_sprite(sHoldItemIcon, -1, 8, 24);
    if (oPlayer1.pickupItemType!= "")
    {
        if (oPlayer1.pickupItemType== "Rock") draw_sprite(sRock, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Jar") draw_sprite(sJar, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Skull") draw_sprite(sSkull, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Fish Bone") draw_sprite(sFishBone, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Arrow") draw_sprite(sArrowRight, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Machete") draw_sprite(sMacheteRight, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Mattock") draw_sprite(sMattockRight, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Mattock Head") draw_sprite(sMattockHead, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Pistol") draw_sprite(sPistolRight, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Web Cannon") draw_sprite(sWebCannonR, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Teleporter") draw_sprite(sTeleporter, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Shotgun") draw_sprite(sShotgunRight, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Bow") draw_sprite(sBowDisp, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Sceptre") draw_sprite(sSceptreRight, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Flare") draw_sprite(sFlare, -1, 8+8, 24+8);
        else if (oPlayer1.pickupItemType== "Key") draw_sprite(sKeyRight, -1, 8+8, 24+8);
    }
    
    n = 28;
    if (global.hasUdjatEye)
    {
        if (global.udjatBlink) draw_sprite(sUdjatEyeIcon2, -1, n, 24);
        else draw_sprite(sUdjatEyeIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasAnkh)
    {
        draw_sprite(sAnkhIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasCrown)
    {
        draw_sprite(sCrownIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasKapala)
    {
        if (global.bloodLevel == 0) draw_sprite(sKapalaIcon, 0, n, 24);
        else if (global.bloodLevel <= 2) draw_sprite(sKapalaIcon, 1, n, 24);
        else if (global.bloodLevel <= 4) draw_sprite(sKapalaIcon, 2, n, 24);
        else if (global.bloodLevel <= 6) draw_sprite(sKapalaIcon, 3, n, 24);
        else if (global.bloodLevel <= 8) draw_sprite(sKapalaIcon, 4, n, 24);
        n += 20;
    }
    if (global.hasSpectacles)
    {
        draw_sprite(sSpectaclesIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasGloves)
    {
        draw_sprite(sGlovesIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasMitt)
    {
        draw_sprite(sMittIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasSpringShoes)
    {
        draw_sprite(sSpringShoesIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasSpikeShoes)
    {
        draw_sprite(sSpikeShoesIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasCape)
    {
        draw_sprite(sCapeIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasJetpack)
    {
        draw_sprite(sJetpackIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasCompass)
    {
        draw_sprite(sCompassIcon, -1, n, 24);
        n += 20;
    }
    if (global.hasParachute)
    {
        draw_sprite(sParachuteIcon, -1, n, 24);
        n += 20;
    }
    if (oPlayer1.pickupItemType == "Bow")
    {
        m = global.arrows;
        while (m > 0)
        {
            draw_sprite(sArrowIcon, -1, n, 24);
            n += 4;
            m -= 1;
        }
    }
     
    draw_set_font(global.myFontSmall);
    draw_set_color(c_yellow);
    if (global.collect > 0) draw_text(moneyX, 8+16, "+" + string(global.collect));
}
