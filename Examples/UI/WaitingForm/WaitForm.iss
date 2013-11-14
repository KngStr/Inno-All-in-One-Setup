[Code]

//  ShowForm('logo.bmp','hahahahh');
//  WizardForm.Hide;
//  sleep(2000);
//  WizardForm.Show;
//  KillForm();
  
var
 g_waitform:TForm;
 g_iconimg:TBitmapImage;
 g_frame:TBevel ;

procedure ShowForm(IconFile,title:string);
var
  Label_title:TLabel;
begin

  g_waitform:=TForm.create(WizardForm);

  ExtractTemporaryFile(IconFile);
	g_iconimg := TBitmapImage.Create(g_waitform);
	g_frame:=TBevel.create(g_waitform);
	Label_title:=TLabel.create(g_waitform);

  g_waitform.width:=200;
  g_waitform.height:=78;

  with g_iconimg do
	begin
  	Bitmap.LoadFromFile(expandconstant('{tmp}\'+IconFile));
  	Stretch := false;
  	//Align := alClient;
  	parent:=g_waitform;
  	left:=20;
  	height:=Bitmap.height;
  	width:=bitmap.width;
  	top:= (g_waitform.Height - Height) / 2;
	end;

  with g_frame do
  begin
  	parent:=g_waitform;
  	Shape:=bsBox;
  	left:=1;
  	top:=1;
  	width:=parent.width-2;
  	height:=parent.height-2;
  	Style:=bsRaised;
  end;


  with Label_title do
  begin
  	parent:=g_waitform;
  	left:=g_iconimg.Left + g_iconimg.Width + 20;
  	top:=parent.height/2-10;
  	width:=parent.width-left;

  	caption:=title;
  end;

  with g_waitform do
  begin
    BORDERSTYLE:= bsNone;
    Position := poScreenCenter;
//    parent:=wizardform;
    show();
    Repaint;
  end;
end;

procedure KillForm();
begin
  g_waitform.hide();
  g_waitform.close();
  g_waitform.free();
end;

[/Code]