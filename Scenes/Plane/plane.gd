extends CharacterBody2D

@onready var sprite:AnimatedSprite2D = $Sprite
@onready var animation_player = $AnimationPlayer
@onready var engine_sound = $EngineSound

func _ready():
	pass
	

func _physics_process(delta):
	velocity.y += GameManager.GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()


func fly() -> void:
	if Input.is_action_just_pressed(GameManager.KB_FLY):
		velocity.y = GameManager.POWER
		animation_player.play("power")


func die() -> void:
	SignalManager.on_plane_died.emit()
	sprite.stop()
	engine_sound.stop()
	set_physics_process(false)

