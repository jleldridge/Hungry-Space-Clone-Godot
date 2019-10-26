extends Node2D

export (PackedScene) var Enemy
var score = 0
var game_running = false

func _ready():
    $Player.hide()

func _on_Player_collision(body):
    if game_running:
        if body.size > $Player.size:
            $Player.hide()
            game_over()
        else:
            body.queue_free()
            $Player.eat()

func _on_StartTimer_timeout():
    game_running = true
    $Player.start($PlayerStartPosition.position)
    $EnemyTimer.start()

func _on_EnemyTimer_timeout():
    var enemy = Enemy.instance()
    add_child(enemy)
    enemy.position = Vector2(get_viewport().size.x - 50, rand_range(10, get_viewport().size.y - 10))
    $Hud.connect("start_game", enemy, "_on_start_game")


func new_game():
    $StartTimer.start()
    $Hud.update_score(score)
    $Hud.show_message("Get Ready")

func game_over():
    game_running = false
    $Hud.show_game_over()
