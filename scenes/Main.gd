extends Node2D
class_name MainGame


var score = 0
@onready var shelf: Shelf = $Shelf

func _ready() -> void:
	ManagerGame.global_main_ref = self


func spawn_obj(instance, g_pos):
	instance.global_position = g_pos
	
	add_child(instance)
