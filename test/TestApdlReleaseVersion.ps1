# Invalid release versions must fail before invoking Windows build tools.
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$buildScript = Join-Path $PSScriptRoot '../Build/scripts/Build-APDL.ps1'
$cases = @(
    @{ ReleaseVersion = '8.26.1106.1' },
    @{ ReleaseVersion = '7.26.1106' },
    @{ ReleaseVersion = '7.26.1106.1.2' },
    @{ ReleaseVersion = '7.026.1106.1' },
    @{ ReleaseVersion = '7.65536.1106.1' },
    @{ ReleaseVersion = '7.26.65536.1' },
    @{ ReleaseVersion = '7.26.1106.65536' },
    @{ BuildNumber = -1 },
    @{ BuildNumber = 65536 }
)
foreach ($case in $cases) {
    $rejected = $false
    try { & $buildScript @case } catch {
        if ($_.FullyQualifiedErrorId -notlike 'ParameterArgumentValidationError*' -and
            $_.Exception.Message -notlike 'ReleaseVersion must be*') { throw }
        $rejected = $true
    }
    if (-not $rejected) { throw "Invalid version accepted: $($case | ConvertTo-Json -Compress)" }
}
Write-Host "Release version validation OK ($($cases.Count) invalid inputs rejected)."
