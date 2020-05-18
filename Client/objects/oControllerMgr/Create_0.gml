/// @description Create Controllers
mControllers = [
	instance_create_layer(0, 0, "Managers", oController),
	instance_create_layer(0, 0, "Managers", oController)
];

mControllers[0].image_blend = c_red;
mControllers[1].image_blend = c_blue;

alarm[0] = 5; // Start processing input

// TESTING
mIsLeft = false;
mIsRight = false;
mIsUp = false;
mIsDown = false;
mIsPrimaryAction = false;
mIsSecondaryAction = false;
