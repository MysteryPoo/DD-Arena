/// @description Start
alarm[0] = room_speed * 2;

mStateMap = ds_map_create();

enum BOTSTATE {
	IDLE,
	SITREP,
	GETINRANGE,
	GETOUTOFRANGE,
	ATTACK,
	DODGE,
	GETAMMO
};
