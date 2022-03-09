public class Tea{
    public static String orderTea(){
    Map <String, string> teaTypes = new Map <String, string>();
    teaTypes.put('Black','Earthy');
    teaTypes.put('White','Sweet');  
    teaTypes.put('Herbal','Sweet'); 
    string flavorProfile = teaTypes.get('Herbal');
        system.debug('teaTypes are ' +teaTypes);
        System.debug('The flavorProfile of Herbal is: ' + flavorProfile);
        return flavorProfile;
    }
        
}