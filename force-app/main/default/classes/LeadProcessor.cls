public class LeadProcessor implements Database.Batchable<sObject> {
    public Integer count=0;
      public Database.QueryLocator start(Database.BatchableContext bc)
      {
       return Database.getQueryLocator('SELECT Id FROM Lead');
      }
      public void execute(Database.BatchableContext bc, List<Lead> leadList){
        System.debug('records'+leadList);
        for(Lead l:leadList){
            l.LeadSource='Dreamforce';
        }
        update leadList; 
      count=count+leadList.size();
      }
      public void finish(Database.BatchableContext bc){
        System.debug('Batch Finished '+ count);
      }
}