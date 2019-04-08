extends Position2D

class_name TunaCanSpawnPos

func _ready():
	var stage = get_parent()
	stage.TunaSpawnLocs.append(position)
	for child in stage.get_children():
		print(child)
		print(child == self)
	queue_free()
	print("done!")