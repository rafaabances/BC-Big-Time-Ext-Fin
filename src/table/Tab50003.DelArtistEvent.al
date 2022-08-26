table 50003 "Del Artist-Event"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No Event"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nº Evento';
            TableRelation = "Del Events"."No Event";
        }

        field(2; "Artist Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Código de Artista';
            TableRelation = "Del Artists"."Artist Code";

        }
        field(3; "Name"; Text[100])
        {
            Caption = 'Nombre';
            FieldClass = FlowField;
            CalcFormula = lookup("Del Artists".Name where("Artist Code" = field("Artist Code")));
            Editable = false;
        }

    }

    keys
    {
        key(PK; "No Event", "Artist Code")
        {
            Clustered = true;
        }
    }

}