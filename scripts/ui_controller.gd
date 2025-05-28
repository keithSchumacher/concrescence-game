extends CanvasLayer

@onready var next_phase_button = $NextPhaseButton
var turn_manager: Node = null  # cache reference

func _ready():
	turn_manager = get_node("../TurnManager")
	turn_manager.phase_changed.connect(_on_phase_changed)
	next_phase_button.pressed.connect(_on_next_phase_pressed)

func _on_next_phase_pressed():
	turn_manager.end_phase()

func _on_phase_changed(player, phase):
	match phase:
		"reinforce":
			next_phase_button.text = "Finish Reinforcement"
		"attack":
			next_phase_button.text = "Finish Attacking"
		"fortify":
			next_phase_button.text = "End Turn"
