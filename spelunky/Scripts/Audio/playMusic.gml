if (global.music and not SS_IsSoundPlaying(argument0))
{
    if (argument1)
        SS_LoopSound(argument0);
    else
        SS_PlaySound(argument0);
}