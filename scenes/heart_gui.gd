extends Panel

@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(currentHealth :int):
	if currentHealth > 4:
		var temp = currentHealth % 4
		sprite.frame = 4-temp
	sprite.frame = currentHealth
		
	
