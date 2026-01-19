extends Node

@export var ball_scene: PackedScene = preload("res://Ball.tscn")
@onready var player_Paddle: Node2D = $Player_Paddle
@onready var AI_Paddle: Node2D = $AI_Paddle

var current_ball: Node2D


func _ready() -> void:
	_on_button_pressed()
	player_Paddle.on_player_collision.connect(_on_paddle_collision)
	AI_Paddle.ai_paddle_collision.connect(_on_paddle_collision)

func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	if is_instance_valid(current_ball):
		current_ball.queue_free()
	
	current_ball = ball_scene.instantiate()
	current_ball.global_position = generate_Spawn()
	add_child(current_ball)
	
	current_ball.ball_Spawned.connect(_on_Ball_Spawned)

func _on_Ball_Spawned(ball) -> void:
	current_ball = ball
	
func generate_Spawn():
	return Vector2(randf_range(0,450),randf_range(0,450))
	
func _on_paddle_collision():
	current_ball.velocity.x = -current_ball.velocity.x
