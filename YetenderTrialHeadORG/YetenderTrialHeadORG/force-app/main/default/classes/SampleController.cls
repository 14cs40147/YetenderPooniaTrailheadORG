public class SampleController {

    public List<Account> lstAccount {get;set;}
    
    public SampleController(){
        
        lstAccount = [SELECT Id, Name, Industry, AccountNumber, phone FROM Account];
    }
}