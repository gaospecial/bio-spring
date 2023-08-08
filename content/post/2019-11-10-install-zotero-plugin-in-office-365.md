---
title: 在 Office 365 中设置 Zotero 插件
author: gaoch
date: '2019-11-10'
slug: install-zotero-plugin-in-office-365
categories:
  - Zotero
tags:
  - Zotero
---

刚换新电脑（我的老爷机终于可以退休了）.新电脑新系统，自带Office 365，于是用上了这个版本的 Word。

Office 365中的 Word 执行常规的Zotero 插件安装无效。

## 官方论坛上面，

https://forums.zotero.org/discussion/74446/zotero-tab-for-office-365-word-is-missing

## 和

https://www.zotero.org/support/word_processor_plugin_manual_installation

## 提到了修复方法，但是没有用。

## 办法其实蛮简单：

打开“文件”-“选项”-“加载项”，在右侧“管理：”旁边的下拉菜单中选择“Word加载项”，点击“转到...”按钮，打开一个对话框：

在“共用模板及加载项”中选择“添加...”，把 Zotero 自带的 “Zotero.dotm” 模板添加进来。

界面提示“是否加载宏”，选择“是”即可。

**Zotero.dotm 是 Word 模板文件，位于Zotero安装目录下面的：`.\extensions\zoteroWinWordIntegration@zotero.org\install\Zotero.dotm` 位置。

如果你用**Everything**，搜索文件名一下就可以找到它了。

## English Version

In Word，open "File" - "Options" - "Add-ons", select "Word Add-ons" from the drop-down menu next to "Manage:" on the right panel, click the "Go to..." button to open a dialog box:

Select "Add..." in "Common Templates and Add-ons" to enable the Zotero's  "Zotero.dotm" template.

If, the Word interface prompts "Do you want to load macros", select "Yes".

**Zotero.dotm** is a Word template file located under the Zotero installation directory: `.\extensions\zoteroWinWordIntegration@zotero.org\install\Zotero.dotm`.

You can find it quickly using a search tool like **Everything**.