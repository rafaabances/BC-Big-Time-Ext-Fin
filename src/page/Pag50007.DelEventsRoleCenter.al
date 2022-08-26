page 50007 "Del Events Role Center"
{
    Caption = 'Del Events Role Center';
    PageType = RoleCenter;
    RefreshOnActivate = true;

    layout
    {
        area(rolecenter)
        {
            part("Del Event List"; "Del Event List Part")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Del Artists"; "Del Artists List part")
            {
                ApplicationArea = Basic, Suite;

            }
            part("Del Location"; "Del Location List Part")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1; "Del Events CardPart")
            {
                ApplicationArea = Basic, Suite;
            }
        }

    }
    actions
    {
        area(Sections)
        {
            group("Group")
            {
                Caption = 'Acciones';
                action("Events")
                {
                    ApplicationArea = all;
                    Caption = 'Eventos';
                    RunObject = page "Del Event List";
                }
                action("Locations")
                {
                    ApplicationArea = all;
                    Caption = 'Localizaciones';
                    RunObject = page "Del Location List";
                }
                action("Artists")
                {
                    ApplicationArea = all;
                    Caption = 'Artistas';
                    RunObject = page "Del Artists List";
                }

                action("SetUp")
                {
                    ApplicationArea = all;
                    Caption = 'Configuración Eventos';
                    RunObject = page "Del Events SetUp Conf";
                }

                group("Group0")
                {
                    Caption = 'Configuración de cuentas';
                    action("Chart of Accounts")
                    {
                        ApplicationArea = all;
                        Caption = 'Plan de Cuentas';
                        RunObject = page "Chart of Accounts (G/L)";
                    }
                    action("Account Schedule Names")
                    {
                        ApplicationArea = all;
                        Caption = 'Esquema de Cuentas';
                        RunObject = page "Account Schedule Names";
                    }
                    action("Column Layout")
                    {
                        ApplicationArea = all;
                        Caption = 'Diseño de Columnas';
                        RunObject = page "Column Layout";
                    }
                    action("Analysis View List")
                    {
                        ApplicationArea = all;
                        Caption = 'Vistas de Análisis';
                        RunObject = page "Analysis View List";
                    }
                }
                group("Group1")
                {
                    Caption = 'Presupuestos y Mov. Conta';

                    action("G/L Budget Names")
                    {
                        ApplicationArea = all;
                        Caption = 'Presupuestos';
                        RunObject = page "G/L Budget Names";
                    }
                    action("G/L Budget Entries")
                    {
                        ApplicationArea = all;
                        Caption = 'Movimientos Contabilidad de Presupuesto';
                        RunObject = page "G/L Budget Entries";
                    }
                }
                group("Group2")
                {
                    Caption = 'Facturación';

                    action("Sales Invoice List")
                    {
                        ApplicationArea = all;
                        Caption = 'Facturas Venta';
                        RunObject = page "Sales Invoice List";
                    }

                    action("Posted Sales Invoices")
                    {
                        ApplicationArea = all;
                        Caption = 'Facturas Venta Registradas';
                        RunObject = page "Posted Sales Invoices";
                    }

                    action("Purchase Invoices")
                    {
                        ApplicationArea = all;
                        Caption = 'Facturas Compra';
                        RunObject = page "Purchase Invoices";
                    }
                    action("Posted Purchase Invoices")
                    {
                        ApplicationArea = all;
                        Caption = 'Facturas Compra Registradas';
                        RunObject = page "Posted Purchase Invoices";
                    }
                    action("General Ledger Entries")
                    {
                        ApplicationArea = all;
                        Caption = 'Mov. de Contabilidad';
                        RunObject = page "General Ledger Entries";
                    }

                }

            }
        }
        area(Processing)
        {
            group("Other SetUp")
            {
                Caption = 'Otras Configuraciones';

                action("No Series")
                {
                    ApplicationArea = all;
                    Caption = 'Nº de Serie';
                    RunObject = page "No. Series";
                }

                action("Dimension")
                {
                    ApplicationArea = all;
                    Caption = 'Dimensiones';
                    RunObject = page Dimensions;
                }

                action("Dimension Values")
                {
                    ApplicationArea = all;
                    Caption = 'Valores de Dimension Evento';
                    RunObject = page "Dimension Values";
                }
                action("General Ledger Setup")
                {
                    ApplicationArea = all;
                    Caption = 'Configuración de Contabilidad';
                    RunObject = page "General Ledger Setup";
                }
                action("Extension Management")
                {
                    ApplicationArea = all;
                    Caption = 'Administración de Extensiones';
                    RunObject = page "Extension Management";
                }
            }
        }

    }

}
