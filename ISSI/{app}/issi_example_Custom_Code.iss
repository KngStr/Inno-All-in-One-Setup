
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to add your custum code to the setup


; PLEASE NOTE that this example shows nothing because you only need this
; if your code gives conflicts with certain ISSI functions that use the
; same functions or procedures. This is provided as a workaround for
; conflicts using ISSI and your own code section.

[ISSI]
#define ISSI_InitializeSetup
[Code]
function ISSI_InitializeSetup(): Boolean;
begin
  MsgBox('Example of using your custom code', mbInformation, mb_Ok);
  result:=True
end;
[/Code]


;If it's original pmplementation as shown below gave conflicts
[Code]
//function InitializeSetup(): Boolean;
//begin
//  MsgBox('Example of using your custom code', mbInformation, mb_Ok);
//  result:=True
//end;
[/Code]

#include ISSI_IncludePath + "\_issi.isi"

[Setup]
AppName=ISSI Example
AppVerName=ISSI Example v1.0
AppVersion=1.0
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=ISSI_Custom_Code
