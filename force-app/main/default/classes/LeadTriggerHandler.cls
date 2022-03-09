public class LeadTriggerHandler {
    public static boolean alreadyExecuted = false;
    public static void beforeInsertHandler(List<Lead> newLead){
        for(Lead leadRec:newLead){
            if(String.isBlank(leadRec.LeadSource)){
                leadRec.LeadSource='Other';
            }
            if(String.isBlank(leadRec.Industry)){
                leadRec.Industry.addError('The Industry Should Not be Blank');
            }
        }
        
    }
    public static void afterInsertHandler(List<Lead> newLead){
        List<Task> leadTasks = new List<Task>();
        for(Lead leadRecord : newLead){
            // create a task
            Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id);
            leadTasks.add(leadTask);
        }
        insert leadTasks;
        
        // inserting another lead record
        // this will call the trigger recursively
        if(LeadTriggerHandler.alreadyExecuted == false){
            LeadTriggerHandler.alreadyExecuted = true;
            Lead anotherLead = new Lead(LastName = 'Test Lead Single', Status='Open - Not Contacted', Company='SFDCFacts', Industry='Finance');
            insert anotherLead;
        	
        }
        
    }
    
    public static void beforeUpdateHandler(List<Lead> newLead, Map<Id, Lead> oldLeadMap){
        for(Lead leadRec:newLead){
            if(String.isBlank(leadRec.LeadSource)){
                leadRec.LeadSource='Other';
            }
            if((leadRec.status=='Closed - Converted' || leadRec.Status=='Closed - Not Converted') && oldLeadMap.get(leadRec.Id).status=='Open - Not Contacted')
                leadRec.Status.addError('You cannnot directly close an open lead record');
            
        }
    }
    
}