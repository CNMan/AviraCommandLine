@echo %off

rem Copyright (c) Avira Operations GmbH & Co. KG
rem Version: 1.0.0.9

rem Description: Performs the PRE action of Updater
rem              It simply appends the action string ("reload" or "restart") in
rem              the post-utils file used by the savapi_post.bat script later in
rem              the POST action

rem Parameters are:
rem %1=INSTALL_DIR
rem %2=ACTION (restart/reload)
rem %3=MODULE (AVE2/VDF)

set POST_UTILS_FILE="%~1\\savapi_post_utils.txt"
echo %~2 %~3 >> %POST_UTILS_FILE%
