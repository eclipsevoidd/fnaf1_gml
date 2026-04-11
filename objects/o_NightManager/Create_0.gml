random_set_seed(global.shared_seed);

global.power_raw = 999.0;
global.power_display = 99;
current_usage = 1;

night_length_seconds = 540;

night_timer = new DeltaTimer(night_length_seconds);

match_timeout_timer = new DeltaTimer(global.match_settings.matchLength * 60);

global.currentHour = 12;

bonnie_mo_timer = new DeltaTimer(4.97);
chica_mo_timer = new DeltaTimer(4.98);
foxy_mo_timer = new DeltaTimer(5.01);
freddy_mo_timer = new DeltaTimer(3.02);

// status update frequency
heartbeat_timer = new DeltaTimer(1.5);

// update these when the server sends us a packet
global.opponent_power = 100;
global.opponent_dead = false;
global.opponent_timeAM = 12;

global.is_dead = false;

global.left_door_closed = false;
global.right_door_closed = false;
global.left_light_on = false;
global.right_light_on = false;
global.camera_up = false;

// ASSET PRELOADING
sprite_prefetch(s_DoorLeft);
sprite_prefetch(s_DoorRight);