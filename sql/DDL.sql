DROP TABLE IF EXISTS fato_propriedades_madeira;
DROP TABLE IF EXISTS dim_especie;
DROP TABLE IF EXISTS dim_taxonomia;
DROP TABLE IF EXISTS dim_aparencia;


-- ------------------------------------------------------------
-- DIMENSÃO: Taxonomia (família / gênero / espécie botânica)
-- ------------------------------------------------------------
CREATE TABLE dim_taxonomia (
    sk_taxonomia    INT          NULL,
    familia         VARCHAR(60)  NULL,
    genero          VARCHAR(60)  NULL,
    especie         VARCHAR(60)  NULL
);

-- ------------------------------------------------------------
-- DIMENSÃO: Aparência (características visuais/qualitativas)
-- ------------------------------------------------------------
CREATE TABLE dim_aparencia (
    sk_aparencia INT NULL,
    cor_cerne_classificacao VARCHAR(300) NULL,
    textura VARCHAR(300) NULL,
    gra VARCHAR(300) NULL,
    brilho VARCHAR(300) NULL,
    cerne_alburno VARCHAR(300) NULL,
    figura_tangencial VARCHAR(300) NULL
);

-- ------------------------------------------------------------
-- DIMENSÃO: Espécie (identidade/rótulo da madeira)
-- ------------------------------------------------------------
CREATE TABLE dim_especie (
    sk_especie INT NULL,
    id_especie INT NOT NULL,
    nome_cientifico VARCHAR(300) NULL,
    nome_popular_1 VARCHAR(300) NULL
);

-- ------------------------------------------------------------
-- FATO: Propriedades físico-mecânicas e de secagem
-- ------------------------------------------------------------
CREATE TABLE fato_propriedades_madeira (
    sk_fato                        INT             NOT NULL,  -- PK lógica
    sk_especie                     INT             NULL,       -- FK lógica -> dim_especie.sk_especie
    sk_taxonomia                   INT             NULL,       -- FK lógica -> dim_taxonomia.sk_taxonomia
    sk_aparencia                   INT             NULL,       -- FK lógica -> dim_aparencia.sk_aparencia
    densidade_basica                DECIMAL(6,3)   NULL,  -- g/cm3
    contracao_tangencial            DECIMAL(6,2)   NULL,  -- %
    contracao_radial                DECIMAL(6,2)   NULL,  -- %
    contracao_volumetrica           DECIMAL(6,2)   NULL,  -- %
    relacao_tangencial_radial       DECIMAL(6,2)   NULL,  -- coeficiente de anisotropia
    flexao_seca_moe                 DECIMAL(8,2)   NULL,  -- GPa
    flexao_seca_mor                 DECIMAL(8,2)   NULL,  -- MPa
    compressao_paralela_seca        DECIMAL(8,2)   NULL,  -- MPa
    dureza_janka_paralela_seca      DECIMAL(10,2)  NULL,  -- N
    dureza_janka_transversal_seca   DECIMAL(10,2)  NULL,  -- N
    cisalhamento_seca               DECIMAL(6,2)   NULL,  -- MPa
    secagem_duracao_dias            DECIMAL(6,1)   NULL   -- dias
);














