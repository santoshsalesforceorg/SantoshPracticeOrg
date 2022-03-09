@isTest
public class TestForceForecasting {
    static testMethod void insertNewUser()
    {
       User userToCreate = new User();
       userToCreate.FirstName = 'David';
       userToCreate.LastName  = 'Liu';
       userToCreate.Email     = 'dvdkliu+sfdc99@gmail.com';
       userToCreate.Username  = 'sfdc-dreamerSant@gmail.com';
       userToCreate.Alias     = 'fattySan';
       userToCreate.ProfileId = '00e2v000003eKc9'; 
       //00e2v000003eKc9
       // Don't worry about these
       userToCreate.TimeZoneSidKey    = 'America/Denver';
       userToCreate.LocaleSidKey      = 'en_US';
       userToCreate.EmailEncodingKey  = 'UTF-8';
       userToCreate.LanguageLocaleKey = 'en_US';
       
       insert userToCreate; 
    }

}