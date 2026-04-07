original_text = "Join a Lobby";
visible_state = GAME_STATE.MENU;

on_click = function() {
    // 1. Tell GameMaker WHY we are connecting
    o_GameManager.connection_intent = "browse";
    
    // 2. Connect to the server
    o_GameManager.client_socket = network_create_socket(network_socket_ws);
    network_connect_raw_async(o_GameManager.client_socket, "127.0.0.1", 8080);
    
    o_GameManager.current_state = GAME_STATE.CONNECTING;
}