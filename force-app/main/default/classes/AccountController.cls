public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [Select Id, Name, Type, Industry From Account Limit 5];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> filterAccountTypeType(String type){
        return [Select Id, Name, Type From Account Where Type=:type Limit 5];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey){
        string key = '%'+searchKey+'%';
        return [Select Id, Name, Type, Industry From Account
                Where Name LIKE:key Limit 5];
    }
}