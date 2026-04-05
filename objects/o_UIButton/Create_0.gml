original_text = "bad button text"

// state button should be visible in
visible_state = GAME_STATE.MENU; 

// function on click
on_click = function() {
    show_debug_message("I was clicked!");
}

// visual feedback
is_hovered = false;
// if hovered on previous frame
was_hovered = false;

current_scale = 1.0; 
target_scale = 1.0;