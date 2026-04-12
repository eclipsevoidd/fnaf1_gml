random_set_seed(global.shared_seed);

global.power_raw = 999.0;
global.power_display = 99;
current_usage = 1;

night_length_seconds = 540;

night_timer = new DeltaTimer(night_length_seconds);

match_timeout_timer = new DeltaTimer(global.match_settings.matchLength * 60);

global.currentHour = 12;

global.camera_feeds = [
    sShowStage,   // 0: Show Stage
    sDiningArea, // 1: Dining Area
    sPirateCove_0,// 2: Pirate Cove
    sWestHall,   // 3: West Hall
    sWestCorner, // 4: West Corner
    sSupplyCloset,     // 5: Supply Closet
    sEastHall,   // 6: East Hall
    sEastCorner, // 7: East Corner
    sBackstage,  // 8: Backstage
    sKitchen,    // 9: Kitchen (Static/Audio only)
	sRestrooms// 10: Restrooms
];

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

// Loop through our array and quietly load every camera sprite into memory
for (var i = 0; i < array_length(global.camera_feeds); i++) {
    sprite_prefetch(global.camera_feeds[i]);
}

// Prefetch the UI overlays too!
sprite_prefetch(s_CamStatic);
sprite_prefetch(s_CamBorder);
sprite_prefetch(s_CamMap);