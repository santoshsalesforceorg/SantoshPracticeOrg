public class DirectBatch {
    @AuraEnabled
    public static String myExecuteBatch() {  
         String CSVFile;
       
        CustomIterableBatchForAccount customIterableBatch = new CustomIterableBatchForAccount(CSVFile); 
        String batchprocessid1 = database.executebatch(customIterableBatch,100); 

       /*ContractRenewalManager runContractRenewalManager = new ContractRenewalManager(); 
       String batchprocessid2 = database.executebatch(runContractRenewalManager,1); */

       return batchprocessid1 ;
    }
}