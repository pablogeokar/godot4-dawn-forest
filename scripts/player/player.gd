extends CharacterBody2D
class_name Player

@onready var player_sprite: Sprite2D = $Texture
@export var speed: int = 150

func _physics_process(_delta: float) -> void:
	horizontal_movement_env()
	move_and_slide()
	player_sprite.animate(velocity)
	
func horizontal_movement_env() -> void:
	var input_direction: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_direction * speed
	
