original_text = "-";
visible_state = GAME_STATE.HOST_LOBBY;

on_click = function() {
    // Subtract 5 minutes, but don't let it go below 5!
    if (global.match_settings.matchLength > 5) {
        global.match_settings.matchLength -= 5;
    }
}