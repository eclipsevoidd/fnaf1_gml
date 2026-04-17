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

global.camera_blackouts = array_create(11, 0);

bonnie = new Animatronic("Bonnie", 10, 4.97); // 10 AI, moves every 4.97 seconds
chica = new Animatronic("Chica", 10, 4.98); // 10 AI, moves every 4.97 seconds

// route that the character takes
bonnie.path = [0, 1, 3, 4]; // camera ids
chica.path = [0, 1, 6, 7];

// Feed this function a Camera ID, and it will figure out exactly what sprite should be there!
refresh_camera_visuals = function(_cam_id) {
    
    // Check who is currently standing in this room
    var _bonnie_here = (bonnie.path[bonnie.current_space] == _cam_id);
    var _chica_here = (chica.path[chica.current_space] == _cam_id);
    
    switch (_cam_id) {
        case 0: // SHOW STAGE
            if (_bonnie_here && _chica_here) {
                global.camera_feeds[0] = sShowStage;
            } else if (!_bonnie_here && _chica_here) {
                global.camera_feeds[0] = sShowStage_chicaFreddy;
            } else if (_bonnie_here && !_chica_here) {
                global.camera_feeds[0] = sShowStage_bonnieFreddy;
            } else {
                global.camera_feeds[0] = sShowStage_freddy;
            }
            break;
            
        case 1: // DINING AREA
            if (_bonnie_here) {
                global.camera_feeds[1] = choose(sDiningArea_bonnie_0, sDiningArea_bonnie_1);
            } else if (_chica_here) {
                global.camera_feeds[1] = choose(sDiningArea_chica_0, sDiningArea_chica_1);
            } else {
                global.camera_feeds[1] = sDiningArea;
            }
            break;
            
        case 3: // WEST HALL
            if (_bonnie_here) global.camera_feeds[3] = sWestHall_bonnie;
            else global.camera_feeds[3] = sWestHall;
            break;
			
		case 4: // WEST CORNER
            if (_bonnie_here) global.camera_feeds[4] = sWestCorner_bonnie_0;
            else global.camera_feeds[4] = sWestCorner;
            break;
			
		case 5: // SUPPLY CLOSET
            if (_bonnie_here) global.camera_feeds[5] = sSupplyCloset_bonnie;
            else global.camera_feeds[5] = sSupplyCloset;
            break;
            
        case 6: // EAST HALL
            if (_chica_here) global.camera_feeds[6] = choose(sEastHall_chica_0, sEastHall_chica_1);
            else global.camera_feeds[6] = sEastHall;
            break;
			
		case 7: // EAST CORNER
            if (_chica_here) global.camera_feeds[7] = sEastCorner_chica;
            else global.camera_feeds[7] = sEastCorner;
            break;
			
		case 8: // BACKSTAGE
            if (_bonnie_here) global.camera_feeds[8] = choose(sBackstage_bonnie, sBackstage_bonnie_rare);
            else global.camera_feeds[8] = sBackstage;
            break;
			
		case 10: // RESTROOMS
            if (_chica_here) global.camera_feeds[10] = choose(sRestrooms_chica_0, sRestrooms_chica_1);
            else global.camera_feeds[10] = sRestrooms;
            break;
    }
}

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