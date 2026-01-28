param(
    [string]$KernelName = "selforganisingsystems",
    [string]$PythonExe = $env:PYTHON_EXE,
    [string]$VenvDir = $env:VENV_DIR
)

$ErrorActionPreference = "Stop"

if (-not $VenvDir) {
    $VenvDir = ".venv"
}

if (-not $PythonExe) {
    $candidates = @("python3.12","python3.11","python3.10","python3")
    foreach ($candidate in $candidates) {
        $cmd = Get-Command $candidate -ErrorAction SilentlyContinue
        if ($cmd) {
            $PythonExe = $cmd.Path
            break
        }
    }
}

if (-not $PythonExe) {
    Write-Error "No suitable Python found (tried python3.12, python3.11, python3.10, python3)."
    exit 1
}

Write-Host "Using Python: $(& $PythonExe --version)"
Write-Host "Venv directory: $VenvDir"

if (Test-Path $VenvDir) {
    $venvPython = Join-Path $VenvDir "Scripts\\python.exe"
    if (Test-Path $venvPython) {
        $venvVer = & $venvPython -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
        $targetVer = & $PythonExe -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
        if ($venvVer -ne $targetVer) {
            Write-Warning "Existing venv uses Python $venvVer but target is $targetVer. Use a new VenvDir or recreate the venv to switch Python versions."
        }
    }
}

if (-not (Test-Path $VenvDir)) {
    Write-Host "Creating virtual environment..."
    & $PythonExe -m venv $VenvDir
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
