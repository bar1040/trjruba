extends CharacterBody2D

@export var speed = 200
var dir;

func _physics_process(delta):
	move()
	anime()
	flip()
	move_and_slide()
	pass

func move():
	dir = Input.get_vector("a","d","w","s")
	if dir:
		velocity = Vector2(dir * speed)
	else :
		velocity = Vector2.ZERO

func anime():
	if velocity.x != 0:
		$AnimationPlayer.play("move")
	elif velocity.y != 0:
		$AnimationPlayer.play("move")
	else :
		$AnimationPlayer.play("idle")

func flip():
	$hand.look_at(get_global_mouse_position())
	
	var muou_pos: Vector2 = (get_global_mouse_position() - global_position)
	
	if (muou_pos.x > 0):
		$Squch/Sprite2D.flip_h = false
	elif (muou_pos.x < 0):
		$Squch/Sprite2D.flip_h = true
