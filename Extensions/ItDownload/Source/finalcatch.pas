unit finalcatch;

interface

type TOnFinal = procedure;
var onFinal: TOnFinal;

implementation

initialization
finalization
  if assigned(onfinal) then
    onfinal;
end.
