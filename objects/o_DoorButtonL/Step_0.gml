var light_val = global.left_light_on ? 1 : 0;
var door_val = global.left_door_closed ? 2 : 0;

image_index = light_val + door_val;