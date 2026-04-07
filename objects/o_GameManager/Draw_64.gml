var menu_Title = "FNaF: Ranked"
var titleX = 125;
var titleY = 200;

var menu_hostText = "Host Match";
var hostTextX = 125;
var hostTextY = display_get_gui_height() / 2;

var menu_connectTitle = "Connecting...";
var connTitleX = display_get_gui_width() / 2;
var connTitleY = display_get_gui_height() / 2;

var connPanelX1 = 20;
var connPanelY1 = display_get_gui_height() - display_get_gui_height() + 20;

var menu_ver = "alpha4"
var verX = display_get_gui_width();
var verY = display_get_gui_height();

var menu_countText = "Starting in " + string(countdown_timer);
var countTextX = display_get_gui_width() / 2;
var countTextY = display_get_gui_height() / 2;

switch (current_state) {
	case GAME_STATE.MENU:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		draw_set_font(fnt_Consolas_24);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text(verX, verY, menu_ver);
		
		// title stuff
		draw_set_font(fnt_Consolas_64);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text(titleX, titleY, menu_Title);
		
		//placeholder text
		draw_set_font(fnt_Consolas_32);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		//draw_text(hostTextX, hostTextY, menu_hostText);
		
		break;
	case GAME_STATE.HOST_LOBBY:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		draw_set_halign(fa_left);
	    draw_set_font(fnt_Consolas_48);
	    draw_text(125, 100, "Lobby Settings");
    
	    draw_set_font(fnt_Consolas_24);
	    var current_length = string(global.match_settings.matchLength) + " Minutes";
	    draw_text(130, display_get_gui_height() - 750, "Match Length: " + current_length);
		break;
	case GAME_STATE.HOST_WAITING:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		draw_set_font(fnt_Consolas_48);
		draw_set_halign(fa_center);
        draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 - 50, "Waiting for player...");
		
        draw_set_font(fnt_Consolas_24);
		draw_set_halign(fa_center);
        draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 + 50, "Room Code: " + global.my_room_id);
        break;
	case GAME_STATE.BROWSER:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		

		
        draw_set_font(fnt_Consolas_48);
		draw_set_halign(fa_center);
        draw_text(display_get_gui_width() / 2, 100, "Hosted Rooms");
        
        var num_rooms = array_length(global.active_server_list);
        
        if (num_rooms == 0) {
            draw_set_font(fnt_Consolas_24);
			draw_set_halign(fa_center);
            draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "No rooms currently hosted.");
        } 
        else {
            draw_set_font(fnt_Consolas_24);
            
            for (var i = 0; i < num_rooms; i++) {
                var room_data = global.active_server_list[i];
                var yy = 250 + (i * 80); 
                
                var scale = room_data.current_scale; 
                
                var box_w = 300 * scale;
                var box_h = 30 * scale;
                draw_rectangle(display_get_gui_width() / 2 - box_w, yy - box_h, display_get_gui_width() / 2 + box_w, yy + box_h, true);
                
                var info_string = "Room: " + room_data.roomId + " // " + string(room_data.settings.matchLength) + " min";
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                
                draw_text_transformed(display_get_gui_width() / 2, yy, info_string, scale, scale, 0);
            }
        }
        break;
	case GAME_STATE.CONNECTING:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		draw_set_alpha(0.75);
		draw_rectangle_colour(connPanelX1, connPanelY1, display_get_gui_width() - 20, display_get_gui_height() - 20, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1); // reset alpha to normal
		
		draw_set_font(fnt_Consolas_64);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(connTitleX, connTitleY, menu_connectTitle);
		
		break;
	case GAME_STATE.NIGHT_COUNTDOWN:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
	
		draw_set_font(fnt_Consolas_64);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(countTextX, countTextY, menu_countText);
		
		break;
	case GAME_STATE.PLAYING:
	
		
	
		break;
	case GAME_STATE.WIN_SCREEN:
	
		break;
}