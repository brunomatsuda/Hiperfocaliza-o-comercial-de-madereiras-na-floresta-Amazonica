<p align="center">
  <img src="imagens/capa.jpg" alt="capa" width="850" height="350">
</p>

# Projeto de extensão: <br> Hiperfocalização comercial de madereiras na floresta Amazônica

## 🌳 Contexto

Estudos realizado entre 2007 e 2020 pela [Imaflora](https://imaflora.org/noticias/estudo-inedito-mostra-que-2-das-especies-disponiveis-compoe-mais-da-metade-da-exploracao-madeireira-na-amazonia-brasileira) apontam que apenas **2%** das espécies de madeiras florestais tem sido exploradas à exaustão, ou seja cerca de 15 a 20 espécies estão sendo levadas ao esgotamento, sendo que algumas delas são consideradas vulneráveis. De 2020 para 2026 este cenário não mudou muito e o subaproveitamento de madeiras continua alto. As principais causas para essa rígida concentração seriam o conservadorismo do mercado, falta de conhecimento tecnológico e científico, diferentes regulagems para espécies e a exploração/concorrência ilegal.

Este projeto visa demonstrar quais espécies fora do radar comercial poderiam ser aproveitadas, analisando principalmente características parecidas entre os dois arquétipos descritos anteriormente.
## Objetivo

**Responder a seguinte pergunta:** Quais são as espécies nativas de árvores mais comercializadas no mercado nacional? Sabendo disto quais outras possíveis espécies possuem as mesmas características para evitar a hiperfocalização/extinção das mesmas?

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

## Arquitetura do projeto
![arquitura do projeto](/arquitetura/arquitetura.png)

## Fontes
[Boletim Técnico nº 15 (julho/2024) do Imaflora/Timberflow](https://admin.imaflora.org/public/media/biblioteca/boletim_timberflow_15_julho_2024_ok.pdf)