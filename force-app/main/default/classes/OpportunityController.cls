public class OpportunityController {

    public static void updateProfile(List<Id> oppIds){
        List<Opportunity> oppList = [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id IN :oppIds];
        for(Opportunity opp : oppList){
            // get opp record
            if(opp.Amount==NULL){
                opp.Profile__c = '';
            }
            else if(opp.Amount <10000){
                opp.Profile__c = 'Low';
            } else if (opp.Amount > 50000){
                opp.Profile__c = 'High';
            } else{
                opp.Profile__c = 'Medium';
            }
            
            // update opportunity
            
        }
        update oppList;
    }
}