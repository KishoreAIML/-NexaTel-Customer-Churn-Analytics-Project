import os
import traceback
import pathlib
import logging
import pandas as pd
from pathlib import Path
from memory_profiler import profile

logging.basicConfig(
    level = logging.INFO,
    format = "%(asctime)s - %(levelname)s - %(message)s"
)

ROOT_DIR = Path(__file__).resolve().parents[2]
from src.config import Raw_data

DATA_DIR = ROOT_DIR/Raw_data
print("data dir", DATA_DIR)

@profile
def read_tables(table_name: str, dir_path: pathlib._local.WindowsPath)-> pd.DataFrame:
    try:
        logging.info("changing directory to raw...")
        files_list = os.listdir(dir_path)
        os.chdir(dir_path)
        print(files_list)
        logging.info("reading dataset...")
        for file in files_list:
            if table_name in file:
                dataset = pd.read_csv(file)
                logging.info(f"dataset {file} readed successfuly")
                return dataset
        raise FileNotFoundError(
            f"No CSV file containing '{table_name}' "
            f"found in {dir_path}"
        )
    except FileNotFoundError:
        logging.info("No such file or diectory!")
        traceback.print_exc
    except NotADirectoryError:
        print("give listdir path is a file not directory!")
        traceback.print_exc
    except Exception as e:
        print("Unexcepted Error!!")
        traceback.print_exc