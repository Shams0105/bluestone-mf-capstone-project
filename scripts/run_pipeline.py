"""
run_pipeline.py
Master execution script for Bluestock MF Capstone
Runs the full ETL pipeline in sequence.
Usage: python scripts/run_pipeline.py
"""

import subprocess
import sys
from pathlib import Path

BASE = Path(__file__).parent.parent

def run_step(step_name, script_path):
    """Run a pipeline step and report success/failure."""
    print(f"\n{'='*50}")
    print(f"Running: {step_name}")
    print('='*50)
    result = subprocess.run(
        [sys.executable, script_path],
        capture_output=True, text=True
    )
    if result.returncode == 0:
        print(f"✅ {step_name} completed successfully")
    else:
        print(f"❌ {step_name} failed")
        print(result.stderr)
    return result.returncode

if __name__ == "__main__":
    print("🚀 Bluestock MF Capstone — Master Pipeline")
    print("="*50)

    steps = [
        ("Step 1: Live NAV Fetch", BASE / "scripts" / "live_nav_fetch.py"),
    ]

    failed = 0
    for name, path in steps:
        code = run_step(name, path)
        if code != 0:
            failed += 1

    print(f"\n{'='*50}")
    if failed == 0:
        print("🎉 Pipeline completed successfully!")
    else:
        print(f"⚠️ Pipeline completed with {failed} error(s)")
    print("="*50)