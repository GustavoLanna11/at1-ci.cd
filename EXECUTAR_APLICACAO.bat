@echo off
echo ============================================
echo Iniciando aplicacao Spring Boot...
echo ============================================
echo.

REM Tenta encontrar Java automaticamente
where.exe java >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%i in ('where.exe java') do set JAVA_PATH=%%i
    set JAVA_HOME=%JAVA_PATH%
    set JAVA_HOME=%JAVA_HOME:\bin\java.exe=%
    set JAVA_HOME=%JAVA_HOME:\bin\java=%
    set JAVA_HOME=%JAVA_HOME:\java.exe=%
    echo Java encontrado: %JAVA_HOME%
    echo.
) else (
    echo AVISO: Java nao encontrado automaticamente.
    echo Configure JAVA_HOME manualmente antes de executar.
    echo.
    pause
    exit /b 1
)

echo Iniciando aplicacao...
echo Apos iniciar, acesse: http://localhost:8080/
echo Para parar, pressione Ctrl+C
echo.
echo ============================================
echo.

call mvnw.cmd spring-boot:run

pause

