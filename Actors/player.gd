extends KinematicBody2D

var momentum := Vector2.ZERO;

var pounce_start : int = 0;

func _physics_process(delta) :
	momentum.x = 0;
	var snap_vec := Vector2.DOWN * 8;
	var pouncing := false;
	if (pounce_start > 0 and (OS.get_system_time_msecs() - pounce_start) > 100):
		pouncing = true;
	
	if (!is_on_floor()):
		momentum += PlayerGlobals.GRAVITY;
		snap_vec = Vector2.ZERO;
	else:
		momentum.y = 0;
		if (Input.is_action_just_pressed("ui_jump")):
			pounce_start = OS.get_system_time_msecs();
		if (Input.is_action_just_released("ui_jump")):
			if (pouncing):
				var pounce_time := float(OS.get_system_time_msecs() - pounce_start) / 1000.0;
				pounce_time = clamp(pounce_time, 0.0, PlayerGlobals.MAX_POUNCE_TIME);
				var pounce_factor = pounce_time / PlayerGlobals.MAX_POUNCE_TIME;
				var jump_impulse := PlayerGlobals.JUMP_IMPULSE * (lerp(PlayerGlobals.MIN_POUNCE, PlayerGlobals.MAX_POUNCE, pounce_factor) as float);
				momentum += jump_impulse;
			else:
				momentum += PlayerGlobals.JUMP_IMPULSE * PlayerGlobals.MIN_POUNCE;

	if (Input.is_action_just_released("ui_jump")):
		pounce_start = 0;
	if (Input.is_action_pressed("ui_left")):
		momentum.x -= PlayerGlobals.WALK_SPEED;
	if (Input.is_action_pressed("ui_right")):
		momentum.x += PlayerGlobals.WALK_SPEED;
	if (pouncing):
		momentum.x *= .25;
	move_and_slide_with_snap(momentum, snap_vec, Vector2.UP);
	