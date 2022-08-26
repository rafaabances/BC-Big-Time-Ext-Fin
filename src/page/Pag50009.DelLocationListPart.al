page 50009 "Del Location List Part"
{
    Caption = 'Lista de Localizaciones';
    PageType = ListPart;
    SourceTable = "Del Location";
    UsageCategory = Lists;
    CardPageId = "Del Location Card";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ubicación field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nombre field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the País field.';
                }
                field("Post Code"; rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ciudad field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tipo field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Aforo field.';
                }
            }
        }
    }
}
