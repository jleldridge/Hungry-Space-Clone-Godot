extends KinematicBody2D

const MIN_SPEED = 100
const MAX_SPEED = 300
const MIN_SIZE = 1
const MAX_SIZE = 250
const DEFAULT_SPRITE_SCALE = 0.1

var speed = Vector2()
var size

func _ready():
	$AnimatedSprite.play()

func determine_size(player_size):
    speed.x = -1 * rand_range(MIN_SPEED, MAX_SPEED)
    size = rand_range(MIN_SIZE, min(MAX_SIZE, player_size + 50))
    _scaleSize()
    
func _scaleSize():
    var computedSize = DEFAULT_SPRITE_SCALE + 0.02 * size
    $CollisionShape2D.scale.x = computedSize
    $CollisionShape2D.scale.y = computedSize
    $AnimatedSprite.scale.x = computedSize
    $AnimatedSprite.scale.y = computedSize

func _physics_process(delta):
    move_and_collide(speed * delta)

func _on_Visibility_screen_exited():
    queue_free()

func _on_start_game():
    queue_free()
