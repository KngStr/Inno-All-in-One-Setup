; Демонстрационный скрипт ISWin7 v0.5
;
; [+] Значительн?переделана отрисовк?прозрачных областей
;
; Поддержк?Windows Vista была некорретна вследствии чего была удален?
;
; Эт?тестовый скрипт позволяет сделат?прозрачным?кр? ил?вс?окно целико?
; Работает ?Windows 7, Windows 8
;
; ?Windows XP ?Windows Vista он пропускает инициализаци?
; чт?не мешает работоспособност?сетапник??этих операционных системах
;
; Создател? VoLT ( Vo1T на Ru-Board )

#include "IsWin7.ish"

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Code]
procedure InitializeWizard();
begin
  PDir('{# ISWin7_DLL }');

  // Необходимо добавлять каждую кнопку расположенну?на стекле
  // до инициализаци?стекла для того чт?бы не было ды?))
  iswin7_add_button(WizardForm.BackButton.Handle);
  iswin7_add_button(WizardForm.NextButton.Handle);
  iswin7_add_button(WizardForm.CancelButton.Handle);
  // Параметр True не трогат?он для htuos ))
  iswin7_add_glass(WizardForm.Handle, 0, 0, 0, 47, True);
end;

procedure DeinitializeSetup();
begin
  //НЛіц°ІЧ°іМРт
  iswin7_free;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.ReadyPage.Hide;
end;