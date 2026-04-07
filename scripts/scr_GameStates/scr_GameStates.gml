enum GAME_STATE {
    MENU,
    HOST_LOBBY,
    HOST_WAITING,
    BROWSER,
    CONNECTING,
    NIGHT_COUNTDOWN,
    PLAYING,
    WIN_SCREEN
}

connection_intent = ""; 
global.active_server_list = []; // array of rooms the server sends us