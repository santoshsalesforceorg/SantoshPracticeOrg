@isTest
public class testConWithPhoneNumb {
    static testmethod void testConWithPhoneNumb(){
        Account acc= new Account();
        acc.name='Test Account';
        insert acc;
        
        List <Contact> conList = New List<Contact>();
        Contact con = new Contact();
        con.LastName = 'Jade';
        con.MobilePhone = '11111';
        con.AccountId = acc.id;
        conList.add(con);
        insert conList;
        system.assertNotEquals(acc.Callable_Contacts__c, 0);
          
    }
    

}