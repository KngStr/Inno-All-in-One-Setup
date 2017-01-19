[Code]
//*****************************************************************************
//
//  File: dialog.iss
//
//  Description: This file contains the support code for user dialog GUIs.
//
//  Global Routines:
//      DlgBox
//
//  Internal Only Routines:
//
//  Notes:
//
//  History:
//
//*****************************************************************************

type
    // Define a record to hold the informatiom about the buttons to create for
    // the message dialog box.
    TDialogButton = record
        Name        : String;         // Button Name.
        ModalResult : Integer;        // Value to return when button is pressed.
        OnClick     : TNotifyEvent;   // Callback to exec when button is pressed.
        default     : Boolean;        // True if button is highlighted as default.
    end;

// Prototypes.
function  DlgBox(text : String; dlgType : TMsgBoxType; const db_buttons : Array of TDialogButton) : Integer; forward;

//*****************************************************************************
//
//  Routine: DlgBox
//
//  Description: Display a message dialog box.
//
//  Calling Sequence:
//      buttonID := DlgBox(text, dlgType, db_buttons);
//
//  Parameters:
//      text       - Specifies the message to display.
//      dlgType    - Specifies which icon to use in the dialog box.
//      db_buttons - Specifies which buttons to include in the dialog box.
//
//  Routines Called:
//      LoadIcon
//
//  Global Variables Referenced:
//
//  Notes:
//     DlgBox works much the same as msgBox does.
//
//     dlgType = (mbInformation, mbConfirmation, mbError, mbCriticalError).
//
//  Return Values:
//      Integer - The value indicating the button the user clicked, or 0
//                if the function fails (which shouldn't happen unless an
//                invalid parameter is specified or system resources are
//                exhausted).
//
//[Code]
//#include "icons.iss"
//#include "dialog.iss"
//
//procedure OnClickAboutButton(Sender : TObject);
//begin
//    msgBox('Dialog Test 1.0', mbInformation, MB_OK);
//end;
//
//function InitializeSetup() : Boolean;
//var
//    db_aboutOK : Array[0..1] of TDialogButton;
//
//begin
//    // Define the About and OK buttons that will be used on the message
//    // dialog box.
//    db_aboutOK[0].Name        := 'About...';
//    db_aboutOK[0].ModalResult := 0;
//    db_aboutOK[0].OnClick     := @OnClickAboutButton;
//    db_aboutOK[0].default     := False;
//    db_aboutOK[1].Name        := 'OK';
//    db_aboutOK[1].ModalResult := mrOK;
//    db_aboutOK[1].OnClick     := Nil;
//    db_aboutOK[1].default     := True;
//
//    // Display the message informing the user that there is nothing to
//    // update.
//    DlgBox('This is a dialog box test', mbInformation, db_aboutOK);
//
//   Result := False;
//end;
//
//*****************************************************************************

function DlgBox(text : String; dlgType : TMsgBoxType; const db_buttons : Array of TDialogButton) : Integer;
var
    entry             : Integer;
    maxWidth          : Integer;
    botOffset         : Integer;
    topOffset         : Integer;
    leftOffset        : Integer;
    numButtons        : Integer;
    buttonOffset      : Integer;
    iconTopOffset     : Integer;
    totalButtonsWidth : Integer;
    title             : String;
    dialogButtons     : Array of TButton;
    dialogBox         : TSetupForm;
    dialogText        : TNewStaticText;
    dialogIcon        : TBitmapImage;

begin
    // Define offsets to place items in the dialog.
    maxWidth      := 800;
    iconTopOffset := 10;
    topOffset     := 19;
    botOffset     := 10;
    leftOffset    := 10;
    buttonOffset  := 8;

    // Create storage for the dialog buttons to create based on the user
    // specified buttons.
    numButtons := GetArrayLength(db_buttons);

    SetArrayLength(dialogButtons, numButtons);

    // Determine if the window is being run during setup or uninstall.
    if (IsUninstaller())
    then begin
        title := 'Uninstall';
    end

    else begin
        title := 'Setup';
    end;

    // Create the main dialog box.
    dialogBox              := CreateCustomForm();
    dialogBox.Caption      := title;
    dialogBox.ClientHeight := ScaleY(55);
    dialogBox.BorderIcons  := [biSystemMenu];
    dialogBox.BorderStyle  := bsDialog;
    dialogBox.Font.Name    := 'Tahoma';
    dialogBox.Font.Pitch   := 0;

    // Create the icon to show the type of dialog.
    dialogIcon          := TBitmapImage.Create(dialogBox);
    dialogIcon.Parent   := dialogBox;
    dialogIcon.Left     := ScaleX(leftOffset);
    dialogIcon.Top      := ScaleY(iconTopOffset);
    dialogIcon.AutoSize := True;

    // Load the bitmap region with the appropriate icon.  Set the
    // background of the icon bitmap so that it is transparent.
    dialogIcon.ReplaceColor     := LoadIcon(dlgType, dialogIcon.Bitmap);
    dialogIcon.ReplaceWithColor := dialogBox.Color;

    // Create the text region in the dialog box.
    dialogText          := TNewStaticText.Create(dialogBox);
    dialogText.Parent   := dialogBox;
    dialogText.Left     := dialogIcon.Left + dialogIcon.Width + ScaleX(2 * leftOffset);
    dialogText.Top      := ScaleY(topOffset);
    dialogText.AutoSize := True;
//    dialogText.WordWrap := True;
    dialogText.Caption  := text;

    // Make sure that the text does not exceed a predefine maximum width.
//    dialogText.SetBounds(dialogText.Left, dialogText.Top, ScaleX(maxWidth), dialogText.Height);

    // Reenable the ability to  automatically set the text region height based
    // on what happens when the text wraps.
    dialogText.AutoSize := True;

    // Resize the dialog box to account for the text being diplayed in the
    // window.
    dialogBox.ClientWidth  := dialogText.Width;
    dialogBox.Width        := dialogBox.ClientWidth + dialogText.Left + 13;
    dialogBox.ClientHeight := dialogBox.ClientHeight + dialogText.Height + dialogText.Top;

    // Create the user specified buttons in the dialog box.
    totalButtonsWidth := 0;

    for entry := 0 to numButtons - 1 do
    begin
        // Create the next button in the dialog box.  The horizontal placement
        // of the button will be done after all the buttons have been created.
        dialogButtons[entry]             := TButton.Create(dialogBox);
        dialogButtons[entry].Parent      := dialogBox;
        dialogButtons[entry].Caption     := db_buttons[entry].Name;
        dialogButtons[entry].Top         := dialogBox.ClientHeight - dialogButtons[entry].Height - ScaleY(botOffset);
        dialogButtons[entry].OnClick     := db_buttons[entry].OnClick;
        dialogButtons[entry].ModalResult := db_buttons[entry].ModalResult;
        dialogButtons[entry].TabOrder    := entry + 1;

        if (db_buttons[entry].default)
        then begin
            // Put focus on a button so that the [Enter] key will perform the
            // same operation as using the mouse.
            dialogBox.ActiveControl := dialogButtons[entry];
        end;

        // Keep track of the amount of horizontal space that the buttons will
        // occupy.
        totalButtonsWidth := totalButtonsWidth + dialogButtons[entry].Width;
    end;

    // Compute the total amount of horizontal space that the buttons occupy
    // including the space that is required between the buttons.
    totalButtonsWidth := totalButtonsWidth + ((numButtons - 1) * buttonOffset);

    // The dialog box can not be smaller then the total width of the buttons.
    if (dialogBox.ClientWidth <= totalButtonsWidth)
    then begin
        dialogBox.ClientWidth := totalButtonsWidth + 10;
        dialogBox.Width       := dialogBox.ClientWidth + 10;
    end;

    // Center the dialog box on the screen after its size has finally been
    // computed.
    dialogBox.Center;

    // Compute where to place the first button.
    leftOffset := (dialogBox.ClientWidth - totalButtonsWidth) / 2;

    // Now go place each of the buttons horizontally.
    for entry := 0 to numButtons - 1 do
    begin
        // Place the button on the screen.
        dialogButtons[entry].Left := leftOffset;

        // Compute where the next button will be placed.
        leftOffset := leftOffset + dialogButtons[entry].Width + buttonOffset;
    end;

    // Display the dialog message box and wait for the user to press a button.
    Result := dialogBox.ShowModal();

    // Remove the diaog message box.
    dialogBox.Release();
end;

[/Code]