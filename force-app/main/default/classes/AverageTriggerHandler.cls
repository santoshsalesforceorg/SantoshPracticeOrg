public class AverageTriggerHandler{
public void UpdateAccount (set<Id> accountIds){

Decimal contactscore;
List<Account> accList = [SELECT id, Contact_Score__c, No_of_Contacts__c,
(SELECT Id, Score__c FROM Contacts) FROM Account WHERE Id in:accountIds];
List<AggregateResult> ar = [SELECT avg(Score__c)sc FROM Contact where AccountId in :accList ];
List<Account> updateAcc = new List<Account>();
for(Account acc:accList){
// List<AggregateResult> ar= [SELECT avg(Score__c)sc FROM Contact where AccountId =:acc.Id];
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