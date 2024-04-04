@isTest
private class ContactChangeEventTriggerHelperTest {

    @isTest
    static void ValidateChangeEvent() {
        Test.enableChangeDataCapture();
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', Email = 'test@test.com');
        insert testContact;

        Test.getEventBus().deliver();
        Task[] testTask = [SELECT Id FROM Task WHERE Subject='New Contact Created'];
        System.assertEquals(1, testTask.size(),'Change Event isFailed');

        Contact con = [SELECT Id,FirstName,LastName, Email FROM Contact WHERE Id =:testContact.Id];
        con.Email = 'test12345@test.com';
        update con;
        Test.getEventBus().deliver();
        Task[] Task = [SELECT Id FROM Task WHERE Subject='New Contact Created'];
        System.assertEquals(1, Task.size(),'Change Event is Failed : Email Updated');
    }
}