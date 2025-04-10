extends CanvasLayer

@onready var level_timer = $LevelTimer

func _ready() -> void:
	ManagerGame.game_over.connect(on_game_over)
	
	ManagerGame.global_ui_ref = self


func _physics_process(delta: float) -> void:
	$Time.text = '%0.1f' % $LevelTimer.time_left
	$Score.text = '%s' % ManagerGame.global_main_ref.score


func pop_to_ui(instance):
	for child in $Popup.get_children():
		child.queue_free()
	
	$Popup.add_child(instance)


func animate_score(new_score):
	var t = create_tween()
	t.tween_property(ManagerGame.global_main_ref, 'score', ManagerGame.global_main_ref.score + new_score, .5)


func _on_level_timer_timeout() -> void:
	ManagerGame.game_over.emit(false)


func on_game_over(is_win: bool):
	var i = load('res://actors/ui/GameOverView.tscn').instantiate()
	i.is_win = is_win
	
	pop_to_ui(i)


func _on_list_pressed() -> void:
	var i = load('res://actors/ui/ListView.tscn').instantiate()
	
	pop_to_ui(i)
