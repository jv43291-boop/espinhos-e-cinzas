extends Node2D
## Sala de teste da Fase 1: liga o herói ao HUD e limita a câmera à sala.

const ROOM_SIZE := Vector2(960, 540)

@onready var _player: CharacterBody2D = $Player
@onready var _hud: CanvasLayer = $HUD

func _ready() -> void:
	_player.stamina_changed.connect(_hud.set_stamina)
	var cam: Camera2D = _player.get_node("Camera2D")
	cam.limit_left = 0
	cam.limit_top = 0
	cam.limit_right = int(ROOM_SIZE.x)
	cam.limit_bottom = int(ROOM_SIZE.y)
	_hud.set_stamina(_player.stamina.value, _player.stamina.max_value)

func _physics_process(_delta: float) -> void:
	_hud.set_running(_player.is_running)
