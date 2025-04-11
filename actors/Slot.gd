@tool

extends Area2D
class_name Slot

enum ITEM_TYPE{
	MILK, # 0
	BREAD, # 1
	STRAWBERRY, # 2
	FLOUR, # 3
	VACANT, # 4
	ORANGE # 5
}


@export var item_type = ITEM_TYPE.VACANT
var idx = -1

func _ready() -> void:
	refresh_display()


func refresh_display():
	if item_type == ITEM_TYPE.VACANT:
		$Sprite2D.texture = null
	else:
		$Sprite2D.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))
		
		$Sprite2D2.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))
		$Sprite2D3.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))
		$Sprite2D4.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))
	
	$Sprite2D.modulate.a = 1.0
	$Sprite2D.modulate = Color.WHITE


func put_item(item_type: int):
	self.item_type = item_type
	
	refresh_display()


func set_item_shadow(texture):
	$Sprite2D.texture = texture
	$Sprite2D.modulate = Color.BLACK
	$Sprite2D.modulate.a = .5
	


#func highlight(texture):
	#if item_type != ITEM_TYPE.VACANT:
		#return
	#
	#$Sprite2D.texture = texture
	#$Sprite2D.modulate.a = .5
#
#
#func remove_highlight():
	#if item_type != ITEM_TYPE.VACANT:
		#return
	#
	#$Sprite2D.texture = null
	#$Sprite2D.modulate.a = 1.0
