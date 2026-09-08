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
-- 4) DIM_ESPECIE
-- ------------------------------------------------------------
INSERT INTO fato_propriedades_madeira (
    sk_fato, densidade_basica, contracao_tangencial, contracao_radial, contracao_volumetrica,
    relacao_tangencial_radial, flexao_seca_moe, flexao_seca_mor, compressao_paralela_seca,
    dureza_janka_paralela_seca, dureza_janka_transversal_seca, cisalhamento_seca,
    secagem_duracao_dias
)
SELECT
    ROW_NUMBER() OVER (ORDER BY densidade_basica) AS sk_fato,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(densidade_basica, ',', '.'))), '') AS DECIMAL(6,3))  AS densidade_basica,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(contracao_tangencial, ',', '.'))), '') AS DECIMAL(6,2))  AS contracao_tangencial,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(contracao_radial, ',', '.'))), '') AS DECIMAL(6,2))  AS contracao_radial,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(contracao_volumetrica, ',', '.'))), '') AS DECIMAL(6,2))  AS contracao_volumetrica,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(relacao_tangencial_radial, ',', '.'))), '') AS DECIMAL(6,2))  AS relacao_tangencial_radial,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(flexao_seca_moe, ',', '.'))), '') AS DECIMAL(8,2))  AS flexao_seca_moe,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(flexao_seca_mor, ',', '.'))), '') AS DECIMAL(8,2))  AS flexao_seca_mor,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(compressao_paralela_seca, ',', '.'))), '') AS DECIMAL(8,2))  AS compressao_paralela_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(dureza_janka_paralela_seca, ',', '.'))), '') AS DECIMAL(10,2))  AS dureza_janka_paralela_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(dureza_janka_transversal_seca, ',', '.'))), '') AS DECIMAL(10,2))  AS dureza_janka_transversal_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(cisalhamento_seca, ',', '.'))), '') AS DECIMAL(6,2))  AS cisalhamento_seca,
    TRY_CAST(NULLIF(LTRIM(RTRIM(REPLACE(secagem_duracao_dias, ',', '.'))), '') AS DECIMAL(6,1))  AS secagem_duracao_dias
FROM (
    SELECT
        densidade_basica, contracao_tangencial, contracao_radial, contracao_volumetrica,
        relacao_tangencial_radial, flexao_seca_moe, flexao_seca_mor, compressao_paralela_seca,
        dureza_janka_paralela_seca, dureza_janka_transversal_seca, cisalhamento_seca, secagem_duracao_dias
    FROM [meu_lakehouse].[dbo].[madeiras_brasileiras]
) d;



