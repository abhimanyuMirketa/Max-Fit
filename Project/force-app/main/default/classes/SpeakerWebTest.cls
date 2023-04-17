@isTest
public class SpeakerWebTest {
    @isTest
    static void speakerWebPageTest() {
        Test.startTest();
        RestContext.response = new RestResponse();
        String sRecord = SpeakerWebServer.doPost('Heera','heera@gmail.com','98769876','Hero');
        String sRecord1 = SpeakerWebServer.doPost('Heera','heera@gmail.com','98769876','Hero');
        List<Speaker__c> speaker = [Select Id,Name from Speaker__c where Name = 'Heera'];
        System.assertEquals(1, speaker.size());
        System.assertEquals(400, RestContext.response.statusCode);
        Test.stopTest();
    }

}