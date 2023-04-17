@isTest
private class ErrorLogUtilTest {


    @isTest
    static void ErrorLogRecordInsertTest() {
        datetime logDateTime = System.now();
        String logDetails = 'This is Error here';
        String processName = 'During QA';
        Test.startTest();
        ErrorLog.InsertErrorLog(logDateTime,logDetails, processName);
        Test.stopTest();
        List<Error_Log__c> newRecord = [Select Id,Log_Date_Time__c,Log_Details__c,Process_Name__c from Error_Log__c where Process_Name__c =:processName];
        System.assertEquals(1, newRecord.size());
        System.assertEquals(System.now(), newRecord[0].Log_Date_Time__c);
        System.assertEquals(logDetails, newRecord[0].Log_Details__c);
        System.assertEquals(processName, newRecord[0].Process_Name__c);
    }
}