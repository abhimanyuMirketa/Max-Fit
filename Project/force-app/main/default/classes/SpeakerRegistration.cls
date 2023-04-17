public class SpeakerRegistration {
    public Speaker__c speaker{get;set;}
    public Event_Speaker__c eventSpeaker{get;set;}
    public SpeakerRegistration() {
        speaker = new Speaker__c();
        eventSpeaker = new Event_Speaker__c();

    }
    public void save(){
        try{
            insert speaker;
            eventSpeaker.Speaker__c=speaker.Id;
            insert eventSpeaker;
            speaker = new Speaker__c();
            eventSpeaker = new Event_Speaker__c();

            
        }
        catch(Exception e){
            system.debug(e.getMessage());
        }
    }
}