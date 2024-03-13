using Godot;
using System;
using System.Text.Json;
using System.Net.Sockets;
using System.Text;

public struct Game
{
	public string id;
}

public partial class Socket : Node
{

	public TcpClient client;
	public NetworkStream stream;
	public const string socketHostname = "127.0.0.1";
	public const int socketPort = 4242;

	public override void _Ready()
	{
		client = new TcpClient();

		try
		{
			client.Connect(socketHostname, socketPort);
		}
		catch (Exception e)
		{
			GD.Print("Could not connect to server: " + e.Message);
			return ;
		}

		SendMessage("{\"id\":\"42\"}");
	}

	public override void _Process(double delta)
	{
		string message = ReceiveMessage();
		if (!string.IsNullOrEmpty(message))
		{
			GD.Print("Received Message: ", message);
			//Game game = JsonSerializer.Deserialize<Game>(message);
			//Console.WriteLine(game.id);
		}
	}

	public void SendMessage(string message)
	{
		GD.Print("Sending message: ", message);
		if (stream.CanWrite)
		{
			byte[] data = Encoding.UTF8.GetBytes(message);
			stream.Write(data, 0, data.Length);
		}
		else throw new Exception("Could not send message");
	}

	public string ReceiveMessage()
	{
		StringBuilder message = new StringBuilder();
		byte[] data = new byte[1024];
		int bytesRead;
		int i = 0;
		
		stream = client.GetStream();
		
		do
		{
			bytesRead = stream.Read(data, 0, data.Length);
			message.Append(System.Text.Encoding.UTF8.GetString(data, 0, bytesRead));
		}
		while (i++ < 10);
		GD.Print("Recieved: ", message.ToString());
		return message.ToString();
	}

}
