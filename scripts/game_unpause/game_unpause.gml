///@description unpauses game and deletes caller

global.pause = false;
instance_activate_all();
instance_destroy();