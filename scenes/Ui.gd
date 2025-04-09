extends CanvasLayer




func _physics_process(delta: float) -> void:
	$Time.text = '%0.1f' % $LevelTimer.time_left
	$Score.text = '%s' % ManagerGame.global_main_ref.score


func _on_level_timer_timeout() -> void:
	pass # Replace with function body.
