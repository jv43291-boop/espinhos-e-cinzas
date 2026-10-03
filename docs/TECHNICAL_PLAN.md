# TECHNICAL_PLAN — Espinhos & Cinzas

> Legenda: **CONFIRMADO** · **PROPOSTA** · **NÃO DEFINIDO**.
> Roadmap do Vertical Slice em fases curtas. Cada fase só avança com aceite dele.

## 1. Stack
- **PROPOSTA:** Godot 4.x (versão estável, sem .NET) + GDScript. Alvo Android; dev no PC.
- **PROPOSTA:** testes headless por fase (smoke tests em GDScript), como no Broken World.
- **PROPOSTA:** dados em Resources `.tres` (ItemData, AttackData, ClassData, BossData) para balancear sem mexer em código.

## 2. Arquitetura sugerida
- **PROPOSTA:** `FloorData` (.tres) por andar: salas, inimigos, chefe, paleta e música; a torre é uma lista de FloorData, o que permite crescer sem mexer em código.
- **PROPOSTA:** SaveData guarda nome do herói (escolhido pelo jogador), andar atual, andar mais alto alcançado, inventário e equipamento.
- **PROPOSTA:** autoloads: SaveData, Inventory, Sfx, TouchControls, PauseMenu.
- **PROPOSTA:** cenas por responsabilidade: Player, Enemy (base), Boss, Pickup, Dungeon (sala), HUD.
- **PROPOSTA:** combate com Hitbox/Hurtbox por camadas de colisão.

## 3. Roadmap

| Fase | Entrega | Critério de aceite |
|---|---|---|
| 0 | Projeto Godot, estrutura de pastas, docs, git local | abre e roda cena vazia |
| 1 | Movimento do herói (PC + touch básico) | anda, pula/esquiva (se aplicável) com sensação aprovada |
| 2 | Combate básico do Caçador (disparo de projétil, mira automática, dano, alvo de treino) | flecha sai, acerta, causa dano, feedback visível |
| 3 | Vida do herói, morte, respawn, primeiro inimigo | inimigo ataca e pode matar |
| 4 | Loot: ItemData, drop, pickup, raridades | itens caem e são coletados |
| 5 | Inventário e equipamento (slots, atributos, comparação) | equipar altera atributos |
| 6 | Conjuntos de equipamento (bônus por peças) | bônus ativa com N peças |
| 7 | Andar 1 (Floresta): 2–3 salas, progressão entre salas | percorre do início ao fim |
| 8 | Chefe do andar 1 (bruxa), com 2 fases, que dropa peça de conjunto | derrotar e receber a peça |
| 8b | Andares 2 (casa de doces) e 3 (salão de espelhos) reutilizando o molde do andar 1 | 3 andares percorríveis com 1 chefe cada |
| 9 | Save local, menu principal (com tela de nome do herói) e pausa | nome escolhido aparece no jogo e CONTINUAR funciona após fechar o app |
| 10 | Export Android + medição de fps no aparelho alvo | roda estável no aparelho |

- **PROPOSTA:** a habilidade ativa do Caçador (armadilha) pode entrar entre as fases 3 e 4, se ele quiser.
- **PROPOSTA:** projéteis como cena própria (Projectile) com Hitbox, velocidade e alcance vindos de um AttackData; usar pooling se houver muitas flechas na tela, medindo no aparelho.
- **PROPOSTA:** mira automática no inimigo mais próximo dentro de um alcance; avaliar sensação no teste manual antes de acrescentar mira manual.
- **NÃO DEFINIDO:** ordem final das fases; ele pode reordenar.

## 4. Desempenho (mobile)
- **PROPOSTA:** medir cedo no aparelho real; luzes 2D e partículas são o gargalo conhecido do Broken World.
- **PROPOSTA:** perfil MobileQuality (menos partículas, sem sombras) desde o início.

## 5. Back-end (arena) — AVISO DE ESCOPO
Se a arena assíncrona entrar, **a tarefa passa a ser território de back-end**. Isso é regra de negócio e fica do outro lado do contrato:
- **Regra de negócio:** matchmaking, ranking, recompensas da arena, anti-trapaça e validação do combate/stats.
- **Back-end:** API, banco de dados, contas/identidade do jogador, armazenamento do "herói fantasma".
- **Front-end (Godot):** apenas exibir e enviar dados; sem decidir resultado nem recompensa.
- **Ação:** antes de implementar qualquer parte disso, o agente deve avisar e apontar o que é regra de negócio. Nada disso entra no Vertical Slice.

## 6. Riscos
- Direitos autorais: seguir as regras da seção 2 do PROJECT_CONTEXT.
- Escopo crescer cedo (arena, múltiplas classes, loja): manter fora do corte.
- Desempenho no aparelho alvo: medir a cada fase visual.
- Balanceamento de loot: manter valores em `.tres`, marcados como PROVISÓRIOS até testes.

## 7. Processo
- Ciclo: especificar → implementar → testar → corrigir → validar → checkpoint → próxima fase.
- Git: só com autorização explícita dele (commit, push, branch, PR).
- Alterações de investigação/protótipo são teste até ele autorizar.
- Ao fim de cada fase: criado, modificado, como testar, problemas, riscos, próximo passo.

## 8. Torre infinita
- **NÃO DEFINIDO:** andares gerados proceduralmente ou número fixo. Fora do Vertical Slice (que tem só 3 andares fixos).
- Se algum dia houver ranking de "andar mais alto" entre jogadores, entra no mesmo aviso de back-end da seção 5.

## 9. Próximo passo
- **CONFIRMADO:** tema escolhido (torre + contos sombrios).
- **CONFIRMADO:** classe inicial = Caçador.
- **CONFIRMADO:** nome do jogo = Espinhos & Cinzas; nome do herói é escolha do jogador.
- Próximo: ele autorizar o início da Fase 0.
