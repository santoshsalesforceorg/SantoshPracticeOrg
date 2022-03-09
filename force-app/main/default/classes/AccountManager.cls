@RestResource(urlMapping='/v1/Account/*')
//https://brave-badger-28hssm-dev-ed.lightning.force.com/services/apexrest/v1/Account/0012v00002V2hgrAAB
global class AccountManager {
	@httpGet
    global static AccountWrapper accountInformation(){
        RestRequest request = RestContext.request;
        String requestURI = request.requestURI;
        String accountId = requestURI.subStringAfterLast('/');
        List<Account> accountList = [SELECT id, Name, Rating, Industry, Description, Phone 
                                        FROM Account WHERE Id=:accountId];    

        List<Contact> contactList = [SELECT Id, Name, FirstName, LastName, Email, Phone
                                        FROM Contact WHERE AccountId =: accountId ];
                                     
        List<Case> caseList = [SELECT Id, CaseNumber, Subject, Description, Status, Owner.Name 
                                FROM Case WHERE AccountId =: accountId];
        AccountWrapper wrapper = new AccountWrapper();
        if(!accountList.isEmpty()){
            wrapper.accountRecord = accountList.get(0);
            wrapper.contactList = contactList;
            wrapper.caseList = caseList;
        }
        return wrapper;
    }
    @httpPost
    global static Account postAccount(String accName, String accNumber, String industry, String description){
        Account accountRecord = new Account(Name = accName, Industry = industry, Description = description, AccountNumber = accNumber);
        insert accountRecord;
        return accountRecord;
    }


    global class AccountWrapper {
        global Account accountRecord;
        global List<Contact> contactList;
        global List<Case> caseList;
    }
}