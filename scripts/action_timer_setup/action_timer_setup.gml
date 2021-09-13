function action_timer_setup() {
	//setup the magic numbers for items used by players
	//these numbers are the minimum time needed for each action
	action_timers[item.none] = 0;
	action_timers[item.sword] = 8;
	action_timers[item.glove] = 8;
	action_timers[item.jump] = 8;
	action_timers[item.dance] = 8;
	action_timers[item.magic] = 8;
	action_timers[item.thrumaturgy] = 8;
}
