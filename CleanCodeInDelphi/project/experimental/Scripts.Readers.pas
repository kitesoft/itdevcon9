unit Scripts.Readers;

interface

uses
  System.Classes;

type
  TContactsScripts = class
    class function GetFirstNameList: string;
  end;

implementation

uses
  Data.Main, DataAccess.Readers, System.SysUtils,
  DataAccess.Readers.FireDAC;

const
  TEXT_SPERATOR = ', ';

class function TContactsScripts.GetFirstNameList: string;
var
  Readers: IReadersDAO;
  s: string;
begin
  Readers := GetReader_FireDAC(DataModMain.mtabContacts);
  s := '';
  Readers.ForEach(
    procedure(row: IReadersDAO)
    begin
      if not row.fldFirstName.Value.Trim.IsEmpty then
        if s.IsEmpty then
          s := row.fldFirstName.Value
        else
          s := s + TEXT_SPERATOR + row.fldFirstName.Value;
    end);
  Result := s;
end;

end.
