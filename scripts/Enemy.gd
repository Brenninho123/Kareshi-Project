extends CharacterBody2D

@export var bullet_scene: PackedScene
@export var fire_rate: float = 1.5
@export var speed: float = 100

var fire_timer: float = 0

func _process(delta):
    position.y += speed * delta

    fire_timer -= delta
    if fire_timer <= 0:
        shoot_pattern()
        fire_timer = fire_rate

func shoot_pattern():
    var bullets_count = 12
    for i in bullets_count:
        var angle = i * 360 / bullets_count
        var bullet = bullet_scene.instantiate()
        bullet.position = position
        bullet.velocity = Vector2.UP.rotated(deg2rad(angle)) * 200
        get_parent().add_child(bullet)