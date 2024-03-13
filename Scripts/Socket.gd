extends Node

export var websocket_url_local = "wss://localhost:4242"
export var websocket_url_public = "wss://coregame.de"

var socket = WebSocketClient.new()
var spectator_id = 42
var data = ""

func _ready():
	# Connect base signals to get notified of connection open, close, and errors.
	socket.connection_closed.connect(socket_on_closed)
	socket.connection_error.connect(socket_on_error)
	socket.connection_established.connect(socket_on_connect)
	# This signal is emitted when not using the Multiplayer API every time
	# a full packet is received.
	# Alternatively, you could check get_peer(1).get_available_packets() in a loop.
	socket.data_received.connect(socket_on_data)

	var err = socket.connect_to_url(websocket_url_local, ["lws-mirror-protocol"])
	if err != OK:
		print("Unable to connect")
		set_process(false)

func socket_on_closed(was_clean = false):
	# was_clean will tell you if the disconnection was correctly notified
	# by the remote peer before closing the socket.
	print("Closed, clean: ", was_clean)
	set_process(false)
	
func socket_on_error(error):
	print("Socket Error: ", error)
	set_process(false)

func socket_on_connect(proto = ""):
	# This is called on connection, "proto" will be the selected WebSocket
	# sub-protocol (which is optional)
	print("Connected with protocol: ", proto)
	# You MUST always use get_peer(1).put_packet to send data to server,
	# and not put_packet directly when not using the MultiplayerAPI.
	socket.get_peer(1).put_packet("{id:%s}".to_utf8() % str(spectator_id))

func socket_on_data():
	# Print the received packet, you MUST always use get_peer(1).get_packet
	# to receive data from server, and not get_packet directly when not
	# using the MultiplayerAPI.
	this.data = socket.get_peer(1).get_packet().get_string_from_utf8()
	print("Got data from server: ", this.data)
	

func _process(delta):
	# Call this in _process or _physics_process. Data transfer, and signals
	# emission will only happen when calling this function.
	socket.poll()
