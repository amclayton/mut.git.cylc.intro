#!/usr/bin/env python
"""Generate Toy Data For Demonstration Purposes
"""

import os
from pathlib import Path
import random

SITES = {
    'Alpha Regio': 440,
    'Asteria Regio': 478,
    'Atla Regio': 520,
    'Bell Regio': 440,
}
CYLC_WORKFLOW_SHARE_DIR = 'CYLC_WORKFLOW_SHARE_DIR'
CYLC_TASK_CYCLE_POINT = os.environ['CYLC_TASK_CYCLE_POINT']
SHARE_DIR = Path(os.environ[CYLC_WORKFLOW_SHARE_DIR])
DATA_FILE = SHARE_DIR / 'data.csv'

def main():
    results = []
    for place, temperature in SITES.items():
        results.append(
            f'{CYLC_TASK_CYCLE_POINT},{place},{random.gauss(temperature, 10)}'
        )

    if DATA_FILE.exists():
        # Update the data file
        DATA_FILE.write_text(
            DATA_FILE.read_text()
            + '\n'
            + '\n'.join(results)
        )
    else:
        # Create the data file
        DATA_FILE.write_text(
            '\n'.join(results)
        )

if __name__ == '__main__':
    main()
