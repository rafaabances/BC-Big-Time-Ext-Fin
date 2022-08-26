table 50000 "Del Events"
{
    DataClassification = ToBeClassified;
    Caption = 'Eventos';

    fields
    {
        field(1; "No Event"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nº Evento';
        }
        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nombre';
        }
        field(3; "Type"; Enum "Del Type Event Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo';
        }
        field(4; "Location"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Del Location".Location;
            Caption = 'Ubicación';

            // Manera de traer campos de una tabla a otra al validar la localización.

            //     trigger OnValidate()
            //     var
            //         rlLocation: record "Del Location";
            //     begin
            //         if rlLocation.Get(Rec."Location") then // se puede poner el Rec. o no, significa el registro actual
            //             Rec.Country := rlLocation.Country;
            //         Rec.City := rlLocation.City;
            //         // rec.Capacity := rlLocation.Capacity;
            //     end;
        }
        field(5; "Country"; code[10])
        {
            Caption = 'País';
            FieldClass = FlowField;
            CalcFormula = lookup("Del Location".Country where(Location = field(Location)));
            Editable = false;
        }
        field(6; "City"; Text[30])
        {
            Caption = 'Ciudad';
            FieldClass = FlowField;
            CalcFormula = lookup("Del Location".City where(Location = field(Location)));
            Editable = false;
        }
        field(7; "Start Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha Inicio';
        }
        field(8; "End Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha Final';
        }
        field(9; "Capacity"; Integer)
        {
            Caption = 'Aforo';
            FieldClass = FlowField;
            CalcFormula = lookup("Del Location".Capacity where(Location = field(Location)));
            Editable = false;
        }
        field(10; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Código Presupuesto';
            TableRelation = "G/L Budget Name";
        }
        field(11; "ACC. Schedule Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Código Esquema Cuentas';
            TableRelation = "Acc. Schedule Name";
        }
        field(12; "Status"; Enum "Del Status Event Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Estado';
        }
        // field(13; "Revenue"; Decimal)
        // {
        //     Caption = 'Ingresos Totales del Presupuesto';
        //     FieldClass = FlowField;
        //     CalcFormula = sum("G/L Budget Entry".Amount where("Budget Name" = const('PRESEVENTO'), "Budget Dimension 1 Code" = field("No Event"), "G/L Account No." = filter(7 .. 7999999)));
        //     Editable = false;
        // }
        // field(14; "Expenses"; Decimal)
        // {
        //     Caption = 'Gastos Totales del Presupuesto';
        //     FieldClass = FlowField;
        //     CalcFormula = sum("G/L Budget Entry".Amount where("Budget Name" = const('PRESEVENTO'), "Budget Dimension 1 Code" = field("No Event"), "G/L Account No." = filter(6 .. 6999999)));
        //     Editable = false;
        // }

    }

    keys
    {
        key(PK; "No Event")
        {
            Clustered = true;
        }
    }

    var
        Delete2: Boolean;
        vText50000: Label 'No esta permitido borrar cuando el evento está en estado %1';

    trigger OnInsert()

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        // SalesSetUp: Record "Sales & Receivables Setup";
        // rlGLSetUp: Record "General Ledger Setup";
        rlEventSetUp: Record "Del Events SetUp";
        rlDimensionsValues: Record "Dimension Value";
    begin
        if XRec."No Event" = '' then begin
            rlEventSetUp.Get();
            rlEventSetUp.TestField("Event No Series");
            "No Event" := NoSeriesMgt.GetNextNo(rlEventSetUp."Event No Series", Today, true);

            // crear y poner dimension con el mismo codigo de la clave primaria
            // borrar si se borra el evento

            rlEventSetUp.Reset();
            rlEventSetUp.Get();
            rlEventSetUp.TestField("Event Dimension Code"); // Da error si el campo está vacío| no dejará crear eventos si la configuración no está cumplimentada.
            rlEventSetUp.TestField("ACC. Schedule Code");
            rlEventSetUp.TestField("Budget Code");
            clear(rlDimensionsValues);
            rlDimensionsValues.Validate("Dimension Code", rlEventSetUp."Event Dimension Code");
            rlDimensionsValues.Validate(Code, "No Event");
            rlDimensionsValues.Insert();
            rlDimensionsValues.Validate(Name, Name);
            rlDimensionsValues.Modify();

            Validate("Budget Code", rlEventSetUp."Budget Code");
            Validate("ACC. Schedule Code", rlEventSetUp."ACC. Schedule Code");

        end;
    end;

    trigger OnDelete()
    var
        rlDimensionsValues: Record "Dimension Value";
        rlEventSetUp: Record "Del Events SetUp";
        rlGlBudget: record "G/L Budget Entry";

    begin
        if Status = Status::Finished then
            Error(vText50000, rec.Status);

        rlEventSetUp.Reset();
        rlEventSetUp.Get();
        if rlDimensionsValues.Get(rlEventSetUp."Event Dimension Code", "No Event") then begin
            rlGlBudget.Reset();
            rlGlBudget.SetRange("Budget Dimension 1 Code", "No Event");
            if rlGlBudget.FindSet() then begin
                rlDimensionsValues.Blocked := true;
                rlDimensionsValues.Modify();
            end else
                rlDimensionsValues.Delete();
        end;

    end;
}