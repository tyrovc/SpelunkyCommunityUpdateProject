
//Unload a sound from memory

//Normally not needed unless you've got a lot of sounds
//or use some very large sounds

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
external_call(global.dll_SS_StopSound,argument0);
return external_call(global.dll_SS_FreeSound,argument0);


