public class CloseCheckChildrenHelper {
    
    public static void onAfterUpdate(List<Account> lstNewAccount, Map<Id,Account> mapOldAccount){
        
        //Set of only those accounts whose status is getting updated to "Closed"
        Set<Id> setAccount = new Set<Id>();
        for(Account objAcc :  lstNewAccount){
            
            if(objAcc.Status__c == 'Closed' && mapOldAccount.get(objAcc.Id).Status__c != objAcc.Status__c){
                setAccount.add(objAcc.Id);
            }
        }
        
        for(Account objAcc : [SELECT Id,(SELECT Id,Status__c FROM Contacts WHERE  Status__c != 'Closed' LIMIT 1),
                              (SELECT Id, Status__c FROM Opportunities WHERE Status__c != 'Closed' LIMIT 1)
                              FROM Account WHERE Id IN :setAccount ]){
                                  
                                  String errorMessage = objAcc.Contacts.size() == 1 ? 'Cannot Close Account, First Close all the Related Contacts' : objAcc.opportunities.size() == 1 ? 'Cannot Close Account, First Close all the Related Opportunities':'';
                                  if(errorMessage != ''){
                                      throw new MyException(errorMessage); 
                                  }   
                              }
    }
    
    public class MyException extends Exception {}
}