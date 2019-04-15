extends KinematicBody2D

var momentum := Vector2.ZERO;

func _physics_process(delta) :
	momentum.x = 0;
	var snap_vec := Vector2.DOWN * 8;
	
	if (!is_on_floor()):
		momentum += PlayerGlobals.GRAVITY;
		snap_vec = Vector2.ZERO;
	else:
		momentum.y = 0;
		if (Input.is_action_just_pressed("ui_jump")):
			momentum += PlayerGlobals.JUMP_IMPULSE;
			
	if (Input.is_action_pressed("ui_left")):
		momentum.x -= PlayerGlobals.WALK_SPEED;
	if (Input.is_action_pressed("ui_right")):
		momentum.x += PlayerGlobals.WALK_SPEED;
	move_and_slide_with_snap(momentum, snap_vec, Vector2.UP);
	