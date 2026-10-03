class_name Stamina
extends RefCounted
## Lógica pura da estamina (sem nó), para poder testar sem cena.
## Correr gasta; parar de correr recupera depois de um atraso.
## Se zerar, fica "exausto" e só volta a correr ao recuperar o mínimo.

var max_value: float
var drain: float
var regen: float
var regen_delay: float
var min_to_run: float

var value: float
var exhausted := false
var _regen_wait := 0.0

static func from_stats(s: PlayerStats) -> Stamina:
	var st := Stamina.new()
	st.max_value = s.stamina_max
	st.drain = s.stamina_drain
	st.regen = s.stamina_regen
	st.regen_delay = s.stamina_regen_delay
	st.min_to_run = s.stamina_min_to_run
	st.value = s.stamina_max
	return st

## Avança o tempo. Retorna true se o herói está correndo neste quadro.
func update(delta: float, wants_run: bool, moving: bool) -> bool:
	if exhausted and value >= min_to_run:
		exhausted = false
	var running := wants_run and moving and not exhausted and value > 0.0
	if running:
		value = maxf(0.0, value - drain * delta)
		_regen_wait = regen_delay
		if value <= 0.0:
			exhausted = true
	else:
		if _regen_wait > 0.0:
			_regen_wait -= delta
			if _regen_wait < 0.0:
				# usa o resto do quadro para já recuperar
				value = minf(max_value, value + regen * -_regen_wait)
				_regen_wait = 0.0
		else:
			value = minf(max_value, value + regen * delta)
	return running
