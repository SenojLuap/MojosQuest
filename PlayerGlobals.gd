extends Node

const GRAVITY = Vector2(0.0, 50.0) # Force of gravity in pixels/sec
const JUMP_IMPULSE = Vector2(0.0, -650)

const MAX_POUNCE_TIME : float = 1.5; # Max time the player may build-up a 'pounce'
const MIN_POUNCE : float = 1.0; # Minimum 'pounce' impulse modifier
const MAX_POUNCE : float = 1.5; # Maximum 'pounce' impulse modifier

const WALK_SPEED = 275