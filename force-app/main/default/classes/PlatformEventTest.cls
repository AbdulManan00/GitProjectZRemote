@isTest
public class PlatformEventTest {
    @isTest
    static void testTriggerLogic() {
        // Create test Cloud_News__e events
        List<Cloud_News__e> events = new List<Cloud_News__e>();
        for (Integer i = 0; i < 3; i++) {
            Cloud_News__e event = new Cloud_News__e(
                Location__c = 'Test Location ' + i,
                Urgent__c = true,
                News_Content__c = 'Test news content'
            );
            events.add(event);
        }
        
        // Publish test events
        Test.startTest();
        Database.SaveResult[] results = EventBus.publish(events);
        Test.stopTest();
        
        // Verify that cases have been created
        Integer expectedCaseCount = 0;
        for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                expectedCaseCount++;
            }
        }
        
        List<Case> cases = [SELECT Id FROM Case WHERE Subject LIKE 'News team dispatch%'];
        System.assertEquals(expectedCaseCount, cases.size(), 'Incorrect number of cases created');
    }
}