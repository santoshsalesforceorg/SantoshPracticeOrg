@isTest
public class COVID19Test {
	@isTest
    public static void treatPatientTest()
    {
        COVID19 jaipur = new COVID19(10);
        Integer treated = jaipur.getTreated();
        system.assertEquals(10,treated ,'Treated Count Does not match');
        
         COVID19 hyd = new COVID19(112);
        	treated = hyd.getTreated();
        system.assertEquals(112,treated ,'Treated Count Does not match');
        
        system.assertEquals(122,COVID19.recoveredInCountry ,'Treated Count Does not match');
        jaipur.treatPatient();
        treated = jaipur.getTreated();
        system.assert(treated==11, 'Treated Count Does not match');
        system.assert(COVID19.recoveredInCountry==123, 'Treated Count Does not match');
        
    }
    @isTest
    public static void treatPatientTestNegetive()
    {
        COVID19 jaipur = new COVID19(-10);
        Integer treated = jaipur.getTreated();
        system.assertEquals(0,treated ,'Treated Count Does not match');
    }
}