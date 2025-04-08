extends Sprite2D


func _ready() -> void:
	generate_level()


func generate_level():
	var values = [0, 1, 2, 3]
	values.shuffle()
	
	for i in 3:
		var rand_amount = randi_range(1, 5)
		var slots_in_row = $Slots.get_child(i).get_children()
		slots_in_row.shuffle()
		
		for j in rand_amount:
			slots_in_row[j].put_item(values[i])
