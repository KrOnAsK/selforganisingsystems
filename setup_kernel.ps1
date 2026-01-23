param(
    [string]$KernelName = "selforganisingsystems"
)

$ErrorActionPreference = "Stop"

$VenvDir = ".venv"

if (-not (Test-Path $VenvDir)) {
    Write-Host "Creating virtual environment..."
    python -m venv $VenvDir
}

Write-Host "Activating virtual environment..."
& "$VenvDir\Scripts\Activate.ps1"

Write-Host "Upgrading pip..."
python -m pip install --upgrade pip

Write-Host "Installing requirements..."
python -m pip install -r requirements.txt

Write-Host "Installing PySOMVis-main..."
python -m pip install -e PySOMVis-main

Write-Host "Installing starvers..."
python -m pip install -e starvers-main\starvers-main

Write-Host "Installing Jupyter kernel..."
python -m ipykernel install --user --name $KernelName --display-name "Python ($KernelName)"

Write-Host "Jupyter kernel installed: $KernelName"
