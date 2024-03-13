extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var discord_working: bool = DiscordSDK.get_is_discord_working()
	var discord_app_id: int = 123
	
	# if this is true try reconnectiing after X seconds?
	if not discord_working:
		print("Can't connect to discord!")
		pass
	
	setup_rpc()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_rpc() -> void:
	DiscordSDK.app_id = discord_app_id
	DiscordSDK.details = "In the Menus"
	DiscordSDK.state = "Choosing Mode"
	DiscordSDK.large_image = "logo"
	DiscordSDK.large_image_text = "Core Game"
	DiscordSDK.small_image_text = "Fighting the end boss! D:"
	DiscordSDK.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordSDK.end_timestamp = int(Time.get_unix_time_from_system()) + 3600
	DiscordSDK.refresh()
	
func update_rpc(details: String = null, state: String = null, small_image: String = null, small_image_text: String = null) -> void:
	var changed: bool = false
	
	if details != null:
		DiscordSDK.details = details
		changed = true
	
	if state != null:
		DiscordSDK.state = state
		changed = true
	
	if small_image != null:
		DiscordSDK.small_image = small_image
		changed = true
	
	if small_image_text != null:
		DiscordSDK.small_image_text = small_image_text
		changed = true
	
	if changed:
		DiscordSDK.refresh()
		print("RPC: Updated")
