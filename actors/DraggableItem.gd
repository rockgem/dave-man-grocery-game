extends CharacterBody2D



var item_type: int

var is_dragging = false

func _ready() -> void:
	match item_type:
		0: $Sprite2D.texture = load('res://reso/items/milk.tres')
		1: $Sprite2D.texture = load('res://reso/items/bread.tres')
		2: $Sprite2D.texture = load('res://reso/items/strawberry.tres')
		3: $Sprite2D.texture = load('res://reso/items/sugar.tres')


func _input(event: InputEvent) -> void:
	if $Sprite2D.is_pixel_opaque($Sprite2D.to_local(event.position)) == false:
		return
	
	get_tree().root.set_input_as_handled()
	
	if event is InputEventScreenTouch and event.pressed and is_dragging == false:
		is_dragging = true
	
	if event is InputEventScreenTouch and !event.pressed and is_dragging:
		is_dragging = false


func _physics_process(delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position()
	else:
		velocity.y = 300.0
	
	move_and_slide()
