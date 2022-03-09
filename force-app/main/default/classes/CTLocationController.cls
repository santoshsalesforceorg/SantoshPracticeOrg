/**
 * CTLocationController
 * Main controller class for Location__c object
 * @author Manish
 */
public with sharing class CTLocationController {
	public static List<Location__c> getRecentStatusChanges(){
        return [SELECT Id, Name, CreatedDate, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        
    }
    public static List<Location__c> serchLocations(String searchTerm){
        searchTerm = searchTerm + '%';
       List<Location__c> locList = [SELECT Id, Name, CreatedDate, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c 
                                    WHERE Name LIKE:searchTerm 
                					OR Pincode__c LIKE :searchTerm 
                					OR Address__c LIKE:searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST];
        
        return locList;
    }
    public static Location__c getLocationById(String locationId){
        List<Location__c> loc = [SELECT Id, Name, CreatedDate, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c WHERE Id=:locationId];
        if(loc!=NULL && loc.size()>0){
            return loc[0];
        }
        return NULL;
    }
   public static Map<String, Integer> getHealthStatusCount(){
        Map<String, Integer> healthCountMap = new Map<String, Integer>();
        for(AggregateResult ar: [SELECT Status__c, Count(id) Total
                                 FROM Location__c GROUP BY Status__c]){
            string healthStatus = String.valueOf(ar.get('Status__c'));
            Integer count = Integer.valueOf(ar.get('Total'));
            healthCountMap.put(healthStatus, count);
        }
    	return healthCountMap;
    } 
}