extends Control

func _ready() -> void:
	$TextureRect.position.x = -278.0
	
	var t = create_tween()
	t.tween_property($TextureRect, 'position:x', 13.0, .3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


func _on_close_pressed() -> void:
	var t = create_tween()
	t.tween_property($TextureRect, 'position:x', -278.0, .3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	await t.finished
	
	queue_free()
