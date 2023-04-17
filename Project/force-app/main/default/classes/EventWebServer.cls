@RestResource(urlMapping = '/Event/*')
global with sharing class EventWebServer {
    @httpGet
    global static List<Events__c> getEventRecord() {
        //request.requestURI.substring(request.requestURI.lastIndexOF('/')+1);
        List <Events__c> details = [Select Id, Name__c, Start__c, Max_Seats__c, Organizer__r.Name , Organizer__r.Email__c From Events__c ];
        return details;

    }
}