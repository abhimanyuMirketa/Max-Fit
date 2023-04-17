public class AccountController {
    
    public static void updateRating(List<Account>accList){
         for(Account acc : acclist){
        if(acc.Industry == 'Banking'){
            acc.Rating = 'Hot';
        }
        else{
            acc.Rating = 'Cold';
        }
    }
    }

}