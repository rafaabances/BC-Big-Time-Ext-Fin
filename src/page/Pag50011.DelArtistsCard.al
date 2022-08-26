page 50011 "Del Artists Card"
{
    Caption = 'Del Artists Card';
    PageType = Card;
    SourceTable = "Del Artists";


    layout
    {
        area(content)
        {
            group(General)
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
