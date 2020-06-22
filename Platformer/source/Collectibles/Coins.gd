extends Area2D

onready var animplayer = $AnimationPlayer
onready var audio_coin = $AudioStreamPlayer2D


func _on_Coins_body_entered(body: Node) -> void:
	animplayer.play("Fade")
	audio_coin.play()
	PlayerData.score += 50
