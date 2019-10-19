extends Node2D

export (PackedScene) var Enemy

func _ready():
    pass

func _process(delta):
    pass


func _on_Player_collision(body):
    body.queue_free()
    pass

func _on_StartTimer_timeout():
    $EnemyTimer.start()
    pass

func _on_EnemyTimer_timeout():
    var enemy = Enemy.instance()
    add_child(enemy)
    enemy.position = Vector2(get_viewport().size.x - 50, rand_range(10, get_viewport().size.y - 10))
    pass