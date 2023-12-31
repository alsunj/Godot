extends CharacterBody2D
@export var speed: int = 65
@onready var animations = $AnimationPlayer
@onready var hurtColor = $Sprite2D/ColorRect
 
var currentHealth: int = 3

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else: 
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
	
		animations.play("walk" + direction)

func handleCollision ():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		
func _physics_process(delta):
	move_and_slide()
	handleInput()
	handleCollision()
	updateAnimation()

func _on_hit_box_area_entered(area):
	if area.name == "hitBox":
		currentHealth -=1
		print_debug(currentHealth)
		
