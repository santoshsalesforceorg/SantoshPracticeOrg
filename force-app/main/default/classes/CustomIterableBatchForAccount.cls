global class CustomIterableBatchForAccount implements Database.Batchable<String>,Database.Stateful{
   
    public String CSVFile;
    public string introValue;
     set<string> strset=new set<string>();
    Map<string,id> offmap=new map<string,id>();
    public  List<Account> gsstoupload;
    public  List<Account>  gsstoupdate;
        public  List<Account> gsssize;
    public string errormsgs;
    //Constructor to hold the uploaded CSV file
   
    global CustomIterableBatchForAccount(String CSVFile){
        this.CSVFile= CSVFile;
    }
    public void data()
    {
   
       
    }
    //Start Method
    global Iterable<String> start(Database.BatchableContext bc){
        return new CustomIterable(CSVFile,introValue );
    }
    //execute method
    global void execute(Database.BatchableContext bc,List<String> scope){
     gsstoupload = new List<Account>();
    gsstoupdate = new List<Account>();
    gsstoupload.clear();
    gsstoupdate.clear();
   for(Account gss:[select name from Account])
        {       
       // gsssize.add(gss.name);
          strset.add(gss.Name);
          offmap.put(gss.Name,gss.id);
          system.debug('All GSS ACCOUNT OBJECT RECORDS'+gss);
          //system.debug('All GSS ACCOUNT OBJECT RECORDS SIZE IN CURRENT SYSTEM'+gsssize.size());
        }
        List<String> inputvalues;
        try{       
            system.debug('**scope size**'+scope.size());

         
            for (Integer i=0;i<scope.size();i++)
            {
                inputvalues = new List<String>();
                //split the rows
                inputvalues = scope[i].split(',');
                if(strset.contains(inputvalues[0]))
            {
                Account a = new Account(id=offmap.get(inputvalues[0]));
               
                //split the rows
               // inputvalues = scope[i].split(',');


            a.Name=inputvalues[0];
            a.Site= inputvalues[1];
            a.SLASerialNumber__c= inputvalues[2];      
            a.CustomerPriority__c= inputvalues[3];
            
            gsstoupdate.add(a);
            }
             else{  
            Account a = new Account(id=offmap.get(inputvalues[4]));
            system.debug('gsss recordsssssss'+a);
            
                 a.Name=inputvalues[0];
            a.Site= inputvalues[1];
            a.SLASerialNumber__c= inputvalues[2];      
            a.CustomerPriority__c= inputvalues[3];
            gsstoupload.add(a);
           
            }
            }
           
            try{
        if(gsstoupdate.size()>0)
        {
        system.debug('######## gsstoupdate'+gsstoupdate);
update gsstoupdate;

        }
        if(gsstoupload.size()>0)
        {
         system.debug('######## gsstoupload'+gsstoupload);
Database.insert(gsstoupload,false);

        }
             }
        catch (Exception e)
        {
       
         system.debug('Exception--->'+e+'%%%'+e.getmessage());
       
        }   
            system.debug('@@@@@@@@@@@@@@@@@@@size'+gsstoupload.size());
          
        }catch(Exception e){
            system.debug('Exception--->'+e+'%%%'+e.getmessage());
        }
       
    }
   
    global void finish(Database.BatchableContext bc)
    {
    }
}