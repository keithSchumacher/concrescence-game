extends Resource
class_name GraphModel

@export var territories: Dictionary = {}   # id → {owner, troops, position}
@export var edges: Array        = []       # [[from, to], …]

static func from_json(path: String) -> GraphModel:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Cannot open %s" % path)
		return null   # or however you signal failure

	var parsed_json: Variant = JSON.parse_string(file.get_as_text())
	file.close()

	if not (parsed_json is Dictionary):
		push_error("Top-level JSON must be an object")
		return null

	var data: Dictionary = parsed_json   # now it’s safe
	var model := GraphModel.new()

	# ───────────────── nodes ─────────────────
	for node_data in data.get("nodes", []):
		var id: String = node_data.get("id")
		model.territories[id] = {
			"owner":    node_data.get("owner"),
			"troops":   node_data.get("troops", 0),
			"position": Vector2(node_data["position"][0],
								node_data["position"][1]),
		}

	# ───────────────── edges ─────────────────
	for edge_data in data.get("edges", []):
		model.edges.append([edge_data.get("from"), edge_data.get("to")])

	return model
