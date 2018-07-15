@echo off
::驗證相關程序內容
title 簡易記事本 2.0
echo test >testfile
if not exist testfile goto noperm
del /f /q testfile
color 0f
if exist welcome.ln goto start
echo 請勿刪除 >welcome.ln
goto WelcomeScreen

:noperm
echo 這個資料夾無法寫入。
echo 請將此程序放在可被寫入的位置後再重啟。
pause
exit

::初始畫面
:WelcomeScreen
CLS
echo 歡迎使用此 "簡易記事本 2.0" 程序。
echo 本程序就是個 Batch 版的 notepad，
echo 且增加了更多更好用的功能。
echo 這可以讓你紀錄一些事情，
echo 且在 2.0 版，程序大重寫，
echo Bugs 也變得更少囉！ 
echo.
echo 注意：未來此訊息將不會再次
echo 顯示，若想再次顯示請在
echo "請輸入你想儲存的檔案名稱"
echo 的位置輸入 "_replay" 就可以
echo 再次看到此畫面。
echo.
echo 按 Enter 進入主程序。
pause >nul
goto Start

::主程序_1
:Start
CLS
echo 您目前的版本是： 2.0.1
set /p filename=請輸入你想要儲存的檔案名稱 (儲存在執行目錄)：
if "%filename%"=="" (
	echo 檔案名稱不可為空
	echo 按 Enter 重新輸入
    pause >nul
	goto :Start
	)
if "%filename%"=="_replay" goto WelcomeScreen
if exist %filename%.txt goto notepad
echo. >%filename%.txt

::輸入介面
:notepad
set savetext=
cls
title 簡易記事本-V2.0 輸入介面
echo == 簡易記事本 輸入介面 ==
echo == 版本： 2.0.1	    ==
echo 輸入說明：
echo 輸入 _clear_note 可以刪除所有文字。
echo 請不要輸入以下字串：
echo "<",">"
echo.
echo 				== 輸入畫面 ==
type %filename%.txt
set /p savetext=
::如果文字為 _clear_note，將進入重設介面
if "%savetext%"=="_clear_note" goto reset
::如果文字為空，將會直接輸出空白
if "%savetext%"=="" echo. >>%filename%.txt & goto notepad
::將文字寫入檔案
echo %savetext% >>%filename%.txt
goto notepad

::重置介面
:reset
title 
set choosereset=
cls
echo.
echo.
echo.
echo.
echo.
set /p choosereset=請問您要刪除所有的內容嗎？ (Yes/No) :
if "%choosereset%"=="Y" echo. >%filename%.txt & goto notepad
if "%choosereset%"=="Yes" echo. >%filename%.txt & goto notepad
if "%choosereset%"=="N" goto notepad
if "%choosereset%"=="No" goto notepad
goto reset