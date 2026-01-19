extends Node2D

var pos_Y: float = self.global_position.y

signal ai_paddle_collision

func _ready() -> void:
	print("AI POS Y: ", pos_Y)


func _process(delta: float) -> void:
	if Input.is_action_pressed("AI_Up"):
		print("PRESSING IT")
		global_position.y -= 4
		
	elif Input.is_action_pressed("AI_Down"):
		print("PRESSING IT")
		global_position.y += 4
		



func _on_hitbox_area_entered(area: Area2D) -> void:
	ai_paddle_collision.emit()
	print("ai collision!")
