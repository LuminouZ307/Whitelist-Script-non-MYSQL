#include <a_samp>
#include <dini>
#include <ZCMD>


//Define Warna
#define COLOR_WHITE   0xFFFBFFFF
#define COLOR_YELLOW    0xFFFB00FF

//Define Dialog
#define DIALOG_WHITELIST 3
#define DIALOG_BLACKLIST 2
#define DIALOG_KICK      1

//Define Function
#define SCM SendClientMessage

public OnFilterScriptInit()
{
        print("--------------------------------------");
        print(" Whitelist system by LuminouZ");
        print("--------------------------------------");
        return 1;
}
public OnFilterScriptExit()
{
        print("--------------------------------------");
        print(" Whitelist system by LuminouZ");
        print("--------------------------------------");
        return 1;
}
public OnPlayerConnect(playerid)
{
    new name[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, name, sizeof(name));
    new player[200];
    format(player,sizeof(player),"/Whitelist/%s.txt",name);
    if(!dini_Exists(player))
    {
        ShowPlayerDialog(playerid,DIALOG_KICK,DIALOG_STYLE_MSGBOX,"{00FFFF}SERVER - WHITELIST","{FF0000}INFORMATION:\n\n{FFFFFF}Namamu belum terdaftar sebagai Whitelist di Server {FFFF00}LuminouZ Roleplay\n{FFFFFF}Silahkan Request Whitelist terlebih dahulu untuk lanjut bermain.","Oke","");
        SetTimerEx("KickTimer",3000,0,"i",playerid);
    }
    else
    {
        SCM(playerid, COLOR_YELLOW, "SERVER: {FFFFFF}Namamu telah terdaftar di Whitelist server!");
    }
    return 1;
}
CMD:whitelist(playerid, params[])
{
    if(IsPlayerAdmin(playerid))
    {
        new String[256];
		if(isnull(params)) return SendClientMessage(playerid, COLOR_YELLOW, "USAGE: {FFFFFF}/whitelist [Player_Name]");
		format(String,sizeof(String),"Whitelist/%s.txt", params);
		dini_Create(String);
		SCM(playerid, COLOR_YELLOW, "SERVER: {FFFFFF}Berhasil Memasukan nama tersebut kedalam Whitelist!");
	}
	else
	{
	    SendClientMessage(playerid, COLOR_YELLOW, "Kamu bukan Administrator!");
	}
	return 1;
}
forward KickTimer(playerid);
public KickTimer(playerid)
{
	Kick(playerid);
	return 1;
}
