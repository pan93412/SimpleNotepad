#!/bin/python3
#-*- coding:utf-8 -*-
import os
class i18nfunc:
    '''i18n 函式'''
    def __init__(self, origlang, langfile=False):
        '''透過 i18nfunc(原始語言檔案, 翻譯語言檔案) 初始化 i18n'''
        if os.path.exists(origlang):
            exec("import " + origlang[:-3] + " as lango")
            self.module = locals()['lango']
        else:
            print("DEBUG: origlang is invaild!")
        if langfile != False:
            if os.path.exists(langfile):
                exec("import " + langfile[:-3] + " as langf")
                self.langmod = locals()['langf']
            else:
                print("DEBUG: langfile is invaild!")
    def str(self, strid):
        '''載入語言檔案中相對應的字串'''
        try:
            return eval("self.langmod." + strid)
        except:
            return eval("self.module." + strid)