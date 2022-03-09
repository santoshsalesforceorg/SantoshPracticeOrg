public with sharing class CarTypeSearch {
	@AuraEnabled
    public static List<Car_Type__c> getCarTypes(){
        return [SELECT Id, Name From Car_Type__c];
    }
}