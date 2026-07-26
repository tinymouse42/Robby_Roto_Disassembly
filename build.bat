@echo off
setlocal

cd /d "%~dp0"

:: -----------------------------------------------------------------------------
:: Pre-flight Checks & Dependency Resolution
:: -----------------------------------------------------------------------------

:: Resolve zmac executable path
if defined ZMAC (
    if exist "%ZMAC%" (
        set "ZMAC_BIN=%ZMAC%"
    ) else (
        where "%ZMAC%" >nul 2>&1 && set "ZMAC_BIN=%ZMAC%" || (echo ERROR: ZMAC not found & pause & exit /b 1)
    )
) else if exist "tools\zmac.exe" (
    set "ZMAC_BIN=tools\zmac.exe"
) else (
    where zmac >nul 2>&1 && set "ZMAC_BIN=zmac" || (echo ERROR: zmac not found & pause & exit /b 1)
)

:: -----------------------------------------------------------------------------
:: Build Execution
:: -----------------------------------------------------------------------------

echo Robby Roto ROM build
echo   source: src\rr_disassembly.asm
echo   output: roms
echo.

echo [1/4] Preparing clean build environment...
if exist "src\zout" rmdir /s /q "src\zout"
mkdir "src\zout"
if not exist "roms" mkdir "roms"

echo [2/4] Assembling rr_disassembly.asm
echo       zmac: %ZMAC_BIN%
pushd src
"..\%ZMAC_BIN%" -h -o zout\rr_disassembly.hex -x zout\rr_disassembly.lst rr_disassembly.asm
set ZMAC_ERR=%ERRORLEVEL%
popd

if %ZMAC_ERR% neq 0 (
    echo ERROR: zmac failed. Review the assembler output above.
    pause
    exit /b %ZMAC_ERR%
)

echo [3/4] Splitting image into Robby Roto ROMs...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$inputFile = 'src\zout\rr_disassembly.hex';" ^
    "$outputDir = 'roms';" ^
    "if (-not (Test-Path $inputFile)) { Write-Error 'Input HEX file missing.'; exit 1 };" ^
    "$memory = [byte[]]::new(0xE000);" ^
    "for ($i = 0; $i -lt 0xE000; $i++) { $memory[$i] = 0xFF };" ^
    "$hexLines = Get-Content $inputFile;" ^
    "foreach ($line in $hexLines) {" ^
    "    if (-not $line.StartsWith(':')) { continue };" ^
    "    $byteCount = [Convert]::ToByte($line.Substring(1, 2), 16);" ^
    "    $address   = [Convert]::ToUInt16($line.Substring(3, 4), 16);" ^
    "    $recordType= [Convert]::ToByte($line.Substring(7, 2), 16);" ^
    "    if ($recordType -eq 0) {" ^
    "        for ($i = 0; $i -lt $byteCount; $i++) {" ^
    "            $dataByte = [Convert]::ToByte($line.Substring(9 + ($i * 2), 2), 16);" ^
    "            $targetAddr = $address + $i;" ^
    "            if ($targetAddr -lt 0xE000) { $memory[$targetAddr] = $dataByte };" ^
    "        }" ^
    "    }" ^
    "};" ^
    "$romMap = [ordered]@{" ^
    "    'rotox1.bin'  = 0x0000..0x0FFF; 'rotox2.bin'  = 0x1000..0x1FFF;" ^
    "    'rotox3.bin'  = 0x2000..0x2FFF; 'rotox4.bin'  = 0x3000..0x3FFF;" ^
    "    'rotox5.bin'  = 0x8000..0x8FFF; 'rotox6.bin'  = 0x9000..0x9FFF;" ^
    "    'rotox7.bin'  = 0xA000..0xAFFF; 'rotox8.bin'  = 0xB000..0xBFFF;" ^
    "    'rotox9.bin'  = 0xC000..0xCFFF; 'rotox10.bin' = 0xD000..0xDFFF;" ^
    "};" ^
    "foreach ($romName in $romMap.Keys) {" ^
    "    $slice = $memory[$romMap[$romName]];" ^
    "    [System.IO.File]::WriteAllBytes((Join-Path $outputDir $romName), $slice);" ^
    "    Write-Host ('  -> Wrote ' + $romName + ' (' + $slice.Length + ' bytes)');" ^
    "}"

echo [4/4] Packaging roms\robby.zip...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$filesToZip = [System.Collections.Generic.List[string]]::new();" ^
    "(Get-ChildItem -Path 'roms\rotox*.bin').FullName | ForEach-Object { $filesToZip.Add($_) };" ^
    "Compress-Archive -Path $filesToZip -DestinationPath 'roms\robby.zip' -Force"

if %ERRORLEVEL% neq 0 (
    echo ERROR: Packaging failed.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo =======================================================================
echo  BUILD SUCCESSFUL!
echo =======================================================================
pause