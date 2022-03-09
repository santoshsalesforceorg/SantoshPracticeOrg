public with sharing class carController{
    @AuraEnabled(Cacheable=true)
    public List<Car__c> getCars(){
        return [SELECT Id,Name, MSRP__c,Description__c,Make__c,Number_of_Seats__c,
                Picture_URL__c,Category__c,Control__c,Fuel_Type__c
                FROM Car__c];
    }
}