extends Node2D
## Cena inicial provisória da Fase 0.
## Só confirma que o projeto abre e roda. Será substituída pelo menu principal (Fase 9).

func _ready() -> void:
	# print aparece no painel "Saída" do editor e no terminal (modo headless).
	print("Espinhos & Cinzas %s — Fase 0 OK" % ProjectSettings.get_setting("application/config/version"))
