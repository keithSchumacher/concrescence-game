extends Node2D

var start_node: Node2D
var end_node: Node2D
@onready var line: Line2D = $Line2D

func _process(_delta):
	if start_node and end_node:
		line.points = [start_node.global_position, end_node.global_position]
