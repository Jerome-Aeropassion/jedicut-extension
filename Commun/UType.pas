{   Copyright 2011 Jerome

    This file is part of OpenDxf.

    OpenDxf is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    OpenDxf is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with OpenDxf.  If not, see <http://www.gnu.org/licenses/>.

    The software Jedicut is allowed to statically and dynamically link this library.
}

unit UType;

interface

{ Caract�ristique d'un mat�riaux }
{ }
type
  PMateriau = ^TMateriau;
  TMateriau = packed record
    vitesse1 : double;
    pourcentage1 : double;
    vitesse2 : double;
    pourcentage2 : double;
  end;

{ Type d'identification d'un registre du port parall�le }
{ - 0 : registre de donn�es
  - 1 : registre de statut /!\ LECTURE SEULE /!\
  - 2 : registre de commande }
{ }
type
  TBitPort = packed record
    adresseBase, iRegistre, iBit : integer;
  end;

{ Caract�ristique de la communication }
{ }
type
  TParametreCommunication = packed record
    BitModeChauffe, BitHorlogeExterne, BitEmissionChauffe, BitReceptionChauffe, BitAlimMoteur : TBitPort;
    synchroniserMoteurAvecTimerExterne : boolean; // true si un timer externe est utilis� pour g�rer le mouvement des moteurs
	frequenceTimer : double; // Fr�quence en kHz
  end;

{ Caract�ristique de la chauffe }
{ }
type
  TParametreChauffe = packed record
    chauffeActive, chauffeMode, chauffeDynamique : boolean;
    chauffeUtilisateur : boolean; // parametre utile lors du pilotage manuel de la machine pour activer/d�sactiver la chauffe
  end;


{ Informations n�cessaires pour UNE rotation moteur }
{ }
type
  TOrdreMoteur = packed record
    bitRotation : Byte; // Bit de rotation moteur
    bitSens : Byte;     // Bit de sens moteur
    vitesse : integer;  // Dur�es d'impulsion (vitesse)
    chauffe : double;   // Pourcentage de chauffe
    keyPoint : boolean;
  end;

{ Tableau d'ordres moteurs }
{ }
type
  TArrayOrdresMoteur = packed record
    ArrayOrdres : array of TOrdreMoteur;
  end;

{ D�finition des constantes communes aux dll }
const DLL_FAMILY_COM = 0;
const DLL_FAMILY_FILE_PROFIL = 1;
const DLL_FAMILY_FILE_PROFIL_READ_ONLY = 2;
const DLL_FAMILY_FILE_PROFIL_WRITE_ONLY = 3;
const DLL_FAMILY_FILE_CUT = 4;
const DLL_FAMILY_FILE_CUT_READ_ONLY = 5;
const DLL_FAMILY_FILE_CUT_WRITE_ONLY = 6;

{ D�finition des constantes sp�cifiques aux dll de communication}
const NO_ERROR = 0;
const ERROR_TIME_OUT = -1;
const ERROR_ON_SENDING = -2;

{--- D�finition des constantes sp�cifiques aux dll de fichier ---}

{ D�finition d'un point d'un profil }
type
  TPointProfil = record
    X : double;
    Y : double;
    keyPoint : boolean;
    valChauffe : double;
  end;

{ D�finition des coordonn�es d'un profil }
type
  TCoordonneesProfil = record
    coordonneesExDecoupe : array of TPointProfil;
    coordonneesInDecoupe : array of TPointProfil;
  end;

implementation


end.
