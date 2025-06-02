# Concrescence

**Concrescence** is an abstract, modular strategy game inspired by *Risk*, game theory, and topology. The game takes place on a **connectivity graph** where players attempt to control nodes according to configurable rules.

## 🧠 Core Concepts

- **Connectivity Graph**: The "board" is a graph — nodes and edges — that define how regions connect.
- **Ruleset Engine**: Rules for gameplay (combat, movement, ownership, etc.) are modular and configurable by players.
- **Visualization-Agnostic**: Visuals are abstract and flexible. The game may be rendered as a graph or tessellated map, but gameplay depends only on connectivity.
- **Multiplayer**: Players connect to a central server or host their own, supporting custom game rules and topologies.

## 🏗️ Project Structure

```plaintext
concrescence-game/
├── assets/           # Images, icons, sounds
├── config/           # JSON or custom config files for rules/graphs
├── cpp/              # C++ source (for GDExtension logic)
├── gdnative/         # GDExtension build and config files
├── scenes/           # Godot scenes (UI, game)
├── scripts/          # GDScript logic and control code
├── notes.md          # Design ideas and planning notes
├── project.godot     # Godot project file
└── README.md
````

## 🚀 Getting Started

### 📦 Requirements

* [Godot Engine 4.x](https://godotengine.org/download)
* Optional: GCC/Clang (for C++ GDExtension)
* Optional: Python (for config tools or server logic)

### 🛠️ Setup

1. Clone or download the repo:

   ```bash
   git clone https://github.com/YOUR_USERNAME/concrescence-game.git
   cd concrescence-game
   ```

2. Launch Godot and open the project.

3. Run the main scene (`scenes/Main.tscn`).

### 🧪 Early Prototype Goals

* [x] Display a graph with nodes and edges.
* [ ] Click on nodes to toggle/control them.
* [ ] Load graph structure from config file.
* [ ] Add player ownership logic.
* [ ] Add rule engine for conflicts and turns.

## 🔄 Modularity

Gameplay logic will be externally defined (JSON, Lua, or custom DSL), allowing players to create and load their own rule sets and maps.

## 🌐 Multiplayer (Planned)

* Central server with subscriptions
* Peer-hosted servers with optional matchmaking
* Shared rule and map definition via config files

## 💬 License / Contributions

> License: TBD

Pull requests, issues, and ideas are welcome!

---

## 🧭 Inspiration

* **Risk** – classic territorial strategy
* **Topology** – games built on shape and connection, not geography
* **Game Theory** – interaction and decision-making
* **Sociology/Psychology** – player dynamics, diplomacy, and control

```

---

Let me know if you’d like to:
- Add badges (build status, license).
- Include install/setup instructions for C++ extension tools.
- Add a sample graph or config format.

Happy building!
```
