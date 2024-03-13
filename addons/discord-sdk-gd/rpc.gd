extends Node

const discord_app_id = 1217401429598408734

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_rpc()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_rpc() -> void:
	DiscordSDK.app_id = discord_app_id
	DiscordSDK.details = "In the Menus"
	DiscordSDK.state = "Choosing Mode"
	DiscordSDK.large_image = "game_logo"
	DiscordSDK.large_image_text = "Core Game"
	DiscordSDK.small_image_text = "by jkauker"
	DiscordSDK.start_timestamp = int(Time.get_unix_time_from_system())
	#DiscordSDK.end_timestamp = int(Time.get_unix_time_from_system()) + 3600
	DiscordSDK.refresh()

func update_rpc(details: String = "", state: String = "", small_image: String = "", small_image_text: String = "") -> void:
	var changed: bool = false
	
	if details != "":
		DiscordSDK.details = details
		changed = true
	
	if state != "":
		DiscordSDK.state = state
		changed = true
	
	if small_image != "":
		DiscordSDK.small_image = small_image
		changed = true
	
	if small_image_text != "":
		DiscordSDK.small_image_text = small_image_text
		changed = true
	
	if changed:
		DiscordSDK.refresh()
		print("RPC: Updated")
