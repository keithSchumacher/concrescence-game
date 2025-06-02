# BoardBuilder.gd
extends Node
class_name BoardBuilder                      # optional convenience

@export var graph_json_path: String = "res://config/example_graph.json"

const TERRITORY_SCENE: PackedScene = preload("res://scenes/territory.tscn")
const EDGE_SCENE:      PackedScene = preload("res://scenes/edge.tscn")

# Territory-ID → Territory scene instance
var territory_nodes: Dictionary = {}

func _ready() -> void:
	# ───────────────── 1. Load data ─────────────────
	var graph_model: GraphModel = GraphModel.from_json(graph_json_path)
	if graph_model == null:
		push_error("BoardBuilder: could not load %s" % graph_json_path)
		return

	# ───────────────── 2. Locate TerritoryManager ─────────────────
	var territory_manager: TerritoryManager = _find_territory_manager()
	if territory_manager == null:
		push_error("BoardBuilder: TerritoryManager not found")
		return

	territory_manager.init_from_model(graph_model)

	# ───────────────── 3. Build territories ─────────────────
	for territory_id in graph_model.territories.keys():
		var territory_data: Dictionary = graph_model.territories[territory_id]

		var territory_instance := TERRITORY_SCENE.instantiate()
		territory_instance.position = territory_data.position
		add_child(territory_instance)                             # enter tree → @onready valid
		territory_instance.initialize(                            # safe call
			territory_data.owner,
			territory_data.troops
		)

		territory_nodes[territory_id] = territory_instance

	# ───────────────── 4. Build edges ─────────────────
	for endpoints in graph_model.edges:
		var edge_instance := EDGE_SCENE.instantiate()
		add_child(edge_instance)
		edge_instance.start_node = territory_nodes[endpoints[0]]
		edge_instance.end_node   = territory_nodes[endpoints[1]]

	# ───────────────── 5. React to state changes ─────────────────
	territory_manager.owner_changed.connect(_on_owner_changed)
	territory_manager.troops_changed.connect(_on_troops_changed)

# -----------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------
func _find_territory_manager() -> TerritoryManager:
	if Engine.has_singleton("TerritoryManager"):
		return Engine.get_singleton("TerritoryManager") as TerritoryManager
	return get_parent().get_node_or_null("TerritoryManager") as TerritoryManager

func _on_owner_changed(territory_id: String, new_owner: String) -> void:
	territory_nodes[territory_id].set_owner(new_owner)

func _on_troops_changed(territory_id: String, new_count: int) -> void:
	territory_nodes[territory_id].set_troops(new_count)
