if (!global.is_dead && !global.camera_up) {
    var mx = device_mouse_x_to_gui(0); 
	var screen_w = display_get_gui_width();
	var center_x = screen_w / 2;

	var pan_speed = 0;
	var distance_from_center = mx - center_x;

	if (abs(distance_from_center) > 100) {
	    pan_speed = distance_from_center * 0.015;
	}

    if (pan_speed != 0) {
        var cam = view_camera[0];
        var cam_x = camera_get_view_x(cam);
        var cam_w = camera_get_view_width(cam);
        
        cam_x += pan_speed;
        
        cam_x = clamp(cam_x, 0, room_width - cam_w);
        
        camera_set_view_pos(cam, cam_x, 0);
    }
}