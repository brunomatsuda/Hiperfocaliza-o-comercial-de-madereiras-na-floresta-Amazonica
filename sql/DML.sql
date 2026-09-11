/*
INSERT INTO dim_taxonomia (
    familia, 
    genero, 
    especie
)
SELECT 
    familia, 
    genero, 
    especie
FROM [meu_lakehouse].[dbo].[madeiras_brasileiras];*/

-- ------------------------------------------------------------
-- 1) DIM_TAXONOMIA 
-- ------------------------------------------------------------
INSERT INTO dim_taxonomia (sk_taxonomia, familia, genero, especie)
SELECT
    ROW_NUMBER() OVER (ORDER BY familia, genero, especie) AS sk_taxonomia,
    familia,
    genero,
    especie
FROM (
    SELECT DISTINCT familia, genero, especie
    FROM [meu_lakehouse].[dbo].[madeiras_brasileiras]
) d;

-- ------------------------------------------------------------
-- 2) DIM_ESPECIE
-- ------------------------------------------------------------
INSERT INTO dim_especie (sk_especie, id_especie, nome_cientifico, nome_popular_1)
SELECT
    ROW_NUMBER() OVER (ORDER BY id_especie) AS sk_especie,
    id_especie,
    nome_cientifico,
    nome_popular_1
FROM (
    SELECT DISTINCT id_especie, nome_cientifico, nome_popular_1
    FROM [meu_lakehouse].[dbo].[madeiras_brasileiras]
) d;

-- ------------------------------------------------------------
-- 3) DIM_APARENCIA 
-- ------------------------------------------------------------
INSERT INTO dim_aparencia (
    sk_aparencia, cor_cerne_classificacao, textura, gra, brilho, cerne_alburno, figura_tangencial
)
SELECT 
    ROW_NUMBER() OVER (ORDER BY cor_cerne_classificacao, textura, gra, brilho, cerne_alburno, figura_tangencial) AS sk_aparencia,
    cor_cerne_classificacao,
    textura,
    gra,
    brilho,
    cerne_alburno,
    figura_tangencial
FROM (
    SELECT DISTINCT
        cor_cerne_classificacao, textura, gra, brilho, cerne_alburno, figura_tangencial
    FROM [meu_lakehouse].[dbo].[madeiras_brasileiras]
)d;

-- ------------------------------------------------------------
-- 4) FATO_PROPRIEDADES_MADEIRA
-- ------------------------------------------------------------
INSERT INTO fato_propriedades_madeira (
    sk_fato, sk_especie, sk_taxonomia, sk_aparencia,
    densidade_basica, contracao_tangencial, contracao_radial, contracao_volumetrica,
    relacao_tangencial_radial, flexao_seca_moe, flexao_seca_mor, compressao_paralela_seca,
    dureza_janka_paralela_seca, dureza_janka_transversal_seca, cisalhamento_seca,
    secagem_duracao_dias
)
SELECT
    ROW_NUMBER() OVER (ORDER BY m.id_especie) AS sk_fato,
    de.sk_especie,
    dt.sk_taxonomia,
    da.sk_aparencia,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.densidade_basica, ',', '.'))), '') AS DECIMAL(6,3))  AS densidade_basica,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.contracao_tangencial, ',', '.'))), '') AS DECIMAL(6,2))  AS contracao_tangencial,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.contracao_radial, ',', '.'))), '') AS DECIMAL(6,2))  AS contracao_radial,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.contracao_volumetrica, ',', '.'))), '') AS DECIMAL(6,2))  AS contracao_volumetrica,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.relacao_tangencial_radial, ',', '.'))), '') AS DECIMAL(6,2))  AS relacao_tangencial_radial,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.flexao_seca_moe, ',', '.'))), '') AS DECIMAL(8,2))  AS flexao_seca_moe,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.flexao_seca_mor, ',', '.'))), '') AS DECIMAL(8,2))  AS flexao_seca_mor,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.compressao_paralela_seca, ',', '.'))), '') AS DECIMAL(8,2))  AS compressao_paralela_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.dureza_janka_paralela_seca, ',', '.'))), '') AS DECIMAL(10,2))  AS dureza_janka_paralela_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.dureza_janka_transversal_seca, ',', '.'))), '') AS DECIMAL(10,2))  AS dureza_janka_transversal_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.cisalhamento_seca, ',', '.'))), '') AS DECIMAL(6,2))  AS cisalhamento_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(m.secagem_duracao_dias, ',', '.'))), '') AS DECIMAL(6,1))  AS secagem_duracao_dias
FROM [meu_lakehouse].[dbo].[madeiras_brasileiras] m
LEFT JOIN dim_especie de
    ON de.id_especie = TRY_CAST(NULLIF(LTRIM(RTRIM(m.id_especie)), '') AS INT)
LEFT JOIN dim_taxonomia dt
    ON dt.familia = m.familia AND dt.genero = m.genero AND dt.especie = m.especie
LEFT JOIN dim_aparencia da
    ON da.cor_cerne_classificacao = m.cor_cerne_classificacao
   AND da.textura = m.textura
   AND da.gra = m.gra
   AND da.brilho = m.brilho
   AND da.cerne_alburno = m.cerne_alburno
   AND da.figura_tangencial = m.figura_tangencial;