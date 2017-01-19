#include "icons.iss"
#include "dialog.iss"

[Setup]
AppName=DiaglogTest
AppId=DialogTest
AppVerName=DialogTest 1.0
DefaultDirName="C:\DialogTest"
DefaultGroupName=DialogTest
OutputBaseFilename=DialogTestInstall
OutputDir=userdocs:Inno Setup Examples Output

[Code]

procedure OnClickAboutButton(Sender : TObject);
begin
    msgBox('Dialog Test 1.0', mbInformation, MB_OK);
end;

function InitializeSetup() : Boolean;
var
    db_OK : Array[0..0] of TDialogButton;
    db_aboutOK : Array[0..1] of TDialogButton;
begin
    // Define the About and OK buttons that will be used on the message
    // dialog box.
    db_OK[0].Name        := 'OK';
    db_OK[0].ModalResult := mrOK;
    db_OK[0].OnClick     := Nil;
    db_OK[0].default     := True;

    // Display the message informing the user that there is nothing to
    // update.
    DlgBox('This is a dialog box test' , mbInformation, db_OK);

   Result := False;

    // Define the About and OK buttons that will be used on the message
    // dialog box.
    db_aboutOK[0].Name        := 'About...';
    db_aboutOK[0].ModalResult := 0;
    db_aboutOK[0].OnClick     := @OnClickAboutButton;
    db_aboutOK[0].default     := False;
    db_aboutOK[1].Name        := 'OK';
    db_aboutOK[1].ModalResult := mrOK;
    db_aboutOK[1].OnClick     := Nil;
    db_aboutOK[1].default     := True;

    // Display the message informing the user that there is nothing to
    // update.
    DlgBox('This is a dialog box test', mbInformation, db_aboutOK);

   Result := False;
end;
