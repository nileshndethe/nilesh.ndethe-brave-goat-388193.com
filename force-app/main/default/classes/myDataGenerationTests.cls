@isTest
public class myDataGenerationTests {
	@TestSetup
    static void loadTestDataFromStaticResource(){
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
    @isTest static void testLoadAccountsFromStaticResource() {
        Account a = TestFactory.getAccount('Muddy Waters Inc.', true);
        List<Account> accts = [SELECT ID FROM Account];
        system.assert(accts.size() == 16, 'expected 16 accounts');
    }
}