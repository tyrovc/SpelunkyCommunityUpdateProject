
//Start looping a sound. It will play until you stop it.

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_LoopSound,argument0);


