extends Control

func _ready() -> void:
	$TextureRect.position.x = -278.0
	
	var t = create_tween()
	t.tween_property($TextureRect, 'position:x', -12.0, .3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	load_items()


func load_items():
	for check in $TextureRect/Bread.get_children():
		check.queue_free()
	for check in $TextureRect/Milk.get_children():
		check.queue_free()
	for check in $TextureRect/Jam.get_children():
		check.queue_free()
	for check in $TextureRect/Juice.get_children():
		check.queue_free()
	for check in $TextureRect/Flour.get_children():
		check.queue_free()
	
	for i in ManagerGame.global_main_ref.shelf.bread_max:
		var check = load('res://actors/ui/Check.tscn').instantiate()
		
		$TextureRect/Bread.add_child(check)
	
	for i in ManagerGame.global_main_ref.shelf.milk_max:
		var check = load('res://actors/ui/Check.tscn').instantiate()
		
		$TextureRect/Milk.add_child(check)
	
	for i in ManagerGame.global_main_ref.shelf.flour_max:
		var check = load('res://actors/ui/Check.tscn').instantiate()
		
		$TextureRect/Flour.add_child(check)
	
	for i in ManagerGame.global_main_ref.shelf.juice_max:
		var check = load('res://actors/ui/Check.tscn').instantiate()
		
		$TextureRect/Juice.add_child(check)
	
	for i in ManagerGame.global_main_ref.shelf.jam_max:
		var check = load('res://actors/ui/Check.tscn').instantiate()
		
		$TextureRect/Jam.add_child(check)
	
	await get_tree().process_frame
	
	for i in ManagerGame.global_main_ref.shelf.jam:
		$TextureRect/Jam.get_child(i).is_active = true
	for i in ManagerGame.global_main_ref.shelf.bread:
		$TextureRect/Bread.get_child(i).is_active = true
	for i in ManagerGame.global_main_ref.shelf.milk:
		$TextureRect/Milk.get_child(i).is_active = true
	for i in ManagerGame.global_main_ref.shelf.flour:
		$TextureRect/Flour.get_child(i).is_active = true
	for i in ManagerGame.global_main_ref.shelf.juice:
		$TextureRect/Juice.get_child(i).is_active = true


func _on_close_pressed() -> void:
	var t = create_tween()
	t.tween_property($TextureRect, 'position:x', -278.0, .3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	await t.finished
	
	queue_free()
