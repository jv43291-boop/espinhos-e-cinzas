extends CharacterBody2D
## Herói (Caçador) — Fase 1: andar em 8 direções e correr gastando estamina.

signal stamina_changed(value: float, max_value: float)

@export var stats: PlayerStats

var stamina: Stamina
var is_running := false
var facing := Vector2.RIGHT

@onready var _facing_marker: Node2D = $Facing

func _ready() -> void:
	if stats == null:
		stats = PlayerStats.new()
	stamina = Stamina.from_stats(stats)
	stamina_changed.emit(stamina.value, stamina.max_value)

func _physics_process(delta: float) -> void:
	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var moving := dir.length() > 0.1
	is_running = stamina.update(delta, Input.is_action_pressed("run"), moving)
	var speed := stats.run_speed if is_running else stats.walk_speed
	velocity = dir * speed
	move_and_slide()
	if moving:
		facing = dir.normalized()
		_facing_marker.rotation = facing.angle()
	stamina_changed.emit(stamina.value, stamina.max_value)
