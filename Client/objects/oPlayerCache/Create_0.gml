/// @description oPlayerCache->Create

mCache = ds_map_create();
mRequestQueue = ds_list_create();

// Offline player cache
var player1 = ds_map_create();
player1[?"id"] = "1";
player1[?"username"] = "Player 1";
player1[?"avatarURI"] = "empty";
player1[?"diceURI"] = "empty";
player1[?"rank"] = 0;
mCache[?"1"] = player1;

var player2 = ds_map_create();
player2[?"id"] = "2";
player2[?"username"] = "Player 2";
player2[?"avatarURI"] = "empty";
player2[?"diceURI"] = "empty";
player2[?"rank"] = 0;
mCache[?"2"] = player2;

var player3 = ds_map_create();
player3[?"id"] = "3";
player3[?"username"] = "Player 3";
player3[?"avatarURI"] = "empty";
player3[?"diceURI"] = "empty";
player3[?"rank"] = 0;
mCache[?"3"] = player3;

var player4 = ds_map_create();
player4[?"id"] = "4";
player4[?"username"] = "Player 4";
player4[?"avatarURI"] = "empty";
player4[?"diceURI"] = "empty";
player4[?"rank"] = 0;
mCache[?"4"] = player4;
