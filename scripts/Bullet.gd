extends Area2D

@export var velocity: Vector2 = Vector2.ZERO

func _process(delta):
    position += velocity * delta
    if position.y < -50 or position.y > 1100 or position.x < -50 or position.x > 2000:
        queue_free()