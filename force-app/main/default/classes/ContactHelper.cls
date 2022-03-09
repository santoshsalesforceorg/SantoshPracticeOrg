public with sharing class ContactHelper {
    public static void afterInsertHandler(List<Contact> newContacts) {
        
        Set<Id> accountIds = new Set<Id>();
        for (Contact con : newContacts) {
            if (String.isNotBlank(con.AccountId)) {
                // write automation logic here
                accountIds.add(con.AccountId);
            }
        }
        // get aggregate result for all accounts
        updateActiveContacts(accountIds);
    }
    public static void afterUpdateHandler(List<Contact> newContacts, Map<Id, Contact> oldConMap){ 
        Set<Id> accountIds = new Set<Id>();
        for (Contact con : newContacts) {
            // capture the account id only if active checkbox value is flipped
            if (String.isNotBlank(con.AccountId) && oldConMap.get(con.Id).IsActive__c != con.IsActive__c) {
                // write automation logic here
                accountIds.add(con.AccountId);
            } else if (oldConMap.get(con.Id).AccountId != con.AccountId) {
                accountIds.add(con.AccountId);
                accountIds.add(oldConMap.get(con.Id).AccountId);
            }
        }
        // get aggregate result for all accounts
        updateActiveContacts(accountIds);
    
    }
    public static void updateActiveContacts(Set<Id> accountIds){
        List<AggregateResult> results = [
            SELECT AccountId, COUNT(Id) totalContacts
            FROM Contact
            WHERE IsActive__c = TRUE AND AccountId IN :accountIds
            GROUP BY AccountId
        ]; //
        // build final list of accounts to update
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results) {
            // get account id and number of active contacts
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            // make sure you use Id feild in your account to update it
            Account acc = new Account(Id = accId, Active_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        // update the final list of account
        update accountsToUpdate;
    } 

    public static void OnAfterInsert( List<SObject> newContact, Map<Id, SObject> newMap){
		Set<Id> accountIds = new Set<Id>();
        for(Contact conRecord : (List<Contact>)newContact){
			accountIds.add(conRecord.AccountId);
		}	
		updateCount(accountIds);
    }

    public static void OnAfterUndelete( List<Contact> newContact, List<Contact> oldContact, Map<ID, Contact> newContactMap , Map<ID, Contact> oldContactMap ) {
		Set<Id> accountIds = new Set<Id>();
        for(Contact conRecord : newContact){
			accountIds.add(conRecord.AccountId);
		}	
		updateCount(accountIds);
    }

    public static void OnAfterUpdate( List<Contact> newContact, List<Contact> oldContact, Map<ID, Contact> newContactMap , Map<ID, Contact> oldContactMap ) {
		Set<Id> accountIds = new Set<Id>();
        for(Contact conRecord : newContact) {
            if(conRecord.AccountId != oldContactMap.get(conRecord.Id).AccountId) {
                accountIds.add(conRecord.AccountId);
                accountIds.add(oldContactMap.get(conRecord.Id).AccountId);
            }
        }    
		updateCount(accountIds);
    }
	
    public static void OnAfterDelete(List<SObject> oldContact,Map<ID, SObject> oldContactMap )
    {
		Set<Id> accountIds = new Set<Id>();
        for(Contact conRecord : (List<Contact>)oldContact ){
            accountIds.add(conRecord.AccountId);
		}	
		updateCount(accountIds);
    }
	
	
	public static void updateCount( Set<Id> accountIds ) {
	
		if(accountIds.size() > 0) {
			List<Account> accountList = [SELECT No_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id in: accountIds];
			if(accountList.size() > 0){
				for(Account accRecord : accountList)
				{
					accRecord.No_of_Contacts__c = accRecord.Contacts.size();
				}	
				update accountList;
			}
		}
    }
    public static void onAfterUpdateCon(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap){
        List<Contact>updateList = new List<Contact>();
        for(Contact con:(List<Contact>)newList){
            String LEVEL = con.Level__c;
            if(con.Level__c!=LEVEL){
                if(con.Level__c == 'Primary'){

                    updateList.add(new Contact(Id=con.Id,Department='Primary'));
                    // con.Department = 'Primary';
                }
            }
            
        }
        update updateList;
    }
}