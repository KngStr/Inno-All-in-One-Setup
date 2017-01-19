Ish 头文件 使用说明

1、Ish 是什么？
  Ish 是由 “PreDefines.ish” 作为基础加载的一个 头文件系统。最初由KngStr提出，并分享。
  其中，有很多的预定义 宏 ，函数 和 过程。为减小制作者的负担，类似Nsis的Nsh 和 Delphi的Pas。
  最初定义，请参考：关于 Ish 以及 如何使用 Ish - http://www.dreams8.com/thread-12007-1-1.html

2、Ish文件格式是怎么样的？
  以 “CallNsis.Ish” 文件为例：
  
  #ifndef _CALLNSIS_ISH_                                    //头文件开始：检测头文件是否已经被定义或者 引用
    #Define _CALLNSIS_ISH_ __PATHFILENAME__                 //以头文件名，定义头文件路径
    #expr Plugin_Init                                          //如果，头文件为插件头文件，那么使用该功能，可以帮你实现插件的各种的定义，方便制作脚本时，全局定义

  #define CallNsis_DLL "CallNsis.dll"                       //定义 该插件头文件 所使用的插件名

  [Files]                                                   //根据上面定义，自动处理文件的加载等等
  Source: {#PluginDir}\{#CallNsis_DLL}; DestDir: {#Plugin_DestDir}; Flags: {#Plugin_FileFlags}

  [Code]                                                   //根据上面定义，自动导入插件功能等等
  function callplug(parentwnd: Integer; pluginname,funcname,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10: PAnsiChar): Integer;
  external 'callplug@{#Plugin_CodeDir}{#CallNsis_DLL} {#Plugin_CodeFlags}';
  [/Code]

  #endif                                                    //头文件结束；
  
  
3、Ish文件默认如何加载？
  1)、安装时，Ish会增加引用文件夹，和自动引用 “PreDefines.ish”
  2)、“PreDefines.ish”，会自动增加 引用文件夹（IncludeDir），插件文件夹（PluginDir），文档文件夹（DocDir），扩展文件夹（ExtendDir） 各类定义
  3)、“PreDefines.ish”，增加 ISPP宏：AddQuotes(str S)；RemoveQuotes(str S)； FolderExists(str DirName) ；SimpleVersion(str S)；InvalidFileName(str FileName)；
  4)、“PreDefines.ish”，补充一些Inno中没有的类型定义 和 function PDir(PName: String): String;
  5)、“PreDefines.ish”，自动增加 IncludeDir 及 其下面的所有子文件夹，到引用目录
  6)、“PreDefines.ish”，定义了 插件引用 参数 和 宏