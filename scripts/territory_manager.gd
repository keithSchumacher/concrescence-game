extends Node

const TerritoryScene = preload("res://scenes/territory.tscn")
const EdgeScene = preload("res://scenes/edge.tscn")


# Graph data
var territories = {
	"A": {"territory_owner": "Player1", "troops": 5, "position": Vector2(100, 100)},
	"B": {"territory_owner": "Player2", "troops": 3, "position": Vector2(300, 150)},
	"C": {"territory_owner": "Neutral", "troops": 1, "position": Vector2(500, 300)}
}

# Each edge is a pair of node IDs
var edges = [
	["A", "B"],
	["B", "C"],
	["C", "A"]
]

# Called when the node enters the scene tree
func _ready():
	for id in territories:
		var data = territories[id]
		
		
		# Instance a new territory scene
		var territory = TerritoryScene.instantiate()
		# Add to scene tree first
		add_child(territory)
		
		# Initialize it with owner and troops
		territory.initialize(data["territory_owner"], data["troops"])

		
		# Set its position
		territory.position = data["position"]

		
		# Optionally store reference by ID
		territories[id].scene = territory

	for edge in edges:
		var id1 = edge[0]
		var id2 = edge[1]

		var territory1 = territories[id1]["scene"]
		var territory2 = territories[id2]["scene"]

		var edge_instance = EdgeScene.instantiate()
		add_child(edge_instance)
		edge_instance.start_node = territory1
		edge_instance.end_node = territory2
		
