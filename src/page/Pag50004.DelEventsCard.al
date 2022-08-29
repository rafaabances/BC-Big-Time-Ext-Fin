page 50004 "Del Events Card"
{
    Caption = 'Ficha de Eventos';
    PageType = Card;
    SourceTable = "Del Events";


    //Tiene una List Part --> ArtistsEvents 50003

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Editable2;
                field("No Event"; Rec."No Event")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nº Evento field.';
                    Editable = false;
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
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ciudad field.';
                    Editable = false;

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
                    Editable = false;
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
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
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
                    Editable = false;
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
                    Editable = false;
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
            part("Event Artist"; "Del Artists-Event List")
            {
                Editable = Editable2;
                ApplicationArea = Basic, Suite;
                SubPageLink = "No Event" = FIELD("No Event");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        Area(Processing)
        {
            action("Finalizar")
            {
                ApplicationArea = All;
                Image = Process;

                trigger OnAction()
                var
                    Text50000: Label 'El estado está en %1, debe estar en confirmado para poder Finalizarlo';

                begin
                    if rec.Status = rec.Status::Confirmed then begin
                        rec.Status := rec.Status::Finished;
                        rec.Modify();
                    end else
                        Message(Text50000, rec.Status);
                end;
            }


            action("Inicializar Evento")
            {
                ApplicationArea = All;
                Image = Process;

                trigger OnAction()
                var
                    Text50001: Label 'El estado está en %1, debe estar en confirmado, en Preparación o Finalizado para poder marcar como Borrador';

                begin
                    if (rec.Status = rec.Status::Confirmed) or (rec.Status = rec.Status::Finished) or (rec.Status = rec.Status::"In preparation") then begin
                        rec.Status := rec.Status::Draft;
                        rec.Modify();
                    end else
                        Message(Text50001, rec.Status);
                end;
            }

            action("Esquema de Cuentas Asociado")
            {
                ApplicationArea = All;
                Image = CostAccountingSetup;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;


                trigger OnAction()
                var

                    CodeEventsSusbscriber: Codeunit "Del Code Events Suscribers";
                    rlAccScheduleLine: Record "Acc. Schedule Line";
                    glAccScheduleOverview: page "Acc. Schedule Overview";
                    rlUserEvent: Record UserEvent;
                begin
                    rlAccScheduleLine.Reset();
                    Clear(glAccScheduleOverview);
                    glAccScheduleOverview.SetAccSchedName(rec."ACC. Schedule Code");
                    rlUserEvent.Init();
                    rlUserEvent.EventNo := Rec."No Event";
                    rlUserEvent.User := Database.UserId;
                    if not rlUserEvent.Insert() then
                        rlUserEvent.Modify();
                    glAccScheduleOverview.Run();
                end;



            }
        }
    }




    trigger OnAfterGetRecord()
    var
        Rec: Record "Del Events";

    begin
        TestEditable();
        AssignAmount();
        AssignRealAmount();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        TestEditable();
        AssignAmount();
        AssignRealAmount();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        TestEditable();
        AssignAmount();
        AssignRealAmount();
    end;

    trigger OnOpenPage()

    begin
        AssignAmount();
        AssignRealAmount();
    end;


    //Functions

    local procedure TestEditable()
    begin
        if (Rec.Status = Rec.Status::Draft) or (Rec.Status = Rec.Status::" ") or (Rec.Status = Rec.Status::"In preparation") then
            Editable2 := true
        else
            Editable2 := false;
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

        Editable2: Boolean;
        vRevenueByEvent: Decimal;
        vExpensesByEvent: Decimal;

        vRevenueRealByEvent: Decimal;
        vExpensesRealByEvent: Decimal;

}
