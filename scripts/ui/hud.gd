extends CanvasLayer
## HUD da Fase 1: barra de estamina e estado (andando/correndo).

@onready var _bar: ProgressBar = $Stamina/Bar
@onready var _state: Label = $State

func set_stamina(value: float, max_value: float) -> void:
	_bar.max_value = max_value
	_bar.value = value

func set_running(running: bool) -> void:
	_state.text = "correndo" if running else "andando"
