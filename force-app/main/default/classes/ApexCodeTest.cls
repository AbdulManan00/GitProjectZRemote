@isTest
public with sharing class ApexCodeTest {
    
    @testSetup static void testData(){
        List<Contact> con= new List<Contact>{
            new Contact(LastName='Manan'),
            new Contact(LastName='cd'),
            new Contact(LastName='yz')              
        };
        insert con;
    }

    
    static testmethod void TestPercentage() {
        Decimal res= ApexCode.Percentage(800,1000);
        system.assertEquals(80, res);
    }
 /*   
    @isTest(SeeAllData=true) 
    static void TestAccount(){
        List<Account> acc=ApexCode.accountList();
        Assert.areEqual(47, acc.size());
    }
    */
     static testmethod void TestContact(){
        List<Contact> acc=ApexCode.conList();
        Assert.areEqual(3, acc.size());
    }
    
    
    static testmethod void TestAddittion() {
        Decimal res= ApexCode.Calculator('Add', 20, 5);
        system.assertEquals(25, res);
         system.assert(25==res);
    }
    static testmethod void TestSubtract() {
        Decimal res= ApexCode.Calculator('Subtract', 20, 5);
        Assert.areEqual(15, res);
    }  static testmethod void TestMultiply() {
        Decimal res= ApexCode.Calculator('Multiply', 20, 5);
        Assert.areEqual(100, res);
    }  
    @istest
    static  void TestDivide() {
        Decimal res= ApexCode.Calculator('Divide', 20, 5);
        Assert.areEqual(4, res);
    }
       @istest
    static  void TestNull() {
        Decimal res= ApexCode.Calculator('mmmmm', 20, 5);
        Assert.areEqual(Null, res);
    }
}