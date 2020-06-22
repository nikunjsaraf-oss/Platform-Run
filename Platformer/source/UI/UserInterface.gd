extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_node("Pause_overlay")
onready var score = $Label
onready var pause_title = $Pause_overlay/Title

var paused: = false setget set_paused


func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("death_updated", self, "_PlayerData_death_updated")
	update_interface()
	
	
func _PlayerData_death_updated():
	self.paused = true
	pause_title.text = "You are dead!"
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause") and pause_title.text != "You are dead!" :
		self.paused = not paused
		scene_tree.set_input_as_handled()
		 
func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible  = value
	
	
func update_interface():
	score.text = "Score: %s" % PlayerData.score
