public class AccountHandler {

    public static void updateAvgCaseResolutionDays(List<Id> accountIds){
        Map<Id, Integer> accountTotalCasesMap = new Map<Id, Integer>();
        Map<Id, Integer> accountTotalDaysMap = new Map<Id, Integer>();
        
        // retrive all the cases for this account
        // get resolution days for each account (ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate, AccountId FROM Case WHERE IsClosed=true AND AccountId IN: accountIds]){
            if(!accountTotalCasesMap.containsKey(caseObj.AccountId)){
                accountTotalCasesMap.put(caseObj.AccountId, 0);
                accountTotalDaysMap.put(caseObj.AccountId, 0);
                
            }
            Integer totalCases = accountTotalCasesMap.get(caseObj.AccountId);
            // increase number of cases
            totalCases++;
            accountTotalCasesMap.put(caseObj.AccountId, totalCases);
            // get duration in days and add it to totalDays
            Integer totalDays = accountTotalDaysMap.get(caseObj.AccountId);
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
            accountTotalDaysMap.put(caseObj.AccountId, totalDays);
        }
        List<Account> accountToUpdate = new List<Account>();
        for(Id accountId:accountTotalCasesMap.keyset()){
            Decimal resolutionDays = accountTotalDaysMap.get(accountId)/accountTotalCasesMap.get(accountId);
        // update account object
        accountToUpdate.add(new Account(Id=accountId, Avg_Case_Resolution_Days__c = resolutionDays));
        }
        
        update accountToUpdate;
    }
}