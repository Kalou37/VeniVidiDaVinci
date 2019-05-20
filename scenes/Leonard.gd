extends KinematicBody2D

var motion = Vector2()
const FRICTION = Vector2(10,0)
const SPEED = 250

#0 = pas de mur / 1 = haut / 2 = droite / 3 = bas / 4 = gauche
var mur_atteind : int = 0
var direction : int = 0

func _process(delta):
	move_and_slide(motion)
	if Input.is_action_just_pressed("ui_right"):
		$Animation.flip_h = false
		$Animation.play("right")
		direction = 2
		motion = Vector2(SPEED, 0)
	elif Input.is_action_just_pressed("ui_up"):
		$Animation.play("up")
		direction = 1
		motion = Vector2(0, -SPEED)
	elif Input.is_action_just_pressed("ui_down"):
		if !is_on_wall():
			$Animation.play("down")
			direction = 3
			motion = Vector2(0, SPEED)
		else:
			print("MUR")
	elif Input.is_action_just_pressed("ui_left"):
		$Animation.flip_h = true
		$Animation.play("right")
		direction = 4
		motion = Vector2(-SPEED, 0)s

	if is_on_wall():
		print(direction)
		$Animation.stop()
		motion = Vector2(0, 0)