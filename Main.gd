extends Node2D

export (PackedScene) var Enemy

func _ready():
    $Player.hide()
    pass

func _process(delta):
    pass


func _on_Player_collision(body):
    print(body.size)
    if body.size > $Player.size:
        $Player.hide()
    else:
        body.queue_free()
        $Player.eat()
    pass

func _on_StartTimer_timeout():
    $Player.show()
    $EnemyTimer.start()
    pass

func _on_EnemyTimer_timeout():
    var enemy = Enemy.instance()
    add_child(enemy)
    enemy.position = Vector2(get_viewport().size.x - 50, rand_range(10, get_viewport().size.y - 10))
    pass
