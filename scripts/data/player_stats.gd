class_name PlayerStats
extends Resource
## Atributos de movimento do herói. Os valores ficam em .tres (data/player/)
## para ajustar sem mexer em código. Todos PROVISÓRIOS até o teste manual.

@export var walk_speed: float = 80.0          ## px/s andando
@export var run_speed: float = 140.0          ## px/s correndo
@export var stamina_max: float = 100.0
@export var stamina_drain: float = 25.0       ## gasto por segundo correndo
@export var stamina_regen: float = 20.0       ## recuperação por segundo
@export var stamina_regen_delay: float = 0.8  ## segundos parado de correr antes de recuperar
@export var stamina_min_to_run: float = 15.0  ## mínimo para voltar a correr depois de zerar
