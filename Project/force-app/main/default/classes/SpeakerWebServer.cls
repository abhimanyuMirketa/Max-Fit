@RestResource(urlMapping = '/Speaker/*')
global with sharing class SpeakerWebServer {
    @httpPost
    global static string dopost(string Name, string Email, string Phone, string Company) {
        Speaker__c speaker = new Speaker__c();
        speaker.Name = Name;
        speaker.Email__c = Email;
        speaker.Phone__c = Phone;
        speaker.Company__c = Company;
        //insert speaker;
        
        try{
            RestResponse res = RestContext.response;
            res.statusCode=200;
            insert speaker;
            return 'success';
        }
        catch(Exception e){
            RestResponse res = RestContext.response;
            res.statusCode = 400;
            return 'Failed';
        }

    }
}