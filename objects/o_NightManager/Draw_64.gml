// Only draw the HUD if the player is alive
if (!is_dead) {
    draw_set_font(fnt_Consolas_24);
    draw_set_color(c_white);
    
    // ==========================================
    // 1. THE NIGHT CLOCK (Top Right)
    // ==========================================
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(display_get_gui_width() - 50, 50, string(global.currentHour) + " AM");
    
    // ==========================================
    // 2. THE SERVER MATCH TIMER (Top Center)
    // ==========================================
    // Grab the raw seconds and split them into minutes and seconds
    var time_left = match_timeout_timer.get_time_left();
    var mins = floor(time_left / 60);
    var secs = floor(time_left % 60);
    
    // Add a leading zero if seconds are single digits (e.g., 9 becomes "09")
    var sec_string = (secs < 10) ? "0" + string(secs) : string(secs);
    
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, 50, "Server Timeout: " + string(mins) + ":" + sec_string);
    
    // ==========================================
    // 3. THE POWER METER (Bottom Left)
    // ==========================================
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_text(50, display_get_gui_height() - 80, "Power left: " + string(global.power_display) + "%");
    
    // ==========================================
    // 4. THE USAGE BARS
    // ==========================================
    draw_text(50, display_get_gui_height() - 40, "Usage: ");
    
    // Draw a green rectangle for every point of current_usage
    draw_set_color(c_lime);
    for (var i = 0; i < current_usage; i++) {
        // Space the bars out horizontally
        var bar_x = 160 + (i * 25);
        var bar_y = display_get_gui_height() - 65;
        
        draw_rectangle(bar_x, bar_y, bar_x + 15, bar_y + 25, false);
    }
    
    // Reset color to white so we don't accidentally tint other things
    draw_set_color(c_white); 
    
    // ==========================================
    // 5. OPPONENT STATS (Bottom Right)
    // ==========================================
    // This will only show real numbers when playing online!
    draw_set_halign(fa_right);
    draw_text(display_get_gui_width() - 50, display_get_gui_height() - 40, "Opponent Power: " + string(global.opponent_power) + "%");
}