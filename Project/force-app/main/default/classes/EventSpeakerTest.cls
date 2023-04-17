@isTest
public class EventSpeakerTest {
    @istest
    public static void EventSpeakerDuplicacy() {
        Events__c firstEvent = new Events__c();
        firstEvent.Name__c = 'DiscoNight';
        firstEvent.Live__c = true;
        firstEvent.Start__c = Datetime.now().addDays(4);
        firstEvent.End__c = Datetime.now().addDays(7);
        firstEvent.Event_Type__c = 'Virtual';
        insert firstEvent;

        Events__c secondEvent = new Events__c();
        secondEvent.Name__c = 'Oscar';
        secondEvent.Live__c = true;
        secondEvent.Start__c = Datetime.now().addDays(3);
        secondEvent.End__c = Datetime.now().addDays(6);
        secondEvent.Event_Type__c = 'Virtual';
        insert secondEvent;

        Speaker__c newSpeaker = new Speaker__c();
        newSpeaker.Name = 'Nusrat';
        newSpeaker.Email__c = 'abhiu.garg@mirketa.com';
        insert newSpeaker;

        Event_Speaker__c firstEventSpeaker = new Event_Speaker__c();
        firstEventSpeaker.Events__c = firstEvent.Id;
        firstEventSpeaker.Speaker__c = newSpeaker.Id;
        insert firstEventSpeaker;

        Event_Speaker__c secondEventSpeaker = new Event_Speaker__c();
        secondEventSpeaker.Events__c = secondEvent.Id;
        secondEventSpeaker.Speaker__c = newSpeaker.Id;

        Test.startTest();
        try{
            insert secondEventSpeaker;
            System.assert(false,'Expected an error but none occured means secondEventSpeaker record is insert');
        }
        catch (DmlException e){
            System.assert(e.getMessage().contains('This speaker is already booked in Event'), 'Unexpected error message: ' + e.getMessage());
        }
        Test.stopTest();

    }

}