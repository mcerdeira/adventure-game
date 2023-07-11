extends Node2D

func _ready():
	var pos_string
	var cell
	for x in range(17):
		for y in range(9):
			if Global.GLOBAL_VISITED[x][y]:
				pos_string = "cell" + str(x) + str(y)
				cell = get_node(pos_string)
				cell.animation = "visited"
				
	pos_string = "cell" + str(Global.GLOBAL_POS.x) + str(Global.GLOBAL_POS.y)
	cell = get_node(pos_string)
	cell.animation = "here"
