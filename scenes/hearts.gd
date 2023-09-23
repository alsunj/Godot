extends HBoxContainer

@onready var heartGuiClass = preload("res://scenes/heart_gui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setMaxHearts(max: int):
	for i in range(max):
		var heart = heartGuiClass.instantiate()
		add_child(heart) 		 

func updateHearts(currentHealth: int):
	var hearts = get_children()
	var totalHearts = hearts.size()
	var fullHearts = currentHealth / 4
	var quartersInLastHeart = currentHealth % 4

	for i in range(totalHearts):
		if i < fullHearts:
			hearts[i].update(0)
		elif i == fullHearts:
			hearts[i].update(4-quartersInLastHeart)
		else:
			hearts[i].update(4)
	if currentHealth <= 0:
		for i in range(totalHearts):
			hearts[i].update(0)
	

