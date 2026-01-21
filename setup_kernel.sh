#!/usr/bin/env bash
set -euo pipefail

KERNEL_NAME="${1:-selforganisingsystems}"
VENV_DIR=".venv"

if [[ ! -d "$VENV_DIR" ]]; then
  python3 -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m pip install -e PySOMVis-main
python -m pip install -e starvers-main/starvers-main

python -m ipykernel install --user --name "$KERNEL_NAME" --display-name "Python ($KERNEL_NAME)"

echo "Jupyter kernel installed: $KERNEL_NAME"
