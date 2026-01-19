extends Node2D

@export var pos_Y: float = self.global_position.y

signal on_player_collision()

func _ready() -> void:
	print("USER POS Y: ", pos_Y)

func _process(delta: float) -> void:
	if Input.is_action_pressed("player_Up"):
		print("PRESSING IT")
		global_position.y -= 4
		
	elif Input.is_action_pressed("player_Down"):
		print("PRESSING IT")
		global_position.y += 4

func _on_hitbox_area_entered(area: Area2D) -> void:
	on_player_collision.emit()
	print("player collision")
