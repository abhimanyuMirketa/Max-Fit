public  class AttendeeRegistration {
    public Attendees__c attendee{get;set;}
    public Locations__c location{get;set;}
    public Event_attendee__c eventAttendee{get;set;}
    public AttendeeRegistration() {
        attendee = new Attendees__c();
        location = new Locations__c();
        eventAttendee = new Event_attendee__c();



    }
    public void save(){
        try{
            insert attendee;
            eventAttendee.Attendeess__c=attendee.Id;
            insert location;
            attendee.Address__c=location.Id;
            insert eventAttendee;
            attendee = new Attendees__c();
            location = new Locations__c();
            eventAttendee = new Event_attendee__c();

        }
        catch(Exception e){
            system.debug(e.getMessage());
        }
    }
}