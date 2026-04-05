function DeltaTimer(_target_time) constructor {
	
	// the time that should be reached (specified in the parameter)
    target_time = _target_time;
    time_current = 0;
    
    // progresses the timer
    static tick = function() {
        time_current += global.dt;
    }
    
    // checks if timer is finished (true/false)
    static is_finished = function() {
        return (current_time >= target_time);
    }
    
    // method for resetting the timer
    static reset = function() {
        time_current = 0;
    }
}

// -- HOW TO CALL:
// variable_name = new DeltaTimer(length);
// -- EXAMPLE:
// hourTimer = new DeltaTimer(90.0);		-- 90 seconds