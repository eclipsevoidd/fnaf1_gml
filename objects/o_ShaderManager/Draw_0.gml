var _cam = view_camera[0];
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);
var _cx = camera_get_view_x(_cam);
var _cy = camera_get_view_y(_cam);

if (!surface_exists(office_surf)) {
    office_surf = surface_create(_w, _h);
}

surface_set_target(office_surf);
draw_clear_alpha(c_black, 0);

// This matrix aligns the 3D room to the 2D surface
matrix_set(matrix_world, matrix_build(-_cx, -_cy, 0, 0, 0, 0, 1, 1, 1));

with (o_Office) draw_self();
with (o_Fan) draw_self();
with (o_DoorLeft) draw_self();
with (o_DoorRight) draw_self();
with (o_DoorButtonL) draw_self();
with (o_DoorButtonR) draw_self();

// visual camera
with (o_CameraFeed) {
    if (global.camera_up && !global.is_dead) {
        var current_sprite = global.camera_feeds[global.current_cam];
        
        // FIX: Check the array to see if THIS SPECIFIC camera is currently blacked out!
        if (global.camera_blackouts[global.current_cam] > 0) {
            draw_set_color(c_black);
            draw_rectangle(_cx - 100, _cy - 100, _cx + _w + 100, _cy + _h + 100, false); 
            draw_set_color(c_white);
        } else {
            // If this camera is safe, draw it normally
            draw_sprite(current_sprite, o_CameraManager.feed_frame, _cx - cam_pan_offset, _cy);
        }
    }
}

matrix_set(matrix_world, matrix_build_identity());
surface_reset_target();

shader_set(shd_perspective);

// (If your shader requires uniform variables like resolution, they would go right here)

draw_surface(office_surf, _cx, _cy);

shader_reset();