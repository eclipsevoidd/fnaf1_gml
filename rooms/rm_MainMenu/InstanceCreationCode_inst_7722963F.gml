original_text = "Host Lobby";
visible_state = GAME_STATE.HOST_LOBBY;
on_click = function() {
    o_GameManager.client_socket = network_create_socket(network_socket_ws);
    network_connect_raw_async(o_GameManager.client_socket, "127.0.0.1", 8080);
    o_GameManager.current_state = GAME_STATE.CONNECTING;
}