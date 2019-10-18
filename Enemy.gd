extends KinematicBody2D

const MIN_SPEED = 50
const MAX_SPEED = 300

var speed

# Called when the node enters the scene tree for the first time.
func _ready():
    speed = Vector2()
    speed.x = rand_range(MIN_SPEED * -1, MAX_SPEED * -1)

func _physics_process(delta):
    move_and_collide(speed * delta);