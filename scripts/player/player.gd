extends CharacterBody2D
class_name Player

@onready var player_sprite: Sprite2D = $Texture
@export var speed: int = 150
@export var jump_speed: int = 150
@export var player_gravity: int = 150

var jump_count: int = 0
var landing: bool = false

func _physics_process(delta: float) -> void:
	horizontal_movement_env()
	vertical_movement_env()
	gravity(delta)
	move_and_slide()
	player_sprite.animate(velocity)
	
func horizontal_movement_env() -> void:
	var input_direction: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_direction * speed

func vertical_movement_env() -> void:
	if is_on_floor():
		jump_count = 0
		
	if Input.is_action_just_pressed("ui_select") and jump_count < 2:
		jump_count += 1
		velocity.y = jump_speed		
	

func gravity(delta: float) -> void:
	velocity.y += delta * player_gravity
	if velocity.y >= player_gravity:
		velocity.y = player_gravity
	
