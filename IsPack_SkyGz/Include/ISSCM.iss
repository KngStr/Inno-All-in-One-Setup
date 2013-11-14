Type
  TSERVICE_STATUS = Record
    dwServiceType: Cardinal;
    dwCurrentState: Cardinal;
    dwControlsAccepted: Cardinal;
    dwWin32ExitCode: Cardinal;
    dwServiceSpecificExitCode: Cardinal;
    dwCheckPoint: Cardinal;
    dwWaitHint: Cardinal;
  End;
//  THANDLE = Cardinal;

Const
  SERVICE_QUERY_CONFIG = $1;
  SERVICE_CHANGE_CONFIG = $2;
  SERVICE_QUERY_STATUS = $4;

  SERVICE_START = $10;
  SERVICE_STOP = $20;

  SERVICE_ALL_ACCESS = $F01FF;
  SC_MANAGER_ALL_ACCESS = $F003F;
  SERVICE_WIN32_OWN_PROCESS = $10;
  SERVICE_WIN32_SHARE_PROCESS = $20;
  SERVICE_WIN32 = $30;
  SERVICE_INTERACTIVE_PROCESS = $100;

  SERVICE_BOOT_START = $0;
  SERVICE_SYSTEM_START = $1;
  SERVICE_AUTO_START = $2;
  SERVICE_DEMAND_START = $3;
  SERVICE_DISABLED = $4;

  SERVICE_DELETE = $10000;

  SERVICE_CONTROL_STOP = $1;
  SERVICE_CONTROL_PAUSE = $2;
  SERVICE_CONTROL_CONTINUE = $3;
  SERVICE_CONTROL_INTERROGATE = $4;

  SERVICE_STOPPED = $1;
  SERVICE_START_PENDING = $2;
  SERVICE_STOP_PENDING = $3;
  SERVICE_RUNNING = $4;
  SERVICE_CONTINUE_PENDING = $5;
  SERVICE_PAUSE_PENDING = $6;
  SERVICE_PAUSED = $7;

  // #######################################################################################
  // nt based service utilities
  // #######################################################################################
Function OpenSCManager(lpMachineName, lpDatabaseName: AnsiString; dwDesiredAccess: Cardinal): THANDLE;
  External 'OpenSCManagerA@advapi32.dll stdcall';

Function OpenService(hSCManager: THANDLE; lpServiceName: AnsiString; dwDesiredAccess: Cardinal): THANDLE;
  External 'OpenServiceA@advapi32.dll stdcall';

Function CloseServiceHandle(hSCObject: THANDLE): boolean;
  External 'CloseServiceHandle@advapi32.dll stdcall';

Function CreateService(hSCManager: THANDLE; lpServiceName, lpDisplayName: AnsiString; dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl: Cardinal; lpBinaryPathName, lpLoadOrderGroup: String; lpdwTagId: Cardinal; lpDependencies, lpServiceStartName, lpPassword: String): Cardinal;
  External 'CreateServiceA@advapi32.dll stdcall';

Function DeleteService(hService: THANDLE): boolean;
  External 'DeleteService@advapi32.dll stdcall';

Function StartNTService(hService: THANDLE; dwNumServiceArgs: Cardinal; lpServiceArgVectors: Cardinal): boolean;
  External 'StartServiceA@advapi32.dll stdcall';

Function ControlService(hService: THANDLE; dwControl: Cardinal; Var ServiceStatus: TSERVICE_STATUS): boolean;
  External 'ControlService@advapi32.dll stdcall';

Function QueryServiceStatus(hService: THANDLE; Var ServiceStatus: TSERVICE_STATUS): boolean;
  External 'QueryServiceStatus@advapi32.dll stdcall';

Function QueryServiceStatusEx(hService: THANDLE; ServiceStatus: TSERVICE_STATUS): boolean;
  External 'QueryServiceStatus@advapi32.dll stdcall';

Function OpenServiceManager(): THANDLE;
Begin
  Result := 0;
  If UsingWinNT() Then
  Begin
    Result := OpenSCManager('', 'ServicesActive', SC_MANAGER_ALL_ACCESS);
    If Result = 0 Then
      MsgBox('the servicemanager is not available', mbError, MB_OK);
  End
  Else
    MsgBox('only nt based systems support services', mbError, MB_OK);
End;

Function IsServiceInstalled(ServiceName: String): boolean;
Var
  hSCM: THANDLE;
  hService: THANDLE;
Begin
  hSCM := OpenServiceManager();
  Result := false;
  If hSCM <> 0 Then
  Begin
    hService := OpenService(hSCM, ServiceName, SERVICE_QUERY_CONFIG);
    If hService <> 0 Then
    Begin
      Result := true;
      CloseServiceHandle(hService)
    End;
    CloseServiceHandle(hSCM)
  End
End;

Function InstallService(FileName, ServiceName, DisplayName, Description: String; ServiceType, StartType: Cardinal): boolean;
Var
  hSCM: THANDLE;
  hService: THANDLE;
Begin
  hSCM := OpenServiceManager();
  Result := false;
  If hSCM <> 0 Then
  Begin
    hService := CreateService(hSCM, ServiceName, DisplayName, SERVICE_ALL_ACCESS, ServiceType, StartType, 0, FileName, '', 0, '', '', '');
    If hService <> 0 Then
    Begin
      Result := true;
      // Win2K & WinXP supports aditional description text for services
      If Description <> '' Then
        RegWriteStringValue(HKLM, 'System\CurrentControlSet\Services\' + ServiceName, 'Description', Description);
      CloseServiceHandle(hService)
    End;
    CloseServiceHandle(hSCM)
  End
End;

Function RemoveService(ServiceName: String): boolean;
Var
  hSCM: THANDLE;
  hService: THANDLE;
Begin
  hSCM := OpenServiceManager();
  Result := false;
  If hSCM <> 0 Then
  Begin
    hService := OpenService(hSCM, ServiceName, SERVICE_ALL_ACCESS);
    If hService <> 0 Then
    Begin
      Result := DeleteService(hService);
      CloseServiceHandle(hService)
    End;
    CloseServiceHandle(hSCM)
  End
End;

Function StartService(ServiceName: String): boolean;
Var
  hSCM: THANDLE;
  hService: THANDLE;
Begin
  hSCM := OpenServiceManager();
  Result := false;
  If hSCM <> 0 Then
  Begin
    hService := OpenService(hSCM, ServiceName, SERVICE_START);
    If hService <> 0 Then
    Begin
      Result := StartNTService(hService, 0, 0);
      CloseServiceHandle(hService)
    End;
    CloseServiceHandle(hSCM)
  End;
End;

Function StopService(ServiceName: String): boolean;
Var
  hSCM: THANDLE;
  hService: THANDLE;
  Status: TSERVICE_STATUS;
Begin
  hSCM := OpenServiceManager();
  Result := false;
  If hSCM <> 0 Then
  Begin
    hService := OpenService(hSCM, ServiceName, SERVICE_STOP);
    If hService <> 0 Then
    Begin
      Result := ControlService(hService, SERVICE_CONTROL_STOP, Status);
      CloseServiceHandle(hService)
    End;
    CloseServiceHandle(hSCM)
  End;
End;

Function IsServiceRunning(ServiceName: String): boolean;
Var
  hSCM: THANDLE;
  hService: THANDLE;
  Status: TSERVICE_STATUS;
Begin
  hSCM := OpenServiceManager();
  Result := false;
  If hSCM <> 0 Then
  Begin
    hService := OpenService(hSCM, ServiceName, SERVICE_QUERY_STATUS);
    If hService <> 0 Then
    Begin
      If QueryServiceStatus(hService, Status) Then
        Result := (Status.dwCurrentState = SERVICE_RUNNING)
      CloseServiceHandle(hService)
    End;
    CloseServiceHandle(hSCM)
  End
End;
