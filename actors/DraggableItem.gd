extends RigidBody2D



var item_type: int


func _ready() -> void:
	match item_type:
		0: $Sprite2D.texture = load('res://reso/items/milk.tres')
		1: $Sprite2D.texture = load('res://reso/items/bread.tres')
		2: $Sprite2D.texture = load('res://reso/items/strawberry.tres')
		3: $Sprite2D.texture = load('res://reso/items/sugar.tres')
