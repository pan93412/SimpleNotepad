@echo off
::���Ҭ����{�Ǥ��e
title ²���O�ƥ� 2.0
echo test >testfile
if not exist testfile goto noperm
del /f /q testfile
color 0f
if exist welcome.ln goto start
echo �ФŧR�� >welcome.ln
goto WelcomeScreen

:noperm
echo �o�Ӹ�Ƨ��L�k�g�J�C
echo �бN���{�ǩ�b�i�Q�g�J����m��A���ҡC
pause
exit

::��l�e��
:WelcomeScreen
CLS
echo �w��ϥΦ� "²���O�ƥ� 2.0" �{�ǡC
echo ���{�ǴN�O�� Batch ���� notepad�A
echo �B�W�[�F��h��n�Ϊ��\��C
echo �o�i�H���A�����@�ǨƱ��A
echo �B�b 2.0 ���A�{�Ǥj���g�A
echo Bugs �]�ܱo����o�I 
echo.
echo �`�N�G���Ӧ��T���N���|�A��
echo ��ܡA�Y�Q�A����ܽЦb
echo "�п�J�A�Q�x�s���ɮצW��"
echo ����m��J "_replay" �N�i�H
echo �A���ݨ즹�e���C
echo.
echo �� Enter �i�J�D�{�ǡC
pause >nul
goto Start

::�D�{��_1
:Start
CLS
echo �z�ثe�������O�G 2.0.1
set /p filename=�п�J�A�Q�n�x�s���ɮצW�� (�x�s�b����ؿ�)�G
if "%filename%"=="" (
	echo �ɮצW�٤��i����
	echo �� Enter ���s��J
    pause >nul
	goto :Start
	)
if "%filename%"=="_replay" goto WelcomeScreen
if exist %filename%.txt goto notepad
echo. >%filename%.txt

::��J����
:notepad
set savetext=
cls
title ²���O�ƥ�-V2.0 ��J����
echo == ²���O�ƥ� ��J���� ==
echo == �����G 2.0.1	    ==
echo ��J�����G
echo ��J _clear_note �i�H�R���Ҧ���r�C
echo �Ф��n��J�H�U�r��G
echo "<",">"
echo.
echo 				== ��J�e�� ==
type %filename%.txt
set /p savetext=
::�p�G��r�� _clear_note�A�N�i�J���]����
if "%savetext%"=="_clear_note" goto reset
::�p�G��r���šA�N�|������X�ť�
if "%savetext%"=="" echo. >>%filename%.txt & goto notepad
::�N��r�g�J�ɮ�
echo %savetext% >>%filename%.txt
goto notepad

::���m����
:reset
title 
set choosereset=
cls
echo.
echo.
echo.
echo.
echo.
set /p choosereset=�аݱz�n�R���Ҧ������e�ܡH (Yes/No) :
if "%choosereset%"=="Y" echo. >%filename%.txt & goto notepad
if "%choosereset%"=="Yes" echo. >%filename%.txt & goto notepad
if "%choosereset%"=="N" goto notepad
if "%choosereset%"=="No" goto notepad
goto reset