extends Camera3D

var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed(KEY_SPACE):
		position.y += speed
	if event.is_action_pressed(KEY_SHIFT):
		position.y -= speed
	if event.is_action_pressed(KEY_W):
		position.x += speed
	if event.is_action_pressed(KEY_S):
		position.x -= speed
	if event.is_action_pressed(KEY_D):
		position.z += speed
	if event.is_action_pressed(KEY_A):
		position.x -= speed
