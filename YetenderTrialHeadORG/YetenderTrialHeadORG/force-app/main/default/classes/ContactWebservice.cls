/*
 *Webservice class to insert or update contact records 
 * 
 * 
*/
global class ContactWebservice {

    webservice static String handleContacts(String records){
        
        String resMessage;
        List<ContactWrapper> lstConWrapper = (List<ContactWrapper>)JSON.deserialize(records, List<ContactWrapper>.class);
        List<Contact> lstContacts = new List<Contact>();
        for(ContactWrapper con : lstConWrapper ){
            
            Contact cont = new Contact();
            cont.FirstName = con.firstName;
            cont.LastName = con.lastName;
            cont.Email = con.email;
            if(String.isNotBlank(con.id)){
             cont.ExternalId__c = con.id;   
            }
            lstContacts.add(cont);
        }
        
        try{
            Upsert lstContacts ExternalId__c;
            resMessage = 'Records processed successfully!';
        }catch(Exception e){
           resMessage = 'opps could not process records.'; 
        }
        
        return resMessage;
    }
    
    //Wrapper class to deserialise contact records
    class ContactWrapper{
        
        String id;
        String firstName;
        String lastName;
        String email;
    }
}