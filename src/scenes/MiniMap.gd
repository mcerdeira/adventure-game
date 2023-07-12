extends Node2D
var go_alpha = false

func _physics_process(delta):
	if go_alpha:
		modulate.a = lerp(modulate.a, 0.1, 0.1)
	else:
		modulate.a = lerp(modulate.a, 1, 0.1)

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


func _on_area_body_entered(body):
	if body.is_in_group("players"):
		go_alpha = true
		
func _on_area_body_exited(body):
	if body.is_in_group("players"):
		go_alpha = false
