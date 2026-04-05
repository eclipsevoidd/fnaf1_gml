if (o_GameManager.current_state != visible_state) exit;

draw_set_font(fnt_Consolas_32);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white); 

// We plug our animated 'current_scale' variable into the X and Y scale arguments!
draw_text_transformed(x, y, original_text, current_scale, current_scale, 0);