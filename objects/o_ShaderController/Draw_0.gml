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

matrix_set(matrix_world, matrix_build(-_cx, -_cy, 0, 0, 0, 0, 1, 1, 1));

with (o_Office) draw_self();
with (o_Fan) draw_self();
with (o_DoorLeft) draw_self();
with (o_DoorRight) draw_self();
with (o_DoorButtonL) draw_self();
with (o_DoorButtonR) draw_self();
// ojects affected by shader go here

matrix_set(matrix_world, matrix_build_identity());
surface_reset_target();

shader_set(shd_perspective);

draw_surface(office_surf, _cx, _cy);

shader_reset();