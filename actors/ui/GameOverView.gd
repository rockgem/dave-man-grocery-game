extends Control

var is_win = true

func _ready() -> void:
	get_tree().paused = true
	
	$Panel/HBoxContainer/Score.text = 'Score: %s' % ManagerGame.global_main_ref.score
	$Panel/HBoxContainer/Time.text = 'Time Left: %0.1f' % ManagerGame.global_ui_ref.level_timer.time_left
	
	if is_win:
		$Panel/Label.text = 'You Win!'
	else:
		$Panel/Label.text = 'You Lose T_T'


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/Main.tscn')


func _on_tree_exiting() -> void:
	get_tree().paused = false
