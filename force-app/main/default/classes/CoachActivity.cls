public with sharing class CoachActivity {
    public CoachActivity() {
    }
    @AuraEnabled
    public String id { get; set; }
    @AuraEnabled
    public Coach coach { get; set; }
    @AuraEnabled
    public String repName { get; set; }
    @AuraEnabled
    public Date interactionDate { get; set; }
    @AuraEnabled
    public Double averageScore { get; set; }
    @AuraEnabled
    public String comments { get; set; }
    @AuraEnabled
    public String recordType { get; set; }
    @AuraEnabled
    public String attribute { get; set; }       // Need to be filled for all record type excpet Rep Evaluation

    @AuraEnabled
    public List<RepEvaluation> repEvaluation { get; set; }
    @AuraEnabled
    public BehaviouralObjective behaviouralObjective { get; set; }
    @AuraEnabled
    public CoachingInteraction coachingInteraction { get; set; }


    public with sharing class Coach  {

        public Coach() {
        }
        @AuraEnabled
        public String coachName { get; set; }
        @AuraEnabled
        public Double averageScore { get; set; }
    }

    public with sharing class RepEvaluation {

        public RepEvaluation() {
        }
        @AuraEnabled
        public String attribute { get; set; }
        @AuraEnabled
        public String attributeType { get; set; }
        @AuraEnabled
        public Decimal experience { get; set; }
    }


    public with sharing class BehaviouralObjective {

        public BehaviouralObjective() {
        }
        @AuraEnabled
        public String managerToDo1 { get; set; }
        @AuraEnabled
        public String managerToDo2 { get; set; }
        @AuraEnabled
        public String managerToDo3 { get; set; }
        @AuraEnabled
        public String salesRepToDo1 { get; set; }
        @AuraEnabled
        public String salesRepToDo2 { get; set; }
        @AuraEnabled
        public String salesRepToDo3 { get; set; }
        @AuraEnabled
        public String detailSpecificObjective { get; set; }
        @AuraEnabled
        public Boolean hasSalesRepAgreed { get; set; }
        @AuraEnabled
        public Boolean hasManagerApproved { get; set; }

    }

    public with sharing class CoachingInteraction {

        public CoachingInteraction() {
        }
        @AuraEnabled
        public String feedbackGiven { get; set; }
        @AuraEnabled
        public String acknowledgeProgress { get; set; }
        @AuraEnabled
        public String repFeedback { get; set; }
        @AuraEnabled
        public String recNextSteps { get; set; }
        
    }    
}