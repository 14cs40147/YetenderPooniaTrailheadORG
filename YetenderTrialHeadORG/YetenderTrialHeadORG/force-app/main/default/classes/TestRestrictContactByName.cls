@isTest
private class TestRestrictContactByName {

    @isTest
    static void createContact(){
        
        Contact con = new Contact(LastName='INVALIDNAME');
        Database.SaveResult conInsertResult = Database.insert(con, false);
        
        System.assert(conInsertResult.getErrors().size()> 0);

    }
}