@echo off
rem ��ǰbat������

cls
	COLOR 0a
	TITLE C++����ͨ�ù���������,�뽫���ڴ�С����Ϊ300/300 ���������Ҽ� ���� ���� ���ڴ�С, ����������ϵouyl��ͳһ�����޸ģ�׳���Ҵ�C++����, �汾2.0/20160304  
cls

:MENU
echo.
echo.
echo. =======================================================
echo. [`] ���˳�:TAB���Ϸ��ļ���
echo. [1] ����˾�����ļ��� 172.16.6.4
echo. [2] ���Զ�������������Ŀ������ļ��� 172.16.6.14
echo. [3] ���鿴ͨ���˻�������Ϣ���Լ����й�����������ɾ����
echo. [4] �������������桿
echo. [5] ��ˢ��ϵͳ����ͼ�꣬���ã�����ص����е��ļ��У���������Ӱ�졿
echo. =======================================================

echo. ��������Ҫ�򿪵����: 
set /p ID=
IF "%ID%"=="`" GOTO EXIT
IF "%ID%"=="1" GOTO openCommon
IF "%ID%"=="2" GOTO openAutoMake1
IF "%ID%"=="3" GOTO showUserPassword
IF "%ID%"=="4" GOTO clearSystem
IF "%ID%"=="5" GOTO clearSystemIcon
GOTO MENU

:openCommon
echo. �������� 172.16.6.4 ...
net use \\172.16.6.4\RD_Center "123" /user:tools
start "" "\\172.16.6.4\RD_Center"
GOTO MENU 

:openAutoMake1
echo. �������� 172.16.6.14 ...
explorer ftp://test:mpr123@172.16.6.14
GOTO MENU 

:showUserPassword
echo.
echo.
echo. ������ϢΪ�˺������¼��Ϣ������Ƿ�������
echo. ***********************************************************************************************
echo. ����	                       ����                  IP                     �˻�        ����
echo. ***********************************************************************************************
echo. ��˾ͨ�ù���                ������Դ          172.16.6.4                 tools         123
echo. ��˾wifi                    MPR-wifi          Wifi1234*
echo. ***********************************************************************************************
GOTO MENU

:clearSystem
@echo off 
echo �������ϵͳ�����ļ������Ե�...... 
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
echo ���ϵͳLJ��ɣ� 
echo. 
GOTO MENU

:clearSystemIcon
rem �ر�Windows��ǳ���explorer
taskkill /f /im explorer.exe
rem ����ϵͳͼ�껺�����ݿ�
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
rem ���� ϵͳ���̼����ͼ��
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream
rem ����Windows��ǳ���explorer
start explorer
echo ˢ��ϵͳͼ����ɣ� 
echo. 
GOTO MENU
