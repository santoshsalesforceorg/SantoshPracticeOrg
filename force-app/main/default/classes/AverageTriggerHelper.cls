//public class AverageTriggerHelper{
public class AverageTriggerHelper
{
    Set<Id> accIds = new Set<Id>();
    Decimal contactscore;
    Decimal noofcontacts;
    public void newContacts(List<contact> newconList) {
        
        for(Contact con: newconList)
        {
            if(con.AccountId!=null)
                accIds.add(con.AccountId);
        }
    }
    
    
    public void oldContacts(List<contact> oldconList) {
        
        for(Contact oldCon: oldconList)
        {
            if(oldCon.AccountId!=null)
                
                accIds.add(oldCon.AccountId);
            
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