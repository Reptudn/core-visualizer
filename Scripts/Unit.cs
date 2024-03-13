using Godot;
using System;

public enum UnitType
{
	Unassigned = -1,
	Unknown = 0,
	Worker = 0,
	Warrior = 1,
}

public partial class Unit : Node
{


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
