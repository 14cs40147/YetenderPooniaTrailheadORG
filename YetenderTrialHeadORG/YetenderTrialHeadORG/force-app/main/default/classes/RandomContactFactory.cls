public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer noOfConatcts, String lastName){
      
        List<Contact> lstContact = new List<Contact>();
        for(Integer i=1; i<= noOfConatcts; i++){
            
            lstContact.add(new Contact(FirstName='Test'+i, LastName=lastName));
        }
        return lstContact;
    }
}