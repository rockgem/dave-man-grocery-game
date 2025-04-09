extends CanvasLayer




func _ready() -> void:
	ManagerGame.global_ui_ref = self


func _physics_process(delta: float) -> void:
	$Time.text = '%0.1f' % $LevelTimer.time_left
	$Score.text = '%s' % ManagerGame.global_main_ref.score


func animate_score(new_score):
	var t = create_tween()
	t.tween_property(ManagerGame.global_main_ref, 'score', ManagerGame.global_main_ref.score + new_score, .5)


func _on_level_timer_timeout() -> void:
	pass # Replace with function body.
