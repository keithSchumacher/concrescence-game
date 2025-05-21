extends Node2D

@export var territory_owner: String = "Neutral"
@export var troop_count: int = 0

# Reference to the UI elements
@onready var label = $TroopLabel
@onready var visual = $Visual

func _ready():
	update_visual()

func update_visual():
	label.text = str(troop_count)
	
	match owner:
		"Player1":
			visual.color = Color.hex(0x3498dbff)  # Blue
		"Player2":
			visual.color = Color.hex(0xe74c3cff)  # Red
		_:
			visual.color = Color.hex(0x95a5a6ff)  # Neutral gray

func initialize(new_owner: String, troops: int):
	territory_owner = new_owner
	troop_count = troops
	update_visual()
