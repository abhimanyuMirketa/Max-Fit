public class EventDetail {
    public Events__c event{get;set;}
    public List<Event_Speaker__c> eventSpeaker{get;set;}
    public EventDetail() {
        Id currentRecordId = ApexPages.CurrentPage().getparameters().get('id');
        this.event = [Select Id,Name__c,Organizer__r.Name,Locations__r.Name,Start__c,End__c From Events__c Where Id =: currentRecordId];
        this.eventSpeaker = [Select Id,Speaker__r.Name,Speaker__r.About_Me__c,Speaker__r.Profile_URL__c From Event_Speaker__c Where Events__c =: currentRecordId];

    }
}