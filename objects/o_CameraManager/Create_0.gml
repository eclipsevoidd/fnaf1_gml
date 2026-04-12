// 1. STATE VARIABLES
global.current_cam = 0;

// 3. ANIMATED FEED TIMER
feed_frame = 0;
feed_fps = 20;

// 4. ANIMATED STATIC TIMER (Just like the menu!)
static_frame = 0;
static_fps = 60; // Runs at 30 FPS regardless of lag

// 5. THE CAMERA DATA 
cameras = [
    { name: "Show Stage",    bx: 983,  by: 353, tx: 961,  ty: 341 }, 
    { name: "Dining Area",   bx: 963,  by: 409, tx: 939,  ty: 397 }, 
    { name: "Pirate Cove",   bx: 931,  by: 487, tx: 908,  ty: 475 }, 
    { name: "West Hall",     bx: 983,  by: 603, tx: 960,  ty: 590 }, 
    { name: "West Corner",   bx: 983,  by: 643, tx: 960,  ty: 630 }, 
    { name: "Supply Closet", bx: 899,  by: 585, tx: 877,  ty: 574 }, 
    { name: "East Hall",     bx: 1089, by: 604, tx: 1066, ty: 592 }, 
    { name: "East Corner",   bx: 1089, by: 644, tx: 1066, ty: 632 }, 
    { name: "Backstage",     bx: 857,  by: 436, tx: 834,  ty: 424 }, 
    { name: "Kitchen",       bx: 1186, by: 568, tx: 1163, ty: 556 }, 
    { name: "Restrooms",     bx: 1195, by: 437, tx: 1172, ty: 424 }  
];