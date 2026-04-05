original_text = "Host a Match";
visible_state = GAME_STATE.MENU;
on_click = function() {
    o_GameManager.current_state = GAME_STATE.HOST_LOBBY;
}