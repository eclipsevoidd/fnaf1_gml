var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();

// Draw the flash stretched over the entire UI, no matter where the room camera is!
draw_sprite_stretched(sprite_index, image_index, 0, 0, screen_w, screen_h);