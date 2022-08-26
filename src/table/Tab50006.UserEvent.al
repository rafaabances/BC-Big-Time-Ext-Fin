table 50006 "UserEvent"

{

    Caption = 'UserEvent';

    DataClassification = ToBeClassified;



    fields

    {

        field(1; User; Text[50])

        {

            Caption = 'User';

            DataClassification = ToBeClassified;

        }

        field(2; EventNo; Code[20])

        {

            Caption = 'EventNo';

            DataClassification = ToBeClassified;

        }

    }

    keys

    {

        key(PK; User)

        {

            Clustered = true;

        }

    }

}