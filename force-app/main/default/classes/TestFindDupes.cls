@isTest
public class TestFindDupes {
    static testMethod void testDupes(){
        
   
Contact cont = new Contact();
    cont.FirstName  = 'Akhil';
    cont.LastName = 'Test';
    cont.Email = 'akhli@tester.com';
    insert  cont;
    Lead dupLead = new Lead ();
        dupLead.FirstName  = 'Akhilesh';
    dupLead.LastName = 'Test';
    dupLead.Email = 'akhli@tester.com';
        dupLead.Company = 'Fake';
        try{
            insert dupLead;
        }
        catch(Exception e){
            System.debug('An error happened, as predicted!');
        }
        List<Lead> dupes = [SELECT id FROM Lead where Email = 'akhli@tester.com'];
        system.assertEquals(0, dupes.size());
        
        Lead legitLead      = new Lead();
       legitLead.FirstName = 'David';
       legitLead.LastName  = 'Lee';
       legitLead.Company   = 'Golden State Warriors';
       legitLead.Email     = 'dlee@gsw.com';
       insert legitLead;
        
        List<Lead> legits = [SELECT id FROM Lead where Email='dlee@gsw.com'];
        system.assertEquals(1,legits.size());
        
}
     }