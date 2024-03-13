extends Camera3D

var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Camera Up"):
		position.y += speed
	if event.is_action_pressed("Camera Down"):
		position.y -= speed
	if event.is_action_pressed("Camera Backwards"):
		position.z += speed
	if event.is_action_pressed("Camera Forward"):
		position.z -= speed
	if event.is_action_pressed("Camera Right"):
		position.x += speed
	if event.is_action_pressed("Camera Left"):
		position.x -= speed
