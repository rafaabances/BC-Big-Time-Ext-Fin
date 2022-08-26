codeunit 50001 "Del Calculate Real Amounts"
{
    procedure "fCalculateRevAmount"(pEvent: Code[20]; pBudgetCode: Code[20]): Decimal

    var
        rleventSetUp: Record "Del Events SetUp";
        rlGlEntry: Record "G/L Entry";


    begin
        rleventSetUp.Reset();
        rlGlEntry.Reset();
        rleventSetUp.get();
        // rleventSetUp.TestField("Def Rev Control Acc. Filter"); // da error si está vacío y entonces ni siquiera te muestra el evnto.
        if rleventSetUp."Def Rev Control Acc. Filter" <> '' then begin
            rlGlEntry.SetRange("Shortcut Dimension 3 Code", pEvent);
            rlGlEntry.SetFilter("G/L Account No.", rleventSetUp."Def Rev Control Acc. Filter");
            if rlGlEntry.FindSet() then begin
                repeat
                    TotalRevAmount += (rlGlEntry."Credit Amount" - rlGlEntry."Debit Amount");
                until rlGlEntry.Next() = 0;
                EXIT(TotalRevAmount);
            end;

        end;
    end;



    procedure "fCalculateExpAmount"(pEvent: Code[20]; pBudgetCode: Code[20]): Decimal
    var
        rleventSetUp: Record "Del Events SetUp";
        rlGlEntry: Record "G/L Entry";
    begin
        rleventSetUp.Reset();
        rlGlEntry.Reset();
        rleventSetUp.get();
        if rleventSetUp."Def Exp Control Acc. Filter" <> '' then begin
            rlGlEntry.SetRange("Shortcut Dimension 3 Code", pEvent);
            rlGlEntry.SetFilter("G/L Account No.", rleventSetUp."Def Exp Control Acc. Filter");

            if rlGlEntry.FindSet() then begin
                repeat
                    TotalExpAmount += (rlGlEntry."Debit Amount" - rlGlEntry."Credit Amount");
                until rlGlEntry.Next() = 0;
                EXIT(TotalExpAmount);
            end;

        end
    end;



    var

        TotalRevAmount: Decimal;
        TotalExpAmount: Decimal;
}