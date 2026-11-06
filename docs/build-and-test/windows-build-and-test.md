# Windows Build and Test

## Build

- `Build\Build_x64.cmd [Release|Debug]` builds one platform; variants are `_Win32`, `_ARM64`, and `_x64_AVX2`.
- `Build\BuildAll.cmd` builds all four supported platforms. `Build\Clean.cmd` cleans outputs.
- Run `nuget restore Notepad3.sln` once before the first build.
- Run `Version.ps1` before building to regenerate `src\VersionEx.h` (`Major.YY.Mdd.Build`, with the build number in `Versions\build.txt`).
- Default configuration is Release. CI is in `.github\workflows\build.yml` (`windows-2025-vs2026`, Release × all four platforms).
- Verify builds using the default target on the full solution. `/t:Notepad3` fails with MSB4057 because not all subprojects define that target. Check that `Bin\Release_x64_v145\Notepad3.exe` has a fresh timestamp.

### APDL/NASTRAN x64 artifact build

`pwsh Build/scripts/Build-APDL.ps1 -BuildNumber 1` builds the full solution in
Release/x64 using the installed Visual Studio toolset. It requires Windows,
PowerShell 7, NuGet on PATH, and Visual Studio C++ tools. It generates version
headers/manifests from the checked-in templates, verifies the executable's fresh
version and AMD64 PE header, and packages the binary, language DLLs, themes,
licenses, and APDL/NASTRAN fixtures under `Bin/APDL-artifacts` with SHA-256 hashes and
source-commit metadata. These checks do not replace Windows GUI acceptance tests.

`.github/workflows/apdl-windows.yml` runs this script on `windows-latest` for
`codex/apdl-*` branch pushes or manual dispatch, runs
`test/TestNastranColumnGuides.ps1` against the built Windows UI (including zh-CN
resource loading), then uploads `Notepad3-APDL-NASTRAN-x64`. The font checks use
Consolas, Arial, and a SHA-256-pinned official Sarasa Term SC archive; the test
registers/removes its regular/bold fonts for the runner session. The artifact README
explains extracting the complete portable ZIP and retaining its `lng` directory.

### Publishing an APDL/NASTRAN fork release

- Push a tag `apdl-nastran-v7.YY.Mdd.Build` pointing to the release source commit.
  The same workflow builds and tests that tagged commit before its separate
  `release` job (the only job with `contents: write`) publishes a GitHub Release.
  Branch pushes and manual dispatch only upload Actions artifacts.
- Tag builds pass `-ReleaseVersion 7.YY.Mdd.Build` to `Build/scripts/Build-APDL.ps1`.
  This overrides the date/run-number version, including the executable resources,
  manifest, ZIP filename, and metadata; rerunning a tag keeps its version.
  Each of the four canonical numeric components must fit a Windows WORD (0-65535).
  `test/TestApdlReleaseVersion.ps1` checks malformed, noncanonical, and out-of-range
  inputs before any build tool is invoked; CI runs it before building.
- The release job checks tag/version/source-commit agreement and both SHA-256
  records, then uploads the complete ZIP, loose EXE, checksums, metadata, and
  package instructions. It creates a draft with all assets before publishing it
  as latest. Release notes come from `Build/Docs/RELEASE-APDL-NASTRAN.md`.
- If publication fails after draft creation, inspect that draft before retrying;
  `gh release create` deliberately refuses an existing release instead of silently
  replacing its assets. Windows GUI lexer acceptance remains a manual check using
  the packaged fixtures; the automated UI test covers NASTRAN column guides.

### Invoking MSBuild from PowerShell

`msbuild` is not on the PowerShell PATH. Locate it with `vswhere.exe`:

```powershell
$msbuild = & "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" `
    -latest -requires Microsoft.Component.MSBuild `
    -find MSBuild\**\Bin\MSBuild.exe | Select-Object -First 1
& $msbuild Notepad3.sln /m /p:Configuration=Release /p:Platform=x64 /nologo /v:minimal
Write-Host "Exit code: $LASTEXITCODE"
```

Check `$LASTEXITCODE` and scan output for `-> Notepad3.exe` or `error C` entries. Avoid reading verbose output in full; filter or tail it.

## Tests and CI

Tests include `test\TestFileVersion.cmd` and `test\TestAhkNotepad3.cmd` (AutoHotkey).

- `test\test_files\encoding\TestEncodingDetection.ps1` builds a temporary native regression harness using Visual C++ and the current encoding detector functions. See [Encoding diagnostics and tests](../domain/encoding-diagnostics-and-tests.md#regression-coverage) for coverage and stub boundaries.
- The CI runner has no `wmic`; query dates and file versions with PowerShell.
- Both tests share a `shell: cmd` step, which reports only the last command's exit code; append `|| exit /b 1` to every earlier test command.
- Drive dialogs in the AHK test should be driven with `PostMessage(WM_COMMAND, ...)`, not `ControlClick`; synthesized clicks fail intermittently on the runner desktop.

## Python environment

For scripting tasks, `.venv\` may provide Python 3.14 and is git-ignored. If absent, check for `py` or `python` before relying on Python availability.

```powershell
.venv\Scripts\python.exe <script.py>
.venv\Scripts\pip.exe install <package>
```

## Windows platform support

Supported platforms: Win32 (x86), x64, x64_AVX2, and ARM64. ARM 32-bit is not supported; `Release|ARM` maps to Win32.

- Both ARM64 and x64 define `_WIN64`; use `_M_ARM64` or `NP3_BUILD_ARM64` in `TypeDefs.h` to distinguish them.
- ARM64 build settings include `CETCompat=false` (CET is x86/x64 only), `TargetMachine=MachineARM64`, and `_WIN64`. Related scripts: `Build\scripts\FixARM64{CETCompat,CrossCompile,OutDir}.ps1`.
