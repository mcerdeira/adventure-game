extends Node2D

func _ready():
	LoadSceneFromPosition()
	$CanvasLayer/MapDesigner.visible = false
	
func change_map(dir):
	if dir == "L":
		var view = get_viewport_rect()
		Global.PLAYER_POS = Vector2(view.size.x - 16, $player.position.y)
		Global.GLOBAL_POS.x -= 1
		Global.PLAYER_FACE = $player.facing
		Global.PLAYER_BACK = $player.back
	if dir == "R":
		Global.PLAYER_POS = Vector2(16, $player.position.y)
		Global.GLOBAL_POS.x += 1
		Global.PLAYER_FACE = $player.facing
		Global.PLAYER_BACK = $player.back
		
	if dir == "U":
		var view = get_viewport_rect()
		Global.PLAYER_POS = Vector2($player.position.x, view.size.y - 16)
		Global.GLOBAL_POS.y -= 1
		Global.PLAYER_FACE = $player.facing
		Global.PLAYER_BACK = $player.back
	if dir == "D":
		Global.PLAYER_POS = Vector2($player.position.x, 16)
		Global.GLOBAL_POS.y += 1
		Global.PLAYER_FACE = $player.facing
		Global.PLAYER_BACK = $player.back
	
	get_tree().reload_current_scene()

func LoadSceneFromPosition():
	Global.GLOBAL_VISITED[Global.GLOBAL_POS.x][Global.GLOBAL_POS.y] = true
	var pos_string = "Map" + str(Global.GLOBAL_POS.x) + str(Global.GLOBAL_POS.y)
	var scene = load("res://map/" + pos_string + ".tscn")
	var s = scene.instance()
	add_child(s)
	s.position = Vector2(0, 0)
	$lbl_coordinates.text = "X:" + str(Global.GLOBAL_POS.x) + " Y:" + str(Global.GLOBAL_POS.y)
	$lbl_coordinates2.text = $lbl_coordinates.text
