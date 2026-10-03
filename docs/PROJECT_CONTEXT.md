# PROJECT_CONTEXT — Espinhos & Cinzas

> Legenda: **CONFIRMADO** (ele decidiu) · **PROPOSTA** (sugestão, aguarda aprovação) · **NÃO DEFINIDO** (em aberto).
> Regra para agentes: não transformar PROPOSTA em cânone, não adicionar sistemas não pedidos, não avançar várias fases sozinho.

## 1. Origem
- **CONFIRMADO:** projeto pessoal, SEPARADO do Broken World e de qualquer trabalho da Rampap.
- **CONFIRMADO:** inspiração é o Dungeon Quest (Shiny Box, LLC), jogo mobile abandonado desde 2024 (informado por ele, não verificado).
- **PROPOSTA:** não é remake. É um sucessor espiritual com identidade própria. O Dungeon Quest segue protegido por direitos autorais mesmo abandonado.
- **CONFIRMADO:** nome do jogo: **Espinhos & Cinzas**.
- Pendente verificação de nome igual na Play Store e no INPI antes de publicar.

## 2. Regras de propriedade intelectual (valem para todo agente)
- Proibido reaproveitar: nome, logotipo, sprites, sons, música, textos, nomes de itens/chefes/fases, layout de fases, código.
- Permitido: gênero e mecânicas gerais (RPG de ação 2D de masmorra, classes, loot por conjuntos, chefes, arena assíncrona).
- Todo asset deve ser original, gerado por ele ou com licença clara registrada.
- Ao criar nomes, evitar semelhança com os do jogo original.

## 3. Pilares de design (o que as pessoas amam no gênero)
- **PROPOSTA:** combate de ação 2D com poucos botões e controle simples no toque.
- **PROPOSTA:** loot e conjuntos de equipamento raros; chefes que dropam peças específicas.
- **PROPOSTA:** campanha 100% offline, sem exigir conta.
- **PROPOSTA (fase futura):** arena assíncrona contra o herói de outros jogadores.

## 4. Plataforma e tecnologia
- **PROPOSTA:** Godot 4.x + GDScript, Android como alvo principal, PC para desenvolvimento (mesma base técnica do Broken World).
- **NÃO DEFINIDO:** aparelho alvo de teste (o Moto G30 já usado no outro projeto é candidato).

## 5. Escopo do primeiro corte (Vertical Slice)
- **PROPOSTA:** 1 classe jogável, 3 andares da torre (ver seção 6), 1 chefe por andar com drop de peça de conjunto, inventário e equipamento básicos, controles touch, save local.
- **Fora do corte:** arena, multiplayer, loja, compras no app, anúncios, múltiplas classes.

## 6. Tema e mundo
- **CONFIRMADO:** estrutura de **torre vertical infinita** (cada andar é uma masmorra; cada chefe guarda a peça de um conjunto) combinada com **fantasia sombria de contos de fadas**.
- **PROPOSTA — premissa:** uma torre onde os contos ficaram presos e apodreceram. Cada andar é um conto distorcido e o chefe do andar é o vilão dele.
- **PROPOSTA — andares do Vertical Slice (3):**
  1. Floresta de trilha sem fim: lobos e chefe-bruxa.
  2. Casa de doces apodrecida: doces mecânicos e chefe-forno.
  3. Salão de espelhos: ilusões e chefe-rainha.
- **PROPOSTA — conjuntos:** cada chefe dropa uma peça do conjunto do conto (capa vermelha, migalhas, espelho), com visual e bônus próprios.
- **PROPOSTA — tom:** lúdico por fora e macabro por dentro.
- **Regra de direitos autorais para o tema:** usar só elementos de folclore/domínio público. Não usar personagens, nomes, designs ou visuais de adaptações protegidas (Disney e similares). Personagens, nomes e visuais devem ser originais.

## 7. Classe inicial
- **CONFIRMADO:** a primeira classe jogável é o **Caçador**.
- **PROPOSTA — papel:** combate à distância (arco ou besta), com foco em manter distância, posicionamento e esquiva.
- **CONFIRMADO — câmera:** vista de cima (top-down); o herói anda livre em 8 direções e não pula.
- **CONFIRMADO — movimento:** andar e correr. Correr gasta estamina, que se recupera com o tempo. No touch, a corrida é um botão de segurar.
- **CONFIRMADO — esquiva:** não é um movimento; é um atributo (chance de o ataque do inimigo errar) que vem de equipamentos, com teto de 75%.
- **PROPOSTA — controles touch:** joystick virtual à esquerda; ataque básico com mira automática no inimigo mais próximo (menos botões na tela); botão de habilidade; botão de correr.
- **PROPOSTA — habilidade ativa inicial:** armadilha posicionável (ex.: armadilha de urso) que prende ou fere inimigos.
- **PROPOSTA — fantasia:** o Caçador do folclore dos contos; identidade, nome e visual originais.
- **PROPOSTA:** equipamentos do Caçador: arma à distância, capa/armadura, aljava/acessório; conjuntos alteram dano, alcance ou tipo de flecha.
- **CONFIRMADO:** o nome do herói é escolhido pelo jogador ao iniciar o jogo; o jogo não define nome canônico.
- **PROPOSTA:** campo de nome na criação de jogo novo, com limite de caracteres e nome padrão caso fique vazio.
- **NÃO DEFINIDO:** atributos-base e número de habilidades.
- **NÃO DEFINIDO:** classes futuras (guerreiro e mago ficam fora do Vertical Slice).

## 8. Pontos NÃO DEFINIDOS
- Tom narrativo detalhado.
- Modelo de monetização (se houver).
- Se a arena será feita e como (ver TECHNICAL_PLAN, seção Back-end).
- Se a torre será infinita de verdade (andares gerados) ou finita com número fixo de andares.

## 9. Regras de trabalho
- Ciclo: especificar → implementar → testar → corrigir → validar → checkpoint → próxima fase.
- Git: nenhum commit, push, branch ou PR sem autorização explícita dele.
- Ao concluir tarefa informar: criado, modificado, como testar, problemas, riscos e próximo passo.
