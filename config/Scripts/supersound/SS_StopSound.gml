
//Stop a playing sound. Especially useful with looped sounds.

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: void
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_StopSound,argument0);


