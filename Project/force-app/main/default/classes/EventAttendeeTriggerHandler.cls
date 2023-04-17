public class EventAttendeeTriggerHandler {
    public static void sendConfirmationMail(List<Event_Attendee__c> newRecordList){
        Set<Id> attendeesIdsSet = new Set<Id>();
        Set<Id> eventIdsSet = new Set<Id>();
        for(Event_Attendee__c EventAttendee : newRecordList){
            attendeesIdsSet.add(EventAttendee.Attendeess__c);
            eventIdsSet.add(EventAttendee.Eventss__c);
        }
        Map<Id,Attendees__c> attendeeMap = new Map<Id,Attendees__c>( [Select Id, Name, Email__c From Attendees__c WHERE Id IN : attendeesIdsSet]);
        Map<Id, Events__c > eventMap = new Map<Id, Events__c > ( [Select Id, Name,Name__c, Start__c,Organizer__c ,Organizer__r.Name, Locations__r.Country__c FROM Events__c WHERE ID IN: eventIdsSet]);
        List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
        for(Event_Attendee__c eventAttendees:newRecordList){
            Attendees__c Attendee = attendeeMap.get(EventAttendees.Attendeess__c);
            Events__c evt = eventMap.get(EventAttendees.Eventss__c);
            Messaging.SingleEmailMessage mails=New Messaging.SingleEmailMessage();
            mails.setSubject('Pass for the '+evt.Name__c);
            List<String> toAddress = new List<String>();
            toAddress.add(Attendee.Email__c);
            mails.setToAddresses( toAddress );
            mails.setSenderDisplayName(evt.Organizer__r.Name);
            String body='Dear '+Attendee.Name+ ',<br/><br/>'+ 'Thank you for registering for '+ evt.Name +' which will be Organized on '+ evt.Start__c +' & will be held in '+ evt.Locations__r.Country__c + '.<br/>We are excited to have you,'+'see you in the event. <br/>'+'Thanks,<br/>'+evt.Organizer__r.Name;
            mails.setHtmlBody(body);
            emailList.add(mails); 
        }
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(emailList, false);
         for(Messaging.SendEmailResult email:results){
             System.debug(email.isSuccess());
    }

}

}