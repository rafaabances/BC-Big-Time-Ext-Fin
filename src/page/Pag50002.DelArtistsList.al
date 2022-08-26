page 50002 "Del Artists List"
{
    ApplicationArea = All;
    Caption = 'Lista de Artistas';
    PageType = List;
    SourceTable = "Del Artists";
    UsageCategory = Lists;
    CardPageID = "Del Artists Card";
    Editable = false;

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
                }
                field("Associated Vendor"; Rec."Associated Vendor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Proveedor Asociado field.';
                }
            }
        }
    }
}
