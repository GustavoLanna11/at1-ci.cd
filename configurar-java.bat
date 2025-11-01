@echo off
echo Procurando Java...
echo.

where.exe java >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%i in ('where.exe java') do set JAVA_PATH=%%i
    echo Java encontrado em: %JAVA_PATH%
    echo.
    
    REM Remove \bin\java.exe do caminho para obter JAVA_HOME
    set JAVA_HOME=%JAVA_PATH%
    set JAVA_HOME=%JAVA_HOME:\bin\java.exe=%
    set JAVA_HOME=%JAVA_HOME:\bin\java=%
    
    echo JAVA_HOME configurado para: %JAVA_HOME%
    echo.
    setx JAVA_HOME "%JAVA_HOME%" >nul 2>&1
    echo JAVA_HOME configurado no sistema!
    echo.
    echo Agora voce pode executar:
    echo   .\mvnw.cmd spring-boot:run
    echo.
) else (
    echo Java nao encontrado no PATH.
    echo Por favor, configure manualmente.
)

pause

