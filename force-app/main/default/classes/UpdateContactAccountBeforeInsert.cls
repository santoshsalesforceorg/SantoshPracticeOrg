public class UpdateContactAccountBeforeInsert {
    public static void contactUpdate(List<Contact>conList){
        Set<Id> accountIds = new Set<Id>();

    for(Contact conRec : conList){
        accountIds.add(conRec.AccountId);
    }

    Map<Id, Account> allConRec = new Map<Id,Account>([Select Id, Rating, Name from Account where Id in :accountIds]);

   for(Contact con : conList) {
       if(allConRec.size() > 0 && allConRec.containsKey(con.AccountId))
       {
           if(allConRec.get(con.AccountId).Rating == null)
           {
              con.Description = 'Blank Rating';
           }
           
       }
   }
    }
    public static Boolean validateEmail(String email) {
	Boolean res = true;
		
	
	String emailRegex = '^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$'; // source: http://www.regular-expressions.info/email.html
	Pattern MyPattern = Pattern.compile(emailRegex);
	Matcher MyMatcher = MyPattern.matcher(email);

	if (!MyMatcher.matches()) 
	    res = false;
	return res;	
	}
}