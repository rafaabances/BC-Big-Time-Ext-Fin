page 50008 "Del Event List Part"
{
    Caption = 'Lista de Eventos';
    PageType = ListPart;
    SourceTable = "Del Events";
    UsageCategory = Lists;
    CardPageID = "Del Events Card";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No Event"; Rec."No Event")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nº Evento field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nombre field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tipo field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ubicación field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the País field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ciudad field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fecha Inicio field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fecha Final field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Aforo field.';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Código presupuesto field.';
                }
                field("ACC. Schedule Code"; Rec."ACC. Schedule Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Código Esquema Cuentas field.';
                }

                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Código Esquema Cuentas field.';
                }

                field(Revenue; vRevenueByEvent)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Revenue Bud. By Event', comment = 'ESP="Ingresos Prep. por Evento"';
                    trigger OnDrillDown()
                    var
                        rleventSetUp: Record "Del Events SetUp";
                        rlGlBudGetEntry: Record "G/L Budget Entry";
                        vlGlBudgerEntries: Page "G/L Budget Entries";
                    begin
                        rleventSetUp.Reset();
                        rlGlBudGetEntry.Reset();
                        rleventSetUp.get();
                        if rleventSetUp."Def Exp Control Acc. Filter" <> '' then begin
                            rlGlBudGetEntry.SetRange("Budget Name", rec."Budget Code");
                            rlGlBudGetEntry.SetRange("Budget Dimension 1 Code", rec."No Event");
                            rlGlBudGetEntry.SetFilter("G/L Account No.", rleventSetUp."Def Rev Control Acc. Filter");
                            Clear(vlGlBudgerEntries);
                            vlGlBudgerEntries.SetTableView(rlGlBudGetEntry);
                            vlGlBudgerEntries.Run();
                        end;
                    end;
                }

                field(Expenses; vExpensesByEvent)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Expenses Bud. By Event', comment = 'ESP="Gastos Prep. por Evento"';
                    trigger OnDrillDown()
                    var
                        rleventSetUp: Record "Del Events SetUp";
                        rlGlBudGetEntry: Record "G/L Budget Entry";
                        vlGlBudgerEntries: Page "G/L Budget Entries";
                    begin
                        rleventSetUp.Reset();
                        rlGlBudGetEntry.Reset();
                        rleventSetUp.get();
                        if rleventSetUp."Def Exp Control Acc. Filter" <> '' then begin
                            rlGlBudGetEntry.SetRange("Budget Name", rec."Budget Code");
                            rlGlBudGetEntry.SetRange("Budget Dimension 1 Code", rec."No Event");
                            rlGlBudGetEntry.SetFilter("G/L Account No.", rleventSetUp."Def Exp Control Acc. Filter");
                            Clear(vlGlBudgerEntries);
                            vlGlBudgerEntries.SetTableView(rlGlBudGetEntry);
                            vlGlBudgerEntries.Run();
                        end;
                    end;
                }

                field(RevenueReal; vRevenueRealByEvent)
                {
                    ApplicationArea = All;
                    Caption = 'Revenue Real By Event', comment = 'ESP="Ingresos Reales por Evento"';
                    trigger OnDrillDown()
                    var
                        rleventSetUp: Record "Del Events SetUp";
                        rlGlEntry: Record "G/L Entry";
                        vlGlEntries: Page "General Ledger Entries";
                    begin
                        rleventSetUp.Reset();
                        rlGlEntry.Reset();
                        rleventSetUp.get();
                        if rleventSetUp."Def Exp Control Acc. Filter" <> '' then begin
                            rlGlEntry.SetRange("Shortcut Dimension 3 Code", rec."No Event");
                            rlGlEntry.SetFilter("G/L Account No.", rleventSetUp."Def Rev Control Acc. Filter");
                            Clear(vlGlEntries);
                            vlGlEntries.SetTableView(rlGlEntry);
                            vlGlEntries.Run();
                        end;
                    end;
                }

                field(ExpensesReal; vExpensesRealByEvent)
                {
                    ApplicationArea = All;
                    Caption = 'Expenses Real By Event', comment = 'ESP="Gastos Reales por Evento"';
                    trigger OnDrillDown()
                    var
                        rleventSetUp: Record "Del Events SetUp";
                        rlGlEntry: Record "G/L Entry";
                        vlGlEntries: Page "General Ledger Entries";
                    begin
                        rleventSetUp.Reset();
                        rlGlEntry.Reset();
                        rleventSetUp.get();
                        if rleventSetUp."Def Exp Control Acc. Filter" <> '' then begin
                            rlGlEntry.SetRange("Shortcut Dimension 3 Code", rec."No Event");
                            rlGlEntry.SetFilter("G/L Account No.", rleventSetUp."Def Exp Control Acc. Filter");
                            Clear(vlGlEntries);
                            vlGlEntries.SetTableView(rlGlEntry);
                            vlGlEntries.Run();
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Esquema de Cuentas Asociado")
            {
                ApplicationArea = All;
                Image = CostAccountingSetup;
                RunObject = page "Account Schedule Names";
                RunPageLink = Name = field("ACC. Schedule Code");
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Rec: Record "Del Events";

    begin
        AssignAmount();
        AssignRealAmount();

    end;

    trigger OnAfterGetCurrRecord()
    begin
        AssignAmount();
        AssignRealAmount();

    end;

    trigger OnOpenPage()

    begin
        AssignAmount();
        AssignRealAmount();

    end;

    local procedure AssignAmount()
    var
        CalculateAmounts: Codeunit "Del Calculate Prep Amounts";
    begin
        vRevenueByEvent := CalculateAmounts.fCalculateRevAmount(rec."No Event", rec."Budget Code");
        vExpensesByEvent := CalculateAmounts.fCalculateExpAmount(Rec."No Event", rec."Budget Code");
    end;

    local procedure AssignRealAmount()
    var
        CalculateRealAmounts: Codeunit "Del Calculate Real Amounts";
    begin
        vRevenueRealByEvent := CalculateRealAmounts.fCalculateRevAmount(rec."No Event", rec."Budget Code");
        vExpensesRealByEvent := CalculateRealAmounts.fCalculateExpAmount(Rec."No Event", rec."Budget Code");
    end;

    var

        vRevenueByEvent: Decimal;
        vExpensesByEvent: Decimal;

        vRevenueRealByEvent: Decimal;
        vExpensesRealByEvent: Decimal;
}
