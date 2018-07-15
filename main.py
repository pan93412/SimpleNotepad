#!/bin/python3
#-*- coding: utf8 -*-
'''
@name   SimpleTextEditor
@ver    1.0
@author pan93412
'''

# 定義變數
filename = 'simpletexteditor.txt'
version = '1.0'
langfile = "lang_custom.py"

# 載入相關模組
import os, sys
from i18ntool import i18nfunc # i18n 工具

# 載入語系檔案
if os.path.exists(langfile):
    i18n = i18nfunc("lang.py", langfile)
else:
    i18n = i18nfunc("lang.py")

# 初始化
file = os.open(filename, os.O_RDWR|os.O_CREAT)
initfile = os.read(file, 4096)

# 寫作畫面
def write():
    global file, initfile
    if sys.platform == "win32":
        os.system("cls")
    else:
        os.system("clear")
    print(i18n.str("write_title"))
    print(str(initfile, encoding="UTF-8"), end="")
    userTxt = input()
    if userTxt == ":/clear/:":
        theResult = input(i18n.str("clear_write"))
        if theResult == "bye":
            os.close(file)
            file = os.open(filename, os.O_RDWR|os.O_TRUNC)
            initfile = os.read(file, 4096)
            write()
            return
        else:
            write()
            return()
    elif userTxt == ":/bye/:":
        print(i18n.str("bye_txt"))
        exit()
    else:
        inputText = bytes(userTxt + "\n", encoding="UTF-8")
        os.write(file, inputText)
        initfile += inputText
        write()
        return
    print(i18n.str("something_wrong"))
    exit(1)

# 主畫面
if __name__ == "__main__":
    print(i18n.str("mainscr").format(ver = version))
    input(i18n.str("maininput"))
    write()
else:
    pass