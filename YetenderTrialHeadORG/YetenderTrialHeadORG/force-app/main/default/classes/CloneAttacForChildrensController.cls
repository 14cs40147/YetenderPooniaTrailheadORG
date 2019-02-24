public class CloneAttacForChildrensController {
    
    public static void onAfterInsert(List<Attachment> lstAttachmentNew){
        
        //Map to hold account id, and Related attachment
        Map<Id,Attachment> mapAccount = new Map<Id,Attachment>();
        //Iterate over newely inserted attachments and get attachment only related to Account
        for(Attachment objAtt : lstAttachmentNew){
            
            if(objAtt.ParentId.getSobjectType() == Account.SobjectType){
                mapAccount.put(objAtt.ParentId, objAtt);
            }
        }
        List<Attachment> lstAttachments = new List<Attachment>();
        //Query all the contacts and Opportunities related to Accounts
        for(Account objAcc : [SELECT Id,(SELECT Id FROM Contacts), (SELECT Id FROM Opportunities) FROM account WHERE Id IN :mapAccount.keySet()]){
            
            
            //Iterate over Contacts
            for(Contact objCon :  objAcc.Contacts){
                
                //Get the Attachment
                Attachment objAttachment = mapAccount.get(objAcc.Id).clone(false,true);
                objAttachment.parentId = objCon.Id;
                lstAttachments.add(objAttachment);
            }  
            
            //Iterate over Opportunities
            for(Opportunity objOpp : objAcc.Opportunities){
                
                //Get the Attachment
                Attachment objAttachment = mapAccount.get(objAcc.Id).clone(false,true);
                objAttachment.parentId = objOpp.Id;
                lstAttachments.add(objAttachment);
            }
        }
        if(lstAttachments.size() > 0)
            Insert lstAttachments;
        
    }
}