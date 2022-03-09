global class updatePhoneOnAccount {
    public static void contactPhoneUpdate(List<sObject> accts,Map<Id, sObject> oldAcc){
        Map<id, Account> mapAccount = new Map<id, Account>();
        List<Contact> conList = new List<Contact>();
        
        for(Account acc:(List<Account>)accts)
        {
            if(acc.phone!=((Account)oldAcc.get(acc.id)).phone)
            system.debug('phone--> '+((Account)oldAcc.get(acc.id)).phone);
                mapAccount.put(acc.id, acc);
        }
        if(mapAccount.size()>0){
            conList = [Select id, name, phone, AccountId From Contact where AccountId IN:mapAccount.keySet()];
        }
        if(conList.size()>0)
        {
            for(Contact cont:conList )
            {
                cont.OtherPhone = mapAccount.get(cont.AccountId).Phone;
                
            }
            update conList;
            
        }
    }
}