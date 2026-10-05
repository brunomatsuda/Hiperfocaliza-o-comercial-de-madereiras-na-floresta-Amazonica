<p align="center">
  <img src="imagens/capa.jpg" alt="capa" width="850" height="350">
</p>

# Projeto de extensão: <br> Hiperfocalização comercial de madereiras na floresta Amazônica

## 🌳 Contexto

Estudos realizados entre 2007 e 2020 pela [Imaflora](https://imaflora.org/noticias/estudo-inedito-mostra-que-2-das-especies-disponiveis-compoe-mais-da-metade-da-exploracao-madeireira-na-amazonia-brasileira) apontam que apenas **2%** das espécies de madeiras florestais têm sido exploradas à exaustão, ou seja, cerca de 15 a 20 espécies estão sendo levadas ao esgotamento, sendo que algumas delas são consideradas vulneráveis. De 2020 para 2026, este cenário não mudou muito e o subaproveitamento de madeiras continua alto. As principais causas para essa rígida concentração seriam o conservadorismo do mercado, a falta de conhecimento tecnológico e científico, diferentes regulamentações para espécies e a exploração/concorrência ilegal.

Este projeto visa demonstrar quais espécies fora do radar comercial poderiam ser aproveitadas, analisando principalmente características parecidas entre os arquétipos descritos anteriormente.

## Objetivo

**Responder à seguinte pergunta:** Quais são as espécies nativas de árvores mais comercializadas no mercado nacional? Sabendo disso, quais outras espécies possuem características semelhantes e podem ajudar a reduzir a hiperfocalização e o risco de extinção das espécies mais exploradas?

## Arquitetura do projeto
![arquitetura do projeto](/arquitetura/arquitetura.png)

## 📋 Descrição das colunas
### Colunas chaves
| `Nome` | `Descrição` |
| :--- | :--- |
| **id_especie** | val2 |
| **nome_cientifico**  | val2 |
| **nome_popular_1**  | val2 |
| **genero**  | val2 |
| **especie**  | val2 |
| **familia**  | val2 |

### Para que essa madeira serve?
Preferível as versões "secas" em relação às "verdes"
| `Nome` | `Descrição` |
| :--- | :--- |
| **densidade_basica** | qualidade da madeira |
| **densidade_aparente**  | qualidade da madeira |
| **contracao_tangencial**  | val2 |
| **contracao_radial**  | val2 |
| **contracao_volumetrica**  | val2 |
| **relacao_tangencial_radial**  | val2 |
| **flexao_seca_moe** | v2 |
| **flexao_seca_mor**  | v2|
| **compressao_paralela_seca**  | val2 |
| **dureza_janka_paralela_seca**  | val2 |
| **dureza_janka_transversal_seca**  | val2 |
| **cisalhamento_seca**  | val2 |

### Estética - uso para móveis/acabamento nobre
| `Nome` | `Descrição` |
| :--- | :--- |
| **cor_cerne_classificacao** | val2 |
| **textura**  | val2 |
| **gra**  | val2 |
| **brilho**  | val2 |
| **figura_tangencial**  | val2 |
| **figura_radial**  | val2 |
| **cerne_alburno**  | val2 |

### Processamento - viabilidade industrial
| `Nome` | `Descrição` |
| :--- | :--- |
| **secagem_duracao_dias** | quantos dias demora para secar |
| **secagem_programa_utilizado**  | val2 |


## 🔎 Descobertas e conclusões do notebook de análise

O notebook de análise foi construído para comparar espécies madeireiras por meio de suas propriedades técnicas e mecânicas, em vez de olhar apenas para o histórico comercial ou para o nome popular. A lógica principal foi:

- carregar a base de espécies e propriedades da madeira;
- selecionar as colunas relevantes para comparação (densidade, contrações, resistência à flexão, compressão, dureza e cisalhamento);
- remover espécies com dados incompletos;
- normalizar as variáveis em escala comparável usando z-score;
- calcular distâncias ponderadas entre a espécie de referência e as demais;
- listar as 5 espécies mais parecidas como potenciais substitutas.

### Principais descobertas

O notebook validou a abordagem com 10 espécies de referência, e todas elas foram encontradas na base de dados, confirmando que o conjunto de análise cobre bem o problema proposto. As principais descobertas foram:

- há espécies fora do “radar comercial” com perfil técnico muito semelhante às espécies mais exploradas;
- algumas madeiras aparecem repetidamente como substitutas em vários cenários de comparação;
- as famílias mais recorrentes na formação de substituições são Fabaceae, Lauraceae, Sapotaceae e Moraceae;
- a análise mostrou que a similaridade técnica pode ser usada como critério para ampliar a diversidade de espécies comercializadas sem perder propriedades relevantes.

### Substituições mais relevantes identificadas

Algumas das principais alternativas técnicas observadas no ranking foram:

- Apuleia leiocarpa = Apuleia molaris → Caraipa densifolia; Aspidosperma desmanthum; Micropholis guyanensis;
- Astronium lecointei → Pterocarpus sp; Piptadenia gonoacantha; Bagassa guianensis;
- Cariniana micrantha → Iryanthera grandis; Brosimum acutifolium; Hymenolobium pulcherrimum;
- Couratari guianensis → Brosimum potabile; Copaifera multijuga; Ocotea cymbarum;
- Dinizia excelsa → Zygia racemosa; Terminalia cf argentea; Pouteria caimito;
- Dipteryx odorata → Bowdichia nitida; Aniba canelilla; Dialium guianense;
- Handroanthus serratifolius = Tabebuia serratifolia → Bowdichia nitida; Myrocarpus frondosus; Terminalia amazonia;
- Hymenaea courbaril → Tetragastris altissima; Inga sp; Enterolobium schomburgkii;
- Hymenolobium petraeum → Tachigali glauca; Ormosia coccinea; Hymenolobium nitidum;
- Manilkara huberi → Aniba canelilla; Diploon cuspidatum; Dipteryx odorata.

### Conclusões possíveis

A principal conclusão do estudo é que existe potencial real para reduzir a hiperfocalização comercial da madeira, identificando espécies com características tecnicamente compatíveis às mais exploradas. Em outras palavras, o projeto sugere que a diversificação da exploração não precisa ocorrer apenas por tradição de mercado, mas também pode se basear em dados objetivos de performance da madeira.

É importante destacar que esta análise é uma triagem técnica inicial. Ela indica espécies promissoras como substitutas, mas não substitui critérios de disponibilidade no mercado, custo logístico, viabilidade industrial, aceitação comercial e aspectos regulatórios. Portanto, o projeto funciona como um filtro analítico para priorizar espécies com maior potencial de substituição sustentável.

## Fontes
[Boletim Técnico nº 15 (julho/2024) do Imaflora/Timberflow](https://admin.imaflora.org/public/media/biblioteca/boletim_timberflow_15_julho_2024_ok.pdf)