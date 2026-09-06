from pathlib import Path


########## PATH ##########
BASE_DIR = Path(__file__).resolve().parents[0]
PATH_RAW_DATA = BASE_DIR/'data/raw/dados_abertos_banco_de_dados_de_madeiras_brasileiras_lpfsfb.csv'
PATH_GOLD_DATA = BASE_DIR/'data/gold'

########## PARÂMETROS CSV ##########
CSV_SEPARATOR = ";"
CSV_ENCODING = "cp1252"
NA_MARKERS = ["", " ", "   ", "NA", "-"]
