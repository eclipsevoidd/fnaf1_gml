if (!global.is_dead) {
    draw_set_font(fnt_LCDSolid32);
    draw_set_color(c_white);
    
    // AM text
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(display_get_gui_width() - 50, 50, string(global.currentHour) + " AM");
	
	// match timer
	var time_left = match_timeout_timer.get_time_left();
    var mins = floor(time_left / 60);
    var secs = floor(time_left % 60);
	var milisecs = floor(frac(time_left) * 100);
    
    var sec_string = (secs < 10) ? "0" + string(secs) : string(secs);
	
	draw_set_font(fnt_Consolas_24);
    draw_set_halign(fa_left);
	draw_text(display_get_gui_width() - 175, 95, string(mins) + ":" + sec_string + "." + string(milisecs));
    
	
	// temp gui
	draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, 50, "-- TEMPORARY GUI TEXT --");
    
	// power text
	draw_set_font(fnt_LCDSolid24);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_text(50, display_get_gui_height() - 80, "Power left: " + string(global.power_display) + "%");
    
	// usage sprite
    draw_text(50, display_get_gui_height() - 40, "Usage: ");
	draw_sprite(s_UsageMeter, current_usage - 1, 180, display_get_gui_height() - 75);
    
	// opponent power text
	draw_set_font(fnt_Consolas_24);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
	draw_text(display_get_gui_width() - 25, display_get_gui_height() - 75, "Opponent: ");
	
	draw_set_font(fnt_LCDSolid24);
    draw_set_halign(fa_right);
    draw_text(display_get_gui_width() - 50, display_get_gui_height() - 40, string(global.opponent_power) + "%");
	
	
}