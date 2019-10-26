extends KinematicBody2D

const MIN_SPEED = 100
const MAX_SPEED = 300
const MIN_SIZE = 1
const MAX_SIZE = 250

var speed = Vector2()
var size

# Called when the node enters the scene tree for the first time.
func _ready():
    speed.x = -1 * rand_range(MIN_SPEED, MAX_SPEED)
    size = rand_range(MIN_SIZE, MAX_SIZE)
    _scaleSize()
    
func _scaleSize():
    var computedSize = 0.5 + 0.02 * size
    $CollisionShape2D.scale.x = computedSize
    $CollisionShape2D.scale.y = computedSize
    $Sprite.scale.x = computedSize
    $Sprite.scale.y = computedSize

func _physics_process(delta):
    move_and_collide(speed * delta)

func _on_Visibility_screen_exited():
    queue_free()

func _on_start_game():
    queue_free()
