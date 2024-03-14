import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.bind(("127.0.0.1", 4242))
client.listen(5)

print("Server is listening on port 4242")

while True:
    conn, addr = client.accept()
    print("Connected to", addr)
    conn.send("Connected to server\nUr mom is cringe\n".encode("utf-8"))
    msg = conn.recv(1024)
    if msg:
    	print("Recieved message:", msg.decode("utf-8"))
    
