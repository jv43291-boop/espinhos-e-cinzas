extends Control
## Botão de toque que segura uma ação enquanto o dedo estiver em cima (ex.: correr).

@export var action: String = "run"
@export var label: String = "CORRER"

var _touch_index := -1

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and _touch_index == -1 and _hit(event.position):
			_touch_index = event.index
			Input.action_press(action)
			queue_redraw()
		elif not event.pressed and event.index == _touch_index:
			_touch_index = -1
			Input.action_release(action)
			queue_redraw()

func _hit(p: Vector2) -> bool:
	var r := size.x * 0.5
	return p.distance_to(global_position + size * 0.5) <= r

func _draw() -> void:
	var c := size * 0.5
	var r := size.x * 0.5
	var pressed := _touch_index != -1
	draw_circle(c, r, Color(1, 1, 1, 0.3 if pressed else 0.15))
	draw_arc(c, r, 0, TAU, 32, Color(1, 1, 1, 0.5), 1.5)
	var font := get_theme_default_font()
	var fs := 10
	var w := font.get_string_size(label, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
	draw_string(font, c + Vector2(-w * 0.5, fs * 0.35), label, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, Color(1, 1, 1, 0.8))
