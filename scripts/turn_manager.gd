extends Node

var players = ["Player1", "Player2", "Player3"]
var current_player_index = 0
var current_phase_index = 0
var phase_order = ["reinforce", "attack", "fortify"]

signal phase_changed(player, phase)
signal turn_changed(player)

func _ready():
	start_turn(players[current_player_index])

func start_turn(player):
	current_phase_index = 0
	emit_signal("turn_changed", player)
	start_phase(player, phase_order[current_phase_index])

func start_phase(player, phase):
	print("Player %s starts phase: %s" % [player, phase])
	emit_signal("phase_changed", player, phase)

func end_phase():
	current_phase_index += 1
	if current_phase_index >= phase_order.size():
		end_turn()
	else:
		start_phase(players[current_player_index], phase_order[current_phase_index])

func end_turn():
	current_player_index = (current_player_index + 1) % players.size()
	start_turn(players[current_player_index])
