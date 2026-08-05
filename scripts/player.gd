extends CharacterBody3D

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Vision
@onready var standing_collision: CollisionShape3D = $standing_collision
@onready var crouching_collision: CollisionShape3D = $crouching_collision

# For interaction menu
@onready var ray_cast_3d: RayCast3D = $HeightCast
@onready var interact_cast: RayCast3D = $Head/Vision/InteractCast
@onready var interact_text: Label = $CanvasLayer/BoxContainer/InteractText


# Checks if player is in dialogue to control movement
var inDialogue = false

# Starting position for resetting purposes
var startingPos

# Movement values
var current_speed_mult

@export var WALK_SPEED = 5
@export var RUN_SPEED = 8
@export var CROUCH_SPEED = 3

const JUMP_VELOCITY = 4.5

# Camera values
@export var mouse_sens = 0.4
const MIN_HEAD_TURN_DEG = -60
const MAX_HEAD_TURN_DEG = 80
const PLAYER_HEIGHT = 1.6
var crouching_depth = -0.5

# FOV
const BASE_FOV = 90.0
const FOV_CHANGE = 1.5

# Head bob variables
const BOB_FREQ = 2.0
const BOB_AMP = 0.08
var t_bob = 0.0

# Interaction messages
const INTERACT_MESSAGE : String = "Presiona E para interactuar"
const DIALOGUE_MESSAGE : String = "Presiona E para hablar"

# Executes once when starting script
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # Makes mouse stay inside window
	interact_text.hide()
	startingPos = global_position


# Camera movement handling
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and !inDialogue:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		camera.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(MIN_HEAD_TURN_DEG), deg_to_rad(MAX_HEAD_TURN_DEG))

func _physics_process(delta: float) -> void:
	if !inDialogue:
		# Interaction check
		
		if interact_cast.is_colliding():
			var target = interact_cast.get_collider()
			if target != null and target.has_method("interact"):
				interact_text.text = INTERACT_MESSAGE
				interact_text.show()
				if Input.is_action_just_pressed("interact"):
					target.interact()
			elif target.has_method("speak"):
				interact_text.text = DIALOGUE_MESSAGE
				interact_text.show()
				if Input.is_action_just_pressed("interact"):
					interact_text.hide()
					target.speak()
			else:
				interact_text.hide()
		else:
			interact_text.hide()
		
		# Check if running or crouching
		if Input.is_action_pressed("crouch"):
			current_speed_mult = CROUCH_SPEED
			head.position.y = lerp(head.position.y, PLAYER_HEIGHT + crouching_depth, delta * 6.0)
			
			standing_collision.disabled = true
			crouching_collision.disabled = false
		elif !ray_cast_3d.is_colliding():
			standing_collision.disabled = false
			crouching_collision.disabled = true
			
			head.position.y = lerp(head.position.y, PLAYER_HEIGHT, delta * 6.0)
			if Input.is_action_pressed("run"):
				current_speed_mult = RUN_SPEED
			else:
				current_speed_mult = WALK_SPEED
		
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		
		if is_on_floor():
			if direction:
				velocity.x = direction.x * current_speed_mult
				velocity.z = direction.z * current_speed_mult
			else:
				velocity.x = lerp(velocity.x, direction.x * current_speed_mult, delta * 7.0)
				velocity.z = lerp(velocity.z, direction.z * current_speed_mult, delta * 7.0)
		else:
			if input_dir != Vector2.ZERO:
				velocity.x = lerp(velocity.x, direction.x * current_speed_mult, delta * 3.0)
				velocity.z = lerp(velocity.z, direction.z * current_speed_mult, delta * 3.0)
		
		#FOV change depending on speed
		var velocity_clamped = clamp(velocity.length(), 0.5, RUN_SPEED * 2.0)
		var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
		camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
		
		# Head bob handling
		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.transform.origin = _headbob(t_bob)

		move_and_slide()

func unstuck():
	global_position = startingPos

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
