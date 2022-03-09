@isTest
public class testAccCreate {
    static testMethod void accCreate(){
        Lead ld = new Lead();
        ld.lastName='testLast';
        ld.Company = 'Test Company';
        insert ld;
        
        
    }
}