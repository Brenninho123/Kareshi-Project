extends CharacterBody2D

@export var speed: float = 400
@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.2

var fire_timer: float = 0

func _process(delta):
    var input_vector = Vector2(
        Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
        Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    ).normalized()
    
    velocity = input_vector * speed
    move_and_slide()

    fire_timer -= delta
    if Input.is_action_pressed("shoot") and fire_timer <= 0:
        fire()
        fire_timer = fire_rate

func fire():
    var bullet = bullet_scene.instantiate()
    bullet.position = position + Vector2(0, -20)
    bullet.velocity = Vector2(0, -600)
    get_parent().add_child(bullet)
