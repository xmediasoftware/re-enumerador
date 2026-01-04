@echo off
setlocal enabledelayedexpansion

REM Define la extensión de archivo que deseas renombrar
set "ext=mp3"

REM Define el contador inicial
set "count=1"

REM Define el directorio actual (donde se ejecuta el script)
set "dir=."

echo Renombrando archivos MP3 en el directorio actual...

REM Itera a través de los archivos, ordenándolos por fecha/hora (O de más antiguo a más reciente)
REM La opción /O:D ordena por fecha/hora (date/time).
for /F "tokens=*" %%f in ('dir /b /A-D /O:D "%dir%\*.%ext%"') do (
    REM Extrae el nombre de archivo actual sin la extensión
    set "filename=%%~nf"
    
    REM Formatea el número de contador para que tenga ceros a la izquierda (ej. 01, 02)
    REM Esto es útil para que el explorador de archivos los ordene correctamente
    set "padded_count=0!count!"
    set "padded_count=!padded_count:~-2!"
    
    REM Define el nuevo nombre del archivo
    set "newname=!padded_count! - !filename!.!ext!"

    ECHO Renombrando "%%f" a "!newname!"

    
    REM Renombra el archivo: "nombre_anterior" "nuevo_nombre"
    copy "%%f" "!newname!"
    
    echo Creando: !newname!

    del "%%f"
    
    REM Incrementa el contador
    set /A count+=1
)

echo.
echo Proceso completado.
pause
