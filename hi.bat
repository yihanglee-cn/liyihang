@echo off
rem 当前bat的作用

cls
	COLOR 0a
	TITLE C++军团通用管理批处理,请将窗口大小设置为300/300 这行字上右键 属性 布局 窗口大小, 有问题请联系ouyl，统一进行修改，壮哉我大C++军团, 版本2.0/20160304  
cls

:MENU
echo.
echo.
echo. =======================================================
echo. [`] 【退出:TAB键上方的键】
echo. [1] 【公司共享】文件夹 172.16.6.4
echo. [2] 【自动构建：各种项目软件】文件夹 172.16.6.14
echo. [3] 【查看通用账户密码信息，自己进行管理，新增或者删除】
echo. [4] 【清理计算机缓存】
echo. [5] 【刷新系统桌面图标，慎用，将会关掉所有的文件夹，其他不受影响】
echo. =======================================================

echo. 请输入需要打开的序号: 
set /p ID=
IF "%ID%"=="`" GOTO EXIT
IF "%ID%"=="1" GOTO openCommon
IF "%ID%"=="2" GOTO openAutoMake1
IF "%ID%"=="3" GOTO showUserPassword
IF "%ID%"=="4" GOTO clearSystem
IF "%ID%"=="5" GOTO clearSystemIcon
GOTO MENU

:openCommon
echo. 正在连接 172.16.6.4 ...
net use \\172.16.6.4\RD_Center "123" /user:tools
start "" "\\172.16.6.4\RD_Center"
GOTO MENU 

:openAutoMake1
echo. 正在连接 172.16.6.14 ...
explorer ftp://test:mpr123@172.16.6.14
GOTO MENU 

:showUserPassword
echo.
echo.
echo. 以下信息为账号密码记录信息，请勿非法操作：
echo. ***********************************************************************************************
echo. 名称	                       别名                  IP                     账户        密码
echo. ***********************************************************************************************
echo. 公司通用共享                公共资源          172.16.6.4                 tools         123
echo. 公司wifi                    MPR-wifi          Wifi1234*
echo. ***********************************************************************************************
GOTO MENU

:clearSystem
@echo off 
echo 正在清除系统垃圾文件，请稍等...... 
del /f /s /q %systemdrive%\*.tmp 
del /f /s /q %systemdrive%\*._mp 
del /f /s /q %systemdrive%\*.log 
del /f /s /q %systemdrive%\*.gid 
del /f /s /q %systemdrive%\*.chk 
del /f /s /q %systemdrive%\*.old 
del /f /s /q %systemdrive%\recycled\*.* 
del /f /s /q %windir%\*.bak 
del /f /s /q %windir%\prefetch\*.* 
rd /s /q %windir%\temp & md %windir%\temp 
del /f /q %userprofile%\cookies\*.* 
del /f /q %userprofile%\recent\*.* 
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 
del /f /s /q "%userprofile%\Local Settings\Temp\*.*" 
del /f /s /q "%userprofile%\recent\*.*" 
echo 清除系统LJ完成！ 
echo. 
GOTO MENU

:clearSystemIcon
rem 关闭Windows外壳程序explorer
taskkill /f /im explorer.exe
rem 清理系统图标缓存数据库
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
del /f "%userprofile%\AppData\Local\IconCache.db"
attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_102.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_1024.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_idx.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_sr.db"
rem 清理 系统托盘记忆的图标
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream
rem 重启Windows外壳程序explorer
start explorer
echo 刷新系统图标完成！ 
echo. 
GOTO MENU
