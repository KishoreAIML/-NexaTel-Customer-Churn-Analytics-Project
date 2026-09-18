import os
import logging
import traceback
from sqlalchemy import create_engine
from dotenv import load_dotenv
from urllib.parse import quote_plus

load_dotenv()

logging.basicConfig(
    level = logging.INFO,
    format = "%(asctime)s - %(levelname)s - %(message)s"
)

logging.info("getting env variables...")
DB_HOST = os.getenv("MYSQL_HOST")
DB_PORT = os.getenv("MYSQL_PORT")
DB_USERNAME = os.getenv("MYSQL_USERNAME")
DB_PASSWORD = os.getenv("MYSQL_PASSWORD")
DB_NAME = os.getenv("MYSQL_DATABASE_NAME")
logging.info("Creadentials initiated Successfuly")

if not DB_HOST:
    raise ValueError("DATABASE HOST Not FOund in Environmetal Variables")
if not DB_PORT:
    raise ValueError("DATABASE PORT Numbers Not Fuund in Environmetal Variables")
if not DB_NAME:
    raise ValueError("DATABASE NAME Found in Environmetal Variables")
if not DB_USERNAME:
    raise ValueError("DATABASE USERNAME Not Found in Environmetal Variables")
if not DB_PASSWORD:
    raise ValueError("DATABASE PASSWORD Not Found in Environmetal Variables")

try:
    logging.info("DB URL Creating...")
    DB_URL = f"mysql+pymysql://{DB_USERNAME}:{quote_plus(DB_PASSWORD)}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    logging.info("DB URL Initiated.")
    logging.info("creating DB Engine...")
    engine = create_engine(DB_URL)
    logging.info("engine created successfuly.")
except OperationalError:
    logging.error("DATABASE Connection Faild!. Due to Wrong Credentials or a dead database server or network timeout.")
    logging.error("Traceback : ")
    logging.error(traceback.format_exc)
except Exception as e:
    logging.error("DATABASE Connection Faild!!")
    logging.error("Traceback : ")
    logging.error(traceback.format_exc)
