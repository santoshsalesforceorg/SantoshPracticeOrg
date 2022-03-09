public virtual class MyVirtualClass {
    public virtual String getName(){
        return 'Parent';
    }
    public static void updateUser(){
        
        Account acc=new Account(Name='Acme123');
		insert acc;
        system.debug('acc--> '+acc);
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
         
        User usr = new User(LastName = 'LIVESTON',
                           FirstName='JASON',
                           Alias = 'jliv',
                           Email = 'teslas1234.liveston@asdf.com',
                           Username = 'teslas1234.liveston1234@asdf.com',
                           ProfileId = profileId.id,
                           TimeZoneSidKey = 'GMT',
                           LanguageLocaleKey = 'en_US',
                           EmailEncodingKey = 'UTF-8',
                          LocaleSidKey = 'en_US'
                           );
        insert usr;
        system.debug('usr--> '+usr);


    }
}