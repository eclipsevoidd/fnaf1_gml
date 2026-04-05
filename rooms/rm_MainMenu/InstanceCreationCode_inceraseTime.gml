original_text = "+";
visible_state = GAME_STATE.HOST_LOBBY;

on_click = function() {
    // Add 5 minutes, capped at 60 for safety
    if (global.match_settings.matchLength < 60) {
        global.match_settings.matchLength += 5;
    }
}