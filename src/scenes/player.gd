extends KinematicBody2D
var facing = 0
var movement = Vector2.ZERO
var back = false

func both_axis(left, right, up, down):
	return (left and down) or (left and up) or (right and down) or (right and up)

func _physics_process(delta):
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var down = Input.is_action_pressed("down")
	var up = Input.is_action_pressed("up")
	var action1 = Input.is_action_pressed("action1")
	var action2 = Input.is_action_pressed("action2")

	var base_speed = Global.speed
	if both_axis(left, right, up, down):
		base_speed = Global.speed / 1.3
	
	if left:
		movement.x = -base_speed / Global.slow_down
		$sprite.scale.x = -1
		$eyes.scale.x = -1
		back = false
	elif right:
		movement.x = base_speed/ Global.slow_down
		$sprite.scale.x = 1
		$eyes.scale.x = 1
		back = false
		
	facing = $sprite.scale.x
	
	if down:
		movement.y = base_speed / Global.slow_down
		back = false
	elif up:
		movement.y = -base_speed / Global.slow_down
		back = true
		
	var move = (left or right or up or down)

	if(move):
		$sprite.animation = "run"
	else:
		$sprite.animation = "idle"
		
	$eyes.visible = !back


	movement = move_and_slide(movement, Vector2.UP)
	
	if !up and !down:
		movement.y = lerp(movement.y, 0, 0.2)
		
	if !left and !right:
		movement.x = lerp(movement.x, 0, 0.2)
	
	z_index = global_position.y + 16
