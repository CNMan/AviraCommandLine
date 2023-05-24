@echo %off & setlocal enabledelayedexpansion

rem Copyright (c) Avira Operations GmbH & Co. KG
rem Version: 1.0.0.12

rem Description: Performs the POST action of Updater.
rem              The script tries to figure out what action (reload or restart)
rem              should apply to the running SAVAPI service then it calls the
rem              savapi_restart.exe tool with the extracted action

rem Parameters are:
rem %1=INSTALL_DIR

set POST_UTILS_FILE="%~1\\savapi_post_utils.txt"

rem NOTE:
rem   By default, all POST files are supposed to be in the installation directory.
rem   In cases when SAVAPI modules are spread over multiple directories, the
rem   SAVAPI_DIR_PATH variable must be modified.

rem NOTE:
rem   The path must have Windows-like separators - '\\' instead of '/' or '\'
rem   Example:
rem      SAVAPI_DIR_PATH=C:\\savapi_dir       (ok)
rem      SAVAPI_DIR_PATH=C:\\savapi_dir\\     (ok)
rem      SAVAPI_DIR_PATH="C:\\savapi_dir"     (ok)
rem      SAVAPI_DIR_PATH=C:\savapi_dir        (nok)
rem      SAVAPI_DIR_PATH=C:\savapi_dir\       (nok)
rem      SAVAPI_DIR_PATH="C:\savapi_dir\"     (nok)
rem      SAVAPI_DIR_PATH=C:/savapi_dir        (nok)

rem The path to directory containing SAVAPI binary files
set SAVAPI_DIR_PATH=%~1

rem Internal variable used to store the directory of SAVAPI binary w/o quotes
set SAVAPI_DIR_PATH_WO_QUOTES=%SAVAPI_DIR_PATH:"=%

rem ############################################################################
rem Skip the POST action if the SAVAPI binary does not exists
rem ############################################################################

if not exist "%SAVAPI_DIR_PATH_WO_QUOTES%\\savapi.exe" (
    echo "[SAVAPI_WARNING] The SAVAPI binary file '%SAVAPI_DIR_PATH_WO_QUOTES%\savapi.exe' couldn't be accessed. The POST action is skipped^!"
    del /Q %POST_UTILS_FILE%
    exit /B 0
)

rem ############################################################################
rem Extract the SCRIPT_MODE for SAVAPI
rem ############################################################################
set ACTION=restart
if exist %POST_UTILS_FILE% (
    findstr "restart" %POST_UTILS_FILE% > nul 2>&1 || (
        findstr "reload" %POST_UTILS_FILE% > nul 2>&1 && (
            set ACTION=reload
        )
    )

    rem Remove the utils file
    del /Q %POST_UTILS_FILE%
) else (
    echo "[SAVAPI_WARNING] PRE action wasn't run. Choosing default SAVAPI action (!ACTION!)"
)

rem ############################################################################
rem Run the SAVAPI restart tool with the extracted action
rem ############################################################################

rem Run the SAVAPI restart
if  exist "%SAVAPI_DIR_PATH_WO_QUOTES%\\savapi_restart.exe" (
    "%SAVAPI_DIR_PATH_WO_QUOTES%\\savapi_restart.exe" !ACTION!
) else (
    echo "[SAVAPI_WARNING] The SAVAPI restart file '%SAVAPI_DIR_PATH_WO_QUOTES%\savapi_restart.exe' couldn't be accessed. The POST action is skipped^!"
)
