@RestResource(urlMapping='/v1/CustManagement/')
global class CustomerManager {
    @httpGet
    global  static Apex_Customer__c doGetCust()
    {
        Apex_Customer__c cust = new Apex_Customer__c();
        map<String, String> paramsMap = RestContext.request.params; 
        String custId = paramsMap.get('Id');
        cust = [Select id, name, Customer_Description__c, Apex_Customer_Status__c From Apex_Customer__c where Id=:custId];
        return cust;
    }
    @httpDelete
    global  static String  doDeletCust()
    {
        Apex_Customer__c cust = new Apex_Customer__c();
        map<String, String> paramsMap = RestContext.request.params; 
        String custId = paramsMap.get('Id');
        cust = [Select id, name, Apex_Customer_Status__c From Apex_Customer__c where Id=:custId];
        delete cust;
        return 'Record is deleted';
    }
    @httpPost
    global  static Apex_Customer__c  doPutCust(String Name, String Description)
    {
        Apex_Customer__c cust = new Apex_Customer__c(Name=name, Customer_Description__c=Description);
        insert cust;
        return cust;
    }

}