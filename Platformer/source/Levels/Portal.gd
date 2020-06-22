tool
extends Area2D

onready var anim = $AnimationPlayer
export var next_scene:  PackedScene


func _on_Portal_body_entered(body: Node) -> void:
	teleport()
	
	
func _get_configuration_warning() -> String:
	return "No scene selected" if not next_scene else ""
	
func teleport():
	anim.play("Fade_In")
	yield(anim, "animation_finished")
	get_tree().change_scene_to(next_scene)

