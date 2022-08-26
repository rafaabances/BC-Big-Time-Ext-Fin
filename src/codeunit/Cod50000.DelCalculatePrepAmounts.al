codeunit 50000 "Del Calculate Prep Amounts"
{
    procedure "fCalculateRevAmount"(pEvent: Code[20]; pBudgetCode: Code[20]): Decimal

    var
        rleventSetUp: Record "Del Events SetUp";
        rlGlBudGetEntry: Record "G/L Budget Entry";


    begin
        rleventSetUp.Reset();
        rlGlBudGetEntry.Reset();
        rleventSetUp.get();
        // rleventSetUp.TestField("Def Rev Control Acc. Filter"); // da error si está vacío y entonces ni siquiera te muestra el evnto.
        if rleventSetUp."Def Rev Control Acc. Filter" <> '' then begin
            rlGlBudGetEntry.SetRange("Budget Name", pBudgetCode);
            rlGlBudGetEntry.SetRange("Budget Dimension 1 Code", pEvent);
            rlGlBudGetEntry.SetFilter("G/L Account No.", rleventSetUp."Def Rev Control Acc. Filter");
            if rlGlBudGetEntry.FindSet() then begin
                repeat
                    TotalRevAmount += rlGlBudGetEntry.Amount;
                until rlGlBudGetEntry.Next() = 0;
                EXIT(TotalRevAmount);
            end;

        end;
    end;



    procedure "fCalculateExpAmount"(pEvent: Code[20]; pBudgetCode: Code[20]): Decimal
    var
        rleventSetUp: Record "Del Events SetUp";
        rlGlBudGetEntry: Record "G/L Budget Entry";
    begin
        rleventSetUp.Reset();
        rlGlBudGetEntry.Reset();
        rleventSetUp.get();
        if rleventSetUp."Def Exp Control Acc. Filter" <> '' then begin
            rlGlBudGetEntry.SetRange("Budget Name", pBudgetCode);
            rlGlBudGetEntry.SetRange("Budget Dimension 1 Code", pEvent);
            rlGlBudGetEntry.SetFilter("G/L Account No.", rleventSetUp."Def Exp Control Acc. Filter");

            if rlGlBudGetEntry.FindSet() then begin
                repeat
                    TotalExpAmount += rlGlBudGetEntry.Amount;
                until rlGlBudGetEntry.Next() = 0;
                EXIT(TotalExpAmount);
            end;

        end
    end;



    var

        TotalRevAmount: Decimal;
        TotalExpAmount: Decimal;
}