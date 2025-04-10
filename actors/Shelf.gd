extends Sprite2D


func _ready() -> void:
	ManagerGame.food_placed_on_shelf.connect(on_food_placed_on_shelf)
	
	await get_tree().process_frame
	
	generate_level()


func generate_level():
	var values = [0, 1, 2, 3, 5]
	values.shuffle()
	
	var inx_count = 0
	
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
	
	# assign indexes
	var count = 0
	for slot in get_tree().get_nodes_in_group("Slot"):
		slot.idx = count
		
		count += 1
	
	var slots = get_tree().get_nodes_in_group("Slot")
	var vacants = []
	
	for slot in slots:
		if slot.item_type == slot.ITEM_TYPE.VACANT:
			vacants.append(slot)
	
	# assigns the item's indexes to the vacant slot's index
	# this way, only a certain item can be inserted into a certain slot! ( see DraggableItem.gd )
	count = 0
	for item in get_tree().get_nodes_in_group("DraggableItem"):
		item.idx = vacants[count].idx
		
		count += 1


func has_vacant_slots() -> bool:
	var has_vacant = false
	for slot: Slot in get_tree().get_nodes_in_group("Slot"):
		if slot.item_type == slot.ITEM_TYPE.VACANT:
			has_vacant = true
			
			break
	
	return has_vacant


func on_food_placed_on_shelf():
	ManagerGame.global_ui_ref.animate_score(420)
	
	if has_vacant_slots() == false:
		ManagerGame.game_over.emit(true)
