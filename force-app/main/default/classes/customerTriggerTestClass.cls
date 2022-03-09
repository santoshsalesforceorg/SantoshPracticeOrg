@isTest
private class customerTriggerTestClass
{
    static testMethod void myUnitTest()
    {
        apex_customer__c objCust=new apex_customer__c();
        objCust.Name='Food Ltd';
        objCust.apex_customer_status__c='Inactive';
        insert objCust;
        
        Test.startTest();
        objCust.apex_customer_status__c='Active';
        update objCust;
        Test.stopTest();
        
       List<apex_invoice__c> invList= [Select id, apex_customer__c from apex_invoice__c where apex_customer__c=:objCust.id];
       System.assertEquals(1,invList.size());
    }
    
    static testMethod void myUnitTest2()
    {
        apex_customer__c objCust=new apex_customer__c();
        objCust.Name='Food Ltd';
        objCust.apex_customer_status__c='Inactive';
        insert objCust;
        
        Test.startTest();
        objCust.apex_customer_status__c='Pending';
        update objCust;
        Test.stopTest();
        
       List<apex_invoice__c> invList= [Select id, apex_customer__c from apex_invoice__c where apex_customer__c=:objCust.id];
       System.assertEquals(0,invList.size());
    }
}