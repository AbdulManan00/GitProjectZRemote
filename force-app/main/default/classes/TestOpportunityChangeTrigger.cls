@isTest
private class TestOpportunityChangeTrigger {

    @isTest static void testCreateAndUpdateOpportunity() {
        Test.enableChangeDataCapture();
        // Insert an opployee test record
        insert new Opportunity(Name='Sell 100 Widgets',
        StageName='Prospecting',
        CloseDate=Date.today().addMonths(3));
        // Call deliver to fire the trigger and deliver the test change event.
        Test.getEventBus().deliver();
        // VERIFICATIONS
        // Check that the change event trigger created a task.
      
        // Update opployee record
        Opportunity[] oppRecords = [SELECT Id,StageName FROM Opportunity];
        // There is only one test record, so get the first one
        Opportunity opp = oppRecords[0];
        // Debug
        System.debug('Retrieved opployee record: ' + opp);
        // Update one field and oppty another
        opp.StageName = 'Closed Won';
        update opp;
        // Call deliver to fire the trigger for the update operation.
        Test.getEventBus().deliver();
        // VERIFICATIONS
       // Check that the change event trigger created a task.
       // We should have two tasks now, including one from the first trigger invocation.
       Task[] taskList = [SELECT Id,Subject FROM Task];
       System.assertEquals(1, taskList.size(),
           'The change event trigger did not create the expected task.');
    }
}