var str, key;
str = string(argument0);
key = "Th1sIsTh3D3faultK3y";
if(!(argument1>0 && argument1<11)){show_message("Encryption error!");}

switch (argument1)
{
    case 1: { key = "QEXCONSDFXC"; break; }
    case 2: { key = "AWERVDFCXVC"; break; }
    case 3: { key = "HPSDFIOJNOI"; break; }
    case 4: { key = "ZDFHOSFDOUH"; break; }
    case 5: { key = "XCVIOPDJFIO"; break; }
    case 6: { key = "SDUIZ0CVHIO"; break; }
    case 7: { key = "VC0JRTAJMNK"; break; }
    case 8: { key = "SERIOJSHDFX"; break; }
    case 9: { key = "XCVIPOJAEJJ"; break; }
    case 10:{ key = "ASDJHXCJVIP"; break; }
}
keylength=string_length(key);

var a, b, c, d, t, v;

a = string_length(str);
b = string_length(key);
t = "";
d = 0;
for (c = 1; c <= a; c += 1)
{
    d = (d mod b) + 1;
    v = ord(string_char_at(str, c)) ^ ord(string_char_at(key, d));
    t = t + chr(v);
}
return t;
