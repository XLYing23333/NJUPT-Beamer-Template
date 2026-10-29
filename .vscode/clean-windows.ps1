# Windows counterpart of clean-linux.sh.
# Usage: powershell.exe -NoProfile -File .vscode/clean-windows.ps1 -TexFile path\to\slide.tex
param(
    [Parameter(Mandatory = $true)]
    [string]$TexFile
)

$ErrorActionPreference = 'Stop'
$workspaceRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$target = (Resolve-Path -LiteralPath $TexFile -ErrorAction Stop).ProviderPath
$target = [System.IO.Path]::GetFullPath($target)
$prefix = $workspaceRoot.TrimEnd([char[]]'\/') + [System.IO.Path]::DirectorySeparatorChar

if (-not $target.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase) -or
    [System.IO.Path]::GetExtension($target) -ne '.tex') {
    throw 'The TeX file must be inside this repository.'
}

$targetDir = [System.IO.Path]::GetDirectoryName($target)
$stem = [System.IO.Path]::GetFileNameWithoutExtension($target)
$extensions = @('aux', 'log', 'out', 'thm', 'toc', 'lof', 'lot', 'bbl', 'blg',
                'idx', 'ind', 'ilg', 'nav', 'snm', 'vrb', 'xdv', 'fls',
                'fdb_latexmk', 'run.xml', 'bcf')
foreach ($extension in $extensions) {
    $artifact = Join-Path $targetDir ($stem + '.' + $extension)
    if (Test-Path -LiteralPath $artifact -PathType Leaf) {
        Remove-Item -LiteralPath $artifact -Force
    }
}
