@isTest
 public class LeadProcessorTest {
    // Define constants
    private static final Integer NUM_LEADS_TO_CREATE = 200;

    @isTest
    public static void testLeadProcessing() {
        // Create test data
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < NUM_LEADS_TO_CREATE; i++) {
            leads.add(new Lead(LastName='SF', Company='SalesForce'));
        }
        insert leads;

        // Execute batch job
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp, NUM_LEADS_TO_CREATE);
        Test.stopTest();

        // Verify results
        List<Lead> processedLeads = [SELECT Id, LeadSource FROM Lead WHERE Company='SalesForce'];
        System.assertEquals(NUM_LEADS_TO_CREATE, processedLeads.size(), 'Incorrect number of leads processed');
    }
}
