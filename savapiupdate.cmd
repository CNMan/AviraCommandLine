@echo off
avupdate.exe --no-config --log=avupdate.log --log-append --install-dir=./ --temp-dir=./tmp --master-file=/idx/master.idx --update-modules-list=APC_HASH,AVE2,SAVAPI,SAVAPI_COMMON,SAVAPI_EX,SAVAPI_RELOAD_AVE2,SAVAPI_RELOAD_VDF,SAVAPI_RESTART,SAVAPI_STUB,SELFUPDATE,VDF,XVDF_MERGE --force-update --internet-srvs=http://oem.avira-update.com/update,http://professional.avira-update.com/update --product-file=/idx/savapi4-win64-en.info.gz --no-cert-verify --check-product --user-agent=SAVAPI4.15.21.77 --no-dns-resolve
rd /s /q avupdate_backup\
rd /s /q idx\
rd /s /q tmp\
pause
del avupdate.log
del savacli.log
del scancl.log
