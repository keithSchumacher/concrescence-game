extends Node

const TerritoryScene = preload("res://scenes/territory.tscn")

# Graph data
var territories = {
	"A": {"territory_owner": "Player1", "troops": 5, "position": Vector2(100, 100)},
	"B": {"territory_owner": "Player2", "troops": 3, "position": Vector2(300, 150)},
	"C": {"territory_owner": "Neutral", "troops": 1, "position": Vector2(500, 300)}
}

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
