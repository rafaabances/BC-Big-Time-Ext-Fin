table 50002 "Del Artists"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Del Artists List";
    DrillDownPageId = "Del Artists List";


    fields
    {
        field(1; "Artist Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Código de Artista';

        }

        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nombre';
        }

        field(3; "Associated Vendor"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Proveedor Asociado';
            TableRelation = Vendor."No.";
        }
    }

    keys
    {
        key(PK; "Artist Code")
        {
            Clustered = true;
        }
    }

}