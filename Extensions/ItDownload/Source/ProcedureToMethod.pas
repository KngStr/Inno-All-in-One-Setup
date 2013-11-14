unit ProcedureToMethod;

interface

uses windows;

{Create stubs that present a Delphi method as if it were a Delphi
 non-object procedure}

procedure DisposeStub(Stub: Pointer);
function CreateStub(ObjectPtr: Pointer; MethodPtr: Pointer): Pointer;

implementation

const
  AsmPopEDX = $5A;
  AsmPushImmediate = $68;
  AsmPushEDX = $52;
  AsmRet = $C3;

type
  TStub = packed record
    PopEDX: Byte;

    Push: Byte;
    SelfPointer: Pointer;

    PushEDX: Byte; {Stack is now object reference, return address}

    Push2: byte;
    MethodPointer: Pointer;

    Ret: byte;
  end;

{Stack before our stub is called:
 ReturnAddress:pointer;

 As the stub calls the provided method:

 ObjectPtr:pointer;
 ReturnAddress:pointer;

 After the method finishes executing, control will return to the caller of the stub
}

function CreateStub(ObjectPtr: Pointer; MethodPtr: Pointer): Pointer;
var
  Stub: ^TStub;
begin
  // Allocate memory for the stub
  Stub := VirtualAlloc(nil, SizeOf(TStub), MEM_COMMIT,
    PAGE_EXECUTE_READWRITE);

  // Pop the return address off the stack
  Stub^.PopEDX := AsmPopEDX;

  // Push the object pointer on the stack
  Stub^.Push := AsmPushImmediate;
  Stub^.SelfPointer := ObjectPtr;

  // Push the return address back on the stack
  Stub^.PushEDX := AsmPushEDX;

  // Now call the method that the caller provided
  Stub^.Push2 := AsmPushImmediate;
  Stub^.MethodPointer := MethodPtr;
  stub^.Ret := AsmRet; //Absolute jump, easier to calculate! (Though slow)

  // Return a pointer to the stub
  Result := Stub;
end; //CreateStub, Nicholas Sherlock

procedure DisposeStub(Stub: Pointer);
begin
  VirtualFree(Stub, SizeOf(TStub), MEM_DECOMMIT);
end;

end.

