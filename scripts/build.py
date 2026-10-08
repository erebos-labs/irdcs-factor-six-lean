#!/usr/bin/env python3
"""Build the required project modules sequentially using the committed order."""
from pathlib import Path
import json
import subprocess

root = Path(__file__).resolve().parents[1]
modules = json.loads((root / "verification/module-build-order.json").read_text())
for index, module in enumerate(modules, 1):
    print(f"[{index}/{len(modules)}] {module}", flush=True)
    subprocess.run(["lake", "--no-cache", "build", module], cwd=root, check=True)
subprocess.run(["lake", "--no-cache", "build", "IRDCS"], cwd=root, check=True)
