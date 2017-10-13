/// @description Create camera

//Set view size
view_width = global.view_width;
view_height = global.view_height;

//Enble views
view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, view_width);
view_set_hport(0, view_height);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface, view_wport[0], view_hport[0]);

//Camera creation
camera = camera_create_view(0, 0, view_width, view_height, 0, id, -1, -1, view_width / 2, view_height / 2);

//Set view0 to use the camera "camera"
view_set_camera(0, camera);

//Set target
target = obj_player;
offset = 0;
offset_target = 0;