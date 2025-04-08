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
	if item_type == ITEM_TYPE.VACANT:
		$Sprite2D.texture = null
	else:
		$Sprite2D.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))



func put_item(item_type: int):
	self.item_type = item_type
	
	if item_type == ITEM_TYPE.VACANT:
		$Sprite2D.texture = null
	else:
		$Sprite2D.texture = load("res://reso/items/%s.tres" % ITEM_TYPE.find_key(item_type))
