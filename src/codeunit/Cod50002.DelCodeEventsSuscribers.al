codeunit 50002 "Del Code Events Suscribers"
{
    [EventSubscriber(ObjectType::Page, Page::"Acc. Schedule Overview", 'OnBeforeUpdateDimFilterControls', '', true, true)]

    local procedure ChangeEventFilter(var AccScheduleLine: Record "Acc. Schedule Line")

    var

        EventCard: Page "Del Events Card";

        UserEvent: Record UserEvent;



    begin



        if UserEvent.Get(Database.UserId) then begin

            AccScheduleLine.SetFilter("Dimension 1 Filter", UserEvent.EventNo);

            //AccScheduleLine."Dimension 1 Filter" := 'E1019';

        end;

    end;
}