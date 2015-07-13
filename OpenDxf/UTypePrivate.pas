// Types sp�cifiques � la gestion des DXF avec la dll CNCTools.dll
unit UTypePrivate;

interface

uses ActiveX;

type
  PointPLT = packed record
    X : single; // Abcisse
    Y : single; // Ordonn�
    Cde : array[0..3] of char; // Commande (PU ou PD)
    numSequence : array[0..3] of char; // N� de s�quence de la d�coupe
  end;

  PPSafeArray = ^PSafeArray;
  PPChar = ^PChar;

  tableStruct = array of PointPLT;

implementation

end.
