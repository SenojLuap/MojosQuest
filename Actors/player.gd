extends KinematicBody2D

var momentum = Vector2(0.0, 0.0)



func _physics_process(delta) :
	if (is_on_floor()):
		momentum.y = 0.0
	else:
		momentum += (PlayerGlobals.GRAVITY * delta)
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		momentum += PlayerGlobals.JUMP_IMPULSE
		
	if Input.is_action_pressed("ui_right"):
		momentum.x = PlayerGlobals.WALK_SPEED
	elif Input.is_action_pressed("ui_left"):
		momentum.x = -PlayerGlobals.WALK_SPEED
	else:
		momentum.x = 0
	
	move_and_slide(momentum, Globals.FLOOR_NORMAL)
	