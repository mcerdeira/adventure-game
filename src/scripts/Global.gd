extends Node

var speed = 0
var slow_down = 1
var SfxMuted = false

func custom_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func normal_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func boot_strap_game():
	custom_cursor()
	speed = 150.0
	slow_down = 1

func _ready():
	boot_strap_game()


func _input(event):
	var cur_scene = get_tree().current_scene.name
	if cur_scene == "TitleScreen":
		if event.is_action_pressed("quit_game"):
			get_tree().quit()
	else:
		#TEMP
		if event.is_action_pressed("quit_game"):
			get_tree().quit()
		if event.is_action_pressed("toggle_fullscreen"):
			OS.window_fullscreen = !OS.window_fullscreen

func pick_random(container):
	if typeof(container) == TYPE_DICTIONARY:
		return container.values()[randi() % container.size() ]
	assert( typeof(container) in [
			TYPE_ARRAY, TYPE_COLOR_ARRAY, TYPE_INT_ARRAY,
			TYPE_RAW_ARRAY, TYPE_REAL_ARRAY, TYPE_STRING_ARRAY,
			TYPE_VECTOR2_ARRAY, TYPE_VECTOR3_ARRAY
			], "ERROR: pick_random" )
	return container[randi() % container.size()]

func play_sound(stream: AudioStream, options:= {}) -> AudioStreamPlayer:
	if SfxMuted:
		return null
	else:
		var audio_stream_player = AudioStreamPlayer.new()

		add_child(audio_stream_player)
		audio_stream_player.stream = stream
		audio_stream_player.bus = "SFX"
		
		for prop in options.keys():
			audio_stream_player.set(prop, options[prop])
		
		audio_stream_player.play()
		audio_stream_player.connect("finished", audio_stream_player, "queue_free")
		
		return audio_stream_player
