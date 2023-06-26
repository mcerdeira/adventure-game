extends Area2D
export var dir = ""

func _on_SideChecker_body_entered(body):
	if body.is_in_group("players"):
		get_parent().change_map(dir)
