#!/usr/bin/env bash
set -euo pipefail

KERNEL_NAME="${1:-selforganisingsystems_v2}"
PYTHON_BIN="${2:-${PYTHON_BIN:-}}"
VENV_DIR="${3:-${VENV_DIR:-.venv}}"

if [[ -z "$PYTHON_BIN" ]]; then
  for candidate in python3.12 python3.11 python3.10 python3; do
    if command -v "$candidate" >/dev/null 2>&1; then
      PYTHON_BIN="$candidate"
      break
    fi
  done
fi

if [[ -z "$PYTHON_BIN" ]]; then
  echo "No suitable Python found (tried python3.12, python3.11, python3.10, python3)." >&2
  exit 1
fi

echo "Using Python: $("$PYTHON_BIN" --version)"
echo "Venv directory: $VENV_DIR"

if [[ ! -d "$VENV_DIR" ]]; then
  "$PYTHON_BIN" -m venv "$VENV_DIR"
else
  if [[ -x "$VENV_DIR/bin/python" ]]; then
    VENV_VER="$("$VENV_DIR/bin/python" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
    TARGET_VER="$("$PYTHON_BIN" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
    if [[ "$VENV_VER" != "$TARGET_VER" ]]; then
      echo "Warning: existing venv uses Python $VENV_VER but target is $TARGET_VER." >&2
      echo "Use a new VENV_DIR or recreate the venv to switch Python versions." >&2
    fi
  fi
fi

source "$VENV_DIR/bin/activate"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m pip install -e PySOMVis-main
python -m pip install -e starvers-main/starvers-main

python -m ipykernel install --user --name "$KERNEL_NAME" --display-name "Python ($KERNEL_NAME)"

echo "Jupyter kernel installed: $KERNEL_NAME"
