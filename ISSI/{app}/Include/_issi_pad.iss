

;; This file generates an PAD.xml

#define AppName "PAD Generator"
#define AppVersion "1.2"
#define AppFileName "_issi_pad"

#define PadIni readini (SourcePath+"\pad.ini","PAD","PadIni")
#define PadAppName readini (SourcePath+"\pad.ini","PAD","PadAppName")
#define PadExportFileName readini (SourcePath+"\pad.ini","PAD","PadExportFileName")
#define PadExportFolder readini (SourcePath+"\pad.ini","PAD","PadExportFolder")
#define PadStyleSheet readini (SourcePath+"\pad.ini","PAD","PAD_Style")

[PAD]
;; Company Info
#define Company_Name readini (PadIni,PadAppName,"Company_Name")
#define Address_2 readini (PadIni,PadAppName,"Address_1")
#define Address_1 readini (PadIni,PadAppName,"Address_2")
#define State_Province readini (PadIni,PadAppName,"City_Town")
#define Zip_Postal_Code readini (PadIni,PadAppName,"Zip_Postal_Code")
#define City_Town readini (PadIni,PadAppName,"State_Province")
#define Country readini (PadIni,PadAppName,"Country")
#define Company_WebSite_URL readini (PadIni,PadAppName,"Company_WebSite_URL")
;; Contact Info
#define Author_First_Name readini (PadIni,PadAppName,"Author_First_Name")
#define Author_Last_Name readini (PadIni,PadAppName,"Author_Last_Name")
#define Author_Email readini (PadIni,PadAppName,"Author_Email")
#define Contact_First_Name readini (PadIni,PadAppName,"Contact_First_Name")
#define Contact_Last_Name readini (PadIni,PadAppName,"Contact_Last_Name")
#define Contact_Email readini (PadIni,PadAppName,"Contact_Email")
;; Support Info
#define Sales_Email readini (PadIni,PadAppName,"Sales_Email")
#define Support_Email readini (PadIni,PadAppName,"Support_Email")
#define General_Email readini (PadIni,PadAppName,"General_Email")
#define Sales_Phone readini (PadIni,PadAppName,"Sales_Phone")
#define Support_Phone readini (PadIni,PadAppName,"Support_Phone")
#define General_Phone readini (PadIni,PadAppName,"General_Phone")
#define Fax_Phone readini (PadIni,PadAppName,"Fax_Phone")

;; Program Info
#define Program_Name readini (PadIni,PadAppName,"Program_Name")
#define Program_Version readini (PadIni,PadAppName,"Program_Version")
#define Program_Release_Month readini (PadIni,PadAppName,"Program_Release_Month")
#define Program_Release_Day readini (PadIni,PadAppName,"Program_Release_Day")
#define Program_Release_Year readini (PadIni,PadAppName,"Program_Release_Year")
#define Program_Cost_Dollars readini (PadIni,PadAppName,"Program_Cost_Dollars")

#define Program_Cost_Other_Code readini (PadIni,PadAppName,"Program_Cost_Other_Code")
#define Program_Cost_Other readini (PadIni,PadAppName,"Program_Cost_Other")

#define Program_Type readini (PadIni,PadAppName,"Program_Type")
#define Program_Release_Status readini (PadIni,PadAppName,"Program_Release_Status")
#define Program_Install_Support readini (PadIni,PadAppName,"Program_Install_Support")
#define Program_OS_Support readini (PadIni,PadAppName,"Program_OS_Support")
#define Program_Language readini (PadIni,PadAppName,"Program_Language")
#define Program_Change_Info readini (PadIni,PadAppName,"Program_Change_Info")
#define Program_Specific_Category readini (PadIni,PadAppName,"Specific_Category")
#define Program_Category_Class readini (PadIni,PadAppName,"Program_Category_Class")
#define Program_Categories readini (PadIni,PadAppName,"Program_Categories")
#define Program_System_Requirements readini (PadIni,PadAppName,"Program_System_Requirements")
#define Includes_JAVA_VM readini (PadIni,PadAppName,"Includes_JAVA_VM")
#define Includes_VB_Runtime readini (PadIni,PadAppName,"Includes_VB_Runtime")
#define Includes_DirectX readini (PadIni,PadAppName,"Includes_DirectX")



;; File Info
#define Filename_Versioned readini (PadIni,PadAppName,"Filename_Versioned")
#define Filename_Previous readini (PadIni,PadAppName,"Filename_Previous")
#define Filename_Generic readini (PadIni,PadAppName,"Filename_Generic")
#define Filename_Long readini (PadIni,PadAppName,"Filename_Long")
#define File_Size_Bytes readini (PadIni,PadAppName,"File_Size_Bytes")
#define File_Size_K readini (PadIni,PadAppName,"File_Size_K")
#define File_Size_MB readini (PadIni,PadAppName,"File_Size_MB")

;; EXPIRE INFO
#define Expire_Count readini (PadIni,PadAppName,"Expire_Count")
#define Has_Expire_Info readini (PadIni,PadAppName,"Has_Expire_Info")
#define Expire_Based_On readini (PadIni,PadAppName,"Expire_Based_On")
#define Expire_Other_Info readini (PadIni,PadAppName,"Expire_Other_Info")
#define Expire_Month readini (PadIni,PadAppName,"Expire_Month")
#define Expire_Day readini (PadIni,PadAppName,"Expire_Day")
#define Expire_Year readini (PadIni,PadAppName,"Expire_Year")

#define Keywords readini (PadIni,PadAppName,"Keywords")
#if Keywords != ""
#define Char_Desc_45 readini (PadIni,PadAppName,"Char_Desc_45")
#define Char_Desc_80 readini (PadIni,PadAppName,"Char_Desc_80")
#define Char_Desc_250 readini (PadIni,PadAppName,"Char_Desc_250")
#define Char_Desc_450 readini (PadIni,PadAppName,"Char_Desc_450")
#define Char_Desc_2000 readini (PadIni,PadAppName,"Char_Desc_2000")
#endif

#define Keywords_Arabic readini (PadIni,PadAppName,"Keywords_Arabic")
#if Keywords_Arabic != ""
#define Char_Desc_Arabic_45 readini (PadIni,PadAppName,"Char_Desc_Arabic_45")
#define Char_Desc_Arabic_80 readini (PadIni,PadAppName,"Char_Desc_Arabic_80")
#define Char_Desc_Arabic_250 readini (PadIni,PadAppName,"Char_Desc_Arabic_250")
#define Char_Desc_Arabic_450 readini (PadIni,PadAppName,"Char_Desc_Arabic_450")
#define Char_Desc_Arabic_2000 readini (PadIni,PadAppName,"Char_Desc_Arabic_2000")
#endif

#define Keywords_ChineseSimplified readini (PadIni,PadAppName,"Keywords_ChineseSimplified")
#if Keywords_ChineseSimplified != ""
#define Char_Desc_ChineseSimplified_45 readini (PadIni,PadAppName,"Char_Desc_ChineseSimplified_45")
#define Char_Desc_ChineseSimplified_80 readini (PadIni,PadAppName,"Char_Desc_ChineseSimplified_80")
#define Char_Desc_ChineseSimplified_250 readini (PadIni,PadAppName,"Char_Desc_ChineseSimplified_250")
#define Char_Desc_ChineseSimplified_450 readini (PadIni,PadAppName,"Char_Desc_ChineseSimplified_450")
#define Char_Desc_ChineseSimplified_2000 readini (PadIni,PadAppName,"Char_Desc_ChineseSimplified_2000")
#endif

#define Keywords_ChineseTraditional readini (PadIni,PadAppName,"Keywords_ChineseTraditional")
#if Keywords_ChineseTraditional != ""
#define Char_Desc_ChineseTraditional_45 readini (PadIni,PadAppName,"Char_Desc_ChineseTraditional_45")
#define Char_Desc_ChineseTraditional_80 readini (PadIni,PadAppName,"Char_Desc_ChineseTraditional_80")
#define Char_Desc_ChineseTraditional_250 readini (PadIni,PadAppName,"Char_Desc_ChineseTraditional_250")
#define Char_Desc_ChineseTraditional_450 readini (PadIni,PadAppName,"Char_Desc_ChineseTraditional_450")
#define Char_Desc_ChineseTraditional_2000 readini (PadIni,PadAppName,"Char_Desc_ChineseTraditional_2000")
#endif

#define Keywords_Czech readini (PadIni,PadAppName,"Keywords_Czech")
#if Keywords_Czech != ""
#define Char_Desc_Czech_45 readini (PadIni,PadAppName,"Char_Desc_Czech_45")
#define Char_Desc_Czech_80 readini (PadIni,PadAppName,"Char_Desc_Czech_80")
#define Char_Desc_Czech_250 readini (PadIni,PadAppName,"Char_Desc_Czech_250")
#define Char_Desc_Czech_450 readini (PadIni,PadAppName,"Char_Desc_Czech_450")
#define Char_Desc_Czech_2000 readini (PadIni,PadAppName,"Char_Desc_Czech_2000")
#endif

#define Keywords_Danish readini (PadIni,PadAppName,"Keywords_Danish")
#if Keywords_Danish != ""
#define Char_Desc_Danish_45 readini (PadIni,PadAppName,"Char_Desc_Danish_45")
#define Char_Desc_Danish_80 readini (PadIni,PadAppName,"Char_Desc_Danish_80")
#define Char_Desc_Danish_250 readini (PadIni,PadAppName,"Char_Desc_Danish_250")
#define Char_Desc_Danish_450 readini (PadIni,PadAppName,"Char_Desc_Danish_450")
#define Char_Desc_Danish_2000 readini (PadIni,PadAppName,"Char_Desc_Danish_2000")
#endif

#define Keywords_Dutch readini (PadIni,PadAppName,"Keywords_Dutch")
#if Keywords_Dutch != ""
#define Char_Desc_Dutch_45 readini (PadIni,PadAppName,"Char_Desc_Dutch_45")
#define Char_Desc_Dutch_80 readini (PadIni,PadAppName,"Char_Desc_Dutch_80")
#define Char_Desc_Dutch_250 readini (PadIni,PadAppName,"Char_Desc_Dutch_250")
#define Char_Desc_Dutch_450 readini (PadIni,PadAppName,"Char_Desc_Dutch_450")
#define Char_Desc_Dutch_2000 readini (PadIni,PadAppName,"Char_Desc_Dutch_2000")
#endif

#define Keywords_Finnish readini (PadIni,PadAppName,"Keywords_Finnish")
#if Keywords_Finnish != ""
#define Char_Desc_Finnish_45 readini (PadIni,PadAppName,"Char_Desc_Finnish_45")
#define Char_Desc_Finnish_80 readini (PadIni,PadAppName,"Char_Desc_Finnish_80")
#define Char_Desc_Finnish_250 readini (PadIni,PadAppName,"Char_Desc_Finnish_250")
#define Char_Desc_Finnish_450 readini (PadIni,PadAppName,"Char_Desc_Finnish_450")
#define Char_Desc_Finnish_2000 readini (PadIni,PadAppName,"Char_Desc_Finnish_2000")
#endif

#define Keywords_French readini (PadIni,PadAppName,"Keywords_French")
#if Keywords_French != ""
#define Char_Desc_French_45 readini (PadIni,PadAppName,"Char_Desc_French_45")
#define Char_Desc_French_80 readini (PadIni,PadAppName,"Char_Desc_French_80")
#define Char_Desc_French_250 readini (PadIni,PadAppName,"Char_Desc_French_250")
#define Char_Desc_French_450 readini (PadIni,PadAppName,"Char_Desc_French_450")
#define Char_Desc_French_2000 readini (PadIni,PadAppName,"Char_Desc_French_2000")
#endif

#define Keywords_German readini (PadIni,PadAppName,"Keywords_German")
#if Keywords_German != ""
#define Char_Desc_German_45 readini (PadIni,PadAppName,"Char_Desc_German_45")
#define Char_Desc_German_80 readini (PadIni,PadAppName,"Char_Desc_German_80")
#define Char_Desc_German_250 readini (PadIni,PadAppName,"Char_Desc_German_250")
#define Char_Desc_German_450 readini (PadIni,PadAppName,"Char_Desc_German_450")
#define Char_Desc_German_2000 readini (PadIni,PadAppName,"Char_Desc_German_2000")
#endif

#define Keywords_Greek readini (PadIni,PadAppName,"Keywords_Greek")
#if Keywords_Greek != ""
#define Char_Desc_Greek_45 readini (PadIni,PadAppName,"Char_Desc_Greek_45")
#define Char_Desc_Greek_80 readini (PadIni,PadAppName,"Char_Desc_Greek_80")
#define Char_Desc_Greek_250 readini (PadIni,PadAppName,"Char_Desc_Greek_250")
#define Char_Desc_Greek_450 readini (PadIni,PadAppName,"Char_Desc_Greek_450")
#define Char_Desc_Greek_2000 readini (PadIni,PadAppName,"Char_Desc_Greek_2000")
#endif

#define Keywords_Hindi readini (PadIni,PadAppName,"Keywords_Hindi")
#if Keywords_Hindi != ""
#define Char_Desc_Hindi_45 readini (PadIni,PadAppName,"Char_Desc_Hindi_45")
#define Char_Desc_Hindi_80 readini (PadIni,PadAppName,"Char_Desc_Hindi_80")
#define Char_Desc_Hindi_250 readini (PadIni,PadAppName,"Char_Desc_Hindi_250")
#define Char_Desc_Hindi_450 readini (PadIni,PadAppName,"Char_Desc_Hindi_450")
#define Char_Desc_Hindi_2000 readini (PadIni,PadAppName,"Char_Desc_Hindi_2000")
#endif

#define Keywords_Hungarian readini (PadIni,PadAppName,"Keywords_Hungarian")
#if Keywords_Hungarian != ""
#define Char_Desc_Hungarian_45 readini (PadIni,PadAppName,"Char_Desc_Hungarian_45")
#define Char_Desc_Hungarian_80 readini (PadIni,PadAppName,"Char_Desc_Hungarian_80")
#define Char_Desc_Hungarian_250 readini (PadIni,PadAppName,"Char_Desc_Hungarian_250")
#define Char_Desc_Hungarian_450 readini (PadIni,PadAppName,"Char_Desc_Hungarian_450")
#define Char_Desc_Hungarian_2000 readini (PadIni,PadAppName,"Char_Desc_Hungarian_2000")
#endif

#define Keywords_Italian readini (PadIni,PadAppName,"Keywords_Italian")
#if Keywords_Italian != ""
#define Char_Desc_Italian_45 readini (PadIni,PadAppName,"Char_Desc_Italian_45")
#define Char_Desc_Italian_80 readini (PadIni,PadAppName,"Char_Desc_Italian_80")
#define Char_Desc_Italian_250 readini (PadIni,PadAppName,"Char_Desc_Italian_250")
#define Char_Desc_Italian_450 readini (PadIni,PadAppName,"Char_Desc_Italian_450")
#define Char_Desc_Italian_2000 readini (PadIni,PadAppName,"Char_Desc_Italian_2000")
#endif

#define Keywords_Japanese readini (PadIni,PadAppName,"Keywords_Hindi")
#if Keywords_Japanese != ""
#define Char_Desc_Japanese_45 readini (PadIni,PadAppName,"Char_Desc_Japanese_45")
#define Char_Desc_Japanese_80 readini (PadIni,PadAppName,"Char_Desc_Japanese_80")
#define Char_Desc_Japanese_250 readini (PadIni,PadAppName,"Char_Desc_Japanese_250")
#define Char_Desc_Japanese_450 readini (PadIni,PadAppName,"Char_Desc_Japanese_450")
#define Char_Desc_Japanese_2000 readini (PadIni,PadAppName,"Char_Desc_Japanese_2000")
#endif

#define Keywords_Korean readini (PadIni,PadAppName,"Keywords_Korean")
#if Keywords_Korean != ""
#define Char_Desc_Korean_45 readini (PadIni,PadAppName,"Char_Desc_Korean_45")
#define Char_Desc_Korean_80 readini (PadIni,PadAppName,"Char_Desc_Korean_80")
#define Char_Desc_Korean_250 readini (PadIni,PadAppName,"Char_Desc_Korean_250")
#define Char_Desc_Korean_450 readini (PadIni,PadAppName,"Char_Desc_Korean_450")
#define Char_Desc_Korean_2000 readini (PadIni,PadAppName,"Char_Desc_Korean_2000")
#endif

#define Keywords_Polish readini (PadIni,PadAppName,"Keywords_Polish")
#if Keywords_Polish != ""
#define Char_Desc_Polish_45 readini (PadIni,PadAppName,"Char_Desc_Polish_45")
#define Char_Desc_Polish_80 readini (PadIni,PadAppName,"Char_Desc_Polish_80")
#define Char_Desc_Polish_250 readini (PadIni,PadAppName,"Char_Desc_Polish_250")
#define Char_Desc_Polish_450 readini (PadIni,PadAppName,"Char_Desc_Polish_450")
#define Char_Desc_Polish_2000 readini (PadIni,PadAppName,"Char_Desc_Polish_2000")
#endif

#define Keywords_Portuguese readini (PadIni,PadAppName,"Keywords_Portuguese")
#if Keywords_Portuguese != ""
#define Char_Desc_Portuguese_45 readini (PadIni,PadAppName,"Char_Desc_Portuguese_45")
#define Char_Desc_Portuguese_80 readini (PadIni,PadAppName,"Char_Desc_Portuguese_80")
#define Char_Desc_Portuguese_250 readini (PadIni,PadAppName,"Char_Desc_Portuguese_250")
#define Char_Desc_Portuguese_450 readini (PadIni,PadAppName,"Char_Desc_Portuguese_450")
#define Char_Desc_Portuguese_2000 readini (PadIni,PadAppName,"Char_Desc_Portuguese_2000")
#endif

#define Keywords_Romanian readini (PadIni,PadAppName,"Keywords_Romanian")
#if Keywords_Romanian != ""
#define Char_Desc_Romanian_45 readini (PadIni,PadAppName,"Char_Desc_Romanian_45")
#define Char_Desc_Romanian_80 readini (PadIni,PadAppName,"Char_Desc_Romanian_80")
#define Char_Desc_Romanian_250 readini (PadIni,PadAppName,"Char_Desc_Romanian_250")
#define Char_Desc_Romanian_450 readini (PadIni,PadAppName,"Char_Desc_Romanian_450")
#define Char_Desc_Romanian_2000 readini (PadIni,PadAppName,"Char_Desc_Romanian_2000")
#endif

#define Keywords_Russian readini (PadIni,PadAppName,"Keywords_Russian")
#if Keywords_Russian != ""
#define Char_Desc_Russian_45 readini (PadIni,PadAppName,"Char_Desc_Russian_45")
#define Char_Desc_Russian_80 readini (PadIni,PadAppName,"Char_Desc_Russian_80")
#define Char_Desc_Russian_250 readini (PadIni,PadAppName,"Char_Desc_Russian_250")
#define Char_Desc_Russian_450 readini (PadIni,PadAppName,"Char_Desc_Russian_450")
#define Char_Desc_Russian_2000 readini (PadIni,PadAppName,"Char_Desc_Russian_2000")
#endif

#define Keywords_Spanish readini (PadIni,PadAppName,"Keywords_Spanish")
#if Keywords_Spanish != ""
#define Char_Desc_Spanish_45 readini (PadIni,PadAppName,"Char_Desc_Spanish_45")
#define Char_Desc_Spanish_80 readini (PadIni,PadAppName,"Char_Desc_Spanish_80")
#define Char_Desc_Spanish_250 readini (PadIni,PadAppName,"Char_Desc_Spanish_250")
#define Char_Desc_Spanish_450 readini (PadIni,PadAppName,"Char_Desc_Spanish_450")
#define Char_Desc_Spanish_2000 readini (PadIni,PadAppName,"Char_Desc_Spanish_2000")
#endif

#define Keywords_Swedish readini (PadIni,PadAppName,"Keywords_Swedish")
#if Keywords_Swedish != ""
#define Char_Desc_Swedish_45 readini (PadIni,PadAppName,"Char_Desc_Swedish_45")
#define Char_Desc_Swedish_80 readini (PadIni,PadAppName,"Char_Desc_Swedish_80")
#define Char_Desc_Swedish_250 readini (PadIni,PadAppName,"Char_Desc_Swedish_250")
#define Char_Desc_Swedish_450 readini (PadIni,PadAppName,"Char_Desc_Swedish_450")
#define Char_Desc_Swedish_2000 readini (PadIni,PadAppName,"Char_Desc_Swedish_2000")
#endif

#define Keywords_Turkish readini (PadIni,PadAppName,"Keywords_Turkish")
#if Keywords_Turkish != ""
#define Char_Desc_Turkish_45 readini (PadIni,PadAppName,"Char_Desc_Turkish_45")
#define Char_Desc_Turkish_80 readini (PadIni,PadAppName,"Char_Desc_Turkish_80")
#define Char_Desc_Turkish_250 readini (PadIni,PadAppName,"Char_Desc_Turkish_250")
#define Char_Desc_Turkish_450 readini (PadIni,PadAppName,"Char_Desc_Turkish_450")
#define Char_Desc_Turkish_2000 readini (PadIni,PadAppName,"Char_Desc_Turkish_2000")
#endif

#define Keywords_Urdu readini (PadIni,PadAppName,"Keywords_Urdu")
#if Keywords_Urdu != ""
#define Char_Desc_Urdu_45 readini (PadIni,PadAppName,"Char_Desc_Urdu_45")
#define Char_Desc_Urdu_80 readini (PadIni,PadAppName,"Char_Desc_Urdu_80")
#define Char_Desc_Urdu_250 readini (PadIni,PadAppName,"Char_Desc_Urdu_250")
#define Char_Desc_Urdu_450 readini (PadIni,PadAppName,"Char_Desc_Urdu_450")
#define Char_Desc_Urdu_2000 readini (PadIni,PadAppName,"Char_Desc_Urdu_2000")
#endif

#define Keywords_Vietnamese readini (PadIni,PadAppName,"Keywords_Vietnamese")
#if Keywords_Vietnamese != ""
#define Char_Desc_Vietnamese_45 readini (PadIni,PadAppName,"Char_Desc_Vietnamese_45")
#define Char_Desc_Vietnamese_80 readini (PadIni,PadAppName,"Char_Desc_Vietnamese_80")
#define Char_Desc_Vietnamese_250 readini (PadIni,PadAppName,"Char_Desc_Vietnamese_250")
#define Char_Desc_Vietnamese_450 readini (PadIni,PadAppName,"Char_Desc_Vietnamese_450")
#define Char_Desc_Vietnamese_2000 readini (PadIni,PadAppName,"Char_Desc_Vietnamese_2000")
#endif

#define Keywords_Yiddish readini (PadIni,PadAppName,"Keywords_Yiddish")
#if Keywords_Yiddish != ""
#define Char_Desc_Yiddish_45 readini (PadIni,PadAppName,"Char_Desc_Yiddish_45")
#define Char_Desc_Yiddish_80 readini (PadIni,PadAppName,"Char_Desc_Yiddish_80")
#define Char_Desc_Yiddish_250 readini (PadIni,PadAppName,"Char_Desc_Yiddish_250")
#define Char_Desc_Yiddish_450 readini (PadIni,PadAppName,"Char_Desc_Yiddish_450")
#define Char_Desc_Yiddish_2000 readini (PadIni,PadAppName,"Char_Desc_Yiddish_2000")
#endif



#define Application_Info_URL readini (PadIni,PadAppName,"Application_Info_URL")
#define Application_Order_URL readini (PadIni,PadAppName,"Application_Order_URL")
#define Application_Screenshot_URL readini (PadIni,PadAppName,"Application_Screenshot_URL")
#define Application_Icon_URL readini (PadIni,PadAppName,"Application_Icon_URL")
#define Application_XML_File_URL readini (PadIni,PadAppName,"Application_XML_File_URL")


;; DOWNLOAD URL'S
#define Primary_Download_URL readini (PadIni,PadAppName,"Primary_Download_URL")
#define Secondary_Download_URL readini (PadIni,PadAppName,"Secondary_Download_URL")
#define Additional_Download_URL_1 readini (PadIni,PadAppName,"Additional_Download_URL_1")
#define Additional_Download_URL_2 readini (PadIni,PadAppName,"Additional_Download_URL_2")

;; PERMISSIONS
#define Distribution_Permissions readini (PadIni,PadAppName,"Distribution_Permissions")
#define EULA readini (PadIni,PadAppName,"EULA")

; ;   P A D - E X T E N S I O N S

;; ASP
;#define ASP_FORM readini (PadIni,PadAppName,"ASP_FORM")
;#define ASP_Member readini (PadIni,PadAppName,"ASP_Member")
#define ASP_Member_Number readini (PadIni,PadAppName,"ASP_Member_Number")
;; TPA
#define TPA_Member_ID readini (PadIni,PadAppName,"TPA_Member_ID")
#define TPA_Trial_License_Type readini (PadIni,PadAppName,"TPA_Trial_License_Type")
;; ESC
#define ESC_Member_Number readini (PadIni,PadAppName,"ESC_Member_Number")
;; MSN
#define MSN_IS_32bit readini (PadIni,PadAppName,"MSN_IS_32bit")
;; PAD Ring
#define PADRING1 readini (PadIni,PadAppName,"PADRING1")
#define PADRING2 readini (PadIni,PadAppName,"PADRING2")
#define PADRING3 readini (PadIni,PadAppName,"PADRING3")
#define PADRING4 readini (PadIni,PadAppName,"PADRING4")
#define PADRING5 readini (PadIni,PadAppName,"PADRING5")
#define PADRING6 readini (PadIni,PadAppName,"PADRING6")
#define PADRING7 readini (PadIni,PadAppName,"PADRING7")
#define PADRING8 readini (PadIni,PadAppName,"PADRING8")
#define PADRING9 readini (PadIni,PadAppName,"PADRING9")
#define PADRING10 readini (PadIni,PadAppName,"PADRING10")

;; DELPHI
#define DELPHI_FORM readini (PadIni,PadAppName,"DELPHI_FORM")
#define DELPHI_D1_URL readini (PadIni,PadAppName,"DELPHI_D1_URL")
#define DELPHI_D2_URL readini (PadIni,PadAppName,"DELPHI_D2_URL")
#define DELPHI_D3_URL readini (PadIni,PadAppName,"DELPHI_D3_URL")
#define DELPHI_D4_URL readini (PadIni,PadAppName,"DELPHI_D4_URL")
#define DELPHI_D5_URL readini (PadIni,PadAppName,"DELPHI_D5_URL")
#define DELPHI_D6_URL readini (PadIni,PadAppName,"DELPHI_D6_URL")
#define DELPHI_BCB1_URL readini (PadIni,PadAppName,"DELPHI_BCB1_URL")
#define DELPHI_BCB3_URL readini (PadIni,PadAppName,"DELPHI_BCB3_URL")
#define DELPHI_BCB4_URL readini (PadIni,PadAppName,"DELPHI_BCB4_URL")
#define DELPHI_BCB5_URL readini (PadIni,PadAppName,"DELPHI_BCB5_URL")
#define DELPHI_K1_URL readini (PadIni,PadAppName,"DELPHI_K1_URL")
#define DELPHI_Type readini (PadIni,PadAppName,"DELPHI_Type")
#define DELPHI_Price readini (PadIni,PadAppName,"DELPHI_Price")
#define DELPHI_Source readini (PadIni,PadAppName,"DELPHI_Source")
#define DELPHI_File_Location readini (PadIni,PadAppName,"DELPHI_File_Location")
#define DELPHI_Link_URL readini (PadIni,PadAppName,"DELPHI_Link_URL")
#define DELPHI_Download_URL readini (PadIni,PadAppName,"DELPHI_Download_URL")
#define DELPHI_Version readini (PadIni,PadAppName,"DELPHI_Version")
#define DELPHI_Notes readini (PadIni,PadAppName,"DELPHI_Notes")



;; ISSI Specific
#define EULA_FileName readini (PadIni,PadAppName,"EULA_FileName")
#define Distribution_Permissions_FileName readini (PadIni,PadAppName,"Distribution_Permissions_FileName")

#define myTemplatePad "\pad.xml"
;#if ASP_FORM == "Y" || ASP_FORM == "y"
;  #define myTemplatePad "\pad-asp.xml"
;#endif



[Setup]
OutputBaseFileName={#AppFileName}
AppName={#AppName}
AppVersion={#AppVersion}
;AppID={#AppID}
AppPublisher=LOGAN Interactive
AppVerName={cm:NameAndVersion,{#AppName},{#AppVersion}}
DefaultDirName={#SourcePath}
OutputDir={#SourcePath}
DisableStartupPrompt=true
DisableReadyPage=true
DisableProgramGroupPage=true
DisableDirPage=true
UpdateUninstallLogAppName=no
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no

[Files]
#if PadStyleSheet != ""
Source: "{#SourcePath}\pad-styler\{#PadStyleSheet}.xsl"; DestDir: "{#PadExportFolder}"; DestName: "{#PadStyleSheet}.xsl"; Flags: ignoreversion
Source: "{#SourcePath}\pad-styler\{#PadStyleSheet}.css"; DestDir: "{#PadExportFolder}"; DestName: "{#PadStyleSheet}.css"; Flags: ignoreversion
  #define PadStyleSheet "<?xml-stylesheet type=""text/xsl"" href="""+PadStyleSheet+".xsl"" media=""screen""?>"
#endif

Source: "{#file SourcePath+myTemplatePad}"; DestDir: "{#PadExportFolder}"; DestName: "{#PadExportFileName}"; Flags: ignoreversion

[Code]
function InitializeSetup(): Boolean;
  var
      mykey          : String;
begin
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) = 0 then
        begin
          MsgBox( ExpandConstant('This file is only to be used by ISSI'), mbInformation, MB_OK );
          Result := False;
        end;
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) > 0 then
        begin
          ////
          Result := True;
        end;
end;
