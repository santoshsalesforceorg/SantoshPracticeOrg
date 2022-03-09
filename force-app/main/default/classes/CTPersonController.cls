/**
 * CTPersonController
 * Main controller class for Person__c object
 * @author Manish
 */
public with sharing class CTPersonController {

    /**
     * generate unique token using mobile number
     * use MD5 algorithm to generate one-way hash
     * @param mobile
     * @return string token
     */
    public static String getToken(String mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        // return encoded string
        return EncodingUtil.base64Encode(hash);
    }
    
    public static List<Person__c> getRecentHealthChanges(){
        List<Person__c> personList = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST];
    	return personList;
    }
    public static List<Person__c> searchPeople(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c 
                WHERE Name LIKE:searchTerm 
                OR Mobile__c LIKE :searchTerm 
                OR Token__c LIKE:searchTerm 
                ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }
    public static Person__c getPersonById(String personId){
     	List<Person__c> person = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
                FROM Person__c
               	WHERE Id=:personId]; 
        if(person!=null && person.size()>0){
            return person[0];
        }
        return null;
    }
    public static Map<String, Integer> getHealthStatusCount(){
        Map<String, Integer> healthCountMap = new Map<String, Integer>();
        for(AggregateResult ar: [SELECT Health_Status__c, Count(id) Total
                                 FROM Person__c GROUP BY Health_Status__c]){
            string healthStatus = String.valueOf(ar.get('Health_Status__c'));
            Integer count = Integer.valueOf(ar.get('Total'));
            healthCountMap.put(healthStatus, count);
        }
    	return healthCountMap;
    }
    public static Set<Id> getCohabitants(Set<Id> personIds){
        Set<Id> cohabitants = new Set<Id>();
        List<String> healthStatuses = new List<String>{'Green','Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Person_1__c, Person_2__c, Id FROM People_Tracing__c
                                                WHERE (Person_1__c IN:personIds OR Person_2__c IN:personIds)
                                                AND Contact_Type__c='Cohabitant'
                                                AND (Person_1__r.Health_Status__c IN:healthStatuses OR Person_2__r.Health_Status__c IN:healthStatuses)];
        for(People_Tracing__c pt:peopleTraces){
            if(!personIds.contains(pt.Person_1__c)){
                cohabitants.add(pt.Person_1__c);
            }
            if(!personIds.contains(pt.Person_2__c)){
                cohabitants.add(pt.Person_2__c);
            }
        }    
    return cohabitants;
    }

    public static Set<Id> getNeighbour(Set<Id> personIds){
        Set<Id> neighbours = new Set<Id>();
        // List<String> healthStatuses = new List<String>{'Green','Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Person_1__c, Person_2__c, Id FROM People_Tracing__c
                                                WHERE (Person_1__c IN:personIds OR Person_2__c IN:personIds)
                                                AND Contact_Type__c='Neighbour'
                                                AND (Person_1__r.Health_Status__c = 'Green' OR Person_2__r.Health_Status__c = 'Green')];
        for(People_Tracing__c pt:peopleTraces){
            if(!personIds.contains(pt.Person_1__c)){
                neighbours.add(pt.Person_1__c);
            }
            if(!personIds.contains(pt.Person_2__c)){
                neighbours.add(pt.Person_2__c);
            }
        }    
    return neighbours;
    }
    
}