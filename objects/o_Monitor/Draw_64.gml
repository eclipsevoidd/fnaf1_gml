var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var ui_scale = screen_h / 720;

// 1. DRAW THE MONITOR ANIMATION
if (animating) {
    var x_scale = screen_w / sprite_get_width(s_MonitorAnimation);
    var y_scale = screen_h / sprite_get_height(s_MonitorAnimation);
    
    draw_sprite_ext(s_MonitorAnimation, anim_index, 0, 0, x_scale, y_scale, 0, c_white, 1);
}

// 2. THE HITBOX MATH
var base_hover_w = 600; 
var base_hover_h = 60;

var hover_w = base_hover_w * ui_scale;
var hover_h = base_hover_h * ui_scale;

var hover_x1 = (screen_w / 2) - (hover_w / 2); 
var hover_y1 = screen_h - hover_h;
var hover_x2 = (screen_w / 2) + (hover_w / 2);
var hover_y2 = screen_h;

// Draw the red box
draw_set_alpha(0.5);
draw_set_color(c_red);
draw_rectangle(hover_x1, hover_y1, hover_x2, hover_y2, false);

// 3. THE VISUAL CAMERA BUTTON
draw_set_alpha(1.0);
draw_set_color(c_white);

draw_sprite_ext(s_PanelButton, 0, screen_w / 2, screen_h - (30 * ui_scale), ui_scale, ui_scale, 0, c_white, 1);