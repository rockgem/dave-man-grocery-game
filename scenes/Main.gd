extends Node2D
class_name MainGame


var score = 0


func _ready() -> void:
	ManagerGame.global_main_ref = self
