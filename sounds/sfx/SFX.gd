extends Node



func play_sound(sound_name):
	get_node(sound_name).play()


func play_meow():
	var meows = $Meows.get_children()
	meows.shuffle()
	
	meows[0].play()
