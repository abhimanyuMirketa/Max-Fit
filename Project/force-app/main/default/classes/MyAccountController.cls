public class MyAccountController {
    @AuraEnabled
    public static List<Contact> getcontact(Id AccountId){
        List<Contact> contactDetail = [Select Id,Name,Title,email,Phone from Contact where AccountId =: AccountId];
        return contactDetail;
                            
    }
    

}