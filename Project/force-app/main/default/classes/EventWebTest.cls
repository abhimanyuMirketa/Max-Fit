@isTest
public class EventWebTest {
    @isTest
    static void eventWebPageTest() {
        List<Events__c> getRecord = new List<Events__c>();
        getRecord.add(new Events__c(Name__c = 'Abhi', Start__c = System.Now(), Max_Seats__c = 200));
        insert getRecord;
        Test.startTest();
        List<Events__c> checkEntry = EventWebServer.getEventRecord();
        Test.stopTest();
        System.assertEquals(1,checkEntry.size());

    }
}