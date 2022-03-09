public class CreateNewContactController {
    
    @AuraEnabled
    public static Account createNewAccount(Account account){
        system.debug('account => '+account);
        insert account;
        return account;
    }
    
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    
    @auraEnabled
    public static Account getAccounts(Account acc){
        Account  acct = [SELECT Id,Name,Industry FROM Account WHERE Id =: acc.Id];
        return acct; 
    }
    
 @auraEnabled
    public static List<contact> getContacts(String AccountId){
        List<contact>  contacts = [SELECT Id, 
                                         Name,FirstName,LastName,Email 
                                         FROM Contact
                                   WHERE AccountId=:AccountId];
        if(!contacts.isEmpty())
        return contacts; 
        else
        return contacts = new List<contact>();
    }
    
    @auraEnabled
    public static void createContact(Contact newContact){
        System.debug('newContact =>'+newContact);
        insert newContact;
    }
}