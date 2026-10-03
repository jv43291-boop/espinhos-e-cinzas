extends Control
## Joystick virtual: aparece onde o dedo toca dentro desta área (metade esquerda).
## Converte o arrasto em ações move_* com força analógica.

@export var radius: float = 40.0
@export var deadzone: float = 0.2

var _touch_index := -1
var _origin := Vector2.ZERO
var _vector := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and _touch_index == -1 and get_global_rect().has_point(event.position):
			_touch_index = event.index
			_origin = event.position
			_apply(Vector2.ZERO)
		elif not event.pressed and event.index == _touch_index:
			_touch_index = -1
			_apply(Vector2.ZERO)
	elif event is InputEventScreenDrag and event.index == _touch_index:
		_apply((event.position - _origin).limit_length(radius) / radius)

func _apply(v: Vector2) -> void:
	_vector = v
	_set_axis("move_left", "move_right", v.x)
	_set_axis("move_up", "move_down", v.y)
	queue_redraw()

func _set_axis(neg: String, pos: String, value: float) -> void:
	if value <= -deadzone:
		Input.action_press(neg, -value)
		Input.action_release(pos)
	elif value >= deadzone:
		Input.action_press(pos, value)
		Input.action_release(neg)
	else:
		Input.action_release(neg)
		Input.action_release(pos)

func _draw() -> void:
	if _touch_index == -1:
		return
	var o := _origin - global_position
	draw_circle(o, radius, Color(1, 1, 1, 0.12))
	draw_arc(o, radius, 0, TAU, 32, Color(1, 1, 1, 0.35), 1.5)
	draw_circle(o + _vector * radius, radius * 0.4, Color(1, 1, 1, 0.45))
