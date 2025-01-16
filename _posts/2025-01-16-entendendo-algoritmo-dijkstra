---
title: Entendendo o Algoritmo de Dijkstra
description: Explicando como o algoritmo de Dijkstra encontra o caminho mais curto em um grafo ponderado. Vamos abordar sua lógica e aplicação prática de forma simples e direta.
author: Gabriel
date: 2025-01-16 18:02:00 +0300
categories: [DSA, Estrutura-de-Dados, Algoritmos]
tags: [algorithms]
pin: true
math: true
mermaid: true
---

# Entendendo o Algoritmo de Dijkstra

O algoritmo de Dijkstra é uma ferramenta poderosa usada para encontrar o caminho mais curto entre um vértice de origem e todos os outros vértices em um grafo ponderado. É amplamente aplicado em sistemas de roteamento, redes de computadores e GPS.

---

## O que é o Algoritmo de Dijkstra?

O algoritmo de Dijkstra resolve o problema do caminho mais curto em um grafo onde:
- Os pesos das arestas são não negativos.
- O grafo pode ser representado por uma matriz de adjacência ou uma lista de adjacência.

Ele funciona iterativamente, expandindo o conjunto de vértices cujo menor caminho é conhecido, até que todos os vértices tenham sido processados.

---

## Como funciona o algoritmo?

1. **Inicialização**:
   - Crie um array de distâncias, onde todas as distâncias são infinitas, exceto a distância do vértice de origem, que é zero.
   - Mantenha um conjunto de vértices ainda não visitados.

2. **Iteração**:
   - Escolha o vértice com a menor distância atualmente conhecida (que ainda não foi visitado).
   - Atualize as distâncias dos vértices vizinhos, caso seja mais curto passar pelo vértice atual.
   - Marque o vértice atual como visitado.

3. **Finalização**:
   - Repita o processo até que todos os vértices tenham sido visitados ou a menor distância conhecida seja infinita (o que indica que alguns vértices não são alcançáveis).

---

## Exemplo Prático

Considere o seguinte grafo:

```
A ---1--- B
|        / \
4      2   5
|    /      \
C ---3--- D
```

### Passo 1: Inicialização
- Vértice inicial: `A`
- Distâncias: `A=0, B=∞, C=∞, D=∞`
- Visitados: Nenhum

### Passo 2: Iteração
1. Escolha `A` (menor distância: 0).
   - Atualize: `B=1, C=4`.
   - Marque `A` como visitado.

2. Escolha `B` (menor distância: 1).
   - Atualize: `D=6` (via `B`).
   - Marque `B` como visitado.

3. Escolha `C` (menor distância: 4).
   - Atualize: `D=7` (via `C`), mas `6` já é menor.
   - Marque `C` como visitado.

4. Escolha `D` (menor distância: 6).
   - Marque `D` como visitado.

### Resultado Final
- Distâncias finais: `A=0, B=1, C=4, D=6`
- Caminho mais curto de `A` para `D`: `A -> B -> D`

---

## Implementação em Python

```python
import heapq

def dijkstra(grafo, inicio):
    distancias = {v: float('inf') for v in grafo}
    distancias[inicio] = 0
    fila_prioridade = [(0, inicio)]

    while fila_prioridade:
        dist_atual, vertice_atual = heapq.heappop(fila_prioridade)

        if dist_atual > distancias[vertice_atual]:
            continue

        for vizinho, peso in grafo[vertice_atual].items():
            nova_dist = dist_atual + peso

            if nova_dist < distancias[vizinho]:
                distancias[vizinho] = nova_dist
                heapq.heappush(fila_prioridade, (nova_dist, vizinho))

    return distancias

# Grafo representado como dicionário
grafo = {
    'A': {'B': 1, 'C': 4},
    'B': {'A': 1, 'C': 2, 'D': 5},
    'C': {'A': 4, 'B': 2, 'D': 3},
    'D': {'B': 5, 'C': 3}
}

inicio = 'A'
distancias = dijkstra(grafo, inicio)
print(distancias)
```

---

## Conclusão

O algoritmo de Dijkstra é essencial para resolver problemas de caminho mais curto em grafos ponderados. Sua implementação é simples e eficiente, principalmente ao usar uma fila de prioridade. Experimente aplicar o algoritmo em outros exemplos e explore casos como grafos maiores ou redes reais!

**Próximos passos**:
- Experimente com grafos direcionados.
- Teste diferentes representações de grafos.
- Explore a limitação de grafos com pesos negativos e outras soluções como o algoritmo de Bellman-Ford.