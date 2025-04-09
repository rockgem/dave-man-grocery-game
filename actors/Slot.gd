@tool

extends Area2D


enum ITEM_TYPE{
	MILK,
	BREAD,
	STRAWBERRY,
	SUGAR,
	VACANT
}


@export var item_type = ITEM_TYPE.VACANT


func _ready() -> void:
	refresh_display()


func refresh_display():
	if item_type == ITEM_TYPE.VACANT:
		$Sprite2D.texture = null
	else:
		$Sprite2D.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))
	
	$Sprite2D.modulate.a = 1.0


func put_item(item_type: int):
	self.item_type = item_type
	
	refresh_display()


func highlight_item(texture):
	if item_type == ITEM_TYPE.VACANT:
		return
	
	$Sprite2D.texture = texture
	$Sprite2D.modulate.a = .5


func remove_highlight_item():
	if item_type == ITEM_TYPE.VACANT:
		return
	
	$Sprite2D.texture = null
	$Sprite2D.modulate.a = 1.0
