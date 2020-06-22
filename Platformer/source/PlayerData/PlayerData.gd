extends Node

var score = 0 setget set_score
var deaths = 0 setget set_death


signal score_updated
signal death_updated


func reset():
	score = 0
	deaths = 0
	
	
func set_score(value: int) :
	score = value
	emit_signal("score_updated")
	

func set_death(value: int) :
	deaths = value 
	emit_signal("death_updated")
