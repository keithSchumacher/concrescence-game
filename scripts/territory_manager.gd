extends Node
signal owner_changed(id:String, new_owner:String)
signal troops_changed(id:String, new_count:int)

var _territories := {} # id -> {owner, troops}

func init_from_model(model:GraphModel) -> void:
	_territories.clear()
	for id in model.territories:
		var t = model.territories[id]
		_territories[id] = {owner = t.owner, troops = t.troops}

# ---------- public API ----------
func get_territory_owner(id: String) -> String:
	return _territories[id].owner
func get_troops(id:String) -> int:
	return _territories[id].troops

func change_owner(id:String, new_owner:String) -> void:
	if _territories[id].owner == new_owner: return
	_territories[id].owner = new_owner
	emit_signal("owner_changed", id, new_owner)

func add_troops(id:String, amount:int) -> void:
	_territories[id].troops += amount
	emit_signal("troops_changed", id, _territories[id].troops)

# …combat, movement rules, etc. live here …
