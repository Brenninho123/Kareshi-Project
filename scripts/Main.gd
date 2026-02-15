extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 2.0

func _ready():
    $Timer.wait_time = spawn_interval
    $Timer.start()

func _on_Timer_timeout():
    var enemy = enemy_scene.instantiate()
    enemy.position = Vector2(randf_range(50, 750), -50)
    add_child(enemy)