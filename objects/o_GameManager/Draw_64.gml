var menu_Title = "FNaF: Ranked"
var titleX = 125;
var titleY = 200;

var menu_hostText = "Host Match";
var hostTextX = 125;
var hostTextY = display_get_gui_height() / 2;

var menu_connectTitle = "Waiting for player...";
var connTitleX = display_get_gui_height() / 2;
var connTitleY = display_get_gui_height() / 2;

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
		
		
		break;
	case GAME_STATE.CONNECTING:
		draw_sprite_stretched_ext(s_MenuFreddy, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1);
		draw_sprite_stretched_ext(s_Static, staticFrame, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 0.2);
		
		draw_set_alpha(0.75);
		draw_rectangle_colour(connPanelX1, connPanelY1, display_get_gui_width() - 20, display_get_gui_height() - 20, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1); // reset alpha to normal
		
		draw_set_font(fnt_Consolas_64);
		draw_set_halign(fa_left);
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