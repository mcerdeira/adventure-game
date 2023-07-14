extends Node2D
export var _MiniMap: NodePath
onready var MiniMap : Node2D = get_node(_MiniMap) as Node2D

func _physics_process(delta):
	var call_map = Input.is_action_just_pressed("call_map")
	if(call_map):
		position_coso()
		MiniMap.visible = !MiniMap.visible
		visible = !visible
		get_tree().paused = visible

func position_coso():
	var pos_string = "Map" + str(Global.GLOBAL_POS.x) + str(Global.GLOBAL_POS.y)
	var map = get_node("ActualMap/" + pos_string)
	if map:
		$ActualMap/MapHERE.position = map.position
