page 50012 "Del Events CardPart"
{
    Caption = 'Actividades';
    PageType = CardPart;
    SourceTable = "Del Event Cue";

    layout
    {
        area(content)
        {
            cuegroup("For Release")

            {
                Caption = 'Control de Eventos';
                field("Number Events"; Rec."Number Events")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Del Event List";
                    LookupPageId = "Del Event List";
                    ToolTip = 'Specifies the value of the Nº de Eventos';
                }
                field("Number Draft Events"; Rec."Number Draft Events")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Del Event List";
                    Image = Settings;
                    LookupPageId = "Del Event List";
                    ToolTip = 'Specifies the value of the Nº de Eventos en Borrador';
                }
                field("Number Confirmed Events"; Rec."Number Confirmed Events")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Del Event List";
                    LookupPageId = "Del Event List";
                    ToolTip = 'Specifies the value of the Nº de Eventos Confirmados';
                }
                field("Number Finished Events"; Rec."Number Finished Events")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Del Event List";
                    LookupPageId = "Del Event List";
                    ToolTip = 'Specifies the value of the Nº de Eventos Finalizados';
                }
            }
        }
    }


    trigger OnOpenPage()

    begin
        rec.Reset();
        if not rec.Get() then begin
            rec.Init();
            rec.Insert()
        end;

    end;
}
