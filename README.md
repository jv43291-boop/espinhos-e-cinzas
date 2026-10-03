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
- Teste: `godot --headless --path . -s res://tests/smoke_test.gd`

## Estado
Fase 0 — projeto criado, aguardando teste manual. Git ainda não inicializado (aguarda autorização).
