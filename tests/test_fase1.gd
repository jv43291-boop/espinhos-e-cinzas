extends SceneTree
## Testes da Fase 1 — movimento e estamina. Rodar sem abrir o editor:
##   godot --headless --path . -s res://tests/test_fase1.gd
## Sai com código 0 se tudo passar e 1 se algo falhar.

var _passed := 0
var _failed := 0
var _room: Node
var _player: CharacterBody2D
var _frame := 0
var _start_x := 0.0
var _walk_dist := 0.0

func _check(cond: bool, label: String) -> void:
	if cond:
		_passed += 1
		print("  ok    ", label)
	else:
		_failed += 1
		print("  FALHA ", label)

func _near(a: float, b: float, tol := 0.01) -> bool:
	return absf(a - b) <= tol

## Avança a estamina em passos pequenos, como o jogo faz a cada quadro.
func _run_for(st: Stamina, seconds: float, wants_run: bool, moving: bool) -> bool:
	var r := false
	var steps := int(round(seconds / 0.05))
	for i in steps:
		r = st.update(0.05, wants_run, moving)
	return r

func _initialize() -> void:
	print("== Testes — Fase 1 ==")
	var stats: PlayerStats = load("res://data/player/cacador_stats.tres")
	_check(stats != null, "cacador_stats.tres carrega")
	_check(stats.walk_speed < stats.run_speed, "correr é mais rápido que andar")

	# --- estamina (lógica pura) ---
	var st := Stamina.from_stats(stats)
	_check(_near(st.value, 100.0), "estamina começa cheia")
	_check(_run_for(st, 1.0, true, true) and _near(st.value, 75.0), "1 s correndo gasta 25")
	_check(not _run_for(Stamina.from_stats(stats), 1.0, true, false), "parado não corre")
	_run_for(st, 3.0, true, true)
	_check(_near(st.value, 0.0) and st.exhausted, "4 s correndo zera e fica exausto")
	_check(not st.update(0.05, true, true), "exausto não corre")
	# o quadro acima (0,05 s) já conta como parado: 0,05 + 0,7 = 0,75 s < 0,8 s
	_run_for(st, 0.7, false, true)
	_check(_near(st.value, 0.0), "não recupera durante o atraso de 0,8 s")
	# 0,75 + 0,55 = 1,3 s parado -> 0,5 s recuperando a 20/s = 10
	_run_for(st, 0.55, false, true)
	_check(_near(st.value, 10.0), "recupera 20/s depois do atraso")
	_check(not st.update(0.05, true, true), "abaixo do mínimo (15) ainda não corre")
	_run_for(st, 0.3, false, true)
	_check(st.update(0.05, true, true), "com o mínimo volta a correr")
	_run_for(st, 20.0, false, false)
	_check(_near(st.value, 100.0), "recuperação para no máximo")

	# --- controles ---
	for a in ["move_left", "move_right", "move_up", "move_down", "run"]:
		_check(InputMap.has_action(a) and InputMap.action_get_events(a).size() > 0, "ação " + a)

	# --- cena (física real) ---
	var packed: PackedScene = load("res://scenes/rooms/test_room.tscn")
	_check(packed != null, "sala de teste carrega")
	_room = packed.instantiate()
	root.add_child(_room)
	_player = _room.get_node("Player")
	_start_x = _player.position.x
	Input.action_press("move_right")

func _physics_process(_delta: float) -> bool:
	_frame += 1
	if _frame == 30:
		_walk_dist = _player.position.x - _start_x
		_check(_walk_dist > 0.0 and not _player.is_running, "anda para a direita")
		_start_x = _player.position.x
		Input.action_press("run")
	elif _frame == 60:
		var run_dist := _player.position.x - _start_x
		_check(_player.is_running and run_dist > _walk_dist * 1.5, "correr anda mais longe no mesmo tempo")
		_check(_player.stamina.value < 100.0, "correr gastou estamina na cena")
		Input.action_release("run")
		Input.action_release("move_right")
		print("== %d ok, %d falhas ==" % [_passed, _failed])
		quit(0 if _failed == 0 else 1)
	return false
