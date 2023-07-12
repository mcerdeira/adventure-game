extends Node2D

func position_coso():
	var pos_string = "Map" + str(Global.GLOBAL_POS.x) + str(Global.GLOBAL_POS.y)
	var map = get_node("ActualMap/" + pos_string)
	if map:
		$ActualMap/MapHERE.position = map.position
