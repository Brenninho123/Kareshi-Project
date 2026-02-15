extends Node2D

@export var enemy_scene: PackedScene = preload("res://Enemy.tscn")
@export var spawn_interval: float = 2.0

func _ready():
    $TimerSpawn.wait_time = spawn_interval
    $TimerSpawn.start()
    randomize()

func _on_TimerSpawn_timeout():
    spawn_enemy()

func spawn_enemy():
    var enemy = enemy_scene.instantiate()
    enemy.position = Vector2(randi() % 800 + 50, -50)  # spawn na parte superior
    add_child(enemy)