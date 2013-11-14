; 演示如何防止 通用解包程序。Update: 2008-12-07
; 脚本: restools ( http://restools.hanzify.org )

; 如果该修改版本在编译脚本或者运行的时候出现问题请提出来.

;build 081207
;1. 修改 GetPassword 定义。
;     function GetPassword(PrePassword: String): String;
;2. 增加 1 个密码设置函数 SetPassword，具体使用方法可以参考例子。
;     procedure SetPassword(const Password: String);

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
Password=123456abcdef
UsePreviousTasks=yes
Encryption=true
OutputDir=userdocs:Inno Setup Examples Output

[Types]
Name: "full"; Description: "full"
Name: "compact"; Description: "compact"
Name: "custom"; Description: "custom"; Flags: iscustom

[Components]
Name: "program"; Description: "app files"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "help files"; Types: full
Name: "readme"; Description: "readme files"; Types: full

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme

[Icons]
Name: "{group}\my application"; Filename: "{app}\MyProg.exe"

[code]
Var
  P1, P2: Integer;
  
function CheckPassword(Password: String): Boolean;
begin
// 无论密码是否正确都要关闭 password 页面。
// 因为我们不需要这个页面来提供正确密码。
  Result := True;
end;
  
// 这里是一个 Inno Setup 内部支持函数, GetPassword,
// 当发现脚本中有此函数时并里面提供正确的密码时, 将会自动跳过 password 页面
// 参数 PrevPassword 是上一次提供的密码，当你需要多段密码重组的时候就用它。否则你可以不必理会这个参数，直接提供正确的密码就可以了。
function GetPassword(PrevPassword: String): String;
begin
// P1 的赋值可以在任何脚本的函数中进行，以确保脚本真正的由你的安装程序运行来获取密码。如果任何非本安装程序运行了脚本，因为未知 P1 的值，直接通过外部程序运行该函数是不能成功获得正确密码的。
  if (P1 = 5) and (P2 = 6) then
  begin
    Result := chr(ord('2')-1);
    Result := Result + chr(ord('3')-1);
    Result := Result + chr(ord('4')-1);
    Result := Result + chr(ord('5')-1);
    Result := Result + chr(ord('6')-1);
    Result := Result + chr(ord('7')-1);
  end else
  if (P1 = 5) and (P2 = 9) then
  begin
// 取前 6 位来组合密码，因为这是上一次提供的半段正确密码。接下来是添加正确的后半段密码。
    Result := Copy(PrevPassword, 1, 6) + chr(ord('b')-1);
    Result := Result + chr(ord('c')-1);
    Result := Result + chr(ord('d')-1);
    Result := Result + chr(ord('e')-1);
    Result := Result + chr(ord('f')-1);
    Result := Result + chr(ord('g')-1);
  end else
    Result := PrevPassword + 'FakePassword'; // 凡是未符合要求的一律返回假密码。
    
// P2 由 GetPassword 内部增加，这样做代表了当 GetPassword 被第 7 次和第 10 次调用后 2 次合并就会获得正确密码。
  P2 := P2 + 1;
  
// 上面的代码如果你愿意，可以做得更复杂，这样会令到真假密码在内存中错综复杂，不利程序自动获取。
// 以下代码用来查看一下密码提供的情况。
//  MsgBox(PrevPassword+' , '+Result, mbInformation, MB_OK);
end;
                             
procedure InitializeWizard();
begin
// P1 放到 InitializeWizard 赋值，表示了脚本必须同时运行了 InitializeWizard 才能够获取正确密码。
// 你可以在安装正体文件之前进行的任何函数中运行多层赋值动作，令到你的密码提供函数(GetPassword)可以遍及整个安装程序脚本而无法分离出来单独运行这一部分函数代码。
  P1 := 5;

// 接下来如何会获得正确密码呢？在文件真正释放的时候，会有 10 次获取正确密码的机会，只要在 10 次之内提供正确的密码（GetPassword 会被运行 10 次）。程序仍然会被正确安装。
// 如非必要，请不要直接用 SetPassword 来提供密码，尽可能用 GetPassword 来在安装文件时自动获取，因为这样做，如果你下面的代码并不能有效防止密码获取程序，至少你的安装程序文件需要被正常安装一次。

// 那么接下来再要写些什么代码呢？因为程序到了安装文件前才提供正确密码，所以任何程序想获取密码就必须运行你的安装程序到开始安装文件那一步，到那里为止有足够的脚本运行时间给你发挥你的想象力来阻止任何这类程序的密码获取行为：
// 1. 选择自动退出安装程序。
// 2. 选择提供一个假密码，导致安装程序不能安装。
// 3. 选择阻止监视程序的密码获取（不建议，因为技术有难度，不适合普通用户实现）
// 检测方法有很多种，进程查看，窗口检查等等，总之你想到什么方法用什么方法。反正脚本是自由的。
// ...... 更多的防止脚本，你们自己发挥吧。我只提供一个大概框架。
end;
