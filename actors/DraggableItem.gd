extends CharacterBody2D



var item_type: int

var first_slot_detected
var is_dragging = false

func _ready() -> void:
	match item_type:
		0: $Sprite2D.texture = load('res://reso/items/milk.tres')
		1: $Sprite2D.texture = load('res://reso/items/bread.tres')
		2: $Sprite2D.texture = load('res://reso/items/strawberry.tres')
		3: $Sprite2D.texture = load('res://reso/items/sugar.tres')


func _input(event: InputEvent) -> void:
	# checks it the current click position is exactly on the object's sprite bounds
	if $Sprite2D.is_pixel_opaque($Sprite2D.to_local(event.position)) == false:
		return
	
	# prevents the input from further propagating
	# this prevents dragging multiple objects at once which will cause bugs
	get_tree().root.set_input_as_handled()
	
	# setting input actions
	if event is InputEventScreenTouch and event.pressed and is_dragging == false:
		is_dragging = true
	
	if event is InputEventScreenTouch and !event.pressed and is_dragging:
		is_dragging = false


func _physics_process(delta: float) -> void:
	# if dragging, continously reposition the object to the mouse position
	if is_dragging:
		global_position = get_global_mouse_position()
	else:
		# if dragging is released slide the object down back to the floor
		velocity.y = 300.0
	
	move_and_slide()
	
	if $Area2D.get_overlapping_areas().is_empty() == false:
		first_slot_detected = $Area2D.get_overlapping_areas()[0]
	else:
		first_slot_detected = null


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
