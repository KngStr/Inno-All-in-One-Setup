//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :

[LangOptions]
DialogFontName=tahoma
DialogFontSize=8

[Languages]
;Name: swedish; MessagesFile: compiler:languages\swedish.isl
;Name: Basque; MessagesFile: compiler:Languages\Basque.isl
Name: BrazilianPortuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl
Name: Catalan; MessagesFile: compiler:Languages\Catalan.isl

Name: ChineseSimp; MessagesFile: {#SourcePath}\Res\Languages\ChineseSimp.isl
Name: ChineseTrad; MessagesFile: {#SourcePath}\Res\Languages\ChineseTrad.isl

Name: Czech; MessagesFile: compiler:Languages\Czech.isl
Name: Danish; MessagesFile: compiler:Languages\Danish.isl
Name: Dutch; MessagesFile: compiler:Languages\Dutch.isl

#ifexist "compiler:Languages\English.isl"
Name: English; MessagesFile: compiler:Languages\English.isl
#else
Name: English; MessagesFile: compiler:Default.isl
#endif

Name: Finnish; MessagesFile: compiler:Languages\Finnish.isl
Name: French; MessagesFile: compiler:Languages\French.isl
Name: German; MessagesFile: compiler:Languages\German.isl
Name: Hebrew; MessagesFile: compiler:Languages\Hebrew.isl
Name: Hungarian; MessagesFile: compiler:Languages\Hungarian.isl
Name: Italian; MessagesFile: compiler:Languages\Italian.isl
Name: Japanese; MessagesFile: compiler:Languages\Japanese.isl
Name: Norwegian; MessagesFile: compiler:Languages\Norwegian.isl
Name: Polish; MessagesFile: compiler:Languages\Polish.isl
Name: Portuguese; MessagesFile: compiler:Languages\Portuguese.isl
;Name: PortugueseStd; MessagesFile: compiler:Languages\PortugueseStd.isl
Name: Russian; MessagesFile: compiler:Languages\Russian.isl
;Name: Slovak; MessagesFile: compiler:Languages\Slovak.isl
Name: Slovenian; MessagesFile: compiler:Languages\Slovenian.isl
Name: Spanish; MessagesFile: compiler:Languages\Spanish.isl

[Messages]
ChineseSimp.BeveledLabel={#BrandingTexts}

ChineseSimp.SetupWindowTitle={#UrlName} - %1
ChineseSimp.SetupAppTitle={#UrlName} - {#AppName}
ChineseSimp.UninstallAppTitle={#UrlName} - 卸载
ChineseSimp.UninstallAppFullTitle={#UrlName} - %1 卸载

ChineseSimp.LicenseAccepted =我同意“许可协议”中的条款(&A)

[CustomMessages]
Inno=Inno Setup
ISPP=Inno Setup Preprocessor
Compiler=Compiler

Help=Help
FAQ=FAQ
Docs=Docs
License=License
History=History
Extensions=Extensions

Examples=Example Scripts
Documentation=Documentation
Revision_History=Revision History

ISD=ISD Format
Newsgroups=Newsgroups
Chm_Hanzify=Hanzify Forum Inno Article
Isxkb=Extensions Knowledge Base
Isxkb_Online=Extensions Knowledge Base Online

Unpack=Unpack
Unpacker=Unpacker
Converter=Converter
InnoLogView=InnoLogView

English.Inno=Inno Setup
English.ISPP=Inno Setup Preprocessor
English.Compiler=Compiler

English.Help=Help
English.FAQ=FAQ
English.Docs=Docs
English.License=License
English.History=History
English.Extensions=Extensions

English.Examples=Example Scripts
English.Documentation=Documentation
English.Revision_History=Revision History

English.ISD=ISD Format
English.Newsgroups=Newsgroups
English.Chm_Hanzify=Hanzify Forum Inno Article
English.Isxkb=Extensions Knowledge Base
English.Isxkb_Online=Extensions Knowledge Base Online

English.Unpack=Unpack
English.Unpacker=Unpacker
English.Converter=Converter
English.InnoLogView=InnoLogView

;cn
ChineseSimp.Inno=Inno Setup
ChineseSimp.ISPP=Inno Setup 预处理器
ChineseSimp.Compiler=编辑器

ChineseSimp.Help=帮助
ChineseSimp.FAQ=常见问题
ChineseSimp.Docs=文档
ChineseSimp.License=许可协议
ChineseSimp.History=历史
ChineseSimp.Extensions=扩展资源

ChineseSimp.Examples=示例脚本
ChineseSimp.Documentation=文档
ChineseSimp.Revision_History=更新历史

ChineseSimp.ISD=ISD 文件格式
ChineseSimp.Newsgroups=新闻组
ChineseSimp.Chm_Hanzify=汉化新世纪论坛精华
ChineseSimp.Isxkb=知识库
ChineseSimp.Isxkb_Online=在线知识库

ChineseSimp.Unpack=解包
ChineseSimp.Unpacker=解包工具
ChineseSimp.Converter=注册表转换器
ChineseSimp.InnoLogView=Inno 卸载记录查看器

ChineseSimp.AdditionalIcons=附加图标:
ChineseSimp.CreateDesktopIcon=创建桌面图标
ChineseSimp.CreateQuickLaunchIcon=创建快速启动图标
ChineseSimp.AssocRightFileExtension=将 %2 文件扩展名与 %1 建立右键关联 (&A)
ChineseSimp.Assoc=文件关联:

;Skins=白羊兔美眉%nChromex%nSustenance%n勾勾手%n可爱小熊%n木头苹果%n洋葱头情侣%nCodejock%nISSkinEx%nSakura
Skins =White Rabbit Crush %nChromex%nSustenance%nGrabhook%nCuteBear%nWoodApples%nOnionCouples%nCodejock%nISSkinEx%nSakura
