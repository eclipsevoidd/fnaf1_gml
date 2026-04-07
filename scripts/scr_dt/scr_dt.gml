function DeltaTimer(_target_time) constructor {
    
    // the time that should be reached (specified in the parameter)
    target_time = _target_time;
    time_current = 0;
    
    // progresses the timer AND returns true if it just finished!
    static tick = function() {
        time_current += global.dt;
        return is_finished(); 
    }
    
    // checks if timer is finished (true/false)
    static is_finished = function() {
        // FIXED: Changed current_time to time_current
        return (time_current >= target_time);
    }
    
    // method for resetting the timer
    static reset = function() {
        time_current = 0;
    }
    
    // --- NEW HELPER METHODS ---
    
    // Returns how much time is left (prevents negative numbers)
    static get_time_left = function() {
        return max(0, target_time - time_current);
    }
    
    // Returns how much time has passed
    static get_elapsed_time = function() {
        return time_current;
    }
}