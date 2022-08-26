page 50006 "Del Events SetUp Conf"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Configuración Eventos';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Del Events SetUp";
    UsageCategory = Administration;



    layout
    {
        area(content)
        {
            group(General)
            {
                field("Event No Series"; Rec."Event No Series")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Event No Series field.';
                }
                field("Event Dimension Code"; Rec."Event Dimension Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Event Dimension Code field.';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Code field.';

                }

                field("ACC. Schedule Code"; rec."ACC. Schedule Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ACC. Schedule Code field.';

                }
                field("Total Revenue Account"; Rec."Def Rev Control Acc. Filter")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Total Revenue Account field.';
                }
                field("Total Expenses Account"; Rec."Def Exp Control Acc. Filter")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Total Expenses Account field.';
                }
            }
        }
    }

    trigger OnOpenPage()

    begin
        rec.Reset();
        if not Rec.Get() then begin
            rec.Init();
            rec.Insert()
        end;
    end;
}
