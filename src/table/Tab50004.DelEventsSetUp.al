table 50004 "Del Events SetUp"
{
    Caption = 'Conf. Eventos';
    DrillDownPageID = "Del Events SetUp Conf";
    LookupPageID = "Del Events SetUp Conf";

    fields
    {
        field(1; "Primary Code"; Code[10])
        {
            Caption = 'Clave Primaria';
        }
        field(2; "Event No Series"; Code[20])
        {
            Caption = 'No Series Evento';
            TableRelation = "No. Series";
        }
        field(3; "Event Dimension Code"; Code[20])
        {
            Caption = 'Código de Dimensión para Evento';
            TableRelation = Dimension;
        }
        field(4; "Budget Code"; Code[20])
        {
            Caption = 'Código Presuspuesto';
            TableRelation = "G/L Budget Name";
        }
        field(5; "ACC. Schedule Code"; Code[10])
        {
            Caption = 'Código Esquema Cuentas';
            TableRelation = "Acc. Schedule Name";
        }
        field(6; "Def Rev Control Acc. Filter"; Code[20])
        {
            Caption = 'Filtro Cuentas de Ingresos';
            trigger OnLookup()
            var
                plGLAccList: Page "G/L Account List";
                rlGLAccount: Record "G/L Account";
            begin
                CLEAR(plGLAccList);
                plGLAccList.LOOKUPMODE(TRUE);
                rlGLAccount.SetFilter("No.", '%1..%2', '7', '7999999');
                plGLAccList.SetTableView(rlGLAccount);
                IF plGLAccList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    "Def Rev Control Acc. Filter" := plGLAccList.GetSelectionFilter;
                END;
            end;
        }
        field(7; "Def Exp Control Acc. Filter"; code[20])
        {
            Caption = 'Filtro Cuentas de Gastos';
            trigger OnLookup()
            var
                plGLAccList: Page "G/L Account List";
                rlGLAccount: Record "G/L Account";

            begin
                CLEAR(plGLAccList);
                plGLAccList.LOOKUPMODE(TRUE);
                rlGLAccount.SetFilter("No.", '%1..%2', '6', '6999999');
                plGLAccList.SetTableView(rlGLAccount);
                IF plGLAccList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    "Def Exp Control Acc. Filter" := plGLAccList.GetSelectionFilter;
                END;
            end;
        }
    }
    keys
    {
        key(PK; "Primary Code")
        {
            Clustered = true;
        }
    }

}
