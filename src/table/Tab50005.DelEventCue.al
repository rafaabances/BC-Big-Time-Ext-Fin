table 50005 "Del Event Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(2; "Number Events"; Integer)
        {
            CalcFormula = Count("Del Events");
            Caption = 'Nº de Eventos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Number Draft Events"; Integer)
        {
            CalcFormula = Count("Del Events" WHERE(Status = const(Draft)));
            Caption = 'Nº de Eventos en Borrador';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Number Confirmed Events"; Integer)
        {
            CalcFormula = Count("Del Events" WHERE(Status = const(Confirmed)));
            Caption = 'Nº de Eventos Confirmados';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Number Finished Events"; Integer)
        {
            CalcFormula = Count("Del Events" WHERE(Status = const(Finished)));
            Caption = 'Nº de Eventos Finalizados';
            Editable = false;
            FieldClass = FlowField;
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }


}