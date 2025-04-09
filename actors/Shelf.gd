extends Sprite2D


func _ready() -> void:
	ManagerGame.food_placed_on_shelf.connect(on_food_placed_on_shelf)
	
	await get_tree().process_frame
	
	generate_level()


func generate_level():
	var values = [0, 1, 2, 3]
	values.shuffle()
	
	for i in 3:
		var rand_amount = randi_range(1, 5)
		var left = 5 - rand_amount
		var slots_in_row = $Slots.get_child(i).get_children()
		slots_in_row.shuffle()
		
		for j in rand_amount:
			slots_in_row[j].put_item(values[i])
		
		for r in left:
			var rand_x = randf_range(-100, 100)
			var p = Vector2(global_position.x + rand_x, global_position.y)
			
			var item = load('res://actors/DraggableItem.tscn').instantiate()
			item.item_type = values[i]
			
			ManagerGame.global_main_ref.spawn_obj(item, p)


func on_food_placed_on_shelf():
	ManagerGame.global_ui_ref.animate_score(420)
