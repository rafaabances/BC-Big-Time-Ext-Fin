table 50001 "Del Location"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Del Location List";
    DrillDownPageId = "Del Location List";

    fields
    {
        field(1; "Location"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ubicación';
        }

        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nombre';
        }
        field(3; "Country"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'País';
            TableRelation = "Country/Region".Code;
        }
        field(4; "Post Code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Country = CONST('')) "Post Code".Code
            ELSE
            IF (Country = FILTER(<> '')) "Post Code".Code WHERE("Country/Region Code" = FIELD(Country));
            Caption = 'Código Postal';
        }
        field(5; "City"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF (Country = CONST('')) "Post Code".City
            ELSE
            IF ("Post Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD(Country), Code = field("Post Code"));
            Caption = 'Ciudad';
        }
        field(6; "Type"; Enum "Del Location Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo';
        }

        field(7; "Capacity"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Aforo';
        }
    }

    keys
    {
        key(PK; Location)
        {
            Clustered = true;
        }
    }

}