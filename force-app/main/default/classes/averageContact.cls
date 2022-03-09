public class averageContact {
    public static void averageContactNumbers(){
Set<Id> accIds;
    Decimal contactscore;
    Decimal noofcontacts;
        List<Contact> conList;
           List <Contact> conOldList;
        
    
    if(trigger.isInsert||trigger.isUpdate||trigger.isUndelete)
    {
        for(Contact con:conList)
        {
            if(con.AccountId!=null)
                accIds.add(con.AccountId);
            }
        }
        if(trigger.isUpdate||trigger.isdelete)
        {
            for(Contact oldCon:conOldList)
            {
                if(oldCon.AccountId!=null)
                
                    accIds.add(oldCon.AccountId);
                
            }
        }
    if(accIds.size()>0){
        List<Account> accList = [SELECT id, Contact_Score__c, No_of_Contacts__c,
                                 (SELECT Id, Score__c FROM Contacts) FROM Account WHERE Id in:accIds];
        List<Account> updateAcc = new List<Account>();
        List<Account> updateAcc2 = new List<Account>();
        for(Account acc:accList){
            List<AggregateResult> ar= [SELECT avg(Score__c)sc FROM Contact where AccountId =:acc.Id];
            for(AggregateResult aRes:ar)
            {
                contactscore = (Decimal)aRes.get('sc');
            }
            acc.Contact_Score__c = contactscore;
            acc.No_of_Contacts__c = acc.contacts.size();
            updateAcc.add(acc) ;
        }
        update updateAcc;
        
    }
        
    }
}