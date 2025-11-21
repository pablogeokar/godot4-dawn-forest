extends Sprite2D
class_name PlayerTexture

@onready var animation: AnimationPlayer = $"../Animation"

func animate(direction: Vector2) -> void:
	verify_position(direction)
	
	if direction.y != 0:
		vertical_behavior(direction)
	else:
		horizontal_behavior(direction)
	
func verify_position(direction: Vector2) -> void:
	if direction.x > 0:
		flip_h = false
	elif direction.x < 0:
		flip_h = true

func horizontal_behavior(direction: Vector2) -> void:
	if direction.x != 0:
		animation.play("run")		
	else:
		animation.play("Idle")
		
func vertical_behavior(direction: Vector2) -> void:
	if direction.y > 0:
		animation.play("fall")
	elif direction.y < 0:
		animation.play("jump")
	pass
