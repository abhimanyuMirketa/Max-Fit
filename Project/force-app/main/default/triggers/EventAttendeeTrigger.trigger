trigger EventAttendeeTrigger on Event_Attendee__c (after insert) {
    EventAttendeeTriggerHandler.sendConfirmationMail(trigger.new);
}