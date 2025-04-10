extends TextureRect


var muted_color = '#9d9ea2'
var active_color = '#97cc7a'


var is_active = false


func _physics_process(delta: float) -> void:
	if is_active:
		modulate = Color(active_color)
	else:
		modulate = Color(muted_color)


func set_active():
	is_active = true
