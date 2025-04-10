extends CharacterBody2D



var item_type: int
var idx = -1

var first_slot_detected: Slot
var is_dragging = false

func _ready() -> void:
	match item_type:
		0: 
			$Sprite2D.texture = load('res://reso/items/milk.tres')
			$Sprite2D.offset.y -= 16.0
		1: $Sprite2D.texture = load('res://reso/items/bread.tres')
		2: $Sprite2D.texture = load('res://reso/items/strawberry.tres')
		3: $Sprite2D.texture = load('res://reso/items/flour.tres')
		5:
			$Sprite2D.texture = load('res://reso/items/orange.tres')
			$Sprite2D.offset.y =- 26.0


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
		
		if $Area2D.get_overlapping_areas().is_empty() == false:
			var slot = null
			
			for area in $Area2D.get_overlapping_areas():
				if area.item_type != area.ITEM_TYPE.VACANT:
					continue
				else:
					slot = area
					break
			
			
			if slot:
				# checks if the index of the slot is assigned to the index of this item
				if slot.idx != idx:
					return
				
				slot.put_item(item_type)
				ManagerGame.food_placed_on_shelf.emit()
				
				Sfx.play_sound('Ping')
				
				queue_free()


func _physics_process(delta: float) -> void:
	# if dragging, continously reposition the object to the mouse position
	if is_dragging:
		global_position = get_global_mouse_position()
	else:
		# if dragging is released slide the object down back to the floor
		velocity.y = 300.0
	
	move_and_slide()
	
	if $Area2D.get_overlapping_areas().is_empty() == false and is_dragging:
		if first_slot_detected:
			first_slot_detected.remove_highlight()
		
		first_slot_detected = $Area2D.get_overlapping_areas()[0]
		
		first_slot_detected.highlight($Sprite2D.texture)
	else:
		if first_slot_detected:
			first_slot_detected.remove_highlight()
		
		first_slot_detected = null


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
