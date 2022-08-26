page 50003 "Del Artists-Event List"
{
    // ApplicationArea = All;
    Caption = 'Lista de Artistas-Eventos';
    PageType = ListPart;
    SourceTable = "Del Artist-Event";
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Artist Code"; Rec."Artist Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Código de Artista field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nombre field.';
                    Editable = false;
                }

            }
        }
    }
}
