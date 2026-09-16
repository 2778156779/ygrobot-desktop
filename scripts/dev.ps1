$ErrorActionPreference = 'Stop'

# Keep the project's legacy Electron/Webpack toolchain on Node.js 16.
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$developmentRoot = Split-Path -Parent (Split-Path -Parent $repositoryRoot)
$nodeHome = Join-Path $developmentRoot 'tools\node-v16.20.2-win-x64'
$npmCommand = Join-Path $nodeHome 'npm.cmd'

if (-not (Test-Path -LiteralPath $npmCommand)) {
    throw "Node.js 16 was not found at $nodeHome. Restore it before starting the development app."
}

# npm's generated command shims use the first `node.exe` on PATH.
$env:Path = "$nodeHome;$env:Path"
Set-Location -LiteralPath $repositoryRoot
& $npmCommand run start
exit $LASTEXITCODE
