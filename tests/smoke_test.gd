extends SceneTree
## Teste de fumaça da Fase 0. Rodar sem abrir o editor:
##   godot --headless --path . -s res://tests/smoke_test.gd
## Sai com código 0 se tudo passar e 1 se algo falhar.

var _passed := 0
var _failed := 0

func _check(cond: bool, label: String) -> void:
	if cond:
		_passed += 1
		print("  ok    ", label)
	else:
		_failed += 1
		print("  FALHA ", label)

func _initialize() -> void:
	print("== Smoke test — Fase 0 ==")
	_check(ProjectSettings.get_setting("application/config/name") == "Espinhos & Cinzas", "nome do projeto")
	var main_path: String = ProjectSettings.get_setting("application/run/main_scene")
	_check(ResourceLoader.exists(main_path), "cena principal existe")
	var packed: PackedScene = load(main_path)
	_check(packed != null, "cena principal carrega")
	if packed:
		var inst := packed.instantiate()
		_check(inst != null, "cena principal instancia")
		if inst:
			inst.free()
	_check(ProjectSettings.get_setting("display/window/size/viewport_width") == 640, "viewport 640x360")
	_check(ProjectSettings.get_setting("rendering/renderer/rendering_method") == "gl_compatibility", "renderer compatibilidade")
	for dir in ["res://docs", "res://scenes", "res://scripts", "res://data", "res://assets/sprites", "res://assets/audio", "res://tests"]:
		_check(DirAccess.dir_exists_absolute(dir), "pasta " + dir)
	print("== %d ok, %d falhas ==" % [_passed, _failed])
	quit(0 if _failed == 0 else 1)
