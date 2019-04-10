extends Area2D

class_name TunaCan

func on_touch(body : PhysicsBody2D) -> void:
	var stage = get_parent()
	if (stage != null):
		stage.player_get_tuna(self)
