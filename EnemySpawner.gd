extends Node

const ENEMY = preload("res://Enemy.tscn")
const MAX_ENEMIES = 50

var enemy_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if (enemy_count < MAX_ENEMIES):
        var e = ENEMY.instance()
        get_node("Container").add_child(e)
        e.position.x = 1500
        e.position.y = rand_range(32, 868)
        enemy_count += 1