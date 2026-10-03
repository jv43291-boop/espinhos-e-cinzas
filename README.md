# Espinhos & Cinzas

RPG de ação 2D mobile (Godot 4.7.2, GDScript). Torre de contos sombrios; herói Caçador.
Documentação de projeto em `docs/` (PROJECT_CONTEXT, ART_DIRECTION, TECHNICAL_PLAN).

## Estrutura
| Pasta | Para quê |
|---|---|
| `scenes/` | cenas `.tscn` (andares, personagens, UI) |
| `scripts/` | scripts `.gd` ligados às cenas |
| `autoload/` | singletons globais (save, som, controles) — vazio na Fase 0 |
| `data/` | Resources `.tres` (itens, ataques, andares) |
| `assets/` | sprites, áudio, fontes |
| `tests/` | testes headless |
| `tools/` | scripts auxiliares (geração de assets etc.) |
| `docs/` | documentos de projeto |

## Rodar
- Editor: abrir `project.godot` no Godot 4.7.2 e apertar F5.
- Testes: `godot --headless --path . -s res://tests/smoke_test.gd` e `-s res://tests/test_fase1.gd`
- Valores do movimento/estamina: `data/player/cacador_stats.tres` (PROVISÓRIOS).

## Estado
Fase 1 — movimento (andar/correr com estamina) implementado, aguardando teste manual e aprovação.
Fase 0 concluída (repositório: github.com/jv43291-boop/espinhos-e-cinzas, privado).
