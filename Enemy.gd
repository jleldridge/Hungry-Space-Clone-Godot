extends KinematicBody2D

const MIN_SPEED = 100
const MAX_SPEED = 300
var speed = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
    speed.x = -1 * rand_range(MIN_SPEED, MAX_SPEED)

func _physics_process(delta):
    move_and_collide(speed * delta)

func _on_Visibility_screen_exited():
    queue_free()
