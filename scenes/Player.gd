extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -500

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("ui_read"):
		if $MessageShape != null:
			$AnimatedSprite.play("Phone")
			$MessageShape.visible = true
		friction = true
	else:
		$AnimatedSprite.play("Idle")
		if $MessageShape != null:
			$MessageShape.visible = false
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$AnimatedSprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	
	motion = move_and_slide(motion, UP)
	pass


func _on_Freezing_timeout():
#	$TempBar.value = healthState
	if $TempBar.value > 0:
		$TempBar.value -= 10
	else:
		$TempBar.value = 100
		get_tree().change_scene("res://scenes/StartScene.tscn")
#	print($TempBar.value)
	
	pass # replace with function body


#func _on_toScene2_body_entered(body):
##	print($TempBar.value)
#	healthState = $TempBar.value
#	pass # replace with function body
#
#
#func _on_Scene2_tree_entered():
#	$TempBar.value = healthState
#	pass # replace with function body


func _on_Beacon_body_entered(body):
	if body.name == "Player":
		print("enter")
		$Freezing.stop()
		$Warming.start()
		$PhoneInfo.visible = true
	pass # replace with function body


func _on_Beacon_body_exited(body):
	if body.name == "Player":
#		$TempBar.value -= 10
		$Freezing.start()
		$Warming.stop()
		$PhoneInfo.visible = false
		print("leave")
		
	pass # replace with function body



func _on_Warming_timeout():
	if $TempBar.value < 100:
		$TempBar.value += 10
	pass # replace with function body
