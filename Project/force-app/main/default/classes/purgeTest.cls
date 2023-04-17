@isTest
public class purgeTest {
    
    @testSetup
    public static void purgeEeventRecord(){
        List<Events__c> eventList = new List<Events__c>();
        for(Integer i=0; i<=200; i++){
            Events__c event = new Events__c(
                Name__c = 'MAX FIT Campaign #'+i+1,
                Event_Type__c = 'Virtual',
                Frequency__c = 'Weekly',
                Max_Seats__c = 199,
                Recurring__c = true,
                Live__c = true,
                Start__c = System.now().addMonths(-4),
                End__c = System.now().addDays(3).addMonths(-4)
            );
            eventList.add(event);


    }
    insert eventList;

    }
    @isTest
    static void PurgeEventRecord(){
        Test.startTest();
        String jobId=Database.executeBatch(new PurgeEventRecord(),250);
        Test.stopTest();
    }
        
        
    }