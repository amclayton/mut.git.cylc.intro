"""Analyse Some Data"""

import math
import os
from pathlib import Path

CYLC_WORKFLOW_SHARE_DIR = 'CYLC_WORKFLOW_SHARE_DIR'
CYLC_TASK_CYCLE_POINT = os.environ['CYLC_TASK_CYCLE_POINT']
SHARE_DIR = Path(os.environ[CYLC_WORKFLOW_SHARE_DIR])
DATA_FILE = SHARE_DIR / 'data.csv'
ANALYSIS_TYPE = os.environ['ANALYSIS_TYPE']


def main():
    data = Path.read_text(DATA_FILE).split('\n')
    all_venus = [float(d.split(',')[2]) for d in data]
    if ANALYSIS_TYPE == 'geometric mean':
        mean = math.prod(all_venus) ** (1/len(all_venus))
    elif ANALYSIS_TYPE == 'arithmetic mean':
        mean = sum(all_venus) / len(all_venus)

    print(f'The {ANALYSIS_TYPE} of the data was {mean}')
