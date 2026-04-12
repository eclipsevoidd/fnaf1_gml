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

// --- THE CAMERA FEED INJECTION ---
with (o_CameraFeed) {
    if (global.camera_up && !global.is_dead) {
        var current_sprite = global.camera_feeds[global.current_cam];
        
        // REMOVED 'other.' because _cx and _cy are local 'var' variables!
        // GameMaker can read them directly through the with() block.
        draw_sprite(current_sprite, o_CameraManager.feed_frame, _cx - cam_pan_offset, _cy);
    }
}
// ---------------------------------

matrix_set(matrix_world, matrix_build_identity());
surface_reset_target();

shader_set(shd_perspective);

// (If your shader requires uniform variables like resolution, they would go right here)

draw_surface(office_surf, _cx, _cy);

shader_reset();