global class FirstScheduleClass implements Schedulable

{

     global void execute(SchedulableContext sc)

     {
          String soql = 'SELECT Id, Name FROM Account';
          FirstBatchClass batch = new FirstBatchClass(soql);
       database.executebatch(batch,200);

     }

}