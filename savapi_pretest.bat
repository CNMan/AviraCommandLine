@echo %off

rem Copyright (c) Avira Operations GmbH & Co. KG
rem Version: 1.0.0.12
rem Description: Performs the PRETEST action of Updater

rem Parameters are:
rem %1=PRETEST_INSTALL_DIR

rem ############################################################################
rem Set the internal variables needed for the PRETEST action
rem ############################################################################

rem NOTE:
rem By default, all PRETEST files are supposed to be in the PRETEST directory.
rem In cases when SAVAPI modules are spread over multiple directories, the
rem following variables must be modified. If the update process is called with
rem "--install-module-path" option, then a corresponding environment variable
rem will be set with the name: <module_name>+"_MODULE_PRETEST_DIR"

rem NOTE:
rem   The paths must have Windows-like separators - '\\' instead of '/' or '\'
rem   Example:
rem      SAVAPI_DIR_PATH=C:\\savapi_dir       (ok)
rem      SAVAPI_DIR_PATH=C:\\savapi_dir\\     (ok)
rem      SAVAPI_DIR_PATH="C:\\savapi_dir"     (ok)
rem      SAVAPI_DIR_PATH="C:\\savapi_dir\\"   (ok)
rem      SAVAPI_DIR_PATH=C:\savapi_dir        (nok)
rem      SAVAPI_DIR_PATH=C:\savapi_dir\       (nok)
rem      SAVAPI_DIR_PATH="C:\savapi_dir\"     (nok)
rem      SAVAPI_DIR_PATH=C:/savapi_dir        (nok)

rem The path to directory containing the SAVAPI files
set SAVAPI_DIR_PATH=%~1

rem The path to directory containing the engine files
if "%AVE2_MODULE_PRETEST_DIR%" == "" (
	set AVE2_MODULE_PRETEST_DIR=%~1
)

rem The path to directory containing the VDF files
if "%VDF_MODULE_PRETEST_DIR%" == "" (
	set VDF_MODULE_PRETEST_DIR=%~1
)

rem Internal variables used to store the input directories w/o quotes
set SAVAPI_DIR_PATH_WO_QUOTES=%SAVAPI_DIR_PATH:"=%
set AVE2_MODULE_PRETEST_DIR_WO_QUOTES=%AVE2_MODULE_PRETEST_DIR:"=%
set VDF_MODULE_PRETEST_DIR_WO_QUOTES=%VDF_MODULE_PRETEST_DIR:"=%

rem ############################################################################
rem Run the PRETEST action for SAVAPI using the specified directory
rem ############################################################################
if exist "%SAVAPI_DIR_PATH_WO_QUOTES%\\savapi.exe" (
    "%SAVAPI_DIR_PATH_WO_QUOTES%\\savapi.exe" --pretest --ave-dir="%AVE2_MODULE_PRETEST_DIR_WO_QUOTES%" --vdf-dir="%VDF_MODULE_PRETEST_DIR_WO_QUOTES%" --ldpath="%SAVAPI_DIR_PATH_WO_QUOTES%"
) else (
    echo "[SAVAPI_WARNING] The SAVAPI binary file '%SAVAPI_DIR_PATH_WO_QUOTES%\\savapi.exe' couldn't be accessed. The PRETEST action is skipped!"
)
