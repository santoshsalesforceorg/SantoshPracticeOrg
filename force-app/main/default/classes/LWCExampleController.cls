public inherited sharing class LWCExampleController {

    @AuraEnabled(Cacheable = true)
    // public static List<Account> retriveAccs(String strAccName){
    //     List<List<SObject>> searchResults =  [FIND :strAccName IN ALL FIELDS RETURNING Account(Name,Industry)];
    //     return (Account[])searchResults[0];
    // }
    public static list<Account> retriveAccs(String strAccName) {
        strAccName = '%' + strAccName + '%';
        list<Account> lstAccs = [SELECT  Id, Name, Industry, Phone, Type From Account WHERE Name LIKE :strAccName OR
        Industry LIKE:strAccName OR Type LIKE:strAccName];

        if(lstAccs.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return lstAccs; 
    }
}