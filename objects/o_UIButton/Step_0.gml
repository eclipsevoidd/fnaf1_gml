if (o_GameManager.current_state != visible_state) {
    is_hovered = false;
    was_hovered = false;
    current_scale = 1.0; // Instantly reset scale if the menu changes
    exit;
}

is_hovered = position_meeting(mouse_x, mouse_y, id);

// --- THE SCALE LOGIC ---
if (is_hovered) {
    target_scale = 1.15; // 15% bigger when hovered (adjust to your liking!)
} else {
    target_scale = 1.0;  // Normal size
}

// Lerp smoothly slides the current_scale towards the target_scale.
// The "0.2" is the animation speed. Higher = faster snap, Lower = floaty.
current_scale = lerp(current_scale, target_scale, 0.2);

// --- THE SOUND LOGIC ---
if (is_hovered && !was_hovered) {
    audio_play_sound(snd_blip, 0, 0, 0.2);
}

was_hovered = is_hovered; 

// --- THE CLICK LOGIC ---
if (is_hovered && mouse_check_button_pressed(mb_left)) {
    audio_play_sound(snd_click, 0, 0, 0.35);
    on_click();
}