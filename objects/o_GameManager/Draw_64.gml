var menu_Title = "FNaF 1 networking test"
var titleX = display_get_gui_width() / 2;
var titleY = 150;

// 172 x 68

var menu_pText = "-- press SPACE --"; // placeholder probably
var pTextX = display_get_gui_width() / 2;
var pTextY = display_get_gui_height() - 60;

var menu_connectTitle = "Waiting for player...";
var connTitleX = display_get_gui_width() / 2;
var connTitleY = display_get_gui_height() / 2 - 60;

var connPanelX1 = 20;
var connPanelY1 = display_get_gui_height() - display_get_gui_height() + 20;

var menu_countText = "Starting in " + string(countdown_timer);
var countTextX = display_get_gui_width() / 2;
var countTextY = display_get_gui_height() / 2;

switch (current_state){
	case GAME_STATE.MENU:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		// title stuff
		draw_set_font(fnt_Consolas_48);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(titleX, titleY, menu_Title);
		
		//placeholder text
		draw_set_font(fnt_Consolas_24);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(pTextX, pTextY, menu_pText);
		
		break;
	case GAME_STATE.CONNECTING:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		draw_set_alpha(0.75);
		draw_rectangle_colour(connPanelX1, connPanelY1, display_get_gui_width() - 20, display_get_gui_height() - 20, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1); // reset alpha to normal
		
		draw_set_font(fnt_Consolas_48);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(connTitleX, connTitleY, menu_connectTitle);
		
		break;
	case GAME_STATE.NIGHT_COUNTDOWN:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
	
		draw_set_font(fnt_Consolas_48);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(countTextX, countTextY, menu_countText);
		
		break;
	case GAME_STATE.PLAYING:
	
		
	
		break;
	case GAME_STATE.WIN_SCREEN:
	
		break;
}