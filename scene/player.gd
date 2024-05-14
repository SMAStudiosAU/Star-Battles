extends Area2D

@export var speed = 400
var screen_size
var playerRotation = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	var currentRotation = $".".rotation
	$".".rotation = currentRotation + ((playerRotation - currentRotation) * 0.1)
	#$".".rotation = playerRotation

	if velocity.y > 0:
		velocity = velocity.normalized() * speed
		playerRotation = -100
	elif velocity.y < 0:
		velocity = velocity.normalized() * speed
		playerRotation = 100
	else:
		playerRotation = 0
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
