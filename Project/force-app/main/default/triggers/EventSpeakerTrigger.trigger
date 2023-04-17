trigger EventSpeakerTrigger on Event_Speaker__c (before insert,before update) {
    Set<Id> eventId = new Set<Id>();
    Set<Id> speakerId = new Set<Id>();

    for(Event_Speaker__c newRecord : Trigger.new){
        eventId.add(newRecord.Events__c);
        speakerId.add(newRecord.Speaker__c);
    }
    Map<Id,Events__c> eventMap = new Map<Id,Events__c>([Select Id,Start__c,End__c from Events__c where Id IN :eventId]);
    List<Event_Speaker__c> listEventSpeaker = [Select Events__c,Speaker__c,Events__r.Start__c,Events__r.End__c from Event_Speaker__c where Speaker__c IN :speakerId];
    for(Event_Speaker__c newlyEventSpeaker : Trigger.new){
        Events__c matchEvent = eventMap.get(newlyEventSpeaker.Events__c);
        Datetime newRecordStartTime = matchEvent.Start__c;
        Datetime newRecordEndTime = matchEvent.End__c;

        for(Event_Speaker__c olderEventSpeaker : listEventSpeaker){
            if((newlyEventSpeaker.Speaker__c == olderEventSpeaker.Speaker__c) && ((newRecordStartTime <= olderEventSpeaker.Events__r.Start__c && newRecordEndTime >= olderEventSpeaker.Events__r.End__c) || (newRecordStartTime >= olderEventSpeaker.Events__r.Start__c && newRecordStartTime <= olderEventSpeaker.Events__r.End__c ) || (newRecordEndTime >= olderEventSpeaker.Events__r.Start__c && newRecordEndTime <= olderEventSpeaker.Events__r.End__c))){

                newlyEventSpeaker.Speaker__c.addError('This speaker is already booked in Event');
                newlyEventSpeaker.addError('You can not create this record because this speaker is already booked in previous event');

            }
        }
    }
}