extends Area2D

const ENEMY = preload("res://Enemy.tscn")
const MAX_SPEED = 500
const ACCELERATION = 15
const FRICTION = 5

var screen_size
var movement = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
    screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_mouse_button_pressed(BUTTON_LEFT):
        var mouse_position = get_viewport().get_mouse_position()
        movement = (mouse_position - get_position())
    else:
        movement.x = 0
        movement.y = 0
    
    var angle = movement.angle()        
    if movement.length() > 5:
        position += movement.normalized() * delta * MAX_SPEED
        $AnimatedSprite.rotation = angle
        $AnimatedSprite.animation = "left"
    else:
        $AnimatedSprite.animation = "default"
    
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)
    
#    var collision = move_and_collide(motion * delta);
#    if collision:
#        if collision.collider.get_filename() == ENEMY.get_path():
#            collision.collider.queue_free()
#            pass