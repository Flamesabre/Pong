extends Node2D

signal ball_Spawned(ball)

var velocity: Vector2 = Vector2(0,0)
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	ball_Spawned.emit(self)
	print("We Ready. should be emitting.")

func _process(delta: float) -> void:
	global_position = global_position + velocity * delta
	out_of_Bounds()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("MOUSE CLICKED")
			generate_Velocity()

func generate_Velocity():
	var left_Right = randi_range(0,1) #0 left, 1 right
	var x_Speed = randi_range(200,400)
	var up_Down = randi_range(0,1) #0 up, 1 down
	var y_Speed = randi_range(100,500)
	
	if left_Right == 0:
		self.velocity = Vector2(-x_Speed, y_Speed)
	
	if up_Down == 0:
		self.velocity = Vector2(x_Speed, -y_Speed)
	
	if self.velocity != Vector2(0,0):
		print("Generated Velocity: ", self.velocity)
	else:
		print("0,0 speed somehow...")
		generate_Velocity()
	
	#self.velocity = Vector2(-300,0)

func out_of_Bounds():
	if self.position.y <= 0:
		self.position.y = 0
		self.velocity.y = -1.0 * self.velocity.y
	elif self.position.y + collision_shape.shape.size.y >= (get_viewport().get_visible_rect().size[1] - 200):
		self.position.y = (get_viewport().get_visible_rect().size[1] - 200) - collision_shape.shape.size.y
		self.velocity.y = -1.0 * self.velocity.y
		
		
	
