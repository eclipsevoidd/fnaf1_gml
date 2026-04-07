client_socket = -1;
current_state = GAME_STATE.MENU;

staticFrame = 0;
countdown_timer = 5;

global.my_room_id = "";

display_set_gui_size(1920, 1080);

// sets the window size for the OS
window_set_size(854, 480);
window_center();

global.match_settings = new MatchConfig(); // constructor for match ruleset

global.offline_debug = false;