@echo off
echo Procurando Java instalado...

REM Tenta locais comuns do Java
set JAVA_HOME_FOUND=

if exist "C:\Program Files\Java\jdk-17" (
    set JAVA_HOME=C:\Program Files\Java\jdk-17
    set JAVA_HOME_FOUND=1
    goto found
)

if exist "C:\Program Files\Java\jdk17" (
    set JAVA_HOME=C:\Program Files\Java\jdk17
    set JAVA_HOME_FOUND=1
    goto found
)

if exist "C:\Program Files (x86)\Java\jdk-17" (
    set JAVA_HOME=C:\Program Files (x86)\Java\jdk-17
    set JAVA_HOME_FOUND=1
    goto found
)

REM Tenta encontrar via registry
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\JavaSoft\Java Development Kit\17" /v JavaHome 2^>nul') do set JAVA_HOME=%%b
if defined JAVA_HOME (
    set JAVA_HOME_FOUND=1
    goto found
)

echo.
echo ERRO: Java nao encontrado automaticamente!
echo.
echo Por favor, configure manualmente:
echo 1. Descubra onde o Java esta instalado
echo 2. Execute: set JAVA_HOME=C:\caminho\para\jdk-17
echo 3. Execute: .\mvnw.cmd clean test
echo.
pause
exit /b 1

:found
echo Java encontrado em: %JAVA_HOME%
echo.
echo Executando testes...
echo.
call mvnw.cmd clean test
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo TESTES EXECUTADOS COM SUCESSO!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ERRO AO EXECUTAR TESTES
    echo ========================================
)
pause

