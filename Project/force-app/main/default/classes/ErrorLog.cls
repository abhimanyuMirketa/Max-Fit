public class ErrorLog {
    public static void InsertErrorLog( Datetime logDateTime, String logDetails,String processName){
        Error_log__c errorLog = new Error_log__c();
        errorLog.Log_Date_Time__c = logDateTime;
        errorLog.Log_Details__c = logDetails;
        errorLog.Process_Name__c = processName;
        insert errorLog;
    }

}