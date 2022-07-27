@isTest
public class RelatedListControllerTest {
    @testSetup 
    static void setupTestData() {
        Id adminProfId = [Select id from Profile WHERE Name=:'System Administrator'].Id;
        User adminUser = new User();
        adminUser.FirstName = 'Admin';
        adminUser.LastName = 'testUser';
        adminUser.Email = 'admin123@test.com';
        adminUser.Username = 'admin@testnatixis123.com';
        adminUser.ProfileId = adminProfId;
        adminUser.IsActive = true;
        adminUser.LanguageLocaleKey = 'en_US';
        adminUser.LocaleSidKey = 'en_US';
        adminUser.Alias = adminUser.FirstName.substring(0,1) + adminUser.LastName.substring(0,4);
        adminUser.EmailEncodingKey = 'UTF-8';
        adminUser.TimeZoneSidKey = 'GMT';        
        insert adminUser;	 
        ObjectA__c obja = new ObjectA__c(Name='TestA');
        insert obja;
        ObjectB__c objb = new ObjectB__c(
            Name='TestB', 
            ObjectA__c=obja.Id
        );
        insert objb;
        ObjectC__c objc = new ObjectC__c(
            Name='TestC',
            ObjectB__c=objb.Id
        );
        insert objc;
        ObjectA__c obja1 = new ObjectA__c(Name='TestA1');
        insert obja1;
        ObjectB__c objb1 = new ObjectB__c(
            Name='TestB1', 
            ObjectA__c=obja1.Id
        );
        insert objb1;
        ObjectC__c objc1 = new ObjectC__c(
            Name='TestC1',
            ObjectB__c=objb.Id
        );
        insert objc1;
        ObjectC__c objc2 = new ObjectC__c(
            Name='TestC2',
            ObjectB__c=objb1.Id
        );
        insert objc2;
    }
    @isTest
    public static void getObjectsB(){
        User adminUser = [SELECT Id FROM User WHERE Username=:'admin@testnatixis123.com' LIMIT 1];
        System.runAs(adminUser){
            Test.startTest();
            Map<String ,  String> resultMap = RelatedListController.getRecords();
            Test.stopTest();
            System.assertNotEquals(null,  resultMap);
        }
    }
}