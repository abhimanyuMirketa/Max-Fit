public class EventRegistrationController {
    public Event_Organizer__c eorganizer{get; set;}
    public Events__c event{get;set;}
    public Locations__c location{get;set;}
    public EventRegistrationController(){
    Id id = ApexPages.currentPage().getParameters().get('id');
    eorganizer=(id == null) ? new Event_Organizer__c() :
    [Select Name,Phone__c,Email__c,Alternative_Email__c,Alternative_Phone__c from Event_Organizer__c where Id=:id];
   
   
   
    event=(id==null)?new Events__c():
    [Select Name__c,Organizer__c,Start__c,End__c from Events__c where Id=:id];
   
   
   
    location=(id==null) ? new Locations__c():
    [Select Street__c,City__c,State__c from Locations__c where Id=:id];
    }
    public void addEventOrganizer(){
    try{
    insert location;
    event.Organizer__c=eorganizer.Id;
    insert eorganizer;
    event.Locations__c=location.Id;
    insert event;
   
     }
    catch(Exception e){
    System.debug(e.getMessage());
    }
   
    }
   }