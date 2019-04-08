extends Node2D

class_name Stage

var TunaSpawnLocs = []
var TunaCans = 0

export var MaxTuna = 2

func player_get_tuna(tuna : TunaCan):
	TunaSpawnLocs.append(tuna.position)
	remove_child(tuna)
	TunaCans -= 1


func update_tunas():
	if TunaCans < MaxTuna and TunaSpawnLocs.size() > 0:
		var newLocIdx = randi() % TunaSpawnLocs.size()
		#var newCan = TunaCan.new()
		var canScene = load("res://TunaCan.tscn")
		var newCan = canScene.instance()
		add_child(newCan)
		newCan.set_owner(self)
		newCan.position = TunaSpawnLocs[newLocIdx]
		TunaSpawnLocs.remove(newLocIdx)
		TunaCans += 1
		