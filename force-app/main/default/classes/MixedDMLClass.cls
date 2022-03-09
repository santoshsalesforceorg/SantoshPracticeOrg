public class MixedDMLClass {
	public static void updateUser(){
        //Contact con=new Contact(LastName='DMLCon');
		//insert con;
        
        Account acc = new Account(Name='DML Account');
        insert acc;
        
        system.debug('acc--> '+acc);
        
        //system.debug('acc--> '+con);
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        UserRole role = [Select Id From userRole Where Name = 'COO'];
        User usr = new User(LastName = 'Mixed',
                           FirstName='DML',
                           Alias = 'Dmix',
                           Email = 'javatest12.liveston@asdf.com',
                           Username = 'javatest123.liveston1234@asdf.com',
                           ProfileId = profileId.id,
                           userroleId = role.id,
                           TimeZoneSidKey = 'GMT',
                           LanguageLocaleKey = 'en_US',
                           EmailEncodingKey = 'UTF-8',
                          LocaleSidKey = 'en_US'
                           );
        insert usr;
        system.debug('usr--> '+usr);


    }
}