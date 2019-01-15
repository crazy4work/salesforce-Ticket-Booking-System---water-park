public class CustomerRegistrationHandling {
    @AuraEnabled
    public static List<Customer__c> getMatchingCus(String Email){
        List<Customer__c> matchedCusList = [SELECT Id, Name, Customer_Email__c, Customer_Phone__c, Customer_Address__c FROM Customer__c WHERE Customer_Email__c=:Email];
        System.debug('matchedCusList:::'+matchedCusList);
        return matchedCusList;
    }

	

}