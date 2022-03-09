public class AccountQueueableExample implements Queueable {
    public List<Account> accList ; 
    public AccountQueueableExample(List<Account> accList){
        this.accList = accList ;  
    }
    public void execute(QueueableContext context) {
        // for(Account acc :accList){
        //     // Update the Account Name 
        //     acc.Name = acc.Name + 'sfdcpoint';
        // }
        // update accList;

        List<Account> accList=[select id,phone,description from Account where industry='banking'];       
        for(account a:accList){            
            a.phone='+5555555555';             
            string ids=context.getJobId();       
            a.Description=ids;      
            update a; 
    }
}
}