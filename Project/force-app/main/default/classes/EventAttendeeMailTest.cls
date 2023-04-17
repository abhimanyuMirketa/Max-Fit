@isTest
public class EventAttendeeMailTest {
    @isTest
    public static void dataCheck() {
        Event_Organizer__c org = new Event_Organizer__c(
            Name = 'Abhimanyu Rana',
            Phone__c = '6395979906',
            Email__c = 'abhimanyu.rana@mirketa.com',
            Alternative_Phone__c = '7900816006',
            Alternative_Email__c ='abhimanyu.19b311184@abes.ac.in'

        );
        insert org;
        Events__c event = new Events__c(
            Name__c = 'MAX FIT Campaign',
            Organizer__c = org.Id,
            Event_Type__c = 'Virtual',
            Frequency__c = 'Weekly',
            Max_Seats__c = 199,
            Recurring__c = true,
            Live__c = true,
            Start__c = System.now(),
            End__c = System.now().addDays(3)
        );
        insert event;
        Attendees__c att = new Attendees__c(
            Name = 'Rohit',
            Email__c = 'devang.tiwari_cs19@gla.ac.in',
            Phone__c = '8953829030'
        );
        insert att;

        Event_Attendee__c evtAtt = new Event_Attendee__c(
            Eventss__c = event.Id, Attendeess__c = att.Id
        );
        insert evtAtt;


    }
    @isTest
    static void sendConfirmationMail(){
        Test.startTest();
        EventAttendeeTriggerHandler.sendConfirmationMail(Trigger.new);
        Test.stopTest();
        
    }
    
    
        
    }