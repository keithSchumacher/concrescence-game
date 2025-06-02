extends Node2D
class_name Territory	# convenient global name


@export var territory_owner: String = "Neutral"
@export var troop_count: int = 0

# Reference to the UI elements
@onready var label = $TroopLabel
@onready var visual = $Visual

# Child-node references – captured once the node is in the tree
@onready var troops_label: Label        = $TroopLabel
@onready var territory_shape: ColorRect = $Visual      # or Sprite

func _ready():
	_update_visual()


func initialize(new_owner: String, troops: int) -> void:
	territory_owner = new_owner
	troop_count     = troops
	_update_visual()

func _update_visual() -> void:
	troops_label.text = str(troop_count)
	match territory_owner:
		"Player1":
			territory_shape.color = Color.hex(0x3498DBFF)   # blue
		"Player2":
			territory_shape.color = Color.hex(0xE74C3CFF)   # red
		_:
			territory_shape.color = Color.hex(0x95A5A6FF)   # grey
