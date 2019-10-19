extends Area2D

const ENEMY = preload("res://Enemy.tscn")
const MAX_SPEED = 500
const ACCELERATION = 15
const FRICTION = 5

signal collision(body)

var screen_size
var movement = Vector2()

func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = false
    
func eat():
    $CollisionShape2D.scale.x += 0.02
    $CollisionShape2D.scale.y += 0.02
    $AnimatedSprite.scale.x += 0.02
    $AnimatedSprite.scale.y += 0.02
    pass

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

func _on_Player_body_entered(body):
    emit_signal("collision", body)
    #this would be how we could prevent further collisions
    #Disabling the area’s collision shape can cause an error if it happens in the middle of the engine’s collision processing. Using set_deferred() allows us to have Godot wait to disable the shape until it’s safe to do so.
#    $CollisionShape2D.set_deferred("disabled", true)
